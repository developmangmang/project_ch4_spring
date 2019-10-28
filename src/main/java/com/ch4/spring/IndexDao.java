package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexDao {
	Logger logger = Logger.getLogger(IndexDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;

	public int question(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.update("question", pMap);
		return result;
	}

	public List<Map<String, Object>> notice() {
		List<Map<String, Object>> noticeList = sqlSessionTemplate.selectList("notice");
		return noticeList;
	}

}
