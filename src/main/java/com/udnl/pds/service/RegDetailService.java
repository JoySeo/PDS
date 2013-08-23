package com.udnl.pds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;

import com.udnl.pds.dto.PdsContent;

@Service
public class RegDetailService {
	
	@Autowired
    private SqlMapClientTemplate sqlMapClientTemplate;

	public Object getPds(String seq) {
		// TODO Auto-generated method stub
		return sqlMapClientTemplate.queryForList("regDetail.selectPds", seq);
	}

	public void save(PdsContent pdsContent) {
		// TODO Auto-generated method stub
		sqlMapClientTemplate.insert("regDetail.savePds", pdsContent);
	}

	public void delete(PdsContent pdsContent) {
		// TODO Auto-generated method stub
		sqlMapClientTemplate.insert("regDetail.deletePds", pdsContent);
	}
}
