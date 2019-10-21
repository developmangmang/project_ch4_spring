package com.ch4.spring;

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

	@RequestMapping(value="list.ch4",produces="text/plain;charset=UTF-8")
	public String list(@RequestParam Map<String,Object> pMap) {
		return "??";
	}
	@RequestMapping(value="detail.ch4",produces="text/plain;charset=UTF-8")
	public String detail(@RequestParam Map<String,Object> pMap) {
		return "??";
	}
	
}
