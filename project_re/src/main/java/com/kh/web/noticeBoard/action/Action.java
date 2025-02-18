package com.kh.web.noticeBoard.action;

import com.kh.web.chat.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response);
}









