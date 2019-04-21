package com.kami.kami.dao;

import java.util.ArrayList;

import com.kami.kami.vo.Haircolor;
import com.kami.kami.vo.Procedure;

public interface ManagementMapper {
	public int insertProcedure(Procedure procedure);
	public ArrayList<Procedure> selectProcedure();
}
