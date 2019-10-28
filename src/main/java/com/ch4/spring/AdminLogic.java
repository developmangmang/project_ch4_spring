package com.ch4.spring;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminLogic {
	@Autowired
	AdminDao adminDao = null;
	
	public int sendAnwser(Map<String, Object> pMap) {
		int result = 0;
		result = adminDao.sendAnwser(pMap);
		return result;
	}
	public List<Map<String, Object>> qnaList() {
	   List<Map<String,Object>> qnaList = adminDao.qnaList();
	   return qnaList;
	}

	public List<Map<String, Object>> companyList() {
	   List<Map<String,Object>> companyList = adminDao.companyList();
	   return companyList;
	}
}
