package com.kami.kami.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.AdminDAO;
import com.kami.kami.dao.CareerDAO;
import com.kami.kami.vo.Career;
import com.kami.kami.vo.Employee;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Member;

@Controller
public class adminController {
	
	@Autowired
	AdminDAO dao;
	@Autowired
	CareerDAO cDao;
	
	@RequestMapping(value = "/goLogin", method = RequestMethod.GET)
	public String goLogin() {
		
		return "admin/login";
	}
	
	@RequestMapping(value = "/goSignup", method = RequestMethod.GET)
	public String goSignup() {
		
		return "admin/register";
	}
	
	@RequestMapping(value = "/goIndex", method = RequestMethod.GET)
	public String goIndex(Model model) {
		
		return "admin/index";
	}
	
	@RequestMapping(value = "/goIndex2", method = RequestMethod.GET)
	public String goIndex2(Model model) {
		
		return "admin/index2";
	}
	
	@RequestMapping(value = "/goManagement", method = RequestMethod.GET)
	public String goManagement() {
		
		return "admin/index3";
	}
	
	@RequestMapping(value = "/goIndex4", method = RequestMethod.GET)
	public String goIndex4() {
		
		return "admin/index4";
	}
	
	@RequestMapping(value = "/goIndex5", method = RequestMethod.GET)
	public String goIndex5() {
		
		return "admin/index5";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Idinfo idinfo ,HttpSession session, Model model) {
		Idinfo result = dao.login(idinfo);
		if (result == null) {
			return "admin/login";
		} else {
			session.setAttribute("loginId", result.getId());
			session.setAttribute("type", result.getType());
			if(result.getType() == 0) {
				Employee employee = dao.employeeTypeCheck(result.getId());
				session.setAttribute("empType", employee.getPositionseq());
			} else if(result.getType() == 1) {
				Member member = dao.memberTypeCheck(result.getId());
				session.setAttribute("memType", member.getMem_flag());
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute("loginId", null);
		session.setAttribute("empType", null);
		session.setAttribute("memType", null);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/goSignUp", method = RequestMethod.GET)
	public String goSignUp() {
		return "admin/register";
	}
	
	
	@RequestMapping(value = "/insertHuman", method = RequestMethod.POST)
	public String insertHuman(Idinfo idinfo, int division) {
		idinfo.setType(division);
		
		System.out.println(idinfo);
		int result = dao.insertIdinfo(idinfo);
		if (result == 0) {
			return "redirect:/goSignUp";
		} else {
			if(division == 0) {
				Employee employee = new Employee();
				employee.setEmp_id(idinfo.getId());
				int re = dao.insertEmployee(employee);
				if (re == 0) {
					return "redirect:/goSignUp";
				}
			} else if(division == 1) {
				Member member = new Member();
				member.setMem_id(idinfo.getId());
				int re = dao.insertMember(member);
				if (re == 0) {
					return "redirect:/goSignUp";
				}
			}
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/idcheck",method=RequestMethod.GET)
	public @ResponseBody String idcheck(String id) {
		ArrayList<Idinfo> list=dao.selectId();
		for (Idinfo idinfo : list) {
			if (id.equals(idinfo.getId())) {
				return "duplicated";
			}
		}
		return "success";
	}
	
	@RequestMapping(value = "/goSearchPopup", method = RequestMethod.GET)
	public String goSearchPopup() {
		return "admin/searchPopup";
	}
	
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	public @ResponseBody Idinfo idSearch(String is_name, String is_phone, String is_email) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("name", is_name);
		map.put("phone", is_phone);
		map.put("email", is_email);
		
		Idinfo idinfo = dao.idSearch(map);
		
		return idinfo;
	}
	
	@RequestMapping(value = "/pwSearch", method = RequestMethod.POST)
	public @ResponseBody Idinfo pwSearch(String is_id, String is_phone, String is_email) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("id", is_id);
		map.put("phone", is_phone);
		map.put("email", is_email);
		
		Idinfo idinfo = dao.pwSearch(map);
		
		return idinfo;
	}
	
	@RequestMapping(value = "/careerList", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Career> careerList(HttpSession session) {
		ArrayList<Career> cList = new ArrayList<Career>();
		String emp_id = (String)session.getAttribute("loginId");
		cList = cDao.careerList(emp_id);
		
		return cList;
	}
	
	@RequestMapping(value = "/insertCareer", method = RequestMethod.POST)
	public @ResponseBody String insertCareer(Career career, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		career.setEmp_id(loginId);
		cDao.insertCareer(career);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/updateCareer", method = RequestMethod.POST)
	public @ResponseBody String updateCareer(Career career) {
		cDao.updateCareer(career);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/selectCareer", method = RequestMethod.POST)
	public @ResponseBody Career selectCareer(int careeaseq) {
		Career career = cDao.selectCareer(careeaseq);
		
		return career;
	}
	
	@RequestMapping(value = "/deleteCareer", method = RequestMethod.POST)
	public @ResponseBody String deleteCareer(int  careeaseq) {
		cDao.deleteCareer(careeaseq);
		
		return "SUCCESS";
	}
}
