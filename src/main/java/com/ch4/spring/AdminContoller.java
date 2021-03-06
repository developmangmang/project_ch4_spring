package com.ch4.spring;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin")
public class AdminContoller {
	Logger logger = Logger.getLogger(AdminContoller.class);
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";

	
	@Value("${host.address}")
	String hostAddress;
	@Autowired
	AdminLogic adminLogic = null;

	@RequestMapping(value = "adminLogin.ch4")
	public String adminLogin(@RequestParam Map<String, Object> pMap) {
		logger.info(pMap);
		if ((pMap.get("adminID").equals(adminID)) && (pMap.get("adminPW").equals(adminPW))) {
			return "admin/Admin_Info";
		}
		return "Fail";
	}
	@RequestMapping(value = "sendAnswer.ch4")
	public String sendAnwser(@RequestParam Map<String, Object> pMap, Model mod) {
		int result = 0;
		mod.addAttribute("host",hostAddress);
		try {
			SendMail sm = new SendMail();
			sm.sendMail(pMap);
			logger.info("메일 보내기 성공");
		} catch (MessagingException me) {
			me.printStackTrace();
			logger.info("메일 보내기 실패");
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("메일 전송 실패");
		}
		result = adminLogic.sendAnwser(pMap);
		if(result == 1) {//성공
			List<Map<String,Object>> qnaList = adminLogic.qnaList();
			mod.addAttribute("qnaList",qnaList);
			return "admin/Admin_QnA";
		}
		return "Fail"; 
	}
	@RequestMapping(value = "qnaBoard.ch4")
	public String qnaBoard(Model mod) {
		mod.addAttribute("host",hostAddress);
		List<Map<String,Object>> qnaList = adminLogic.qnaList();
		mod.addAttribute("qnaList",qnaList);
		return "admin/Admin_QnA";
	}

}
