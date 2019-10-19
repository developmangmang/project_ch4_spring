package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value = "/goods")
public class RestGoodsController {
	Logger logger = Logger.getLogger(RestGoodsController.class);
	@Autowired
	GoodsLogic gLogic = null;
	String jsonStr = null;
	Gson g = new Gson();

	@RequestMapping(value = "preGoodsList.ch4",produces="text/plain;charset=UTF-8")
	public String preGoodsList(@RequestParam Map<String, Object> pMap) {
		List<Map<String, Object>> preGoodsList = gLogic.preGoodsList(pMap);
		logger.info("goods/preGoodsList");
		jsonStr = g.toJson(preGoodsList);
		return jsonStr;
	}

	@RequestMapping(value = "preGoodsListDetail.ch4",produces="text/plain;charset=UTF-8")
	public String preGoodsListDetail(@RequestParam Map<String, Object> pMap) {
		Map<String, Object> preGoodsDetail = gLogic.preGoodsDetail(pMap);
		jsonStr = g.toJson(preGoodsDetail);
		return jsonStr;
	}

	@RequestMapping(value = "search.ch4",produces="text/plain;charset=UTF-8")
	public String search(@RequestParam Map<String, Object> pMap) {
		if(pMap.get("searchType").equals("num")) {
            List<Map<String,Object>> goodsSearch = gLogic.goodsSearch(pMap);
            jsonStr = g.toJson(goodsSearch);
         }
         else if(pMap.get("searchType").equals("info")){
            List<Map<String, Object>> goodsList = gLogic.goodsList(pMap);
            jsonStr = g.toJson(goodsList);
         }
		return jsonStr;
	}

	@RequestMapping(value = "detail.ch4",produces="text/plain;charset=UTF-8")
	public String detail(@RequestParam Map<String, Object> pMap) {
		Map<String, Object> rMap = gLogic.goodsDetail(pMap);
        jsonStr = g.toJson(rMap);
		return jsonStr;
	}

	@RequestMapping(value = "qrCodeList.ch4",produces="text/plain;charset=UTF-8")
	public String qrCodeList(@RequestParam Map<String, Object> pMap) {
		List<Map<String,Object>> qrCodeList = gLogic.qrCodeList(pMap);
        jsonStr = g.toJson(qrCodeList);
		return jsonStr;
	}
}
