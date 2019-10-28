package com.ch4.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorDao {
	Logger logger = Logger.getLogger(VisitorDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public Map<String, Object> applyDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();

		Map<String, Object> infoMap = sqlSessionTemplate.selectOne("visitorApplySearch", pMap);
		List<Map<String, Object>> vtList = sqlSessionTemplate.selectList("visitorSearch", pMap);
		List<Map<String, Object>> tkList = sqlSessionTemplate.selectList("deviceSearch", pMap);
		List<Map<String, Object>> pkList = sqlSessionTemplate.selectList("parkingSearch", pMap);

		rMap.put("infoMap", infoMap);
		rMap.put("vtList", vtList);
		rMap.put("tkList", tkList);
		rMap.put("pkList", pkList);

		return rMap;
	}

	public void visitApplyAdd(Map<String, Object> applyAdd) {
		logger.info("applyAdd : " + applyAdd);
		sqlSessionTemplate.update("visitorApplyAdd", applyAdd);
		int result = (int) applyAdd.get("result");
		if (result == 0) {
			return;
		}
	}

	public int visitSubAdd(Map<String, Object> vtMap, Map<String, Object> tkMap, Map<String, Object> pkMap) {
		int result = 0;

		int visitorNum = ((List<Map<String, Object>>) vtMap.get("vtAddList")).size();
		int deviceNum = ((List<Map<String, Object>>) tkMap.get("tkAddList")).size();
		int parkNum = ((List<Map<String, Object>>) pkMap.get("pkAddList")).size();
		int rowNum = 0;
		logger.info("visitorNum : " + visitorNum);
		logger.info("deviceNum : " + deviceNum);
		logger.info("parkNum : " + parkNum);

		rowNum = sqlSessionTemplate.insert("visitorAdd", vtMap);
		if (visitorNum == rowNum) {
			result = 1;
			if (deviceNum != 0) {
				rowNum = sqlSessionTemplate.insert("deviceAdd", tkMap);
			} else {
				rowNum = 0;
			}
			if (deviceNum == rowNum) {
				result = 1;
				if (parkNum != 0) {
					rowNum = sqlSessionTemplate.insert("parkingAdd", pkMap);
				} else {
					rowNum = 0;
				}
			} else {
				result = 0;
				return result;
			}
		} else {
			result = 0;
			return result;
		}
		return result;
	}

	public int visitorCancle(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("visitorApplyCancle", pMap);
		result = (int) pMap.get("result");
		logger.info("result : " + (int) pMap.get("result"));
		return result;
	}

	public int visitorUpdate(Map<String, Object> applyupd) {
		int result = 0;
		sqlSessionTemplate.update("visitorApplyUpdate", applyupd);
		result = (int) applyupd.get("result");
		return result;
	}

	public List<Map<String, Object>> companyList() {
		List<Map<String, Object>> companyList = sqlSessionTemplate.selectList("companyCombo");
		return companyList;
	}

	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		logger.info(pMap);
		List<Map<String, Object>> deptList = sqlSessionTemplate.selectList("deptCombo", pMap);
		return deptList;
	}

	public List<Map<String, Object>> applySearch(Map<String, Object> pMap) {
		List<Map<String, Object>> applySearch = sqlSessionTemplate.selectList("visitorApplySearch", pMap);
		return applySearch;
	}

	public List<Map<String, Object>> applyList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyList = sqlSessionTemplate.selectList("visitorApplySearch", pMap);
		return applyList;
	}

	public List<Map<String, Object>> preVisitList(Map<String, Object> pMap) {
		sqlSessionTemplate.update("preVisitorSearch", pMap);
		logger.info("pMap : " + pMap);
		List<Map<String, Object>> preVisitList = (List<Map<String, Object>>) pMap.get("preList");
		return preVisitList;
	}

	public Map<String, Object> previsitDetail(Map<String, Object> pMap) {
		Map<String, Object> preDetailList = new HashMap<String, Object>();

		List<Map<String, Object>> visitorList = sqlSessionTemplate.selectList("visitorSearch", pMap);
		List<Map<String, Object>> deviceList = sqlSessionTemplate.selectList("deviceSearch", pMap);
		List<Map<String, Object>> parkingList = sqlSessionTemplate.selectList("parkingSearch", pMap);

		preDetailList.put("vtList", visitorList);
		preDetailList.put("tkList", deviceList);
		preDetailList.put("pkList", parkingList);

		return preDetailList;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String, Object>> qrCodeList = sqlSessionTemplate.selectList("visitorQRcode", pMap);
		return qrCodeList;
	}

	public Map<String, Object> navigation(Map<String, Object> pMap) {
		Map<String, Object> rMap = sqlSessionTemplate.selectOne("navigation", pMap);
		return rMap;
	}

	public Map<String,Object> naviVisitNo(Map<String, Object> pMap) {
		Map<String,Object> rMap = sqlSessionTemplate.selectOne("naviVisitNo",pMap);
		return rMap;
	}

}