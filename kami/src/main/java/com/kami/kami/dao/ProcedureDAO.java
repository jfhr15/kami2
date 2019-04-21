package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.Collections;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Procedure;

@Repository
public class ProcedureDAO {
	
	
	@Autowired
	SqlSession session;
	
	//시술 등록
		public int insertProcedure(Procedure procedure) {
			int result =0;
			
		
			try {
				ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
				result = mapper.insertProcedure(procedure);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			return result;
		}
	
		
		public int insertPicture(Picture picture) {
			int result =0;
			try {
				ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
				result = mapper.insertPicture(picture);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
			return result;
		}
		//추천 사진출력
		public ArrayList<Picture> pickmeSelect(Condition condition){
			ArrayList<Picture> result = new ArrayList<Picture>();
			
			try {
				ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
				result = mapper.pickmeSelect(condition);
				//추천 사진 랜덤 출력
				Collections.shuffle(result);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			
			return result;
		}
		//id로 condition 찾기
		public String genderSelect(String id) {
			String result = null;
			ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
			result = mapper.genderSelect(id);
			
			return result;
		}
		public String conditionSelect(String id) {
			String result = null;
			ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
			result = mapper.conditionSelect(id);
			
			return result;
		}
		
		//사진값 다받아버리기
		public ArrayList<Picture> PictureSelect(){
			ArrayList<Picture> result = new ArrayList<Picture>();
			ArrayList<Picture> result2 = new ArrayList<Picture>();
			ProcedureMapper mapper = session.getMapper(ProcedureMapper.class);
			result = mapper.PictureSelect();
			int k =0;
			if(result.size() < 8) {
				k=result.size();
			} else {
				k=8;
			}
			
			for (int i = 0; i < k; i++) {
				result2.add(result.get(i));
			}
			
			return result2;	
		}
		
}
