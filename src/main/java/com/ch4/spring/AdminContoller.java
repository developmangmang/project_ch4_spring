package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin")
public class AdminContoller {
	Logger logger = Logger.getLogger(AdminContoller.class);
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";
	
	@RequestMapping(value="login")
	public String login(@RequestParam Map<String,Object> pMap) {
		if((pMap.get("").equals(adminID))&&(pMap.get("").equals(adminPW))) {
		}
		return "";
	}

}
