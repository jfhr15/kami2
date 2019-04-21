package com.kami.kami.vo;

public class Supply { //직원이 소유하고 있는 소모품 정보를 관리

	private int supplyseq;
	private String emp_id; 
	private String sup_name; //소모품 이름
	public Supply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Supply(int supplyseq, String emp_id, String sup_name, String sup_amount, String sup_content) {
		super();
		this.supplyseq = supplyseq;
		this.emp_id = emp_id;
		this.sup_name = sup_name;
		this.sup_amount = sup_amount;
		this.sup_content = sup_content;
	}
	public int getSupplyseq() {
		return supplyseq;
	}
	public void setSupplyseq(int supplyseq) {
		this.supplyseq = supplyseq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getSup_name() {
		return sup_name;
	}
	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}
	public String getSup_amount() {
		return sup_amount;
	}
	public void setSup_amount(String sup_amount) {
		this.sup_amount = sup_amount;
	}
	public String getSup_content() {
		return sup_content;
	}
	public void setSup_content(String sup_content) {
		this.sup_content = sup_content;
	}
	private String sup_amount; //소모품 수량
	private String sup_content; //소모품 내용
	@Override
	public String toString() {
		return "Supply [supplyseq=" + supplyseq + ", emp_id=" + emp_id + ", sup_name=" + sup_name + ", sup_amount="
				+ sup_amount + ", sup_content=" + sup_content + "]";
	}
	
	

}
