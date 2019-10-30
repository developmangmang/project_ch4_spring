package com.ch4.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoDao {
	Logger logger = Logger.getLogger(InfoDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	public int confirmVQR(Map<String,Object> pMap){
		logger.info("DAO : confirmVQR호출");
		int result = 0;
		result = sqlSessionTemplate.update("confirmVQR",pMap);
		logger.info(pMap);
		logger.info("DAO : "+result);
		return result;
	}
	public int confirmGQR(Map<String,Object> pMap){
		logger.info("DAO : confirmGQR호출");
		int result = 0;
		result = sqlSessionTemplate.update("confirmGQR",pMap);
		logger.info("DAO : "+result);
		return result;
	}
	public int kioskLogin(Map<String,Object> pMap) {
		logger.info("DAO : kioskLogin호출");
		int result = 0;
		result = sqlSessionTemplate.update("kioskLogin",pMap);
		logger.info("DAO : "+result);
		return result;
	}
	public int selectExit(Map<String,Object> pMap) {
		logger.info("DAO : selectExit호출");
		int result = 0;
		result = sqlSessionTemplate.update("selectExit",pMap);
		logger.info("DAO : "+result);
		return result;
	}
	public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
		List<Map<String,Object>> destiList = sqlSessionTemplate.selectList("destination", pMap);
		logger.info(destiList);
		return destiList;
	}
	public List<Map<String, Object>> kiosk(Map<String, Object> pMap) {
		List<Map<String,Object>> kiosk = sqlSessionTemplate.selectList("kiosk", pMap);
		logger.info(kiosk);
		return kiosk;
	}
	public List<Map<String, Object>> closeday(Map<String, Object> pMap) {
		List<Map<String,Object>> closeday = sqlSessionTemplate.selectList("closeday", pMap);
		logger.info(closeday);
		return closeday;
	}
	public int destiAdd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.insert("destiAdd",pMap);
		return result;
	}
	public int destiUpd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.update("destiUpd",pMap);
		return result;
	}
	public int destiDel(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.delete("destiDel",pMap);
		return result;
	}
	public int kioskUpd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.update("kioskUpd",pMap);
		return result;
	}
	public int closeDayAdd(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.insert("closeDayAdd",pMap);
		return result;
	}
	public int closeDayDel(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.delete("closeDayDel",pMap);
		return result;
	}
}
