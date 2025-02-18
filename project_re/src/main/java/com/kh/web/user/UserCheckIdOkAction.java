package com.kh.web.user;

import java.io.IOException;
import java.io.PrintWriter;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.user.dao.UsersDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserCheckIdOkAction implements Action{

	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        UsersDAO udao = new UsersDAO();
        response.setContentType("text/plain; charset=UTF-8");

        String user_id = request.getParameter("user_id");
        try {
            PrintWriter out = response.getWriter();
            if (user_id == null || user_id.trim().isEmpty()) {
                out.print("아이디를 입력해주세요.");
            } else if (!user_id.matches("^[a-zA-Z0-9]+$")) {
                out.print("아이디는 영문자와 숫자만 입력 가능합니다.");
            } else {
                boolean isDuplicate = udao.checkId(user_id);
                if (isDuplicate) {
                    out.print("사용할 수 있는 아이디입니다.");
                } else {
                    out.print("중복된 아이디입니다.");
                }
            }
            out.flush();
            response.flushBuffer();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;  // 페이지 이동 없음
    }

}
