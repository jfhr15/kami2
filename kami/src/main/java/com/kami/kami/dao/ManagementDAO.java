package com.kami.kami.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Haircolor;
import com.kami.kami.vo.Procedure;

@Repository
public class ManagementDAO {

	@Autowired
	SqlSession session;
	
	public int insertProcedure(Procedure procedure) {
		int result = 0;
		ManagementMapper mapper = session.getMapper(ManagementMapper.class);
		try {
			result = mapper.insertProcedure(procedure);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public ArrayList<Procedure> selectProcedure(){
		ArrayList<Procedure> pList = null;
		ManagementMapper mapper = session.getMapper(ManagementMapper.class);
		try {
			pList = mapper.selectProcedure();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return pList;
	}
}
