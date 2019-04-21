package com.kami.kami.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.vo.Picture;

@Controller
public class hairController {

	@Autowired
	ProcedureDAO dao;
	
	@RequestMapping(value = "/goCut", method = RequestMethod.GET)
	public String goCut() {
		
		return "hair/cut";
	}
	
	@RequestMapping(value = "/goPerm", method = RequestMethod.GET)
	public String goPerm() {
		
		return "hair/perm";
	}
	
	@RequestMapping(value = "/goColor", method = RequestMethod.GET)
	public String goColor() {
		
		return "hair/color";
	}
	
	@RequestMapping(value = "/goDetailHair", method = RequestMethod.GET)
	public String goDetailHair(int pictureSeq, Model model) {
		Picture picture = dao.PictureSelectOne(pictureSeq);
		
		model.addAttribute("picture", picture);
		
		return "hair/detailHair";
	}
}
