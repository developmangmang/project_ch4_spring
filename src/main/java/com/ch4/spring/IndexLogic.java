package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexLogic {
	@Autowired
	IndexDao indexDao = null;

	public int question(Map<String, Object> pMap) {
		int result = 0;
		result = indexDao.question(pMap);
		return result;
	}

	public List<Map<String, Object>> notice() {
		List<Map<String, Object>> noticeList = indexDao.notice();
		return noticeList;
	}

}
