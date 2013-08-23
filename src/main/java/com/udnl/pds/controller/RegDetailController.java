package com.udnl.pds.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.udnl.pds.service.RegDetailService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RegDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegDetailController.class);
	
	@Autowired
	protected RegDetailService regDetailService;
	
	@RequestMapping(value = "/regDetail.do", method = RequestMethod.GET)
	public String regDetail(Model model, HttpSession session, String flag, String seq) {
		
		//정상적인 사용자인지 체크
		String userId = (String) session.getAttribute("userId");
		System.out.println("userId="+userId);
		
		if(userId == null || userId == ""){
			//에러메세지
			model.addAttribute("msg", "정상적인 접근이 아닙니다.");
			return "login";
		}
		
		String strUserNm = (String)session.getAttribute("userNm");
		model.addAttribute("userNm",strUserNm);
		model.addAttribute("flag",flag);
		
		//flag R: 상세보기, C: 신규등록, U: 수정
		if( flag.equals("R") ){
			//seq에 해당하는 데이터를 가져온다
			model.addAttribute("result", regDetailService.getPds(seq));
			System.out.println("model>>"+model);
		}
		
		return "reg_detail";
	}
}
