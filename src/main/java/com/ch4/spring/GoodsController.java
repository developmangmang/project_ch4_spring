package com.ch4.spring;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ch4.getData.GoodsData;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {
	Logger logger = Logger.getLogger(GoodsController.class);
	@Autowired
	GoodsLogic gLogic = null;

	@RequestMapping(value = "add.ch4",produces="text/plain;charset=UTF-8")
	public String add(@RequestParam Map<String, Object> pMap,@ModelAttribute GoodsData gData, Model mod) {
		int result = 0;
		result = gLogic.goodsApplyAdd(pMap,gData);
		if (result == 1) {
			mod.addAttribute("aplg_no", pMap.get("aplg_no"));
			mod.addAttribute("gmAddList", pMap.get("gmAddList"));
			return "visitor/Visit_ResultGoods";
		}
		return "Fail";
	}

	@RequestMapping(value = "cancle.ch4")
	public String cancle(@RequestParam Map<String, Object> pMap) {
		int result = 0;
		result = gLogic.goodsCancle(pMap);
		if (result == 1) {
			return "visitor/Visit_Main";
		}
		return "Fail";
	}

	@RequestMapping(value = "changeGoods.ch4",produces="text/plain;charset=UTF-8")
	public String changeGoods(@RequestParam Map<String, Object> pMap, Model mod) {
		Map<String, Object> rMap = gLogic.goodsDetail(pMap);
		mod.addAttribute("rMap", rMap);
		return "visitor/Visit_ChangeGoods";
	}

	@RequestMapping(value = "update.ch4",produces="text/plain;charset=UTF-8")
	public String update(@RequestParam Map<String, Object> pMap,@ModelAttribute GoodsData gData, Model mod) {
		int result = 0;
		result = gLogic.goodsUpdate(pMap,gData);
		if (result == 1) {
			mod.addAttribute("aplg_no", pMap.get("aplg_no"));
			mod.addAttribute("gmAddList", pMap.get("gmAddList"));
			return "visitor/Visit_ResultGoods";
		}
		return "Fail";
	}

	@RequestMapping(value="searchGoods.ch4")
	public String searchGoods() {
		
		return "visitor/Visit_SearchGoods";
	}
	
	@RequestMapping(value = "searchGQRcode.ch4")
	public String searchVQRcode() {
		return "visitor/Visit_SearchGoodsQR";
	}
}
