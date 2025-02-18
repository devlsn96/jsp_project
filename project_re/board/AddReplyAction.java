
  package com.kh.app.board;
  
  import com.kh.app.board.dao.BoardDAO; import com.kh.app.board.dao.BoardDTO;
  import com.kh.app.board.dao.ReplyDTO; import com.kh.web.action.Action; import
  com.kh.web.action.ActionForward;
  
  import jakarta.servlet.http.HttpServletRequest; import
  jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
  
  public class AddReplyAction implements Action{
  
	  @Override public ActionForward execute(HttpServletRequest request,
	  HttpServletResponse response) { ActionForward forward = new ActionForward();
	  
		  BoardDAO bdao = new BoardDAO(); 
		  ReplyDTO reply = new ReplyDTO();
		  
		  // 세션에서 로그인된 사용자의 userId 가져오기
	        HttpSession session = request.getSession();
	        String userId = (String) session.getAttribute("user_id");

	        // 로그인 여부 확인
	        if (userId == null) {
	            System.out.println("세션이 만료되었거나 로그인되지 않은 상태입니다.");
	            forward.setPath("/user/login.jsp"); // 로그인 페이지로 리다이렉트
	            forward.setRedirect(true);
	            return forward;
	        }

	        // 게시글 ID와 댓글 내용 가져오기
	        int boardid = Integer.parseInt(request.getParameter("boardid"));
	        String content = request.getParameter("content");

	        // 댓글 DTO에 값 설정
	        reply.setBoardid(boardid);
	        reply.setContent(content);
	        reply.setUserid(userId);  // 세션에서 가져온 userId 설정

		  
		  if(bdao.addReply(reply)) { 
			  forward.setRedirect(true);
			  forward.setPath("/board/BoardView.bo?boardid=" + boardid); 
		  }
	  
	  
	  return forward;
	  }
  
  }
 