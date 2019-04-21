package com.kami.kami.dao;

import java.util.ArrayList;

import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Procedure;

public interface ProcedureMapper {
	
	//시술 등록
	public int insertProcedure(Procedure procedure);
	//사진 등록
	public int insertPicture(Picture picture);
	//추전 사진출력
	public ArrayList<Picture> pickmeSelect(Condition condition);
	//ID의 머리상태 조사
	public String genderSelect(String id);
	public String conditionSelect(String id);
	public int typeSelect(String id);
	//사진값 다받아버리기
	public ArrayList<Picture> PictureSelect();
}
