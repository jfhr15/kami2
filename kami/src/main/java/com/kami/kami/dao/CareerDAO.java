package com.kami.kami.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Career;

@Repository
public class CareerDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertCareer(Career career) {
		int result = 0;
		CareerMapper mapper = session.getMapper(CareerMapper.class);
		try{
			result = mapper.insertCareer(career);
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<Career> careerList(String emp_id){
		ArrayList<Career> cList = null;
		CareerMapper mapper = session.getMapper(CareerMapper.class);
		try{
			cList = mapper.careerList(emp_id);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return cList;
	}
	
	public int updateCareer(Career career) {
		int result = 0;
		CareerMapper mapper = session.getMapper(CareerMapper.class);
		try{
			result = mapper.updateCareer(career);
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Career selectCareer(int careeaseq) {
		Career result = null;
		CareerMapper mapper = session.getMapper(CareerMapper.class);
		try{
			result = mapper.selectCareer(careeaseq);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int deleteCareer(int careeaseq) {
		int result = 0;
		CareerMapper mapper = session.getMapper(CareerMapper.class);
		try{
			result = mapper.deleteCareer(careeaseq);
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
}
