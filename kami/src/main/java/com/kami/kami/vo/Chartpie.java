package com.kami.kami.vo;

public class Chartpie {
	private String name;
	private String count;
	
	
	
	
	public Chartpie() {
		super();
	}




	public Chartpie(String name, String count) {
		super();
		this.name = name;
		this.count = count;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getCount() {
		return count;
	}




	public void setCount(String count) {
		this.count = count;
	}




	@Override
	public String toString() {
		return "Chartpie [name=" + name + ", count=" + count + "]";
	}
	
	
}
