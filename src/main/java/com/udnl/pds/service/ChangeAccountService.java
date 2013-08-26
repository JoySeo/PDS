package com.udnl.pds.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

@Service
public class ChangeAccountService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public void changePass(String userId, String newPass) {
		// TODO Auto-generated method stub
		Map<String, String> hm = new HashMap<String, String>();
		hm.put("userId", userId);
		hm.put("newPass", newPass);
		sqlMapClientTemplate.update("changeAcc.updateUser", hm);
	}

	public String confirmPass(String userId, String currPass) {
		// TODO Auto-generated method stub
		Map<String, String> hm = new HashMap<String, String>();
		hm.put("userId", userId);
		hm.put("currPass", currPass);
		return (String)sqlMapClientTemplate.queryForObject("changeAcc.selectUser",hm);
	}

}
