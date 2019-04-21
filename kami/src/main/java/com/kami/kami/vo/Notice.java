package com.kami.kami.vo;

public class Notice { //공지 게시판
	private int noticeseq; 
	private String emp_id; //게시직원 아이디
	private String ntc_title; //제목
	private String ntc_content; //내용
	private String ntc_date; //날짜
	private String ntc_file; //파일정보
	
	
	public int getNoticeseq() {
		return noticeseq;
	}
	public void setNoticeseq(int noticeseq) {
		this.noticeseq = noticeseq;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getNtc_title() {
		return ntc_title;
	}
	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}
	public String getNtc_content() {
		return ntc_content;
	}
	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}
	public String getNtc_date() {
		return ntc_date;
	}
	public void setNtc_date(String ntc_date) {
		this.ntc_date = ntc_date;
	}
	public String getNtc_file() {
		return ntc_file;
	}
	public void setNtc_file(String ntc_file) {
		this.ntc_file = ntc_file;
	}
	@Override
	public String toString() {
		return "Notice [noticeseq=" + noticeseq + ", emp_id=" + emp_id + ", ntc_title=" + ntc_title + ", ntc_content="
				+ ntc_content + ", ntc_date=" + ntc_date + ", ntc_file=" + ntc_file + "]";
	}
	public Notice(int noticeseq, String emp_id, String ntc_title, String ntc_content, String ntc_date,
			String ntc_file) {
		super();
		this.noticeseq = noticeseq;
		this.emp_id = emp_id;
		this.ntc_title = ntc_title;
		this.ntc_content = ntc_content;
		this.ntc_date = ntc_date;
		this.ntc_file = ntc_file;
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
