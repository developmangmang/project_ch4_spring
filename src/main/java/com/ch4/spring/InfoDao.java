package com.ch4.spring;

import java.util.HashMap;
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

}
