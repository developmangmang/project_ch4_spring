package com.ch4.spring;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
@Transactional(propagation=Propagation.REQUIRED, rollbackFor = Exception.class)
public class CompanyLogic {
	Logger logger = Logger.getLogger(CompanyLogic.class);
	
	@Value("${file.path}")
	String filePath = null;
	@Value("${host.address}")
	String hostAddress = null;
	
	@Autowired
	CompanyDao cDao = null;
	
	public int mngPermit(Map<String, Object> pMap) {
		int result = 0;
		if (pMap.get("visit_no") != null) {
			result = cDao.mngUpdateV(pMap); // update
		} else if (pMap.get("aplg_no") != null) {
			result = cDao.mngUpdateG(pMap);
		}

		List<Map<String, Object>> confirmList = (List<Map<String, Object>>) pMap.get("confirmList");
		logger.info("pMap ++ : " + pMap);
		logger.info("와와아 : " + confirmList);
		String permit = null;
		for (int i = 0; i < confirmList.size(); i++) {
			logger.info(confirmList.get(i));
			permit = confirmList.get(i).get("CONFM_NO").toString();
			logger.info(permit);
		}
		if (result == 0) {
			return result;
		} else if (result == 1 && !(permit.equals("null"))) {
			if (pMap.get("visit_permit_st") != null) {// 방문일 경우
				cDao.mngPermitV(pMap);
				result = (int) pMap.get("result");
				if (result == 0) {
					return result;
				}
			} else if (pMap.get("aplg_permit_id") != null) {// 반입일 경우
				cDao.mngPermitG(pMap);
				result = (int) pMap.get("result");
				if (result == 0) {
					return result;
				}
			}
		}

		/////////////////////////////////// qr이미지 생성//////////////////////////////////
		for (int i = 0; i < confirmList.size(); i++) {
			Map<String, Object> cMap = confirmList.get(i);
			String qrCode = (String) cMap.get("CONFM_QRCODE");
			String savedFilePath = filePath;
			String path = null;
			String url = null;

			if (pMap.get("visit_no") != null) {
				path = savedFilePath + "visitor/";
				url = hostAddress + "/android/QRconfirm.ch4?confm_qrcode=" + qrCode + "&type=visitor";
			} else if (pMap.get("aplg_no") != null) {
				path = savedFilePath + "goods/";
				url = hostAddress + "/android/QRconfirm.ch4?confm_qrcode=" + qrCode + "&type=goods";
			}

			File file = new File(path);
			QRCodeWriter writer = new QRCodeWriter();
			try {
				BitMatrix qr = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);
				BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qr);
				ImageIO.write(qrImage, "PNG", new File(file, qrCode + ".png"));
			} catch (WriterException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			/////////////////////////////////// qr이미지 생성 끝//////////////////////////////////
		}
		return result;
	}

	public void companyLogin(Map<String, Object> pMap) {
		cDao.companyLogin(pMap);

	}

	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.companyJoin(pMap);
		return result;
	}

	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		result = cDao.isExistID(pMap);
		return result;
	}

	public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyVisitList = cDao.applyVisitList(pMap);
		return applyVisitList;
	}

	public List<Map<String, Object>> inOutVisitorList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = cDao.inOutVisitorList(pMap);
		return inOutList;
	}
	
	public List<Map<String, Object>> inOutGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = cDao.inOutGoodsList(pMap);
		return inOutList;
	}

	public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyGoodsList = cDao.applyGoodsList(pMap);
		return applyGoodsList;
	}

	public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
		List<Map<String, Object>> destiList = cDao.destiList(pMap);
		return destiList;
	}

}
