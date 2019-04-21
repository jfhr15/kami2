package com.kami.kami.vo;

public class Employee {
	private String emp_id; //id는 email 주소를 받는다.
	private int positionseq; //직원의 직책 정보
	private String  emp_hiredate; //직원 입사일
	private String  emp_firedate; //직원 퇴사일
	private String  emp_flag; //직원 퇴직 여부, 0: 관리자 / 1: 재직 / 2: 퇴직
	public Employee(String emp_id, int positionseq, String emp_hiredate, String emp_firedate, String emp_flag) {
		super();
		this.emp_id = emp_id;
		this.positionseq = positionseq;
		this.emp_hiredate = emp_hiredate;
		this.emp_firedate = emp_firedate;
		this.emp_flag = emp_flag;
	}
	public Employee() {
		super();
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public int getPositionseq() {
		return positionseq;
	}
	public void setPositionseq(int positionseq) {
		this.positionseq = positionseq;
	}
	public String getEmp_hiredate() {
		return emp_hiredate;
	}
	public void setEmp_hiredate(String emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}
	public String getEmp_firedate() {
		return emp_firedate;
	}
	public void setEmp_firedate(String emp_firedate) {
		this.emp_firedate = emp_firedate;
	}
	public String getEmp_flag() {
		return emp_flag;
	}
	public void setEmp_flag(String emp_flag) {
		this.emp_flag = emp_flag;
	}
	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", positionseq=" + positionseq + ", emp_hiredate=" + emp_hiredate
				+ ", emp_firedate=" + emp_firedate + ", emp_flag=" + emp_flag + "]";
	}
}
