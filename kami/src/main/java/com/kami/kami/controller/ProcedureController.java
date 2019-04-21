package com.kami.kami.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kami.kami.dao.ProcedureDAO;
import com.kami.kami.vo.Condition;
import com.kami.kami.vo.Picture;
import com.kami.kami.vo.Procedure;

@Controller
public class ProcedureController {
	
	@Autowired
	ProcedureDAO dao;
	private static final String UPLOADPATH="C:/upload/";
	
	//페이지 이동
		@RequestMapping(value = "/goProcedureManage", method = RequestMethod.GET)
		public String goProductManage() {
			return "admin/procedureManage";
		}
		
		//상품 등록
		@RequestMapping(value = "/insertProcedure", method = RequestMethod.POST)
		public String insertProcedure(Procedure procedure,HttpSession session, MultipartFile uploadFile, Model model) {
			model.addAttribute("procedure", procedure);
			
			
			//기존 파일 명
			String orgfile = uploadFile.getOriginalFilename();
			procedure.setPcd_orgfile(orgfile);
			//세이브 파일 명
			String savfile = UploadFile(uploadFile);
			procedure.setPcd_savfile(savfile);
			
			System.out.println(procedure);
			int result = dao.insertProcedure(procedure);
			if(result==1) {
				System.out.println("db 입력성공");
			}else {
				System.out.println("db 안들어감");
			}
			
			
			return "admin/procedureManage";
		}	
		
		//사진 등록
				@RequestMapping(value = "/insertPicture", method = RequestMethod.POST)
				public String insertPicture(Picture picture,String hashtag, Condition condition ,HttpSession session, MultipartFile uploadFile, Model model) {
				
					//기존 파일 명
					String orgfile = uploadFile.getOriginalFilename();
					picture.setOrgfile(orgfile);
					//세이브 파일 명
					String savfile = UploadFile(uploadFile);
					picture.setSavfile(savfile);
					//condition값 넣기
					picture.setCondition(condition.toString());
					
					System.out.println(picture);
					int result = dao.insertPicture(picture);
					if(result==1) {
						System.out.println("db 입력성공");
					}else {
						System.out.println("db 안들어감");
					}
					
					
					return "admin/pictureManage";
				}	
		

		//파일 업로드
		public String UploadFile(MultipartFile uploadFile) {
			String fileName = uploadFile.getOriginalFilename();
			if(fileName=="") {
				
				return "";
			}
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH.mm.ss.ms");
			Date time = new Date();
			String time1 = format1.format(time);
			
			try {
				uploadFile.transferTo(new File(UPLOADPATH+time1+fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return time1+fileName;
		}
}
