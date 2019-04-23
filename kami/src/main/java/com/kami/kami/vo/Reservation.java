package com.kami.kami.vo;

public class Reservation {
	private int reservationseq;
	private String emp_id; //예약직원
	private String mem_id; //예약회원
	private String paymentNum;//결제정보
	private String rsv_date; //예약날짜
	private String rsv_time; //예약시간
	private int rsv_totalPrice;
	private int pictureSeq;
	public Reservation() {
		super();
	}
	public Reservation(int reservationseq, String emp_id, String mem_id, String paymentNum, String rsv_date,
			String rsv_time, int rsv_totalPrice, int pictureSeq) {
		super();
		this.reservationseq = reservationseq;
		this.emp_id = emp_id;
		this.mem_id = mem_id;
		this.paymentNum = paymentNum;
		this.rsv_date = rsv_date;
		this.rsv_time = rsv_time;
		this.rsv_totalPrice = rsv_totalPrice;
		this.pictureSeq = pictureSeq;
	}
	public int getReservationseq() {
		return reservationseq;
	}
	public void setReservationseq(int reservationseq) {
		this.reservationseq = reservationseq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPaymentNum() {
		return paymentNum;
	}
	public void setPaymentNum(String paymentNum) {
		this.paymentNum = paymentNum;
	}
	public String getRsv_date() {
		return rsv_date;
	}
	public void setRsv_date(String rsv_date) {
		this.rsv_date = rsv_date;
	}
	public String getRsv_time() {
		return rsv_time;
	}
	public void setRsv_time(String rsv_time) {
		this.rsv_time = rsv_time;
	}
	public int getRsv_totalPrice() {
		return rsv_totalPrice;
	}
	public void setRsv_totalPrice(int rsv_totalPrice) {
		this.rsv_totalPrice = rsv_totalPrice;
	}
	public int getPictureSeq() {
		return pictureSeq;
	}
	public void setPictureSeq(int pictureSeq) {
		this.pictureSeq = pictureSeq;
	}
	@Override
	public String toString() {
		return "Reservation [reservationseq=" + reservationseq + ", emp_id=" + emp_id + ", mem_id=" + mem_id
				+ ", paymentNum=" + paymentNum + ", rsv_date=" + rsv_date + ", rsv_time=" + rsv_time
				+ ", rsv_totalPrice=" + rsv_totalPrice + ", pictureSeq=" + pictureSeq + "]";
	}
}
