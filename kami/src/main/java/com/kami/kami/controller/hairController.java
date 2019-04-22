package com.kami.kami.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Picturesearch;

@Controller
public class hairController {
	
	@Autowired
	ProcedureDAO dao;
	

	
	@RequestMapping(value = "/goCut", method = RequestMethod.GET)
	public String goCut(String hashtag, String setting , Model model) {
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		
		if((hashtag==null)||(setting==null)) {
			picturesearch.setHashtag("");
			picturesearch.setSetting("여자");
		}
		
		System.out.println(picturesearch);
		list = dao.PictureNameSelect(picturesearch);
		
	
		
		model.addAttribute("picture", list);
		
		
		return "hair/cut";
	}
	
	@RequestMapping(value = "/goCutM", method = RequestMethod.GET)
	public String goCutM(String hashtag, String setting , Model model) {
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		
		if((hashtag==null)||(setting==null)) {
			picturesearch.setHashtag("");
			picturesearch.setSetting("여자");
		}
		
		System.out.println(picturesearch);
		list = dao.PictureNameSelect(picturesearch);
		
	
		
		model.addAttribute("picture", list);
		
		
		return "hair/cutM";
	}
	
	@RequestMapping(value = "/goPerm", method = RequestMethod.GET)
	public String goPerm() {
		
		return "hair/perm";
	}
	
	@RequestMapping(value = "/goColor", method = RequestMethod.GET)
	public String goColor() {
		
		return "hair/color";
	}
}
