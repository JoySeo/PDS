package com.udnl.pds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.udnl.pds.dto.User;

@Service
public class AdminService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public String getAuth(String userId) {
		// TODO Auto-generated method stub
		return (String)sqlMapClientTemplate.queryForObject("admin.selectAuth", userId);
	}

	public Object getAuthList() {
		// TODO Auto-generated method stub
		return sqlMapClientTemplate.queryForList("admin.selectAuthList");
	}

	public void createUser(User user) {
		// TODO Auto-generated method stub
		sqlMapClientTemplate.insert("admin.insertUser", user);
	}

	public String getUserId(User user) {
		// TODO Auto-generated method stub
		return (String)sqlMapClientTemplate.queryForObject("admin.selectUserId",user);
	}


}
