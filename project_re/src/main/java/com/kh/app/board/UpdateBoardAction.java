package com.kh.app.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateBoardAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    	
    	ActionForward forward = new ActionForward();
    	BoardDAO bdao = new BoardDAO();
    	
    	// 세션에서 현재 로그인한 사용자 userId 가져오기
    	HttpSession session = request.getSession();
    	String loggedInUserId = (String) session.getAttribute("user_id");

    	int boardid =  Integer.parseInt(request.getParameter("boardid"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        // DB에서 해당 게시글의 작성자 userId 가져오기
        String postOwnerId = bdao.getPostOwnerId(boardid);  // 게시글 작성자 조회
        
        
        // 작성자와 로그인한 사용자 비교
        if (postOwnerId == null || !loggedInUserId.equals(postOwnerId)) {
            // 작성자와 현재 로그인한 사용자가 다르면 권한 없음 경고창 띄우기
            response.setContentType("text/html; charset=UTF-8");
            try {
				response.getWriter().println("<script>alert('수정할 권한이 없습니다.'); history.back();</script>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            try {
				response.getWriter().flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return null;  // 실행 종료
        }
        
       if(bdao.updateBoard(boardid, title, content)) {
    	   forward.setRedirect(false);
    	   forward.setPath("/board/BoardView.bo?boardid=" + boardid);
       }
        return forward;
    }
}