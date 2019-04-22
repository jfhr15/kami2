package com.kami.kami.vo;

public class Product {
	private int productseq; //상품시퀀스
	private String kindseq; //상품종류시퀀스
	private String prd_name; //상품 이름
	private String prd_price1; //상품원가
	private String prd_price2; //상품 판매가
	private String prd_content; //상품소개
	private String prd_savfile; //상품저장이름
	private String prd_ognfile; //상품원본이름
	private String prd_quantity; //수량
	private String prd_indate; //상품업로드 날짜
	private String pcd_condition; //머리 상태
	
	
	
	
	
	
	public Product() {
		super();
	}






	public Product(int productseq, String kindseq, String prd_name, String prd_price1, String prd_price2,
			String prd_content, String prd_savfile, String prd_ognfile, String prd_quantity, String prd_indate,
			String pcd_condition) {
		super();
		this.productseq = productseq;
		this.kindseq = kindseq;
		this.prd_name = prd_name;
		this.prd_price1 = prd_price1;
		this.prd_price2 = prd_price2;
		this.prd_content = prd_content;
		this.prd_savfile = prd_savfile;
		this.prd_ognfile = prd_ognfile;
		this.prd_quantity = prd_quantity;
		this.prd_indate = prd_indate;
		this.pcd_condition = pcd_condition;
	}






	public int getProductseq() {
		return productseq;
	}






	public void setProductseq(int productseq) {
		this.productseq = productseq;
	}






	public String getKindseq() {
		return kindseq;
	}






	public void setKindseq(String kindseq) {
		this.kindseq = kindseq;
	}






	public String getPrd_name() {
		return prd_name;
	}






	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}






	public String getPrd_price1() {
		return prd_price1;
	}






	public void setPrd_price1(String prd_price1) {
		this.prd_price1 = prd_price1;
	}






	public String getPrd_price2() {
		return prd_price2;
	}






	public void setPrd_price2(String prd_price2) {
		this.prd_price2 = prd_price2;
	}






	public String getPrd_content() {
		return prd_content;
	}






	public void setPrd_content(String prd_content) {
		this.prd_content = prd_content;
	}






	public String getPrd_savfile() {
		return prd_savfile;
	}






	public void setPrd_savfile(String prd_savfile) {
		this.prd_savfile = prd_savfile;
	}






	public String getPrd_ognfile() {
		return prd_ognfile;
	}






	public void setPrd_ognfile(String prd_ognfile) {
		this.prd_ognfile = prd_ognfile;
	}






	public String getPrd_quantity() {
		return prd_quantity;
	}






	public void setPrd_quantity(String prd_quantity) {
		this.prd_quantity = prd_quantity;
	}






	public String getPrd_indate() {
		return prd_indate;
	}






	public void setPrd_indate(String prd_indate) {
		this.prd_indate = prd_indate;
	}






	public String getPcd_condition() {
		return pcd_condition;
	}






	public void setPcd_condition(String pcd_condition) {
		this.pcd_condition = pcd_condition;
	}






	@Override
	public String toString() {
		return "Product [productseq=" + productseq + ", kindseq=" + kindseq + ", prd_name=" + prd_name + ", prd_price1="
				+ prd_price1 + ", prd_price2=" + prd_price2 + ", prd_content=" + prd_content + ", prd_savfile="
				+ prd_savfile + ", prd_ognfile=" + prd_ognfile + ", prd_quantity=" + prd_quantity + ", prd_indate="
				+ prd_indate + ", pcd_condition=" + pcd_condition + "]";
	}
	
	
	
	
}
