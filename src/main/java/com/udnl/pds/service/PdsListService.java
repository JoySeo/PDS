package com.udnl.pds.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

@Service
public class PdsListService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public Object getList(String userId, String period, String page) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("period", period);
		map.put("page", page);
		return sqlMapClientTemplate.queryForList("pdsList.selectList", map);
	}
}
