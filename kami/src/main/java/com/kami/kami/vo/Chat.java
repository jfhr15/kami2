package com.kami.kami.vo;

public class Chat { //챗봇 예약용 채팅
	private int chatseq;
	private String id; //회원 id
	private String chat_content; //채팅 내용
	private String chat_date; //날짜
	public Chat(int chatseq, String id, String chat_content, String chat_date) {
		super();
		this.chatseq = chatseq;
		this.id = id;
		this.chat_content = chat_content;
		this.chat_date = chat_date;
	}
	public Chat() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Chat [chatseq=" + chatseq + ", id=" + id + ", chat_content=" + chat_content + ", chat_date=" + chat_date
				+ "]";
	}
	public int getChatseq() {
		return chatseq;
	}
	public void setChatseq(int chatseq) {
		this.chatseq = chatseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	
	
	
}
