package com.kami.kami.vo;

public class Picturesearch {
	private String hashtag;
	private String setting;
	
	
	
	public Picturesearch() {
		super();
	}



	public Picturesearch(String hashtag, String setting) {
		super();
		this.hashtag = hashtag;
		this.setting = setting;
	}



	public String getHashtag() {
		return hashtag;
	}



	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}



	public String getSetting() {
		return setting;
	}



	public void setSetting(String setting) {
		this.setting = setting;
	}



	@Override
	public String toString() {
		return "Picturesearch [hashtag=" + hashtag + ", setting=" + setting + "]";
	}




	
	
	
}
