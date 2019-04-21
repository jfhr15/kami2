package com.kami.kami.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.AdminDAO;
import com.kami.kami.dao.PaymentDAO;
import com.kami.kami.dao.ProductDAO;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Orders;
import com.kami.kami.vo.Product;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class ProductCostomerController {

   @Autowired
   ProductDAO dao;

   @Autowired
   AdminDAO adao;
	

	@Autowired	
	PaymentDAO pmdao;
	
	IamportClient client;

   //페이지 이동
   @RequestMapping(value = "/goProduct", method = RequestMethod.GET)
   public String goProduct() {
   
   return "product/product";
   }
   

	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "payment/complete";
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
      String id = (String)session.getAttribute("loginId");
      Idinfo idinfo = adao.SearchIDforPayment(id);
      Map<String, Object> map = new HashMap<String, Object>();

      int price2 = Integer.parseInt(product.getPrd_price2());
      
      int price = quantity*price2;

      System.out.println(product);
      System.out.println(quantity);
      System.out.println(idinfo);
      System.out.println(price);
      //결제창에 회원정보, 상품정보, 구매수량 전달
      map.put("quantity", quantity);
      map.put("product", product);
      map.put("price", price);
      map.put("idinfo", idinfo);
      
      return map;
   }
   
   
   //물건 구매 이후 db 저장
	@RequestMapping(value = "/finish", method = RequestMethod.POST)
	public @ResponseBody String finish(com.kami.kami.vo.Payment payment, Orders orders) {
		
		System.out.println(payment);
		System.out.println(orders);
		int presult = pmdao.insertPayment(payment);
		
		if (presult == 1) {
			
			int oresult = pmdao.insertOrders(orders);
			
			if (oresult == 1) {
				return "Payment/Payment";
				}
			else {
				return null;
			}
			
		} else {
			return null;
		}
	}
	
	
	
	//토큰 가져오기
	public void testGetToken() {
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage() + " at testGetToken");
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				System.out.println("401 at testGetToken");
				break;
			case 500 :
				//TODO
				System.out.println("500 at testGetToken");
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
	}

	
	
	
	//결제 요청해서 아임포트에서 반환객체 받아오기
	@RequestMapping(value = "action", method = RequestMethod.POST)
	@ResponseBody
	public IamportResponse<Payment> action(String imp_uid) {
		String api_key = "5104462610694003";
		String api_secret = "DupZMERnNTRfw9RFctADvF23YViTBD9f7yfUc6h008gxi7cuAN86saaq5tkH6uWe2c8fiqgjywQRE3mf";
		client = new IamportClient(api_key, api_secret);
		
		testGetToken();
		IamportResponse<Payment> paymentResponse = null;
		System.out.println("imp_uid : " + imp_uid);
		
		if(imp_uid == null) {
			imp_uid = "";
		}
		try {
			paymentResponse = client.paymentByImpUid(imp_uid);
			//TODO : 처리 로직
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage() + " at action");
			e.printStackTrace();
			System.out.println(e.getHttpStatusCode());
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO : 401 Unauthorized
				System.out.println("401 at action");

				break;
			case 404 :
				//TODO : imp_123412341234 에 해당되는 거래내역이 존재하지 않음
				System.out.println("404 at action");

			 	break;
			case 500 :
				//TODO : 서버 응답 오류
				System.out.println("500 at action");

				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		return paymentResponse;
	}
   
   //한명의 물건 구매 정보 조회
	@RequestMapping(value = "selectOrders", method = RequestMethod.POST)
	public @ResponseBody HashMap<Object, Object> selectOrders(HttpSession session) {
		HashMap<Object, Object> orders = new HashMap<Object, Object>();
		
		String mem_id = (String)session.getAttribute("loginId");
		orders = pmdao.selectOrders(mem_id);
		System.out.println(orders);
		return orders;
	}
	
	
   
}