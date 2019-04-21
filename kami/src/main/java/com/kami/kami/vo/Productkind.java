package com.kami.kami.vo;

public class Productkind { //상품종류 테이블
	
	private int kindseq; //시퀀스
	private String productkind; //상품종류
	public int getKindseq() {
		return kindseq;
	}
	public void setKindseq(int kindseq) {
		this.kindseq = kindseq;
	}
	public String getProductkind() {
		return productkind;
	}
	public void setProductkind(String productkind) {
		this.productkind = productkind;
	}
	@Override
	public String toString() {
		return "Productkind [kindseq=" + kindseq + ", productkind=" + productkind + "]";
	}
	public Productkind(int kindseq, String productkind) {
		super();
		this.kindseq = kindseq;
		this.productkind = productkind;
	}
	public Productkind() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
