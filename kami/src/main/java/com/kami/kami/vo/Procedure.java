package com.kami.kami.vo;

public class Procedure { //고객이 선택할 수 있는 시술 정보를 담는다. 

	private int procedureseq; 
	
	private String pcd_name; //시술 명
	private String pcd_setting;
	private String pcd_time; //시술 소요시간
	private String pcd_price; //시술당 가격
	private String pcd_savfile;
	private String pcd_orgfile;
	
	
	
	
	
	public Procedure() {
		super();
	}





	public Procedure(int procedureseq, String pcd_name, String pcd_setting, String pcd_time, String pcd_price,
			String pcd_savfile, String pcd_orgfile) {
		super();
		this.procedureseq = procedureseq;
		this.pcd_name = pcd_name;
		this.pcd_setting = pcd_setting;
		this.pcd_time = pcd_time;
		this.pcd_price = pcd_price;
		this.pcd_savfile = pcd_savfile;
		this.pcd_orgfile = pcd_orgfile;
	}





	public int getProcedureseq() {
		return procedureseq;
	}





	public void setProcedureseq(int procedureseq) {
		this.procedureseq = procedureseq;
	}





	public String getPcd_name() {
		return pcd_name;
	}





	public void setPcd_name(String pcd_name) {
		this.pcd_name = pcd_name;
	}





	public String getPcd_setting() {
		return pcd_setting;
	}





	public void setPcd_setting(String pcd_setting) {
		this.pcd_setting = pcd_setting;
	}





	public String getPcd_time() {
		return pcd_time;
	}





	public void setPcd_time(String pcd_time) {
		this.pcd_time = pcd_time;
	}





	public String getPcd_price() {
		return pcd_price;
	}





	public void setPcd_price(String pcd_price) {
		this.pcd_price = pcd_price;
	}





	public String getPcd_savfile() {
		return pcd_savfile;
	}





	public void setPcd_savfile(String pcd_savfile) {
		this.pcd_savfile = pcd_savfile;
	}





	public String getPcd_orgfile() {
		return pcd_orgfile;
	}





	public void setPcd_orgfile(String pcd_orgfile) {
		this.pcd_orgfile = pcd_orgfile;
	}





	@Override
	public String toString() {
		return "Procedure [procedureseq=" + procedureseq + ", pcd_name=" + pcd_name + ", pcd_setting=" + pcd_setting
				+ ", pcd_time=" + pcd_time + ", pcd_price=" + pcd_price + ", pcd_savfile=" + pcd_savfile
				+ ", pcd_orgfile=" + pcd_orgfile + "]";
	}





	
	
	
}
