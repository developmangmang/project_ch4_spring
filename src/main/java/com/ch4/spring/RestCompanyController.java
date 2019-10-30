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
@RequestMapping(value="/company")
public class RestCompanyController {
	Logger logger = Logger.getLogger(RestCompanyController.class);
	@Autowired
	CompanyLogic cLogic = null;
	String jsonStr = null;
	Gson g = new Gson();
	
	@RequestMapping(value = "applyVisitList.ch4",produces="text/plain;charset=UTF-8")
	public String applyVisitList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> applyVisitList =  cLogic.applyVisitList(pMap);
        jsonStr = g.toJson(applyVisitList);
		return jsonStr;
	}
	@RequestMapping(value = "inOutVisitorList.ch4",produces="text/plain;charset=UTF-8")
	public String inOutVisitorList(@RequestParam Map<String, Object> pMap) {
		 logger.info(pMap);
		 List<Map<String, Object>> inOutList = cLogic.inOutVisitorList(pMap);
         jsonStr = g.toJson(inOutList);
         logger.info(jsonStr);
		return jsonStr;
	}
	@RequestMapping(value = "inOutGoodsList.ch4",produces="text/plain;charset=UTF-8")
	public String inOutGoodsList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> inOutList = cLogic.inOutGoodsList(pMap);
		jsonStr = g.toJson(inOutList);
		return jsonStr;
	}
	@RequestMapping(value = "applyGoodsList.ch4",produces="text/plain;charset=UTF-8")
	public String applyGoodsList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> applyGoodsList = cLogic.applyGoodsList(pMap);
        jsonStr = g.toJson(applyGoodsList);
		return jsonStr;
	}
	@RequestMapping(value = "destiList.ch4",produces="text/plain;charset=UTF-8")
	public String destiList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> destiList = cLogic.destiList(pMap);
        jsonStr = g.toJson(destiList);
		return jsonStr;
	}
}