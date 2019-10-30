package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value="destiList.ch4",produces="text/plain;charset=UTF-8")
	public String destiList(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		List<Map<String,Object>> destiList = iLogic.destiList(pMap);
		jsonStr =g.toJson(destiList);
		return jsonStr;
	}
	
	@RequestMapping(value="destiAdd.ch4",produces="text/plain;charset=UTF-8")
	public String destiAdd(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		List<Map<String,Object>> destiList = iLogic.destiAdd(pMap);
		jsonStr =g.toJson(destiList);
		return jsonStr;
	}
	
	@RequestMapping(value="destiUpd.ch4",produces="text/plain;charset=UTF-8")
	public String destiUpd(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		List<Map<String,Object>> destiList = iLogic.destiUpd(pMap);
		jsonStr =g.toJson(destiList);
		return jsonStr;
	}
	
	@RequestMapping(value="destiDel.ch4",produces="text/plain;charset=UTF-8")
	public String destiDel(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		List<Map<String,Object>> destiList = iLogic.destiDel(pMap);
		jsonStr =g.toJson(destiList);
		return jsonStr;
	}
	
	
	
	@RequestMapping(value="kiosk.ch4",produces="text/plain;charset=UTF-8")
	public String kiosk(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> kiosk = iLogic.kiosk(pMap);
		logger.info(pMap);
		jsonStr =g.toJson(kiosk);
		return jsonStr;
	}
	
	@RequestMapping(value="kioskUpd.ch4",produces="text/plain;charset=UTF-8")
	public String kioskUpd(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap);
		List<Map<String,Object>> kiosk = iLogic.kioskUpd(pMap);
		jsonStr =g.toJson(kiosk);
		return jsonStr;
	}
	
	
	
	@RequestMapping(value="closeday.ch4",produces="text/plain;charset=UTF-8")
	public String closeday(@RequestParam Map<String,Object> pMap) {
		logger.info("closeday :"+ pMap);
		List<Map<String,Object>> closeday = iLogic.closeday(pMap);
		logger.info("여기");
		jsonStr =g.toJson(closeday);
		return jsonStr;
	}
	
	@RequestMapping(value="closeDayAdd.ch4",produces="text/plain;charset=UTF-8")
	public String closeDayAdd(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> closeday = iLogic.closeDayAdd(pMap);
		jsonStr =g.toJson(closeday);
		return jsonStr;
	}
	
	@RequestMapping(value="closeDayDel.ch4",produces="text/plain;charset=UTF-8")
	public String closeDayDel(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> closeday = iLogic.closeDayDel(pMap);
		jsonStr =g.toJson(closeday);
		return jsonStr;
	}
	
}
