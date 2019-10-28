package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value="/admin")
public class RestAdminController {
	@Autowired
	AdminLogic adminLogic = null;
	String jsonStr = null;
	Gson g = new Gson();
	
	@RequestMapping(value = "qnaList.ch4")
	public String qnaList() {
		List<Map<String, Object>> qnaList = adminLogic.qnaList();
		jsonStr = g.toJson(qnaList);
		return jsonStr;
	}

	@RequestMapping(value = "adminInfo.ch4")
	public String adminInfo() {
		List<Map<String, Object>> companyList = adminLogic.companyList();
		jsonStr = g.toJson(companyList);
		return jsonStr;
	}
}
