package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin")
public class AdminContoller {
	Logger logger = Logger.getLogger(AdminContoller.class);
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";
	
	@Value("${host.address}")
	String hostAddress;
	
	@RequestMapping(value="login")
	public String login(@RequestParam Map<String,Object> pMap, Model mod) {
		mod.addAttribute("host",hostAddress);
		if((pMap.get("").equals(adminID))&&(pMap.get("").equals(adminPW))) {
		}
		return "";
	}

}
