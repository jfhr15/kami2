package com.kami.kami.vo;

public class Haircolor {

	private String colorseq; 
	private String color; //색깔 이름
	private String colorCode; //색깔번호
	public Haircolor(String colorseq, String color, String colorCode) {
		super();
		this.colorseq = colorseq;
		this.color = color;
		this.colorCode = colorCode;
	}
	public Haircolor() {
		super();
	}
	public String getColorseq() {
		return colorseq;
	}
	public void setColorseq(String colorseq) {
		this.colorseq = colorseq;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	@Override
	public String toString() {
		return "Haircolor [colorseq=" + colorseq + ", color=" + color + ", colorCode=" + colorCode + "]";
	}
}
