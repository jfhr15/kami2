package com.kami.kami.vo;

public class Chartbar {//데이터를 얻기 위해 만듬
	
	private String id;
	private String name;
	private String rsv_totalprice;
	
	
	
	
	public Chartbar() {
		super();
	}




	public Chartbar(String id, String name, String rsv_totalprice) {
		super();
		this.id = id;
		this.name = name;
		this.rsv_totalprice = rsv_totalprice;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getRsv_totalprice() {
		return rsv_totalprice;
	}




	public void setRsv_totalprice(String rsv_totalprice) {
		this.rsv_totalprice = rsv_totalprice;
	}




	@Override
	public String toString() {
		return "Chartbar [id=" + id + ", name=" + name + ", rsv_totalprice=" + rsv_totalprice + "]";
	}



	
	
}
