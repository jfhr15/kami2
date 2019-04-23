package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kami.kami.vo.Orders;
import com.kami.kami.vo.Payment;



@Repository
public class PaymentDAO {

	@Autowired
	SqlSession session;
	
	public int insertPayment(Payment payment) {
		int result = 0;
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			result = mapper.insertPayment(payment);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	

	//모든 결제정보 출력
	public ArrayList<Payment> selectAllPayment() {
		ArrayList<Payment> pList = new ArrayList<Payment>();
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			pList = mapper.selectAllPayment();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return pList;
		
		
	}
	
	
	//물건 구입 정보 입력
	public int insertOrders(Orders orders) {
		int result = 0;
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			result = mapper.insertOrders(orders);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
		
	}
	
	
	//물건 구입 정보 출력
	public ArrayList<Orders> selectAllOrders() {

		ArrayList<Orders> oList = new ArrayList<Orders>();
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			oList = mapper.selectAllOrders();
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return oList;
		
		
	}
	

	//한명의 물건 구입 정보 조회
	public List<HashMap<String, Object>> selectOrders(String mem_id) {

		List<HashMap<String, Object>> orders = new ArrayList<HashMap<String, Object>>();
		PaymentMapper mapper = session.getMapper(PaymentMapper.class);
		try {
			orders = mapper.selectOrders(mem_id);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return orders;
	}
	
	
	
	
}
