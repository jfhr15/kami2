package com.kami.kami.vo;

public class Orders {

	private int billseq; //주문번호
	private int productseq; //상품번호
	private String mem_id; //구입한 회원
	private String ord_amount; //총 구입 금액
	private String ord_date; //구입날짜
	private String ord_quantity; //구입수량
	private String ord_status; //주문상태
	public int getBillseq() {
		return billseq;
	}
	public void setBillseq(int billseq) {
		this.billseq = billseq;
	}
	public int getProductseq() {
		return productseq;
	}
	public void setProductseq(int productseq) {
		this.productseq = productseq;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getOrd_amount() {
		return ord_amount;
	}
	public void setOrd_amount(String ord_amount) {
		this.ord_amount = ord_amount;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_quantity() {
		return ord_quantity;
	}
	public void setOrd_quantity(String ord_quantity) {
		this.ord_quantity = ord_quantity;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public Orders(int billseq, int productseq, String mem_id, String ord_amount, String ord_date, String ord_quantity,
			String ord_status) {
		super();
		this.billseq = billseq;
		this.productseq = productseq;
		this.mem_id = mem_id;
		this.ord_amount = ord_amount;
		this.ord_date = ord_date;
		this.ord_quantity = ord_quantity;
		this.ord_status = ord_status;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Orders [billseq=" + billseq + ", productseq=" + productseq + ", mem_id=" + mem_id + ", ord_amount="
				+ ord_amount + ", ord_date=" + ord_date + ", ord_quantity=" + ord_quantity + ", ord_status="
				+ ord_status + "]";
	}
	
	
}
