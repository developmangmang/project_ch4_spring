package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyDao {
	Logger logger = Logger.getLogger(CompanyDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public int mngUpdateV(Map<String, Object> pMap) {
		int result = 0;

		sqlSessionTemplate.update("vApplyPermit", pMap);
		result = (int) pMap.get("result");
		logger.info("pMap : : " + pMap);
		return result;
	}

	public int mngUpdateG(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("gApplyPermit", pMap);
		result = (int) pMap.get("result");
		return result;
	}

	public void mngPermitV(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("vApplyConfirm", pMap);// VISIT_CONFM테이블에 insert
	}

	public void mngPermitG(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("gApplyConfirm", pMap);
	}

	public void companyLogin(Map<String, Object> pMap) {
		sqlSessionTemplate.update("companyLogin", pMap);
	}

	public int companyJoin(Map<String, Object> pMap) {
		int result = 0;
		logger.info(pMap);
		result = sqlSessionTemplate.insert("companyJoin", pMap);
		return result;
	}

	public int isExistID(Map<String, Object> pMap) {
		int result = 0;
		logger.info(pMap);
		result = sqlSessionTemplate.update("isExistID", pMap);
		return result;
	}

	public List<Map<String, Object>> applyVisitList(Map<String, Object> pMap) {
		logger.info(pMap);
		List<Map<String, Object>> applyVisitList = sqlSessionTemplate.selectList("visitorApplySearch", pMap);
		return applyVisitList;
	}

	public List<Map<String, Object>> inOutVisitorList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = sqlSessionTemplate.selectList("vLogSearch", pMap);
		logger.info(pMap);
		return inOutList;
	}
	public List<Map<String, Object>> inOutGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = sqlSessionTemplate.selectList("gLogSearch", pMap);
		logger.info(pMap);
		return inOutList;
	}

	public List<Map<String, Object>> applyGoodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> applyGoodsList = sqlSessionTemplate.selectList("goodsApplySearch", pMap);
		return applyGoodsList;
	}

	public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
		List<Map<String, Object>> destiList = sqlSessionTemplate.selectList("destiCombo", pMap);
		return destiList;
	}
}
