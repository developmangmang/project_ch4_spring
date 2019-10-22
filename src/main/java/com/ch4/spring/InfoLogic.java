package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoLogic {
	Logger logger = Logger.getLogger(InfoLogic.class);
	@Autowired
	InfoDao iDao = null;

	public JSONObject confirmVQR(Map<String,Object> pMap) {
		logger.info("Logic : confirmVQR호출");
		iDao.confirmVQR(pMap);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg",pMap.get("msg"));
		jsonObject.put("inout",pMap.get("inout"));
		JSONArray jsonArray = new JSONArray();
		return jsonObject;
	}
	
	public JSONObject confirmGQR(Map<String,Object> pMap) {
		logger.info("Logic : confirmGQR호출");
		iDao.confirmGQR(pMap);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg",pMap.get("msg"));
		jsonObject.put("inout",pMap.get("inout"));
		JSONArray jsonArray = new JSONArray();
		return jsonObject;
	}
	
	public JSONObject kioskLogin(Map<String,Object> pMap) {
		logger.info("Logic : kioskLogin호출");
		iDao.kioskLogin(pMap);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg",pMap.get("msg"));
		jsonObject.put("kiosk_gate",pMap.get("kiosk_gate"));
		JSONArray jsonArray = new JSONArray();
		return jsonObject;
	}
	
	public JSONObject selectExit(Map<String,Object> pMap) {
		logger.info("Logic : selectExit호출");
		iDao.selectExit(pMap);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg",pMap.get("msg"));
		jsonObject.put("inout",pMap.get("inout"));
		JSONArray jsonArray = new JSONArray();
		return jsonObject;
	}

}
