package com.kami.kami.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class hairController {

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
}
