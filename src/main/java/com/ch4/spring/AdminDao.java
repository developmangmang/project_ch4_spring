package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDao {
	Logger logger = Logger.getLogger(AdminDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public int sendAnwser(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.insert("sendAnswer", pMap);
		return result;
	}
	
	public List<Map<String, Object>> qnaList() {
		List<Map<String, Object>> qnaList = sqlSessionTemplate.selectList("qnaList");
		return qnaList;
	}

	public List<Map<String, Object>> companyList() {
		List<Map<String, Object>> companyList = sqlSessionTemplate.selectList("companyList");
		return companyList;
	}
}
