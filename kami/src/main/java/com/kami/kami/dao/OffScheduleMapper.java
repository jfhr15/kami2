package com.kami.kami.dao;

import java.util.HashMap;
import java.util.List;

import com.kami.kami.vo.Offschedule;

public interface OffScheduleMapper {
	public int insertOff(Offschedule off);
	public List<Offschedule> selectOff(HashMap<Object, Object> map);
	public int deleteOff(HashMap<Object, Object> map);
	public Offschedule selectOffOne(int off_scheduleseq);
	public int updateOff(Offschedule off);
	public int updateOffCheck(HashMap<Object, Object> map);
}	
