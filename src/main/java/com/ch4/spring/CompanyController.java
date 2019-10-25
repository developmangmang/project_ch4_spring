package com.ch4.spring;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/company")
public class CompanyController {
	Logger logger = Logger.getLogger(CompanyController.class);
	
	@Value("${file.path}")
	String filePath = null;
	@Value("${host.address}")
	String hostAddress;
	@Autowired
	CompanyLogic cLogic = null;
	@Autowired
	VisitorLogic vLogic = null;
	@Autowired
	GoodsLogic gLogic = null;

	@RequestMapping(value = "mngPermit.ch4")
	public String mngPermit(@RequestParam Map<String, Object> pMap, Model mod) {
		int result = 0;
		logger.info("pMap : " + pMap);
		result = cLogic.mngPermit(pMap);
		mod.addAttribute("host",hostAddress);
		if (result == 1) {
			if (pMap.get("visit_no") != null) {
				return "company/manager/Manager_SearchVisitor";
			} else if (pMap.get("aplg_no") != null) {
				return "company/manager/Manager_SearchGoods";
			}
		}
		return "Fail";
	}

	@RequestMapping(value = "login.ch4",produces="text/plain;charset=UTF-8")
	public String login(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req,
			HttpServletResponse res) {
		cLogic.companyLogin(pMap);
		mod.addAttribute("host",hostAddress);
		String msg = pMap.get("msg").toString();
		if (msg.equals("error")) {
			return "Fail";
		} else if (msg.equals("id") || msg.equals("pw")) {
			mod.addAttribute("msg", msg);
			return "company/Company_Login";
		} else if (msg.equals("success")) {
			///////////////////// 세션에 정보 넘기기 //////////////////////
			Map<String, Object> sMap = new HashMap<String, Object>();
			sMap.put("cmng_id", pMap.get("cmng_id"));
			sMap.put("cmng_name", pMap.get("cmng_name"));
			sMap.put("com_no", pMap.get("com_no"));
			sMap.put("com_name", pMap.get("com_name"));
			sMap.put("dept_name", pMap.get("dept_name"));

			HttpSession session = req.getSession();
			session.setAttribute("sMap", sMap);
			//////////////////////////////////////////////////////////

			if (pMap.get("logincheck") != null) {
				Cookie id = new Cookie("cmng_id", pMap.get("cmng_id").toString());
				Cookie pw = new Cookie("cmng_pw", pMap.get("cmng_pw").toString());
				logger.info(pMap.get("cmng_id").toString());
				logger.info(pMap.get("cmng_pw").toString());
				id.setMaxAge(60);
				pw.setMaxAge(60);

				res.addCookie(id);
				res.addCookie(pw);
			}

			if (pMap.get("cmng_grade").toString().equals("승인자")) {
				return "company/manager/Manager_Main";
			} else if (pMap.get("cmng_grade").toString().equals("안내데스크")) {
				return "company/info/Info_Main";
			}
		}
		return "Fail";
	}

	@RequestMapping(value = "register.ch4")
	public String register(@RequestParam Map<String, Object> pMap, Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/Company_Join";
	}

	@RequestMapping(value = "join.ch4")
	public String join(@RequestParam Map<String, Object> pMap, Model mod) {
		int result = 0;
		result = cLogic.companyJoin(pMap);
		mod.addAttribute("host",hostAddress);
		if (result == 1) {
			return "company/Company_Login";
		}
		return "Fail";
	}

	@RequestMapping(value = "isExistID.ch4",produces="application/text;charset=UTF-8")
	public @ResponseBody String isExistID(@RequestParam Map<String, Object> pMap, Model mod, HttpServletRequest req) {
		int result = 0;
		result = cLogic.isExistID(pMap);
		logger.info(pMap);
		mod.addAttribute("host",hostAddress);
		return pMap.get("msg").toString();
	}

	@RequestMapping(value = "logout.ch4")
	public String logout(@RequestParam Map<String, Object> pMap, HttpServletRequest req, Model mod) {
		HttpSession session = req.getSession();
		mod.addAttribute("host",hostAddress);
		session.invalidate();
		return "company/Company_Login";
	}

	@RequestMapping(value = "applyVisitDetail.ch4",produces="text/plain;charset=UTF-8")
	public String applyVisitDetail(@RequestParam Map<String, Object> pMap, Model mod) {
		Map<String, Object> rMap = vLogic.applyDetail(pMap);
		mod.addAttribute("host",hostAddress);
		mod.addAttribute("rMap", rMap);
		return "company/manager/Manager_DetailVisitor";
	}

	@RequestMapping(value = "applyGoodsDetail.ch4",produces="text/plain;charset=UTF-8")
	public String applyGoodsDetail(@RequestParam Map<String, Object> pMap, Model mod) {
		Map<String, Object> rMap = gLogic.goodsDetail(pMap);
		mod.addAttribute("host",hostAddress);
		mod.addAttribute("rMap", rMap);
		return "company/manager/Manager_DetailGoods";
	}

	/////////////// SideMenuBar ///////////////////
	@RequestMapping(value = "mng_main.ch4")
	public String mng_main(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/manager/Manager_Main";
	}

	@RequestMapping(value = "searchVisitor.ch4")
	public String searchVisitor(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/manager/Manager_SearchVisitor";
	}

	@RequestMapping(value = "logVisitor.ch4")
	public String logVisitor(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/manager/Manager_LogVisitor";
	}

	@RequestMapping(value = "searchGoods.ch4")
	public String searchGoods(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/manager/Manager_SearchGoods";
	}

	@RequestMapping(value = "logGoods.ch4")
	public String logGoods(Model mod) {
		mod.addAttribute("host",hostAddress);
		return "company/manager/Manager_LogGoods";
	}

}
