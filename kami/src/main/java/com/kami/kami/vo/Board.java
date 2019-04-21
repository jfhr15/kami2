package com.kami.kami.vo;

public class Board {
	private int boardseq;
	private String id; //게시자
	private String brd_title; //제목
	private String brd_content; //내용
	private String brd_date; //업로드 시간
	private String brd_file; //파일을 첨부할 경우 파일 정보
	public Board(int boardseq, String id, String brd_title, String brd_content, String brd_date, String brd_file) {
		super();
		this.boardseq = boardseq;
		this.id = id;
		this.brd_title = brd_title;
		this.brd_content = brd_content;
		this.brd_date = brd_date;
		this.brd_file = brd_file;
	}
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBoardseq() {
		return boardseq;
	}
	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBrd_title() {
		return brd_title;
	}
	public void setBrd_title(String brd_title) {
		this.brd_title = brd_title;
	}
	public String getBrd_content() {
		return brd_content;
	}
	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}
	public String getBrd_date() {
		return brd_date;
	}
	public void setBrd_date(String brd_date) {
		this.brd_date = brd_date;
	}
	public String getBrd_file() {
		return brd_file;
	}
	public void setBrd_file(String brd_file) {
		this.brd_file = brd_file;
	}
	@Override
	public String toString() {
		return "Board [boardseq=" + boardseq + ", id=" + id + ", brd_title=" + brd_title + ", brd_content="
				+ brd_content + ", brd_date=" + brd_date + ", brd_file=" + brd_file + "]";
	}
	
	
	
	
	
}
