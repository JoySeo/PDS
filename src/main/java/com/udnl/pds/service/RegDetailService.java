package com.udnl.pds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

@Service
public class RegDetailService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public Object getPds(String seq) {
		// TODO Auto-generated method stub
		return sqlMapClientTemplate.queryForList("regDetail.selectPds", seq);
	}
}
