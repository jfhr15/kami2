package com.kami.kami.vo;

public class Condition {
	private String conditionM;
	private String conditionG;
	private String conditionH;
	private String conditionD;
	private String conditionF;
	private String gender;
	
	
	
	
	public Condition() {
		super();
	}




	public Condition(String conditionM, String conditionG, String conditionH, String conditionD, String conditionF,
			String gender) {
		super();
		this.conditionM = conditionM;
		this.conditionG = conditionG;
		this.conditionH = conditionH;
		this.conditionD = conditionD;
		this.conditionF = conditionF;
		this.gender = gender;
	}




	public String getConditionM() {
		return conditionM;
	}




	public void setConditionM(String conditionM) {
		this.conditionM = conditionM;
	}




	public String getConditionG() {
		return conditionG;
	}




	public void setConditionG(String conditionG) {
		this.conditionG = conditionG;
	}




	public String getConditionH() {
		return conditionH;
	}




	public void setConditionH(String conditionH) {
		this.conditionH = conditionH;
	}




	public String getConditionD() {
		return conditionD;
	}




	public void setConditionD(String conditionD) {
		this.conditionD = conditionD;
	}




	public String getConditionF() {
		return conditionF;
	}




	public void setConditionF(String conditionF) {
		this.conditionF = conditionF;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	@Override
	public String toString() {
		return conditionM + "/" + conditionG + "/" + conditionH
				+ "/" + conditionD + "/" + conditionF;
	}




	
	
	
}
