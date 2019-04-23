package com.kami.kami.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kami.kami.dao.ReservationDAO;
import com.kami.kami.vo.Idinfo;
import com.kami.kami.vo.Orders;
import com.kami.kami.vo.Procedure;
import com.kami.kami.vo.Procedureinfomation;
import com.kami.kami.vo.Reservation;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class reservationController {
   
   @Autowired
   ReservationDAO rDao;
   

   IamportClient client;
   
   @RequestMapping(value = "/goReservation", method = RequestMethod.GET)
   public String goReservation(Model model) {
      ArrayList<Idinfo> eList = new ArrayList<Idinfo>();
      model.addAttribute("eList", eList);
      
      return "reservation/reservation";
   }
   
   @RequestMapping(value = "/goReservationList", method = RequestMethod.GET)
   public String goReservationList() {
      
      return "reservation/viewReservation";
   }
   
   /*@RequestMapping(value = "/insertRes", method = RequestMethod.POST)
   public @ResponseBody String insertRes(Reservation res, HttpSession session, int pcd) {
      res.setMem_id((String)session.getAttribute("loginId"));

      System.out.println(res);
      Procedure p = rDao.selectProcedureOne(pcd);
      
      res.setRsv_time(p.getPcd_time());
      
      rDao.insertRes(res);
      return "success";
   }*/
   
   @RequestMapping(value = "/selectRes", method = RequestMethod.GET)
   public @ResponseBody List<Reservation> selectRes(HttpSession session) {
      String loginId = (String)session.getAttribute("loginId");
      
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      
      map.put("mem_id", loginId);
      
      List<Reservation> cList = rDao.selectRes(map);
      
      return cList;
   }
   
   @RequestMapping(value = "/updateRes", method = RequestMethod.POST)
   public @ResponseBody String updateRes(Reservation res, HttpSession session) {
      res.setMem_id((String)session.getAttribute("loginId"));
      res.setRsv_time("3:00");
      rDao.updateRes(res);
      
      return "success";
   }
   
   @RequestMapping(value = "/deleteRes", method = RequestMethod.POST)
   public @ResponseBody String deleteRes(String reservationseq) {
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      map.put("reservationseq", reservationseq);
      
      rDao.deleteRes(map);
      
      return "success";
   }
   
   @RequestMapping(value = "/selectResOne", method = RequestMethod.POST)
   public @ResponseBody Reservation selectResOne(String reservationseq) {
      
      Reservation res = rDao.selectResOne(reservationseq);
      
      return res;
   }
   
   @RequestMapping(value = "/selectResEmp", method = RequestMethod.GET)
   public @ResponseBody List<Reservation> selectResEmp(HttpSession session) {
      String loginId = (String)session.getAttribute("loginId");
      
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      
      map.put("emp_id", loginId);
      
      List<Reservation> cList = rDao.selectResEmp(map);
      
      return cList;
   }
   
   @RequestMapping(value = "/dList", method = RequestMethod.POST)
   public @ResponseBody List<Idinfo> dList(Model model, String rsv_date) {
      String[] date1 = rsv_date.split("-");
      String date2 = date1[0].substring(date1[0].length() -2, date1[0].length());
      String date = date2+"/"+date1[1]+"/"+date1[2];
      
      ArrayList<Idinfo> dList = rDao.employeeList(date);
      
      model.addAttribute("eList", dList);
      
      return dList;
   }
   
   @RequestMapping(value = "/pList", method = RequestMethod.POST)
   public @ResponseBody List<Procedure> pList(String pcd_setting) {
      ArrayList<Procedure> dList = rDao.selectProcedure(pcd_setting);
      
      return dList;
   }
   
   @RequestMapping(value = "/pOne", method = RequestMethod.POST)
   public @ResponseBody Procedure pOne(int procedureseq) {
      Procedure pOne = rDao.selectProcedureOne(procedureseq);
      
      return pOne;
   }
   
   @RequestMapping(value = "/insertPI", method = RequestMethod.POST)
   public @ResponseBody String insertPI(Procedureinfomation pi) {
      rDao.insertPI(pi);
      
      return "SUCCESS";
   }
   
   @RequestMapping(value = "/currentRes", method = RequestMethod.GET)
   public @ResponseBody Reservation currentRes() {
      Reservation res = rDao.currentRes();
      
      return res;
   }
   
   
   

   
   //결제 요청해서 아임포트에서 반환객체 받아오기
   @RequestMapping(value = "ReservationAction", method = RequestMethod.POST)
   @ResponseBody
   public IamportResponse<Payment> ReservationAction(String imp_uid) {
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

   //예약 이후 db 저장
   @RequestMapping(value = "/ReservationFinish", method = RequestMethod.POST)
   public @ResponseBody String ReservationFinish(Reservation res, HttpSession session, int pcd) {
      
      res.setMem_id((String)session.getAttribute("loginId"));
      Procedure p = rDao.selectProcedureOne(pcd);
      res.setRsv_time(p.getPcd_time());
      System.out.println(res);
      rDao.insertRes(res);
      return "success";
   }
}