package com.kh.app.board;

import java.io.IOException;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		// 세션에서 현재 로그인한 사용자 userId 가져오기
        HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("user_id");
        
		int commentnum = Integer.parseInt(request.getParameter("commentnum"));
		String content = request.getParameter("content");
		String boardid = request.getParameter("boardid");
		
		 // DB에서 해당 댓글 작성자 userId 가져오기
        String replyOwnerId = bdao.getReplyOwnerId(commentnum);  // 댓글 작성자 조회

        // 작성자와 로그인한 사용자 비교
        if (replyOwnerId == null || !loggedInUserId.equals(replyOwnerId)) {
            // 작성자와 현재 로그인한 사용자가 다르면 권한 없음 경고창 띄우기
            response.setContentType("text/html; charset=UTF-8");
            try {
				response.getWriter().println("<script>alert('댓글을 수정할 권한이 없습니다.'); history.back();</script>");
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

		
		if(bdao.updateReply(commentnum, content)) {
		      System.out.println("수정할 댓글 번호: " + commentnum);
			forward.setRedirect(true);
			// 상세 보기 페이지로 이동
			forward.setPath("/board/BoardView.bo?boardid=" + boardid);
		};
		
		return forward;
	}

}
