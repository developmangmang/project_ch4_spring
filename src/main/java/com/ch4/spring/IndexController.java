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
@RequestMapping(value="/index")
public class IndexController {
	Logger logger = Logger.getLogger(IndexController.class);

	@Value("${host.address}")
	String hostAddress;
	@Autowired
	IndexLogic indexLogic = null;

	@RequestMapping(value = "question.ch4")
	public String question(@RequestParam Map<String, Object> pMap, Model mod) {
		int result = 0;
		result = indexLogic.question(pMap);
		mod.addAttribute("host", hostAddress);
		if (result == 1) {
			return "index/Index_QnA";
		}
		return "Fail";
	}

	/* 사이드 바 */
	@RequestMapping(value = "indexMain.ch4")
	public String indexMain(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_Main";
	}

	@RequestMapping(value = "customerSupport.ch4")
	public String customerSupport(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_CustomerSupport";
	}

	@RequestMapping(value = "moveQnA.ch4")
	public String moveQnA(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_QnA";
	}

	@RequestMapping(value = "askJoin.ch4")
	public String askJoin(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_AskJoin";
	}

	@RequestMapping(value = "story.ch4")
	public String story(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_Story";
	}
	
	@RequestMapping(value = "notice.ch4")
	public String notice(Model mod) {
		mod.addAttribute("host", hostAddress);
		return "index/Index_Notice";
	}
}