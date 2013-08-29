package com.udnl.pds.service;

import java.util.HashMap;
import java.util.Map;

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

	public Object getUserList() {
		// TODO Auto-generated method stub
		return sqlMapClientTemplate.queryForList("admin.selectUserList");
	}

	public void initPass(String userId, String sId) {
		// TODO Auto-generated method stub
		Map<String, String> hm = new HashMap<String, String>();
		hm.put("userId", userId);
		hm.put("sId", sId);
		System.out.println("hm>>>>>>>"+hm);
		sqlMapClientTemplate.update("admin.updatePass", hm);
	}

	public void modifyUser(User user) {
		// TODO Auto-generated method stub
		sqlMapClientTemplate.update("admin.updateUser", user);
	}


}
