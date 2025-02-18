package com.kh.web.user.dao;

public class UsersDTO {
	private String user_id;		// 아이디
	private String name;		// 주문자 이름?
	private String email;		// 이메일
	private String password;	// 패스워드
	private String nickname;	// 별명 (프로필 이름이 될 예정?)
	private String tel;			// 전화번호
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
	
	
}
