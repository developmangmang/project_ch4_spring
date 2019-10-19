package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/info")
public class InfoController {
	Logger logger = Logger.getLogger(InfoController.class);
	@Autowired
	InfoLogic iLogic = null;
	
	@RequestMapping(value="kioskLogin.ch4")
	public String kioskLogin(@RequestParam Map<String,Object> pMap) {
		return "kiosk/Fail";
	}
	@RequestMapping(value="QRconfirm.ch4",produces="text/plain;charset=UTF-8")
	public String QRconfirm(@RequestParam Map<String,Object> pMap, Model mod) {
		if(((String)pMap.get("type")).equals("visitor")) {
			Map<String, Object> resultMap = null;
			resultMap = iLogic.confirmQR(pMap);
			if("in".equals(resultMap.get("inout"))
					||"denied".equals(resultMap.get("inout"))
					||"none".equals(resultMap.get("inout"))
			  ) 
			{
				mod.addAttribute("pMap", pMap);
				return "??";
			}
			else if("out".equals(resultMap.get("inout"))) {
				mod.addAttribute("pMap", pMap);
				return "??";
			}
		}
		else if(((String)pMap.get("type")).equals("goods")) {
			//여기다가 이 qr을 입력하면 안된다는 소리 출력하는법?
		}
		return "Fail";
	}
	@RequestMapping(value="selectExit.ch4")
	public String selectExit(@RequestParam Map<String,Object> pMap) {
		Map<String, Object> resultMap = null;
		resultMap = iLogic.selectExit(pMap);
		if((int)resultMap.get("result")==1) {
			return "??";
		}
		return "Fail";
	}
	
	/////////////// SideMenuBar ///////////////////
	@RequestMapping(value = "info_main.ch4")
	public String mng_main() {
	
		return "company/info/Info_Main";
	}

	@RequestMapping(value = "logVisitor.ch4")
	public String logVisitor() {
	
		return "company/info/Info_ManageVLog";
	}
	
	@RequestMapping(value = "logGoods.ch4")
	public String logGoods() {
	
		return "company/info/Info_ManageGLog";
	}
	
	@RequestMapping(value = "totalManage.ch4")
	public String totalManage() {
		
		return "company/info/Info_ManageCompany";
	}

}
