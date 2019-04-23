package com.kami.kami.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Picturesearch;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Product;

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

	public ArrayList<Product> ProductSelect();
	//사진 이름별분류
	public ArrayList<Picture> PictureNameSelect(Picturesearch picturesearch, RowBounds rb);
	public int PictureCount(Picturesearch picturesearch);
	
	public Picture PictureSelectOne(int pictureSeq);

}
