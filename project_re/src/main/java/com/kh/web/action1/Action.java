package com.kh.web.action1;

import com.kh.app.board.dao.BoardDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);
	ActionForward forward = new ActionForward();
	BoardDAO bdao = new BoardDAO();
}
