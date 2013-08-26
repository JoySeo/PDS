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

import com.udnl.pds.service.ChangeAccountService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ChangeAccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChangeAccountController.class);
	
	@Autowired
	protected ChangeAccountService changeAccService;
	
	@RequestMapping(value = "/changAcc.do", method = RequestMethod.GET)
	public String viewChangeAcc(Model model, HttpSession session) {
		
		//정상적인 사용자인지 체크
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//에러메세지
			model.addAttribute("msg", "정상적인 접근이 아닙니다.");
			return "login";
		}
		
		String strUserNm = (String)session.getAttribute("userNm");
		model.addAttribute("userNm",strUserNm);
		
		return "change_account";
	}
	
	@RequestMapping(value = "/changePass.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePass(Model model, HttpSession session, String currPass, String newPass) {
		Map<String, Object> hm = new HashMap<String, Object>();
		//정상적인 사용자인지 체크
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//에러메세지
			hm.put("msg", "정상적인 접근이 아닙니다.");
			hm.put("errcode", 2);
		}
		
		try {
			//현재 비번이 맞는지 확인
			String strConfirm = changeAccService.confirmPass(userId, currPass);
			
			if( strConfirm.equals("1") ){
				//비번 변경 서비스 호출
				changeAccService.changePass(userId, newPass);
				hm.put("msg", "비밀번호가 변경 되었습니다.");
				hm.put("errcode", 0);
			}else{
				hm.put("msg", "현재 비밀번호가 맞지 않습니다.");
				hm.put("errcode", 3);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("msg", "시스템 오류로 실패하였습니다.\n관리자에게 문의 하세요.");
			hm.put("errcode", 1);
		}
		
		return hm;
	}
	
}
