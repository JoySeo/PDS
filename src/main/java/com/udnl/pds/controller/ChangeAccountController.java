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
		
		//�������� ��������� üũ
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//�����޼���
			model.addAttribute("msg", "�������� ������ �ƴմϴ�.");
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
		//�������� ��������� üũ
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//�����޼���
			hm.put("msg", "�������� ������ �ƴմϴ�.");
			hm.put("errcode", 2);
		}
		
		try {
			//���� ����� �´��� Ȯ��
			String strConfirm = changeAccService.confirmPass(userId, currPass);
			
			if( strConfirm.equals("1") ){
				//��� ���� ���� ȣ��
				changeAccService.changePass(userId, newPass);
				hm.put("msg", "��й�ȣ�� ���� �Ǿ����ϴ�.");
				hm.put("errcode", 0);
			}else{
				hm.put("msg", "���� ��й�ȣ�� ���� �ʽ��ϴ�.");
				hm.put("errcode", 3);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("msg", "�ý��� ������ �����Ͽ����ϴ�.\n�����ڿ��� ���� �ϼ���.");
			hm.put("errcode", 1);
		}
		
		return hm;
	}
	
}
