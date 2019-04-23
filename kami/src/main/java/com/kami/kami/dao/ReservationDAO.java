package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Offschedule;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Procedureinfomation;
import com.kami.kami.vo.Reservation;

@Repository
public class ReservationDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertRes(Reservation res) {
		int result = 0;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.insertRes(res);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<Reservation> selectRes(HashMap<Object,Object> map){
		ArrayList<Reservation> result = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.selectRes(map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteRes(HashMap<Object,Object> map) {
		int result = 0;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.deleteRes(map);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Reservation selectResOne(int reservationseq) {
		Reservation result = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.selectResOne(reservationseq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int updateRes(Reservation res) {
		int result = 0;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.updateRes(res);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<Reservation> selectResEmp(HashMap<Object,Object> map){
		ArrayList<Reservation> result = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.selectResEmp(map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public ArrayList<Idinfo> employeeList(String rsv_date){
		ArrayList<Idinfo> result = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.employeeList(rsv_date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public ArrayList<Procedure> selectProcedure(String pcd_setting){
		ArrayList<Procedure> pList= null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			pList = mapper.selectProcedure(pcd_setting);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return pList;
	}
	
	public Procedure selectProcedureOne(int procedureseq) {
		Procedure procedure = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			procedure = mapper.selectProcedureOne(procedureseq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return procedure;
	}
	
	public int insertPI(Procedureinfomation pi) {
		int result = 0;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			result = mapper.insertPI(pi);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Reservation currentRes() {
		Reservation res = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			res = mapper.currentRes();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return res;
	}
	
	public ArrayList<Offschedule> yasumi(String emp_id){
		ArrayList<Offschedule> off = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			off = mapper.yasumi(emp_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return off;
	}
	
	public Procedureinfomation selectPI(int reservationseq) {
		Procedureinfomation pi = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			pi = mapper.selectPI(reservationseq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return pi;
	}
	
	public Idinfo employeeName(String id) {
		Idinfo re = null;
		ReservationMapper mapper = session.getMapper(ReservationMapper.class);
		try {
			re = mapper.employeeName(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return re;
	}
}
