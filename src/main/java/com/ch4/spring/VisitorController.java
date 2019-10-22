package com.ch4.spring;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ch4.getData.VisitorData;

@Controller
@RequestMapping(value = "/visitor")
public class VisitorController {
	Logger logger = Logger.getLogger(VisitorController.class);
	
	@Value("${file.path}")
	String filePath;
	@Value("${host.address}")
	String hostAddress;
	@Autowired
	VisitorLogic vLogic = null;

	@RequestMapping(value = "applyRequest.ch4",produces="text/plain;charset=UTF-8")
	public String applyRequest(@RequestParam Map<String, Object> pMap, HttpServletRequest req,Model mod) {
		HttpSession session = req.getSession();
		mod.addAttribute("host",hostAddress);
		session.setAttribute("pMap", pMap);
		return "visitor/Visit_Agreement";
	}

	@RequestMapping(value = "searchVisitor.ch4")
	public String searchVisitor(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "visitor/Visit_SearchVisitor";
	}

	@RequestMapping(value = "searchVQRcode.ch4")
	public String searchVQRcode(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "visitor/Visit_SearchVisitorQR";
	}

	@RequestMapping(value = "applyAgreement.ch4")
	public String applyAgreement(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "visitor/Visit_Select";
	}

	@RequestMapping(value = "visitPurpose.ch4")
	public String visitPurpose(@RequestParam Map<String, Object> pMap, HttpServletRequest req ,Model mod) {
		String vPP = req.getParameter("pp");
		mod.addAttribute("host", hostAddress);
		if (vPP.equals("visitor")) {
			return "visitor/Visit_ApplyVisitor";
		} else if (vPP.equals("goods")) {
			return "visitor/Visit_ApplyGoods";
		}
		return "Fail";
	}

	@RequestMapping(value = "add.ch4",produces="text/plain;charset=UTF-8")
	public String add(@RequestParam Map<String, Object> pMap, @ModelAttribute VisitorData vData,  Model mod) {
		int result = 0;
		result = vLogic.visitApplyAdd(pMap,vData);
		mod.addAttribute("host",hostAddress);
		if (result == 1) {
			mod.addAttribute("visit_no", pMap.get("visit_no"));
			mod.addAttribute("vtAddList", pMap.get("vtAddList"));
			mod.addAttribute("tkAddList", pMap.get("tkAddList"));
			mod.addAttribute("pkAddList", pMap.get("pkAddList"));
			return "visitor/Visit_ResultVisitor";
		}
		return "Fail";
	}

	@RequestMapping(value = "cancle.ch4")
	public String cancle(@RequestParam Map<String, Object> pMap, Model mod) {
		int result = 0;
		mod.addAttribute("host",hostAddress);
		result = vLogic.visitorCancle(pMap);
		if (result == 1) {
			return "visitor/Visit_Main";
		}
		return "Fail";
	}

	@RequestMapping(value = "changeVisitor.ch4",produces="text/plain;charset=UTF-8")
	public String changeVisitor(@RequestParam Map<String, Object> pMap, Model mod) {
		Map<String, Object> rMap = vLogic.applyDetail(pMap);
		mod.addAttribute("rMap", rMap);
		mod.addAttribute("host",hostAddress);
		return "visitor/Visit_ChangeVisitor";
	}

	@RequestMapping(value = "update.ch4",produces="text/plain;charset=UTF-8")
	public String update(@RequestParam Map<String, Object> pMap, @ModelAttribute VisitorData vData, Model mod) {
		int result = 0;
		result = vLogic.visitorUpdate(pMap,vData);
		mod.addAttribute("host",hostAddress);
		if (result == 1) {
			mod.addAttribute("visit_no", pMap.get("visit_no"));
			mod.addAttribute("vtAddList", pMap.get("vtAddList"));
			mod.addAttribute("tkAddList", pMap.get("tkAddList"));
			mod.addAttribute("pkAddList", pMap.get("pkAddList"));
			return "visitor/Visit_ResultVisitor";
		}
		return "Fail";
	}

}
