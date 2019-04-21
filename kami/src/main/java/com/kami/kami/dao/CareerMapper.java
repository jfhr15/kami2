package com.kami.kami.dao;

import java.util.ArrayList;

import com.kami.kami.vo.Career;

public interface CareerMapper {
	public int insertCareer(Career career);
	public ArrayList<Career> careerList(String emp_id);
	public int updateCareer(Career career);
	public Career selectCareer(int careeaseq);
	public int deleteCareer(int careeaseq);
}
