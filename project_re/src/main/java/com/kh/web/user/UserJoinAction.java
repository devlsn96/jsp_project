package com.kh.web.user;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.user.dao.UsersDAO;
import com.kh.web.user.dao.UsersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDTO user = new UsersDTO();
		UsersDAO udao = new UsersDAO();
		
		// 요청받아온 키값을 dto에 세팅
		user.setUser_id(req.getParameter("user_id"));
		user.setName(req.getParameter("name"));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		user.setNickname(req.getParameter("nickname"));
		user.setTel(req.getParameter("tel"));
		
		// dao에서 MyBatis로 커넥션된 db의 insert처리되면
		if (udao.join(user)) {
	        // 회원가입 성공처리
	        forward.setRedirect(true);
	        forward.setPath("/user/login.jsp");
	    } else {
	        // 회원가입 실패처리
	        req.setAttribute("errorMessage", "회원가입에 실패하였습니다. 다시 시도해주세요."); // 에러 메시지 설정
	        forward.setRedirect(false); // 포워드로 설정
	        forward.setPath("/user/join.jsp"); // 회원가입 페이지로 이동
	    }
	    return forward;
	}

	

	
	
	
}
