package board.action;


import java.util.ArrayList;
import java.util.List;

import board.dao.BoardDAO;
import board.dao.BoardDTO;
import chat.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
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
        System.out.println("공지사항 페이지 - 세션에 저장된 유저 ID: " + userId);
		
		int currentPage = 1;
		if(request.getParameter("page")!=null){
			currentPage=Integer.parseInt(request.getParameter("page"));
		} // 현재 페이지 (기본값 1)
		int pageSize = 10; // 페이지당 게시물 수
		int totalCount = bdao.getTotalCount(); // 전체 게시물 수
		
		request.setAttribute("boardList", bdao.getBoardList(currentPage,pageSize));
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totalCount", totalCount);
		
		forward.setPath("/board/boardlist.jsp");
		forward.setRedirect(false);	// forward 이동
		
		
		return forward;
	}
	
}
