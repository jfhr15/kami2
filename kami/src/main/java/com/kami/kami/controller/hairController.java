package com.kami.kami.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.util.PageNavigatorPicture;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Picturesearch;

@Controller
public class hairController {
	
	



	@Autowired
	ProcedureDAO dao;

	
	@RequestMapping(value = "/goCut", method = RequestMethod.GET)
	public String goCut(String hashtag, String setting , Model model ,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		
		if(hashtag==null) {
			
			hashtag = "컷";
			
		}
		if(setting==null) {
			
			setting ="여자";
		}
		picturesearch.setHashtag(hashtag);
		picturesearch.setSetting(setting);
		
		int totalRecoundCount = dao.PictureCount(picturesearch);
		PageNavigatorPicture navi = new PageNavigatorPicture(currentPage, totalRecoundCount);
		
		list = dao.PictureNameSelect(picturesearch, navi.getStartRecord(), navi.getCountPerPage() );
		
		model.addAttribute("navi", navi);
		model.addAttribute("setting", setting);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("picture", list);
		
		
		return "hair/cut";
	}
	
	@RequestMapping(value = "/goCutM", method = RequestMethod.GET)
	public String goCutM(String hashtag, String setting , Model model,@RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();
		
		if(hashtag==null) {
			
			hashtag = "컷";
			
		}
		if(setting==null) {
			
			setting ="남자";
		}
		picturesearch.setHashtag(hashtag);
		picturesearch.setSetting(setting);
		
		int totalRecoundCount = dao.PictureCount(picturesearch);
		PageNavigatorPicture navi = new PageNavigatorPicture(currentPage, totalRecoundCount);
		
		list = dao.PictureNameSelect(picturesearch, navi.getStartRecord(), navi.getCountPerPage() );
		
		model.addAttribute("navi", navi);
		model.addAttribute("setting", setting);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("picture", list);
		
		
		
		
		return "hair/cutM";
	}
	
	@RequestMapping(value = "/goPerm", method = RequestMethod.GET)
	public String goPerm(String hashtag, String setting , Model model,@RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		if(hashtag==null) {
			
			hashtag = "펌";
			
		}
		if(setting==null) {
			
			setting ="여자";
		}
		
		picturesearch.setHashtag(hashtag);
		picturesearch.setSetting(setting);
		
		int totalRecoundCount = dao.PictureCount(picturesearch);
		PageNavigatorPicture navi = new PageNavigatorPicture(currentPage, totalRecoundCount);
		
		list = dao.PictureNameSelect(picturesearch, navi.getStartRecord(), navi.getCountPerPage() );
		
		model.addAttribute("navi", navi);
		model.addAttribute("setting", setting);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("picture", list);
		
		return "hair/perm";
	}
	
	@RequestMapping(value = "/goPermM", method = RequestMethod.GET)
	public String goPermM(String hashtag, String setting , Model model,@RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		if(hashtag==null) {
			
			hashtag = "펌";
			
		}
		if(setting==null) {
			
			setting ="여자";
		}
		
		picturesearch.setHashtag(hashtag);
		picturesearch.setSetting(setting);
		
		int totalRecoundCount = dao.PictureCount(picturesearch);
		PageNavigatorPicture navi = new PageNavigatorPicture(currentPage, totalRecoundCount);
		
		list = dao.PictureNameSelect(picturesearch, navi.getStartRecord(), navi.getCountPerPage() );
		
		model.addAttribute("navi", navi);
		model.addAttribute("setting", setting);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("picture", list);
		
		return "hair/permM";
	}
	
	
	@RequestMapping(value = "/goColor", method = RequestMethod.GET)
	public String goColor(String hashtag, String setting , Model model,@RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		Picturesearch picturesearch = new Picturesearch();
		ArrayList<Picture> list = new ArrayList<Picture>();

		if(hashtag==null) {
			
			hashtag = "브";
			
		}
		if(setting==null) {
			
			setting ="여자";
		}
		
		picturesearch.setHashtag(hashtag);
		picturesearch.setSetting(setting);
		
		int totalRecoundCount = dao.PictureCount(picturesearch);
		PageNavigatorPicture navi = new PageNavigatorPicture(currentPage, totalRecoundCount);
		
		list = dao.PictureNameSelect(picturesearch, navi.getStartRecord(), navi.getCountPerPage() );
		
		model.addAttribute("navi", navi);
		model.addAttribute("setting", setting);
		model.addAttribute("hashtag", hashtag);
		model.addAttribute("picture", list);
		
		return "hair/color";
	}
	
	@RequestMapping(value = "/goDetailHair", method = RequestMethod.GET)
	public String goDetailHair(int pictureSeq, Model model) {
		Picture picture = dao.PictureSelectOne(pictureSeq);
		
		model.addAttribute("picture", picture);
		
		return "hair/detailHair";
	}
}
