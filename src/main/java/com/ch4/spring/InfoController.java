package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/info")
public class InfoController {
	Logger logger = Logger.getLogger(InfoController.class);
	
	@Value("${host.address}")
	String hostAddress;
	@Autowired
	InfoLogic iLogic = null;
	
	/////////////// SideMenuBar ///////////////////
	@RequestMapping(value = "info_main.ch4")
	public String mng_main(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/info/Info_Main";
	}

	@RequestMapping(value = "logVisitor.ch4")
	public String logVisitor(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/info/Info_ManageVLog";
	}
	
	@RequestMapping(value = "logGoods.ch4")
	public String logGoods(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/info/Info_ManageGLog";
	}
	
	@RequestMapping(value = "totalManage.ch4")
	public String totalManage(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/info/Info_ManageCompany";
	}

}
