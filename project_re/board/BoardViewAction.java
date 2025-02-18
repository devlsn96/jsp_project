package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int boardid = Integer.parseInt(request.getParameter("boardid"));
		// System.out.println("BoardViewAction : " + boardid);

		request.setAttribute("replylist", bdao.getReplys(boardid));
		
		request.setAttribute("board", bdao.getDetail(boardid)); 
		forward.setRedirect(false);
		forward.setPath("/app/board/boardView.jsp");
		
		
		return forward;
	}

}
