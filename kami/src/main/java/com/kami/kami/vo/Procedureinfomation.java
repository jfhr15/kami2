package com.kami.kami.vo;

public class Procedureinfomation { //고객이 선택한 시술 정보
	private int proinfoseq; //고객이 선택한 시술 정보 시퀀스
	private int procedureseq; //시술 정보 시퀀스
	private int reservationseq; //예약 정보 시퀀스
	public Procedureinfomation() {
		super();
	}
	public Procedureinfomation(int proinfoseq, int procedureseq, int reservationseq) {
		super();
		this.proinfoseq = proinfoseq;
		this.procedureseq = procedureseq;
		this.reservationseq = reservationseq;
	}
	public int getProinfoseq() {
		return proinfoseq;
	}
	public void setProinfoseq(int proinfoseq) {
		this.proinfoseq = proinfoseq;
	}
	public int getProcedureseq() {
		return procedureseq;
	}
	public void setProcedureseq(int procedureseq) {
		this.procedureseq = procedureseq;
	}
	public int getReservationseq() {
		return reservationseq;
	}
	public void setReservationseq(int reservationseq) {
		this.reservationseq = reservationseq;
	}
	@Override
	public String toString() {
		return "Procedureinfomation [proinfoseq=" + proinfoseq + ", procedureseq=" + procedureseq + ", reservationseq="
				+ reservationseq + "]";
	}
}
