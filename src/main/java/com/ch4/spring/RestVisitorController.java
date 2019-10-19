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
@RequestMapping(value = "/visitor")
public class RestVisitorController {
	Logger logger = Logger.getLogger(RestVisitorController.class);
	@Autowired
	VisitorLogic vLogic = null;
	String jsonStr = null;
	Gson g = new Gson();

	@RequestMapping(value = "companyList.ch4",produces="text/plain;charset=UTF-8")
	public String companyList(@RequestParam Map<String, Object> pMap) {
		logger.info("companyList 호출 성공");
		List<Map<String, Object>> companyList = vLogic.companyList();
		jsonStr = g.toJson(companyList);
		return jsonStr;
	}

	@RequestMapping(value = "deptList.ch4",produces="text/plain;charset=UTF-8")
	public String deptList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> deptList = vLogic.deptList(pMap);
		jsonStr = g.toJson(deptList);
		return jsonStr;
	}

	@RequestMapping(value = "preVisitList.ch4",produces="text/plain;charset=UTF-8")
	public String preVisitList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> preVisitList = vLogic.preVisitList(pMap);
		jsonStr = g.toJson(preVisitList);
		return jsonStr;
	}

	@RequestMapping(value = "preVisitListDetail.ch4",produces="text/plain;charset=UTF-8")
	public String preVisitListDetail(@RequestParam Map<String, Object> pMap) {
		Map<String, Object> preVisitDetail = vLogic.previsitDetail(pMap);
		jsonStr = g.toJson(preVisitDetail);
		return jsonStr;
	}

	@RequestMapping(value = "search.ch4",produces="text/plain;charset=UTF-8")
	public String search(@RequestParam Map<String, Object> pMap) {
		if (pMap.get("searchType").equals("num")) {
			List<Map<String, Object>> applySearch = vLogic.applySearch(pMap);
			jsonStr = g.toJson(applySearch);
		} else if (pMap.get("searchType").equals("info")) {
			List<Map<String, Object>> applyList = vLogic.applyList(pMap);
			jsonStr = g.toJson(applyList);
		}
		return jsonStr;
	}

	@RequestMapping(value = "detail.ch4",produces="text/plain;charset=UTF-8")
	public String detail(@RequestParam Map<String, Object> pMap) {
		Map<String, Object> rMap = vLogic.applyDetail(pMap);
		jsonStr = g.toJson(rMap);
		return jsonStr;
	}

	@RequestMapping(value = "qrCodeList.ch4",produces="text/plain;charset=UTF-8")
	public String qrCodeList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> qrCodeList = vLogic.qrCodeList(pMap);
		jsonStr = g.toJson(qrCodeList);
		return jsonStr;
	}

}
