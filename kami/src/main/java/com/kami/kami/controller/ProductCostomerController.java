package com.kami.kami.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.ProductDAO;
import com.kami.kami.vo.Product;

@Controller
public class ProductCostomerController {

   @Autowired
   ProductDAO dao;

   //페이지 이동
   @RequestMapping(value = "/goProduct", method = RequestMethod.GET)
   public String goProduct() {
   
   return "product/product";
   }
   
   //연습페이지 이동
      @RequestMapping(value = "/producttest", method = RequestMethod.GET)
      public String producttest() {
      
      return "product/productTest";
      }
   
   
   //상품 전체 출력
   @RequestMapping(value = "/selectAll", method = RequestMethod.POST)
   public @ResponseBody ArrayList<Product> selectAll() {
      ArrayList<Product> pList = new ArrayList<Product>();
      pList = dao.selectProduct();
      System.out.println(pList);
      return pList;
   }

   //상품 구매를 위해 상품 한개만 가져오기
   @RequestMapping(value="/searchProduct", method=RequestMethod.POST)
   public @ResponseBody Map<String, Object> searchProduct(int productseq, int quantity, HttpSession session) {
      Product product = dao.selectOneProduct(productseq);
      System.out.println(product);
      System.out.println(quantity);
      String id = (String)session.getAttribute("loginId");
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("product", product);
      map.put("quantity", quantity);
      return map;
   }
   
}