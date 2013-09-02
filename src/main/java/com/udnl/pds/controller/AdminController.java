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

import com.udnl.pds.dto.User;
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
	
	@ResponseBody
	@RequestMapping(value = "/getAuth.do", method = RequestMethod.GET)
	public Map<String,Object> getAuth() {
		Map<String,Object> hm = new HashMap<String,Object>();
		hm.put("list", adminService.getAuthList() );
		return hm;
	}
	
	@ResponseBody
	@RequestMapping(value = "/createUser.do", method = RequestMethod.POST)
	public Map<String,Object> createUser(User user, HttpSession session) {
		Map<String,Object> hm = new HashMap<String,Object>();
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null || userId == ""){
			//�����޼���
			hm.put("errcode", 3);
			hm.put("errmsg", "�������� ������ �ƴմϴ�.");
			return hm;
		}
		
		try {
			//���� ���̵� �ִ��� Ȯ��
			String strId = adminService.getUserId(user);
			
			if(strId == null || strId == ""){
				user.setREG_USER(userId);
				adminService.createUser(user);
				hm.put("errcode",  0);
				hm.put("msg",  "�ű� ����ڰ� �߰� �Ǿ����ϴ�.");
			}else{
				hm.put("errcode",  2);
				hm.put("msg",  "������ ID�� �����մϴ�.");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("errcode",  1);
			hm.put("msg",  "�ý��� ������ �����Ͽ����ϴ�.\n�����ڿ� �����ϼ���.");
		}
		
		return hm;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getUsers.do", method = RequestMethod.GET)
	public Map<String,Object> getUsers() {
		Map<String,Object> hm = new HashMap<String,Object>();
		hm.put("list", adminService.getUserList() );
		return hm;
	}
	
	@ResponseBody
	@RequestMapping(value = "/initPass.do", method = RequestMethod.GET)
	public Map<String,Object> initPass(String userId, HttpSession session) {
		Map<String,Object> hm = new HashMap<String,Object>();
		String sId = (String) session.getAttribute("userId");
		
		if(sId == null || sId == ""){
			//�����޼���
			hm.put("errcode", 3);
			hm.put("msg", "�������� ������ �ƴմϴ�.");
			return hm;
		}
		
		try {
			//����� ��� �ʱ�ȭ ���� ȣ��
			adminService.initPass(userId,sId);
			hm.put("errcode",  0);
			hm.put("msg",  "��й�ȣ�� �ʱ�ȭ �Ǿ����ϴ�.");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("errcode",  1);
			hm.put("msg",  "�ý��� ������ �����Ͽ����ϴ�.\n�����ڿ� �����ϼ���.");
		}
		
		return hm;
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyUser.do", method = RequestMethod.POST)
	public Map<String,Object> modifyUser(User user, HttpSession session) {
		Map<String,Object> hm = new HashMap<String,Object>();
		String sId = (String) session.getAttribute("userId");
		
		if(sId == null || sId == ""){
			//�����޼���
			hm.put("errcode", 3);
			hm.put("msg", "�������� ������ �ƴմϴ�.");
			return hm;
		}
		
		try {
			//����� ��� �ʱ�ȭ ���� ȣ��
			user.setUPDATE_USER(sId);
			adminService.modifyUser(user);
			hm.put("errcode",  0);
			hm.put("msg",  "����� ������ ���� �Ǿ����ϴ�.");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("errcode",  1);
			hm.put("msg",  "�ý��� ������ �����Ͽ����ϴ�.\n�����ڿ� �����ϼ���.");
		}
		
		return hm;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteUser.do", method = RequestMethod.POST)
	public Map<String,Object> deleteUser(User user, HttpSession session) {
		Map<String,Object> hm = new HashMap<String,Object>();
		String sId = (String) session.getAttribute("userId");
		
		if(sId == null || sId == ""){
			//�����޼���
			hm.put("errcode", 3);
			hm.put("msg", "�������� ������ �ƴմϴ�.");
			return hm;
		}
		
		try {
			adminService.deleteUser(user);
			hm.put("errcode",  0);
			hm.put("msg",  "����ڰ� ���� �Ǿ����ϴ�.");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			hm.put("errcode",  1);
			hm.put("msg",  "�ý��� ������ �����Ͽ����ϴ�.\n�����ڿ� �����ϼ���.");
		}
		
		return hm;
	}
	
}
