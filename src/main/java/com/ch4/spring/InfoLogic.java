package com.ch4.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

	public List<Map<String, Object>> destiList(Map<String, Object> pMap) {
		List<Map<String,Object>> destiList = iDao.destiList(pMap);
		return destiList;
	}
	public List<Map<String, Object>> destiAdd(Map<String, Object> pMap) {
		int result =0;
		List<Map<String,Object>> destiList = new ArrayList<>();
		result = iDao.destiAdd(pMap);
		if(result==1) {
			Map<String,Object> pMap2 = new HashMap<String, Object>();
			pMap2.put("com_no", pMap.get("com_no"));
			destiList = iDao.destiList(pMap2);
		}
		return destiList;
	}
	public List<Map<String, Object>> destiUpd(Map<String, Object> pMap) {
		int result =0;
		List<Map<String, Object>> destiUpd = new ArrayList<>();
		result = iDao.destiUpd(pMap);
		if(result==1) {
			Map<String,Object> pMap2 = new HashMap<String, Object>();
			pMap2.put("com_no", pMap.get("com_no"));
			destiUpd = iDao.destiList(pMap2);
		}
		return destiUpd;
	}
	
	public List<Map<String, Object>> destiDel(Map<String, Object> pMap) {
		int result =0;
		List<Map<String,Object>> destiDel = new ArrayList<>();
		result = iDao.destiDel(pMap);
		if(result==1) {
			Map<String,Object> pMap2 = new HashMap<String, Object>();
			pMap2.put("com_no", pMap.get("com_no"));
			destiDel = iDao.destiList(pMap2);
		}
		return destiDel;
	}

	public List<Map<String, Object>> kiosk(Map<String, Object> pMap) {
		List<Map<String,Object>> kiosk = iDao.kiosk(pMap);
		return kiosk;
	}

	public List<Map<String, Object>> kioskUpd(Map<String, Object> pMap) {
		int result =0;
		List<Map<String,Object>> kioskList = new ArrayList<>();
		
		result = iDao.kioskUpd(pMap);
		if(result ==1) {
			Map<String,Object> pMap2 = new HashMap<String,Object>();
			pMap2.put("com_no",pMap.get("com_no"));
			pMap2.put("kiosk_no", pMap.get("kiosk_no"));
			kioskList = iDao.kiosk(pMap2);
		}
		return kioskList;
	}
	
	public List<Map<String, Object>> closeday(Map<String, Object> pMap) {
		logger.info("logic : "+pMap);
		List<Map<String,Object>> closeday = iDao.closeday(pMap);
		logger.info("closeday :"+closeday);
		return closeday;
	}


	public List<Map<String, Object>> closeDayAdd(Map<String, Object> pMap) {
		int result =0;
		List<Map<String,Object>> closeday = new ArrayList<>();
		result = iDao.closeDayAdd(pMap);
		if(result ==1) {
			logger.info(result);
			Map<String,Object> pMap2 = new HashMap<String, Object>();
			pMap2.put("com_no", pMap.get("com_no"));
			closeday = iDao.closeday(pMap2);
		}
		return closeday;
	}
	

	public List<Map<String, Object>> closeDayDel(Map<String, Object> pMap) {
		int result =0;
		List<Map<String,Object>> closeday = new ArrayList<>();
		result = iDao.closeDayDel(pMap);
		if(result ==1) {
			logger.info(result);
			Map<String,Object> pMap2 = new HashMap<String, Object>();
			pMap2.put("com_no", pMap.get("com_no"));
			closeday = iDao.closeday(pMap2);
		}
		return closeday;
	}

}
