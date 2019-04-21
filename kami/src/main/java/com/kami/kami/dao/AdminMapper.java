package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kami.kami.vo.Employee;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Member;

public interface AdminMapper {

	public int insertEmployee(Employee employee);
	public int insertMember(Member member);
	public int insertIdinfo(Idinfo idinfo);
	public Idinfo login(Idinfo idinfo);
	public HashMap<Object,Object> selectEmployee(HashMap<Object,Object> map);
	public ArrayList<Idinfo> selectId();
	public Idinfo idSearch(HashMap<Object,Object> map);
	public Idinfo pwSearch(HashMap<Object,Object> map);
	public Member memberTypeCheck(String id);
	public Employee employeeTypeCheck(String id);
}
