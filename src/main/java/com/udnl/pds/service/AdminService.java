package com.udnl.pds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public String getAuth(String userId) {
		// TODO Auto-generated method stub
		return (String)sqlMapClientTemplate.queryForObject("admin.selectAuth", userId);
	}


}
