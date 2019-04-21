package com.kami.kami.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kami.kami.dao.ProductDAO;
import com.kami.kami.vo.Product;
import com.kami.kami.vo.Productkind;



@Controller
public class ProductController {
	
	@Autowired
	ProductDAO dao;
	private static final String UPLOADPATH= "/resources/img/";
	
	//페이지 이동
	@RequestMapping(value = "/goProductManage", method = RequestMethod.GET)
	public String goProductManage() {
		return "admin/productManage";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "admin/test";
	}
	
	
	//상품종류 전체목록 출력
	@RequestMapping(value = "/selectproductlist", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Productkind> selectproductlist() {
		ArrayList<Productkind> pkList = new ArrayList<Productkind>();
		pkList = dao.selectproductkind();
		System.out.println(pkList);
		return pkList;
	}
	
	//상품 전체목록 출력
	@RequestMapping(value = "/selectAllproduct", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Product> selectAllproduct() {
		ArrayList<Product> pList = new ArrayList<Product>();
		pList = dao.selectProduct();
		System.out.println(pList);
		return pList;
	}
		
	//상품종류 등록
	@RequestMapping(value = "/insertproduct", method = RequestMethod.POST)
	public @ResponseBody int insertproduct(String pk) {
		System.out.println(pk);
		Productkind pkd = new Productkind();
		pkd.setProductkind(pk);
		int result = dao.insertproductkind(pkd);
		if(result==1) {
			System.out.println("상품종류 등록 성공");
		} else {
			System.out.println("상품종류 등록 실패");
		}
		return result;
	}
	
	//상품종류 삭제
	@RequestMapping(value = "/deleteproduct", method = RequestMethod.GET)
	public @ResponseBody int deleteproduct(int seq) {
		System.out.println(seq);
		Productkind pkd = new Productkind();
		pkd.setKindseq(seq);
		int result = dao.deleteproductkind(pkd);
		if(result==1) {
			System.out.println("상품종류 삭제 성공");
		} else {
			System.out.println("상품종류 삭제 실패");
		}
		return result;
	}
	

	//상품등록 페이지 이동
	@RequestMapping(value = "/goProductInsert", method = RequestMethod.GET)
	public String goProductInsert(Model model) {
		ArrayList<Productkind> pList = new ArrayList<Productkind>();
		pList = dao.selectproductkind();
		model.addAttribute("pList", pList);
		return "admin/writeProduct";
	}
	

	/*prd_savfile
	prd_ognfile*/
	//상품 등록
	@RequestMapping(value = "/writeProduct", method = RequestMethod.POST)
	public String writeProduct(Product product, HttpSession session, MultipartFile uploadFile, Model model) {
		System.out.println(product);
		String fileName = UploadFile(uploadFile);
		product.setPrd_ognfile(fileName);
		//이건 바로 그 게시물 페이지로 이동하여 다운받기 위하여..
		model.addAttribute("fileName", fileName);
		System.out.println(fileName);
		int result = dao.insertProduct(product);
		if (result==1) {
			System.out.println("상품 등록 success");
		} else {
			System.out.println("상품 등록 fail");
		}
		return "admin/detailProduct";
	}
	
	
	//파일 업로드
	public String UploadFile(MultipartFile uploadFile) {
		String fileName = uploadFile.getOriginalFilename();
		try {
			uploadFile.transferTo(new File(UPLOADPATH+fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	//파일 다운로드
	@RequestMapping(value="/fileDownload", method=RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, String downloadFile) {
		response.setHeader("Content-Disposition", "attachment;filename="+downloadFile);
		
		FileInputStream fis;
		ServletOutputStream sos;
		
		try {
			fis = new FileInputStream(UPLOADPATH+downloadFile);
			sos = response.getOutputStream();
			FileCopyUtils.copy(fis, sos);
			
			fis.close();
			sos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//상품 상세페이지로 이동
	@RequestMapping(value="/godetailProduct", method=RequestMethod.GET)
	public String godetailProduct(Model model, int productseq) {
		Product product = dao.selectOneProduct(productseq);
		System.out.println(product);
		if (product!=null) {
			model.addAttribute("product", product);
		}
		return "admin/detailProduct";
	}
	
	
	
	//상품 수정페이지로 이동
	@RequestMapping(value="/goUpdateProduct", method=RequestMethod.GET)
	public String goUpdateProduct(Model model, int productseq) {
		Product product = dao.selectOneProduct(productseq);
		ArrayList<Productkind> pList = new ArrayList<Productkind>();
		pList = dao.selectproductkind();
		System.out.println(product);
		if (product!=null) {
			model.addAttribute("pList", pList);
			model.addAttribute("product", product);
		}
		return "admin/writeProduct";
	}
	
	//상품 수정
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(Product product, HttpSession session, MultipartFile uploadFile, Model model) {
		System.out.println(product);
		String fileName = UploadFile(uploadFile);
		product.setPrd_ognfile(fileName);
		model.addAttribute("fileName", fileName);
		System.out.println(fileName);
		int result = dao.updateProduct(product);
		if (result==1) {
			System.out.println("상품 수정 success");
		} else {
			System.out.println("상품 수정 fail");
		}
		return "admin/detailProduct";
	}
		
	
}


