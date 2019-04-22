package com.kami.kami;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.dao.ProductDAO;
import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Product;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	ProcedureDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model,HttpSession session) {

		String id= (String)session.getAttribute("loginId");
		ArrayList<Picture> list = new ArrayList<Picture>();
		list = dao.PictureSelect();
		ArrayList<Product> pList = new ArrayList<Product>();
	      pList = dao.ProductSelect();
	   
		if(id==null) {
			model.addAttribute("picture", list);
			model.addAttribute("product", pList);
			return "home";
		}
		
		int type = dao.typeSelect(id);
		
		if(type==1) {
			 String gender = dao.genderSelect(id);
		     String org_condition = dao.conditionSelect(id);
		     Condition condition = chageCondition(gender, org_condition); 
		     list = dao.pickmeSelect(condition);
		     model.addAttribute("picture", list);
		     
			model.addAttribute("product", pList);
			
		}else {
			model.addAttribute("picture", list);
			model.addAttribute("product", pList);
		}
		
		
		return "home";
	}
	
	@RequestMapping(value = "/goHome", method = RequestMethod.GET)
	public String goHome() {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/goAbout", method = RequestMethod.GET)
	public String goAbout() {
		return "about";
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
