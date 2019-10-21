package com.ch4.spring;

import java.util.Map;

import javax.mail.MessagingException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/admin")
public class AdminContoller {
	Logger logger = Logger.getLogger(AdminContoller.class);
	final static String adminID = "admin";
	final static String adminPW = "q1w2e3r4";
	@Autowired
	AdminLogic adminLogic = null;

	@RequestMapping(value = "adminLogin")
	public String adminLogin(@RequestParam Map<String, Object> pMap) {
		if ((pMap.get("adminID").equals(adminID)) && (pMap.get("adminPW").equals(adminPW))) {
			return "admin/Admin_MangerInfo";
		} else {

		}
		return "Fail";
	}
	@RequestMapping(value = "sendAnwser")
	public String sendAnwser(@RequestParam Map<String, Object> pMap) {
		int result = 0;
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
			return "admin/Admin_QnA";
		}
		return "Fail"; 
	}

}
