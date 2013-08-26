package com.udnl.pds.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.udnl.pds.service.PdsListService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PdsListController {
	
	private static final Logger logger = LoggerFactory.getLogger(PdsListController.class);
	
	@Autowired
	protected PdsListService pdsListService;
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getList(Model model, HttpSession session, String period, String page) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		//정상적인 사용자인지 체크
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//에러메세지
			modelMap.put("errcode", 1);
			modelMap.put("errmsg", "정상적인 접근이 아닙니다.");
			return modelMap;
		}
		
		if(period == null || period == ""){
			period = "1";
		}
		if(page == null || page == ""){
			page = "1";
		}
		
		try {
			//리스트 가져오는 서비스 호출
			modelMap.put("pdsList", pdsListService.getList(userId, period, page) );
			modelMap.put("errcode", 0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			modelMap.put("errcode", 2);
			modelMap.put("errmsg", "시스템 에러 입니다.\n관리자에게 문의하세요.");
		}
		
		return modelMap;
	}
}
