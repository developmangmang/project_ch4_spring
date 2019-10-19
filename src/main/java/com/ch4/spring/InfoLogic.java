package com.ch4.spring;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoLogic {
	@Autowired
	InfoDao iDao = null;

	public Map<String, Object> confirmQR(Map<String, Object> pMap) {
		Map<String, Object> resultMap = null;
		resultMap = iDao.confirmVQR(pMap);
		return resultMap;
	}

	public Map<String, Object> selectExit(Map<String, Object> pMap) {
		Map<String, Object> resultMap = null;
		resultMap = iDao.selectExit(pMap);
		return resultMap;
	}

}
