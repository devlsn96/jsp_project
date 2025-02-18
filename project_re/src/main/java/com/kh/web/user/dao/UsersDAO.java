package com.kh.web.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kh.mybatis.SqlMapConfig;
import com.kh.web.shopping.dao.ShoppingDAO;


public class UsersDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession session;

	public UsersDAO() {
		session = factory.openSession(true);
	}


	// 회원가입
	public boolean join(UsersDTO user) {
		boolean result = false;

		if ( session.insert("Users.join", user) == 1) {
			new ShoppingDAO().addCartNum(user.getUser_id());
			result = true;
		}
		return result;
	}

	// 로그인 처리
	public boolean login(String user_id, String password) {
		boolean result = false;
		HashMap<String, String> datas = new HashMap<>();
		
		datas.put("user_id", user_id);
		datas.put("password", password);
		
		if ( (Integer)session.selectOne("Users.login", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	 
	// 로그인 아이디 확인
	public boolean checkId(String user_id) { 
		boolean result = false;
		if((Integer)session.selectOne("Users.checkId",user_id) == 0) { 
			return true; 
		}
		return result;
	}
	
	// 휴대폰 번호 조회
	public String getPhoneNumber(String user_id) {
	       return session.selectOne("Users.getPhoneNumber", user_id);
	   }
}
