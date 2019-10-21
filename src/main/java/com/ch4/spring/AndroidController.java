package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ch4.getData.VisitorData;

@RestController
@RequestMapping(value="/android")
public class AndroidController {
	Logger logger = Logger.getLogger(AndroidController.class);
	@Autowired
	VisitorLogic vLogic = null;
	@Autowired
	GoodsLogic gLogic = null;
	@Autowired
	CompanyLogic cLogic = null;
	@Autowired
	InfoLogic iLogic = null;
	
	
	//////////////////////////////////// 키오스크  //////////////////////////////////////////////
	@RequestMapping(value="/QRconfirm.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject confirmVQR(@RequestParam Map<String,Object> pMap) {
	JSONObject jsonObject = new JSONObject();
	logger.info(pMap.get("kiosk_no"));
	logger.info(pMap.get("confm_qrcode"));
	logger.info(pMap.get("type"));
	if(pMap.get("type").equals("visitor")) {
		jsonObject = iLogic.confirmVQR(pMap);
	}
	else if(pMap.get("type").equals("goods")) {
		jsonObject = iLogic.confirmGQR(pMap);
	}
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
	//////////////////////////////////// 키오스크  //////////////////////////////////////////////
	
	
	//////////////////////////////////// 방문자  //////////////////////////////////////////////
	@RequestMapping(value="companyList.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject companyList(@RequestParam Map<String,Object> pMap) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<Map<String, Object>> companyList = vLogic.companyList();
		for(Map<String, Object> company : companyList) {
			jsonArray.add(company);
		}
		jsonObject.put("sendData", jsonArray);
		logger.info(jsonObject.toString());
		return jsonObject;
	}
	
	@RequestMapping(value="deptList.ch4",produces="application/json;charset=utf-8")
	public @ResponseBody JSONObject deptList(@RequestParam Map<String,Object> pMap) {
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		List<Map<String, Object>> deptList = vLogic.deptList(pMap);
		for(Map<String, Object> dept : deptList) {
			jsonArray.add(dept);
		}
		jsonObject.put("sendData", jsonArray);
		logger.info(jsonObject.toString());
		return jsonObject;
	}
	
	@RequestMapping(value="/add.ch4")
	public @ResponseBody JSONObject visitAdd(@RequestParam Map<String,Object> pMap,@ModelAttribute VisitorData vData,Model mod) {
		logger.info("visitAdd호출");
		int result = 0;
		result = vLogic.visitApplyAdd(pMap, vData);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("visit_no", pMap.get("visit_no"));
		return jsonObject;
	}
	
	@RequestMapping(value="/update.ch4")
	public @ResponseBody JSONObject visitorUpdate(@RequestParam Map<String,Object> pMap,@ModelAttribute VisitorData vData,Model mod) {
		logger.info("visitorUpdate호출");
		int result = 0;
		result = vLogic.visitorUpdate(pMap, vData);
		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("visit_no", pMap.get("visit_no"));
		return jsonObject;
	}
	
	@RequestMapping(value="/cancle.ch4")
	public @ResponseBody JSONObject visitorCancle(@RequestParam Map<String,Object> pMap) {
		logger.info("visitorCancle호출");
		int result = 0;
		result = vLogic.visitorCancle(pMap);
		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("visit_no", pMap.get("visit_no"));
		return jsonObject;
	}
	
	@RequestMapping(value="/changeVisitor.ch4")
	public @ResponseBody JSONObject changeVisitor(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("changeVisitor호출");
		Map<String,Object> rMap = vLogic.applyDetail(pMap);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("infoMap", pMap.get("infoMap"));
		jsonObject.put("vtList", pMap.get("vtList"));
		jsonObject.put("tkList", pMap.get("tkList"));
		jsonObject.put("pkList", pMap.get("pkList"));
		return jsonObject;
	}
	//////////////////////////////////// 방문자  //////////////////////////////////////////////
}
