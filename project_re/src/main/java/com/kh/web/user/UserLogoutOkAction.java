package com.kh.web.user;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserLogoutOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		// 세션에 사용자 정보가 있는지 확인
        String user_id = (String)session.getAttribute("user_id");
        
        forward.setRedirect(true);
        if (user_id != null) {
        	// 세션을 무효화하여 로그아웃 처리
        	// user_id값 지워내기
            session.removeAttribute("user_id");
            // 메인 페이지로 리다이렉트
            forward.setPath("/index.jsp");
		} 
		return forward;
	}
	
}
