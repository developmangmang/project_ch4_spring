package com.ch4.spring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsDao {
	Logger logger = Logger.getLogger(GoodsDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public Map<String, Object> goodsDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();

		Map<String, Object> infoMap = sqlSessionTemplate.selectOne("goodsApplySearch", pMap);
		List<Map<String, Object>> gmList = sqlSessionTemplate.selectList("goodsSearch", pMap);

		rMap.put("infoMap", infoMap);
		rMap.put("gmList", gmList);

		return rMap;
	}

	public void goodsApplyAdd(Map<String, Object> applyAdd) {
		logger.info("applyAdd : " + applyAdd);
		sqlSessionTemplate.update("goodsApplyAdd", applyAdd);
	}

	public int goodsSubAdd(Map<String, Object> gmMap) {
		int result = 0;

		int gmNum = ((List<Map<String, Object>>) gmMap.get("gmAddList")).size();
		int rowNum = 0;

		rowNum = sqlSessionTemplate.insert("goodsAdd", gmMap);
		if (gmNum == rowNum) {
			result = 1;
		}
		return result;
	}

	public int goodsCancle(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("goodsApplyCancle", pMap);
		result = (int) pMap.get("result");
		return result;
	}

	public int goodsUpdate(Map<String, Object> pMap) {
		int result = 0;
		sqlSessionTemplate.update("goodsApplyUpdate", pMap);
		result = (int) pMap.get("result");
		return result;
	}

	public List<Map<String, Object>> preGoodsList(Map<String, Object> pMap) {
		sqlSessionTemplate.selectList("preGoodsSearch", pMap);
		List<Map<String, Object>> preGoodsList = (List<Map<String, Object>>) pMap.get("preList");
		return preGoodsList;
	}

	public List<Map<String, Object>> goodsSearch(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsSearch = sqlSessionTemplate.selectList("goodsApplySearch", pMap);
		return goodsSearch;
	}

	public List<Map<String, Object>> goodsList(Map<String, Object> pMap) {
		List<Map<String, Object>> goodsList = sqlSessionTemplate.selectList("goodsApplySearch", pMap);
		return goodsList;
	}

	public Map<String, Object> preGoodsDetail(Map<String, Object> pMap) {
		Map<String, Object> rMap = new HashMap<String, Object>();
		List<Map<String, Object>> gmList = sqlSessionTemplate.selectList("goodsSearch", pMap);
		rMap.put("gmList", gmList);
		return rMap;
	}

	public List<Map<String, Object>> qrCodeList(Map<String, Object> pMap) {
		List<Map<String, Object>> qrCodeList = sqlSessionTemplate.selectList("goodsQRcode", pMap);
		return qrCodeList;
	}

	public Map<String, Object> navigation(Map<String, Object> pMap) {
		Map<String, Object> rMap = sqlSessionTemplate.selectOne("navigation", pMap);
		return rMap;
	}

}
