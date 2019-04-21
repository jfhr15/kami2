package com.kami.kami.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;

@Controller
public class PictureController {
	
	@Autowired
	ProcedureDAO dao;
	private static final String UPLOADPATH="C:/upload/";
	
	//페이지 이동
		@RequestMapping(value = "/goPicture", method = RequestMethod.GET)
		public String goPicture() {
			return "admin/pictureManage";
		}
		
		 //상품 전체 출력
		   @RequestMapping(value = "/pickmeSelect", method = RequestMethod.POST)
		   public @ResponseBody ArrayList<Picture> pickmeSelect(HttpSession session) {
		      ArrayList<Picture> pList = new ArrayList<Picture>();
		     String id = (String)session.getAttribute("loginId");
		     System.out.println(id);
		     
		     String gender = dao.genderSelect(id);
		     String org_condition = dao.conditionSelect(id);
		     Condition condition = chageCondition(gender, org_condition); 
		     pList = dao.pickmeSelect(condition);
		      System.out.println(pList);
		      return pList;
		   }
		   
		  //condition 설정
		 public Condition chageCondition(String gender, String condition) {
			 Condition result = new Condition();
			 result.setGender(gender);	
			 
			 String[] arrayCondition = condition.split("/");
			 result.setConditionM(arrayCondition[0]);
			 result.setConditionG(arrayCondition[1]);
			 result.setConditionH(arrayCondition[2]);
			 result.setConditionD(arrayCondition[3]);
			 result.setConditionF(arrayCondition[4]);
			 
			 System.out.println(result);
			 return result;
		 }  
}
