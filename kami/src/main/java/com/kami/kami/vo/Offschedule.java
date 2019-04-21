package com.kami.kami.vo;

public class Offschedule {
	private int off_scheduleseq; //휴무 일정 등록
	private String emp_id; //해당직원id
	private String off_startdate; //휴무시작일
	private String off_enddate; //휴무 종료일
	private String off_check; //뭐지 이건
	public Offschedule() {
		super();
	}
	public Offschedule(int off_scheduleseq, String emp_id, String off_startdate, String off_enddate, String off_check) {
		super();
		this.off_scheduleseq = off_scheduleseq;
		this.emp_id = emp_id;
		this.off_startdate = off_startdate;
		this.off_enddate = off_enddate;
		this.off_check = off_check;
	}
	public int getOff_scheduleseq() {
		return off_scheduleseq;
	}
	public void setOff_scheduleseq(int off_scheduleseq) {
		this.off_scheduleseq = off_scheduleseq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getOff_startdate() {
		return off_startdate;
	}
	public void setOff_startdate(String off_startdate) {
		this.off_startdate = off_startdate;
	}
	public String getOff_enddate() {
		return off_enddate;
	}
	public void setOff_enddate(String off_enddate) {
		this.off_enddate = off_enddate;
	}
	public String getOff_check() {
		return off_check;
	}
	public void setOff_check(String off_check) {
		this.off_check = off_check;
	}
	@Override
	public String toString() {
		return "Offschedule [off_scheduleseq=" + off_scheduleseq + ", emp_id=" + emp_id + ", off_startdate="
				+ off_startdate + ", off_enddate=" + off_enddate + ", off_check=" + off_check + "]";
	}
}
