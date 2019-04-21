package com.kami.kami.vo;

public class Payment {
	private String paymentNum; //거래번호
	private String issucess; //거래성공여부
	private String meansofpayment; //결제수단
	private String resultcode; //status 결과상태
	private String totprice; //최종금액
	private String indate; //승인날짜
	private String receipt_url; //영수증 url
	
	
	
	public String getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}
	public String getIssucess() {
		return issucess;
	}
	public void setIssucess(String issucess) {
		this.issucess = issucess;
	}
	public String getMeansofpayment() {
		return meansofpayment;
	}
	public void setMeansofpayment(String meansofpayment) {
		this.meansofpayment = meansofpayment;
	}
	public String getResultcode() {
		return resultcode;
	}
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}
	public String getTotprice() {
		return totprice;
	}
	public void setTotprice(String totprice) {
		this.totprice = totprice;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getReceipt_url() {
		return receipt_url;
	}
	public void setReceipt_url(String receipt_url) {
		this.receipt_url = receipt_url;
	}
	@Override
	public String toString() {
		return "Payment [paymentNum=" + paymentNum + ", issucess=" + issucess + ", meansofpayment=" + meansofpayment
				+ ", resultcode=" + resultcode + ", totprice=" + totprice + ", indate=" + indate + ", receipt_url="
				+ receipt_url + "]";
	}
	public Payment(String paymentNum, String issucess, String meansofpayment, String resultcode, String totprice,
			String indate, String receipt_url) {
		super();
		this.paymentNum = paymentNum;
		this.issucess = issucess;
		this.meansofpayment = meansofpayment;
		this.resultcode = resultcode;
		this.totprice = totprice;
		this.indate = indate;
		this.receipt_url = receipt_url;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
}
