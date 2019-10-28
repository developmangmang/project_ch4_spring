package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value = "/index")
public class RestIndexController {
	@Autowired
	IndexLogic indexLogic = null;
	String jsonStr = null;
	Gson g = new Gson();
	
	@RequestMapping(value = "noticeList.ch4",produces="text/plain;charset=UTF-8")
	public String notice(Model mod) {
		List<Map<String, Object>> noticeList = indexLogic.notice();
		jsonStr = g.toJson(noticeList);
		return jsonStr;
	}
}
