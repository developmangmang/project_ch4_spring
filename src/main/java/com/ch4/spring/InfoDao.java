package com.ch4.spring;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InfoDao {
	Logger logger = Logger.getLogger(InfoDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	public Map<String, Object> confirmVQR(Map<String, Object> pMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		sqlSessionTemplate.selectOne("confirmVQR",pMap); // confirmVQR vs confirmGQR
		resultMap.put("result", pMap.get("result"));
		resultMap.put("inout", pMap.get("inout"));
		resultMap.put("msg", pMap.get("msg"));
		return resultMap;
	}

	public Map<String, Object> selectExit(Map<String, Object> pMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		sqlSessionTemplate.update("selectExit", pMap);
		resultMap.put("result", pMap.get("result"));
		resultMap.put("inout", pMap.get("inout"));
		resultMap.put("msg", pMap.get("msg"));
		return resultMap;
	}

}
