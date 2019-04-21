package com.kami.kami.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.ReservationDAO;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Procedureinfomation;
import com.kami.kami.vo.Reservation;

@Controller
public class reservationController {
	
	@Autowired
	ReservationDAO rDao;
	
	@RequestMapping(value = "/goReservation", method = RequestMethod.GET)
	public String goReservation(Model model) {
		ArrayList<Idinfo> eList = new ArrayList<Idinfo>();
		model.addAttribute("eList", eList);
		
		return "reservation/reservation";
	}
	
	@RequestMapping(value = "/goReservationList", method = RequestMethod.GET)
	public String goReservationList() {
		
		return "reservation/viewReservation";
	}
	
	@RequestMapping(value = "/insertRes", method = RequestMethod.POST)
	public @ResponseBody String insertRes(Reservation res, HttpSession session, int pcd) {
		res.setMem_id((String)session.getAttribute("loginId"));
		
		rDao.selectProcedureOne(pcd);
		
		res.setRsv_time("2:00");
		rDao.insertRes(res);
		
		return "success";
	}
	
	@RequestMapping(value = "/selectRes", method = RequestMethod.GET)
	public @ResponseBody List<Reservation> selectRes(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("mem_id", loginId);
		
		List<Reservation> cList = rDao.selectRes(map);
		
		return cList;
	}
	
	@RequestMapping(value = "/updateRes", method = RequestMethod.POST)
	public @ResponseBody String updateRes(Reservation res, HttpSession session) {
		res.setMem_id((String)session.getAttribute("loginId"));
		res.setRsv_time("3:00");
		rDao.updateRes(res);
		
		return "success";
	}
	
	@RequestMapping(value = "/deleteRes", method = RequestMethod.POST)
	public @ResponseBody String deleteRes(String reservationseq) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("reservationseq", reservationseq);
		
		rDao.deleteRes(map);
		
		return "success";
	}
	
	@RequestMapping(value = "/selectResOne", method = RequestMethod.POST)
	public @ResponseBody Reservation selectResOne(String reservationseq) {
		
		Reservation res = rDao.selectResOne(reservationseq);
		
		return res;
	}
	
	@RequestMapping(value = "/selectResEmp", method = RequestMethod.GET)
	public @ResponseBody List<Reservation> selectResEmp(HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("emp_id", loginId);
		
		List<Reservation> cList = rDao.selectResEmp(map);
		
		return cList;
	}
	
	@RequestMapping(value = "/dList", method = RequestMethod.POST)
	public @ResponseBody List<Idinfo> dList(Model model, String rsv_date) {
		String[] date1 = rsv_date.split("-");
		String date2 = date1[0].substring(date1[0].length() -2, date1[0].length());
		String date = date2+"/"+date1[1]+"/"+date1[2];
		
		ArrayList<Idinfo> dList = rDao.employeeList(date);
		
		model.addAttribute("eList", dList);
		
		return dList;
	}
	
	@RequestMapping(value = "/pList", method = RequestMethod.POST)
	public @ResponseBody List<Procedure> pList(String pcd_setting) {
		ArrayList<Procedure> dList = rDao.selectProcedure(pcd_setting);
		
		return dList;
	}
	
	@RequestMapping(value = "/pOne", method = RequestMethod.POST)
	public @ResponseBody Procedure pOne(int procedureseq) {
		Procedure pOne = rDao.selectProcedureOne(procedureseq);
		
		return pOne;
	}
	
	@RequestMapping(value = "/insertPI", method = RequestMethod.POST)
	public @ResponseBody String insertPI(Procedureinfomation pi) {
		rDao.insertPI(pi);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value = "/currentRes", method = RequestMethod.GET)
	public @ResponseBody Reservation currentRes() {
		Reservation res = rDao.currentRes();
		
		return res;
	}
}
