package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.app.board.dao.BoardDTO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		BoardDTO board = new BoardDTO();
		
		// 세션에서 유저 ID 확인하는 코드 추가
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("user_id");

        // 로그인 여부 확인
        if (userId == null) {
            // 로그인하지 않은 상태라면 로그인 페이지로 리다이렉트
            System.out.println("세션이 만료되었거나 로그인되지 않은 상태입니다.");
            forward.setPath("/user/login.jsp"); // 로그인 페이지로 리다이렉트
            forward.setRedirect(true); // 리다이렉트 이동
            return forward;
        }

        // 세션에 유저 ID가 저장되어 있는지 확인하는 코드
       // System.out.println("게시판 작성 페이지 - 세션에 저장된 유저 ID: " + userId);
		
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boardtype = 1;
		
		board.setTitle(title);
		board.setContent(content);
		board.setBoardtype(boardtype);
		board.setUserid(userId);  // 세션에서 가져온 userId 설정
		
		
		forward.setRedirect(true);
		
		if(bdao.insertBoard(board)) {	// 성공
			// boardnum seq 조회
			

			int boardid = bdao.getSeq();
			// 성공한 글의 게시글 상세보기
			forward.setPath("/board/BoardView.bo?boardid=" + boardid);
		} else {						// 실패
			forward.setPath("/board.BoardWrite.bo?flag=false");
		}
		
		
		return forward;
	}

}
