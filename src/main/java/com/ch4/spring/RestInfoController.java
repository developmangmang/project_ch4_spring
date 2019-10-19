package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value = "/info")
public class RestInfoController {
	Logger logger = Logger.getLogger(RestInfoController.class);
	@Autowired
	InfoLogic iLogic = null;
	String jsonStr = null;
	Gson g = new Gson();

	@RequestMapping(value="list.ch4",produces="text/plain;charset=UTF-8")
	public String list(@RequestParam Map<String,Object> pMap) {
		return "??";
	}
	@RequestMapping(value="detail.ch4",produces="text/plain;charset=UTF-8")
	public String detail(@RequestParam Map<String,Object> pMap) {
		return "??";
	}
	
	//////////////////안드로이드 연동 부분//////////////////
	@RequestMapping(value="/QRconfirm.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject confirmVQR(@RequestParam Map<String,Object> pMap) {
		JSONObject jsonObject = new JSONObject();
		logger.info(pMap.get("kiosk_no"));
		logger.info(pMap.get("confm_qrcode"));
		jsonObject = iLogic.confirmVQR(pMap);
		return jsonObject;
	}
	
	@RequestMapping(value="/kioskLogin.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject kioskLogin(@RequestParam Map<String,Object> pMap) {
		JSONObject jsonObject = new JSONObject();
		jsonObject = iLogic.kioskLogin(pMap);
		return jsonObject;
	}
	
	@RequestMapping(value="/selectExit.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject selectExit(@RequestParam Map<String,Object> pMap) {
		JSONObject jsonObject = new JSONObject();
		logger.info(pMap.get("p_notes"));
		jsonObject = iLogic.selectExit(pMap);
		return jsonObject;
	}
	//////////////////////////////////////////////////
}
