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

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.dao.ReservationDAO;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Offschedule;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Procedureinfomation;
import com.kami.kami.vo.Reservation;

@Controller
public class reservationController {
	
	@Autowired
	ReservationDAO rDao;
	@Autowired
	ProcedureDAO pDao;
	
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
	public @ResponseBody String insertRes(Reservation res, HttpSession session, int pcd, int pictureSeq) {
		res.setMem_id((String)session.getAttribute("loginId"));
		
		Procedure p = rDao.selectProcedureOne(pcd);
		
		res.setRsv_time(p.getPcd_time());
		res.setPictureSeq(pictureSeq);
		System.out.println(res);
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
	public @ResponseBody Reservation selectResOne(int reservationseq) {
		
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
	
	@RequestMapping(value = "/yasumi", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Offschedule> yasumi(HttpSession session) {
		String emp_id = (String)session.getAttribute("loginId");
		ArrayList<Offschedule> oList = rDao.yasumi(emp_id);
		
		return oList;
	}
	
	@RequestMapping(value = "/selProcedure", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String selProcedure(int reservationseq) {
		Procedureinfomation pi = rDao.selectPI(reservationseq);
		Procedure p = rDao.selectProcedureOne(pi.getProcedureseq());
		
		return p.getPcd_name();
	}
	
	@RequestMapping(value = "/goReservation2", method = RequestMethod.GET)
	public String goReservation2(Model model, int pictureSeq) {
		ArrayList<Idinfo> eList = new ArrayList<Idinfo>();
		model.addAttribute("eList", eList);
		model.addAttribute("pictureSeq", pictureSeq);
		
		return "reservation/reservation";
	}
	
	@RequestMapping(value = "/selName", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String selName(String id) {
		Idinfo re = rDao.employeeName(id);
		
		return re.getName();
	}
	
	@RequestMapping(value = "/goResCon", method = RequestMethod.GET)
	public String goResCon(Model model, int reservationseq) {
		Reservation res = rDao.selectResOne(reservationseq);
		Picture pic = pDao.PictureSelectOne(res.getPictureSeq());
		
		model.addAttribute("picture", pic);
		model.addAttribute("res", res);
		
		return "admin/customerCondition";
	}
}
