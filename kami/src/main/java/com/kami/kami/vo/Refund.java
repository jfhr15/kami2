package com.kami.kami.vo;

public class Refund { //환불테이블
	private String cshr_cancelnum; //환불시퀀스
	private String paymentnum; //결제시퀀스
	private String ref_issuccess; //취소성공여부
	private String ref_resultmsg; //취소결과에 대한 설명
	private String ref_resultcode; //결과코드
	private String ref_totalprice; //취소완료금액
	
	
	
	public String getCshr_cancelnum() {
		return cshr_cancelnum;
	}
	@Override
	public String toString() {
		return "Refund [cshr_cancelnum=" + cshr_cancelnum + ", paymentnum=" + paymentnum + ", ref_issuccess="
				+ ref_issuccess + ", ref_resultmsg=" + ref_resultmsg + ", ref_resultcode=" + ref_resultcode
				+ ", ref_totalprice=" + ref_totalprice + "]";
	}
	public Refund() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Refund(String cshr_cancelnum, String paymentnum, String ref_issuccess, String ref_resultmsg,
			String ref_resultcode, String ref_totalprice) {
		super();
		this.cshr_cancelnum = cshr_cancelnum;
		this.paymentnum = paymentnum;
		this.ref_issuccess = ref_issuccess;
		this.ref_resultmsg = ref_resultmsg;
		this.ref_resultcode = ref_resultcode;
		this.ref_totalprice = ref_totalprice;
	}
	public void setCshr_cancelnum(String cshr_cancelnum) {
		this.cshr_cancelnum = cshr_cancelnum;
	}
	public String getPaymentnum() {
		return paymentnum;
	}
	public void setPaymentnum(String paymentnum) {
		this.paymentnum = paymentnum;
	}
	public String getRef_issuccess() {
		return ref_issuccess;
	}
	public void setRef_issuccess(String ref_issuccess) {
		this.ref_issuccess = ref_issuccess;
	}
	public String getRef_resultmsg() {
		return ref_resultmsg;
	}
	public void setRef_resultmsg(String ref_resultmsg) {
		this.ref_resultmsg = ref_resultmsg;
	}
	public String getRef_resultcode() {
		return ref_resultcode;
	}
	public void setRef_resultcode(String ref_resultcode) {
		this.ref_resultcode = ref_resultcode;
	}
	public String getRef_totalprice() {
		return ref_totalprice;
	}
	public void setRef_totalprice(String ref_totalprice) {
		this.ref_totalprice = ref_totalprice;
	}
	
	
}
