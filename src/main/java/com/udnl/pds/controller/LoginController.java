package com.udnl.pds.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.udnl.pds.dto.User;
import com.udnl.pds.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	protected LoginService loginService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginGet(User user, Model model, HttpSession session) {
		return login(user,model,session);
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		logger.info("user="+user);
		
		//id,pass validation
		String strId = user.getID();
		String strPass = user.getPASSWORD();
		if(strId == null || strId == ""){
			model.addAttribute("msg", "ID 를 입력해주세요.");
			System.out.println("model="+model);
			return "login";
		}
		
		if(strPass == null || strPass == ""){
			model.addAttribute("msg", "Password 를 입력해주세요.");
			return "login";
		}

		//로그인 서비스 호출
		String strLogRs = loginService.login(user);
		//결과를 받아와 성공/실패 에따라 분기
		System.out.println("strLogRs="+strLogRs);
		
		if(strLogRs.equals("-1")){
			//로그인 실패
			//실패시 에러페세지 날림
			model.addAttribute("msg", "ID 또는 Password 가 맞지 않습니다.");
			return "login";
		}else{
			//로그인 성공
			//성공시 pds 목록 화면이동
			session.setAttribute("userId", strId);
			session.setAttribute("userNm", strLogRs);
			model.addAttribute("userNm", strLogRs);
			return "pds_list";
		}
	}
}
