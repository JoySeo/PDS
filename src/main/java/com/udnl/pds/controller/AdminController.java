package com.udnl.pds.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.udnl.pds.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	protected AdminService adminService ;
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String viewAdmin(Model model, HttpSession session) {
		
		//�������� ��������� üũ
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//�����޼���
			model.addAttribute("msg", "�������� ������ �ƴմϴ�.");
			return "login";
		}
		
		String strUserNm = (String)session.getAttribute("userNm");
		model.addAttribute("userNm",strUserNm);
		model.addAttribute("auth",session.getAttribute("auth"));
		
		return "admin";
	}
	
	
}
