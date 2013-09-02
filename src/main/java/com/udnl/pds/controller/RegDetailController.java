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

import com.udnl.pds.dto.PdsContent;
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
		
		if(userId == null || userId == ""){
			//에러메세지
			model.addAttribute("msg", "정상적인 접근이 아닙니다.");
			return "login";
		}
		
		String strUserNm = (String)session.getAttribute("userNm");
		model.addAttribute("userNm",strUserNm);
		model.addAttribute("flag",flag);
		model.addAttribute("seq",seq);
		model.addAttribute("auth",session.getAttribute("auth"));
		
		//flag R: 상세보기, C: 신규등록, U: 수정
		if( flag.equals("R") ){
			//seq에 해당하는 데이터를 가져온다
			model.addAttribute("result", regDetailService.getPds(seq));
		}
		
		return "reg_detail";
	}
	
	@RequestMapping(value = "/viewList.do", method = RequestMethod.GET)
	public String viewList(Model model, HttpSession session) {
		model.addAttribute("userNm", session.getAttribute("userNm") );
		model.addAttribute("auth",session.getAttribute("auth"));
		return "pds_list";
	}
	
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save(Model model, HttpSession session, PdsContent pdsContent) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId == ""){
			modelMap.put("errcode", 2);
			modelMap.put("msg", "정상적인 접근이 아닙니다.");
			return modelMap;
		}else{
			pdsContent.setUPDATE_USER(userId);
		}
		
		try {
			regDetailService.save(pdsContent);
			modelMap.put("errcode", 0);
			modelMap.put("msg", "저장 완료 되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			modelMap.put("errcode", 1);
			modelMap.put("msg", "시스템 오류로 저장 실패 되었습니다.\n관리자에 문의하세요.");
		}
		
		return modelMap;
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(Model model, HttpSession session, PdsContent pdsContent) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId == ""){
			modelMap.put("errcode", 2);
			modelMap.put("msg", "정상적인 접근이 아닙니다.");
			return modelMap;
		}else{
			pdsContent.setUPDATE_USER(userId);
		}
		
		try {
			regDetailService.delete(pdsContent);
			modelMap.put("errcode", 0);
			modelMap.put("msg", "삭제 완료 되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			modelMap.put("errcode", 1);
			modelMap.put("msg", "시스템 오류로 삭제 실패 되었습니다.\n관리자에 문의하세요.");
		}
		
		return modelMap;
	}
}
