package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/service")
public class ServiceTypeController {
	Logger logger = Logger.getLogger(ServiceTypeController.class);
	
	@RequestMapping(value="index.ch4")
	public String index() {
		return "index/Index_Choose";
	}
	@RequestMapping(value="visitor.ch4")
	public String visitor() {
		return "visitor/Visit_Main";
	}
	@RequestMapping(value="company.ch4")
	public String company() {
		return "company/Company_Login";
	}
	@RequestMapping(value="admin.ch4")
	public String admin(@RequestParam Map<String,Object> pMap) {
		return "admin/Admin_MangerLogin";
	}

}
