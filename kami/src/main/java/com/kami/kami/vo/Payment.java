package com.kami.kami.vo;

public class Payment {
	private String paymentNum; //거래번호
	private String billseq; //주문번호
	private String pay_isSucess; //거래성공여부
	private String pay_meansOfPayment; //결제방법(지불수단)
	private String pay_resultcode; //결과코드
	private String pay_totalprice; //결제완료금액
	private String pay_ordernum; //주문번호
	private String pay_indate; //승인날짜 및 시간
	private String pay_eventcode; //이벤트코드
	private String pay_cardnum; //카드번호
	private String pay_installment; //할부
	private String pay_ispointuse; //포인트사용
	private String pay_cardtype; //카드종류
	private String pay_cardcompany; //카드발급사
	
	
	public String getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}
	public String getBillseq() {
		return billseq;
	}
	public void setBillseq(String billseq) {
		this.billseq = billseq;
	}
	public String getPay_isSucess() {
		return pay_isSucess;
	}
	public void setPay_isSucess(String pay_isSucess) {
		this.pay_isSucess = pay_isSucess;
	}
	public String getPay_meansOfPayment() {
		return pay_meansOfPayment;
	}
	public void setPay_meansOfPayment(String pay_meansOfPayment) {
		this.pay_meansOfPayment = pay_meansOfPayment;
	}
	public String getPay_resultcode() {
		return pay_resultcode;
	}
	public void setPay_resultcode(String pay_resultcode) {
		this.pay_resultcode = pay_resultcode;
	}
	public String getPay_totalprice() {
		return pay_totalprice;
	}
	public void setPay_totalprice(String pay_totalprice) {
		this.pay_totalprice = pay_totalprice;
	}
	public String getPay_ordernum() {
		return pay_ordernum;
	}
	public void setPay_ordernum(String pay_ordernum) {
		this.pay_ordernum = pay_ordernum;
	}
	public String getPay_indate() {
		return pay_indate;
	}
	public void setPay_indate(String pay_indate) {
		this.pay_indate = pay_indate;
	}
	public String getPay_eventcode() {
		return pay_eventcode;
	}
	public void setPay_eventcode(String pay_eventcode) {
		this.pay_eventcode = pay_eventcode;
	}
	public String getPay_cardnum() {
		return pay_cardnum;
	}
	public void setPay_cardnum(String pay_cardnum) {
		this.pay_cardnum = pay_cardnum;
	}
	public String getPay_installment() {
		return pay_installment;
	}
	public void setPay_installment(String pay_installment) {
		this.pay_installment = pay_installment;
	}
	public String getPay_ispointuse() {
		return pay_ispointuse;
	}
	public void setPay_ispointuse(String pay_ispointuse) {
		this.pay_ispointuse = pay_ispointuse;
	}
	public String getPay_cardtype() {
		return pay_cardtype;
	}
	public void setPay_cardtype(String pay_cardtype) {
		this.pay_cardtype = pay_cardtype;
	}
	public String getPay_cardcompany() {
		return pay_cardcompany;
	}
	public void setPay_cardcompany(String pay_cardcompany) {
		this.pay_cardcompany = pay_cardcompany;
	}
	public Payment(String paymentNum, String billseq, String pay_isSucess, String pay_meansOfPayment,
			String pay_resultcode, String pay_totalprice, String pay_ordernum, String pay_indate, String pay_eventcode,
			String pay_cardnum, String pay_installment, String pay_ispointuse, String pay_cardtype,
			String pay_cardcompany) {
		super();
		this.paymentNum = paymentNum;
		this.billseq = billseq;
		this.pay_isSucess = pay_isSucess;
		this.pay_meansOfPayment = pay_meansOfPayment;
		this.pay_resultcode = pay_resultcode;
		this.pay_totalprice = pay_totalprice;
		this.pay_ordernum = pay_ordernum;
		this.pay_indate = pay_indate;
		this.pay_eventcode = pay_eventcode;
		this.pay_cardnum = pay_cardnum;
		this.pay_installment = pay_installment;
		this.pay_ispointuse = pay_ispointuse;
		this.pay_cardtype = pay_cardtype;
		this.pay_cardcompany = pay_cardcompany;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Payment [paymentNum=" + paymentNum + ", billseq=" + billseq + ", pay_isSucess=" + pay_isSucess
				+ ", pay_meansOfPayment=" + pay_meansOfPayment + ", pay_resultcode=" + pay_resultcode
				+ ", pay_totalprice=" + pay_totalprice + ", pay_ordernum=" + pay_ordernum + ", pay_indate=" + pay_indate
				+ ", pay_eventcode=" + pay_eventcode + ", pay_cardnum=" + pay_cardnum + ", pay_installment="
				+ pay_installment + ", pay_ispointuse=" + pay_ispointuse + ", pay_cardtype=" + pay_cardtype
				+ ", pay_cardcompany=" + pay_cardcompany + "]";
	}
	
	
	
	
}
