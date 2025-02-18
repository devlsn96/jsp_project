package com.kh.web.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DefaultAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        // 기본적으로 보여줄 페이지 설정
        ActionForward forward = new ActionForward();
        forward.setPath("/default.jsp"); // 기본 JSP 페이지 경로
        forward.setRedirect(false); // 포워드 방식으로 이동
        return forward;
    }
}
