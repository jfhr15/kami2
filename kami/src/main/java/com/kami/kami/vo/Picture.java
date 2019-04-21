package com.kami.kami.vo;

public class Picture {
	private int pictureSeq;
	private String name;
	private String hashtag;
	private String setting;
	private String condition;
	private String savfile;
	private String orgfile;
	
	
	
	
	public Picture() {
		super();
	}




	public Picture(int pictureSeq, String name, String hashtag, String setting, String condition, String savfile,
			String orgfile) {
		super();
		this.pictureSeq = pictureSeq;
		this.name = name;
		this.hashtag = hashtag;
		this.setting = setting;
		this.condition = condition;
		this.savfile = savfile;
		this.orgfile = orgfile;
	}




	public int getPictureSeq() {
		return pictureSeq;
	}




	public void setPictureSeq(int pictureSeq) {
		this.pictureSeq = pictureSeq;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
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




	public String getCondition() {
		return condition;
	}




	public void setCondition(String condition) {
		this.condition = condition;
	}




	public String getSavfile() {
		return savfile;
	}




	public void setSavfile(String savfile) {
		this.savfile = savfile;
	}




	public String getOrgfile() {
		return orgfile;
	}




	public void setOrgfile(String orgfile) {
		this.orgfile = orgfile;
	}




	@Override
	public String toString() {
		return "Picture [pictureSeq=" + pictureSeq + ", name=" + name + ", hashtag=" + hashtag + ", setting=" + setting
				+ ", condition=" + condition + ", savfile=" + savfile + ", orgfile=" + orgfile + "]";
	}




	
	
	
}
