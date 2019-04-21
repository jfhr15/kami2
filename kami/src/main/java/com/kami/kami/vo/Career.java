package com.kami.kami.vo;

public class Career { //직원의 경력정보를 담는 VO
	private int careeaseq;
	private String emp_id; //해당 직원 id
	private String care_date; //경력 날짜
	private String care_content; //경력 내용
	
	
	public int getCareeaseq() {
		return careeaseq;
	}
	public void setCareeaseq(int careeaseq) {
		this.careeaseq = careeaseq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getCare_date() {
		return care_date;
	}
	public void setCare_date(String care_date) {
		this.care_date = care_date;
	}
	public String getCare_content() {
		return care_content;
	}
	public void setCare_content(String care_content) {
		this.care_content = care_content;
	}
	public Career(int careeaseq, String emp_id, String care_date, String care_content) {
		super();
		this.careeaseq = careeaseq;
		this.emp_id = emp_id;
		this.care_date = care_date;
		this.care_content = care_content;
	}
	public Career() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Career [careeaseq=" + careeaseq + ", emp_id=" + emp_id + ", care_date=" + care_date + ", care_content="
				+ care_content + "]";
	}
	
	
	
	
}
