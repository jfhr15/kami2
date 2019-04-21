package com.kami.kami.vo;

public class Member { //회원정보 
	private String mem_id;  //회원아이디
	private String mem_money; //회원이 보유하고 있는 적립금
	private String mem_registDate; //회원가입일
	private String mem_flag; //회원 탈퇴 여부, 1: 가입 / 2: 탈퇴
	private String mem_condition;
	
	
	
	
	public Member() {
		super();
	}




	public Member(String mem_id, String mem_money, String mem_registDate, String mem_flag, String mem_condition) {
		super();
		this.mem_id = mem_id;
		this.mem_money = mem_money;
		this.mem_registDate = mem_registDate;
		this.mem_flag = mem_flag;
		this.mem_condition = mem_condition;
	}




	public String getMem_id() {
		return mem_id;
	}




	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}




	public String getMem_money() {
		return mem_money;
	}




	public void setMem_money(String mem_money) {
		this.mem_money = mem_money;
	}




	public String getMem_registDate() {
		return mem_registDate;
	}




	public void setMem_registDate(String mem_registDate) {
		this.mem_registDate = mem_registDate;
	}




	public String getMem_flag() {
		return mem_flag;
	}




	public void setMem_flag(String mem_flag) {
		this.mem_flag = mem_flag;
	}




	public String getMem_condition() {
		return mem_condition;
	}




	public void setMem_condition(String mem_condition) {
		this.mem_condition = mem_condition;
	}




	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_money=" + mem_money + ", mem_registDate=" + mem_registDate
				+ ", mem_flag=" + mem_flag + ", mem_condition=" + mem_condition + "]";
	}
	
	
}
