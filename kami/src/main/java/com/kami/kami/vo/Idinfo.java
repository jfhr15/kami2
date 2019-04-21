package com.kami.kami.vo;

public class Idinfo { //전체 id 정보

	private String id;
	private String pw;
	private String name;
	private String birthday;
	private String gender;
	private String email;
	private String address;
	private String phone;
	private int type; //직원, 회원 여부. 직원:0 / 회원:1
	public Idinfo(String id, String pw, String name, String birthday, String gender, String email, String address,
			String phone, int type) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.type = type;
	}
	public Idinfo() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Idinfo [id=" + id + ", pw=" + pw + ", name=" + name + ", birthday=" + birthday + ", gender=" + gender
				+ ", email=" + email + ", address=" + address + ", phone=" + phone + ", type=" + type + "]";
	}
}
