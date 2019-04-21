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


import com.kami.kami.dao.ChartDAO;
import com.kami.kami.dao.OffScheduleDAO;
import com.kami.kami.vo.Offschedule;

@Controller
public class ChartController {
	

	
	@Autowired
	ChartDAO cDao;
	@Autowired
	OffScheduleDAO oDao;
	
	@RequestMapping(value="/chartListH", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> chartListH(Model model) {

		
		String month = "201903";
		 ArrayList<String>list =  cDao.barChartListH(month);
		
		
		
		return list;
	}
	
	
	
	
	@RequestMapping(value="/chartListV", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> chartListV(Model model) {


		String month = "201903";
		 ArrayList<String>list =  cDao.barChartListV(month);
		
		
	
		
		return list;
	}
	
	@RequestMapping(value="/pieChartN", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> barChartD(Model model,HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		

		 ArrayList<String>list =  cDao.pieChartListN(id);
	
		
		return list;
	}
	
	@RequestMapping(value="/pieChartV", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> barChartV(Model model,HttpSession session) {


		String id = (String) session.getAttribute("loginId");
		

		 ArrayList<String>list =  cDao.pieChartListV(id);
	
		
		return list;
	}
	

	@RequestMapping(value="/areaChartH", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> areaChartH(Model model,HttpSession session) {

		String id = (String) session.getAttribute("loginId");
	

		 ArrayList<String>list =  cDao.areaChartListH(id);
		return list;
	}
	
	@RequestMapping(value="/areaChartV", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> areaChartV(Model model,HttpSession session) {

		String id = (String) session.getAttribute("loginId");
		

		 ArrayList<String>list =  cDao.areaChartListV(id);
		
		return list;
	}
	
	@RequestMapping(value="/change0", method = RequestMethod.POST)
	public @ResponseBody String change0() {
		
		return "success";
	}
	
	@RequestMapping(value="/change1", method = RequestMethod.POST)
	public @ResponseBody String change1() {
		
		return "success";
	}
	
	@RequestMapping(value = "/insertOff", method = RequestMethod.POST)
	public @ResponseBody String insertOff(Offschedule off, HttpSession session) {
		off.setEmp_id((String)session.getAttribute("loginId"));
		oDao.insertOff(off);
		System.out.println(off);
		return "success";
	}
	
	@RequestMapping(value = "/selectOff", method = RequestMethod.GET)
	public @ResponseBody List<Offschedule> selectOff(int num, HttpSession session) {
		String off_check = null;
		
		if(num == 0) {
			off_check = "미승인";
		} else if(num == 1){
			off_check = "승인";
		}
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("off_check", off_check);
		map.put("emp_id", (String)session.getAttribute("loginId"));
		
		List<Offschedule> cList = oDao.selectOff(map);
		
		return cList;
	}
	
	@RequestMapping(value = "/updateOff", method = RequestMethod.POST)
	public @ResponseBody String updateOff(Offschedule off) {
		
		oDao.updateOff(off);
		
		return "success";
	}
	
	@RequestMapping(value = "/deleteOff", method = RequestMethod.POST)
	public @ResponseBody String deleteOff(int off_scheduleseq) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("off_scheduleseq", off_scheduleseq);
		
		oDao.deleteOff(map);
		
		return "success";
	}
	
	@RequestMapping(value = "/selectOffOne", method = RequestMethod.POST)
	public @ResponseBody Offschedule selectOffOne(int off_scheduleseq) {
		
		Offschedule off = oDao.selectOffOne(off_scheduleseq);
		
		return off;
	}
	
	@RequestMapping(value = "/updateOffCheck", method = RequestMethod.POST)
	public @ResponseBody String updateOffCheck(int off_scheduleseq) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("off_scheduleseq", off_scheduleseq);
		map.put("off_check", "승인");
		
		oDao.updateOffCheck(map);
		
		return "success";
	}
}
