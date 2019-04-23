package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Offschedule;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Procedureinfomation;
import com.kami.kami.vo.Reservation;

public interface ReservationMapper {
	public int insertRes(Reservation res); 
	public ArrayList<Reservation> selectRes(HashMap<Object,Object> map); 
	public int deleteRes(HashMap<Object,Object> map);
	public Reservation selectResOne(int reservationseq);
	public int updateRes(Reservation res);
	public ArrayList<Reservation> selectResEmp(HashMap<Object,Object> map);
	public ArrayList<Idinfo> employeeList(String rsv_date);
	public ArrayList<Procedure> selectProcedure(String pcd_setting);
	public Procedure selectProcedureOne(int procedureseq);
	public int insertPI(Procedureinfomation pi);
	public Reservation currentRes();
	public ArrayList<Offschedule> yasumi(String emp_id);
	public Procedureinfomation selectPI(int reservationseq);
	public Idinfo employeeName(String id);
}
