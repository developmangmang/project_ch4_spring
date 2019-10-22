package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/service")
public class ServiceTypeController {
	Logger logger = Logger.getLogger(ServiceTypeController.class);
	
	@Value("${host.address}")
	String hostAddress;
	
	@RequestMapping(value="index.ch4")
	public String index(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "index/Index_Choose";
	}
	@RequestMapping(value="visitor.ch4")
	public String visitor(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "visitor/Visit_Main";
	}
	@RequestMapping(value="company.ch4")
	public String company(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/Company_Login";
	}
	@RequestMapping(value="admin.ch4")
	public String admin(@RequestParam Map<String,Object> pMap, Model mod) {
		mod.addAttribute("host",hostAddress);
		return "admin/Admin_MangerLogin";
	}

}
