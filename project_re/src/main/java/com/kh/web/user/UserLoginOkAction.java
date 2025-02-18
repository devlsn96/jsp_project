package com.kh.web.user;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.user.dao.UsersDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		
		String user_id = req.getParameter("user_id");
		String password = req.getParameter("password");
		
        forward.setRedirect(true);
       	if (udao.login(user_id, password)) {
            // 로그인 성공
            // 세션 생성
            HttpSession session = req.getSession();
            session.setAttribute("user_id", user_id);
            session.setMaxInactiveInterval(30 * 60); // 세션 유지 시간 30분 설정

            // 세션에 저장된 유저 ID 확인
            System.out.println("세션에 저장된 유저 ID: " + session.getAttribute("user_id"));


            // 세션에 저장된 유저 ID 확인 - 테스트용
            // System.out.println("세션에 저장된 유저 ID: " + session.getAttribute("user_id"));
            
            forward.setPath("/index.jsp");
        } else {
            // 로그인 실패
        	forward.setPath("/user/login.jsp?flag=false");
        }
        	
		
        return forward;
    }

}
