package com.kami.kami.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kami.kami.vo.Orders;
import com.kami.kami.vo.Payment;

public interface PaymentMapper {
	//결제정보 입력
	public int insertPayment(Payment payment);
	//모든 결제정보 출력
	public ArrayList<Payment> selectAllPayment();
	//물건 구입 정보 입력
	public int insertOrders(Orders orders);
	//물건 구입 정보 전체 조회
	public ArrayList<Orders> selectAllOrders();
	//한명의 물건 구입 정보 조회
	public HashMap<Object, Object> selectOrders(String mem_id);
}	
