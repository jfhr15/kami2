package com.kami.kami.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Offschedule;

@Repository
public class OffScheduleDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertOff(Offschedule off) {
		int result = 0;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			result = mapper.insertOff(off);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public List<Offschedule> selectOff(HashMap<Object, Object> map){
		List<Offschedule> cList = null;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			cList = mapper.selectOff(map);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return cList;
	}
	
	public int deleteOff(HashMap<Object, Object> map) {
		int result = 0;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			result = mapper.deleteOff(map);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public Offschedule selectOffOne(int off_scheduleseq) {
		Offschedule result = null;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			result = mapper.selectOffOne(off_scheduleseq);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
	
	public int updateOff(Offschedule off) {
		int result = 0;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			result = mapper.updateOff(off);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	public int updateOffCheck(HashMap<Object, Object> map) {
		int result = 0;
		OffScheduleMapper mapper = session.getMapper(OffScheduleMapper.class);
		try {
			result = mapper.updateOffCheck(map);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
}
