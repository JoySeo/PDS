package com.udnl.pds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.udnl.pds.dto.User;

@Service
public class LoginService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public User login(User user) {
		// TODO Auto-generated method stub
		return (User) sqlMapClientTemplate.queryForObject("login.selectUser", user);
	}

}
