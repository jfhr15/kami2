package com.kami.kami.vo;

public class Chartarea {
	private String rsv_totalprice;
	private String rsv_date;
	
	
	
	public Chartarea() {
		super();
	}



	public Chartarea(String rsv_totalprice, String rsv_date) {
		super();
		this.rsv_totalprice = rsv_totalprice;
		this.rsv_date = rsv_date;
	}



	public String getRsv_totalprice() {
		return rsv_totalprice;
	}



	public void setRsv_totalprice(String rsv_totalprice) {
		this.rsv_totalprice = rsv_totalprice;
	}



	public String getRsv_date() {
		return rsv_date;
	}



	public void setRsv_date(String rsv_date) {
		this.rsv_date = rsv_date;
	}



	@Override
	public String toString() {
		return "Chartarea [rsv_totalprice=" + rsv_totalprice + ", rsv_date=" + rsv_date + "]";
	}


	
	
}
