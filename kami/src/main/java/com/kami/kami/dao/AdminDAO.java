package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Employee;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Member;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession session;
	
	
	public int insertIdinfo(Idinfo idinfo) {
		int iResult = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		try {
			iResult = mapper.insertIdinfo(idinfo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return iResult;
	}
	
	public int insertEmployee(Employee employee) {
		int eResult = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		try {
			eResult = mapper.insertEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return eResult;
	}
	
	public int insertMember(Member member) {
		int mResult = 0;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		try {
			mResult = mapper.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return mResult;
	}
	
	public HashMap<Object,Object> selectEmployee(HashMap<Object,Object> map) {
		HashMap<Object,Object> result = null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		try {
			result = mapper.selectEmployee(map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public Idinfo login(Idinfo idinfo) {
		Idinfo result= null;
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		try {
			result = mapper.login(idinfo);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public ArrayList<Idinfo> selectId(){
		ArrayList<Idinfo> iList= null;
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			iList = mapper.selectId();
		} catch (Exception e) {
			e.printStackTrace();
			return iList;
		}
		return iList;
	}
	
	public Idinfo idSearch(HashMap<Object,Object> map) {
		Idinfo result= null;
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			result = mapper.idSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Idinfo pwSearch(HashMap<Object,Object> map) {
		Idinfo result= null;
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			result = mapper.pwSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
	
	public Member memberTypeCheck(String id) {
		Member member = new Member();
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			member = mapper.memberTypeCheck(id);
		} catch (Exception e) {
			e.printStackTrace();
			return member;
		}
		return member;
	}
	
	public Employee employeeTypeCheck(String id) {
		Employee employee = new Employee();
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			employee = mapper.employeeTypeCheck(id);
		} catch (Exception e) {
			e.printStackTrace();
			return employee;
		}
		return employee;
	}
	
	public Idinfo SearchIDforPayment(String id) {
		Idinfo result= null;
		try {
			AdminMapper mapper = session.getMapper(AdminMapper.class);
			result = mapper.SearchIDforPayment(id);
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;
	}
}
