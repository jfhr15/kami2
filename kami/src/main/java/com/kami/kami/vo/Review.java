package com.kami.kami.vo;

public class Review {
	private int reviewseq; //댓글달기 댓글시퀀스
	private int boardseq; //해당글 시퀀스
	private String id; //댓글 단 사람 아이디
	private String rvw_content; //댓글 내용
	private String rvw_date; //업로드 날짜
	public int getReviewseq() {
		return reviewseq;
	}
	public void setReviewseq(int reviewseq) {
		this.reviewseq = reviewseq;
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
	public String getRvw_content() {
		return rvw_content;
	}
	public void setRvw_content(String rvw_content) {
		this.rvw_content = rvw_content;
	}
	public String getRvw_date() {
		return rvw_date;
	}
	public void setRvw_date(String rvw_date) {
		this.rvw_date = rvw_date;
	}
	@Override
	public String toString() {
		return "Review [reviewseq=" + reviewseq + ", boardseq=" + boardseq + ", id=" + id + ", rvw_content="
				+ rvw_content + ", rvw_date=" + rvw_date + "]";
	}
	public Review(int reviewseq, int boardseq, String id, String rvw_content, String rvw_date) {
		super();
		this.reviewseq = reviewseq;
		this.boardseq = boardseq;
		this.id = id;
		this.rvw_content = rvw_content;
		this.rvw_date = rvw_date;
	}
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
