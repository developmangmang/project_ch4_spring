package com.ch4.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch4.getData.GoodsData;

@Service
public class GoodsLogic {
	@Autowired
	GoodsDao gDao = null;

	public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
		Map<String, Object> goodsDetail = gDao.goodsDetail(pMap);
		return goodsDetail;
	}

	public int goodsApplyAdd(Map<String, Object> pMap, GoodsData gData) {
		int result = 0;
		String aplg_no = null;
		Map<String, Object> addInfo = SortAndBind.goodsApplySort(gData);

		List<Map<String, Object>> gmAddList = (List<Map<String, Object>>) addInfo.get("gmAddList");
		gDao.goodsApplyAdd(pMap);
		result = (int) pMap.get("result");
		if (result == 0) {
			return result;
		} else if (result == 1) {
			aplg_no = pMap.get("aplg_no").toString();

			Map<String, Object> gmMap = new HashMap<String, Object>();
			gmMap.put("aplg_no", aplg_no);
			gmMap.put("gmAddList", gmAddList);

			result = gDao.goodsSubAdd(gmMap);
			if (result == 1) {
				pMap.put("gmAddList", gmAddList);
			}
		}
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		result = gDao.goodsCancle(pMap);
		return result;
	}

	public int goodsUpdate(Map<String, Object> pMap, GoodsData gData) {
		int result = 0;
		String aplg_no = null;
		Map<String, Object> updInfo = SortAndBind.goodsApplySort(gData);

		List<Map<String, Object>> gmAddList = (List<Map<String, Object>>) updInfo.get("gmAddList");

		gDao.goodsUpdate(pMap);
		result = (int) pMap.get("result");

		if (result == 0) {
			return result;
		} else if (result == 1) {
			aplg_no = pMap.get("aplg_no").toString();

			Map<String, Object> gmMap = new HashMap<String, Object>();
			gmMap.put("aplg_no", aplg_no);
			gmMap.put("gmAddList", gmAddList);

			result = gDao.goodsSubAdd(gmMap);

			if (result == 1) {
				pMap.put("gmAddList", gmAddList);
			}
		}
		return result;
	}

	public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> preGoodsList = gDao.preGoodsList(pMap);
		return preGoodsList;
	}

	public Map<String, Object> preGoodsDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = gDao.preGoodsDetail(pMap);
		return rMap;
	}

	public List<Map<String, Object>> goodsSearch(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsSearch = gDao.goodsSearch(pMap);
		return goodsSearch;
	}

	public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsList = gDao.goodsList(pMap);
		return goodsList;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String, Object>> qrCodeList = gDao.qrCodeList(pMap);
		for(int i=0; i<qrCodeList.size();i++) {
	    	  Map<String, Object> indexMap = qrCodeList.get(i);
	    	  indexMap.put("qrPath", "http://localhost:8000/resources/QR/goods/" + indexMap.get("confm_qrcode") + ".png");
	      }
		return qrCodeList;
	}
}
