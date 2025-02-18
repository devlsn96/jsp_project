package com.kh.app.board;

import com.kh.app.board.dao.BoardDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
	    ActionForward forward = new ActionForward();
	    BoardDAO bdao = new BoardDAO();

	    // 페이지 번호 가져오기, 없으면 기본값 1로 설정
	    String temp = req.getParameter("page");
	    int page = 1;  // 페이지 번호 기본값을 1로 설정

	    if (temp != null && !temp.isEmpty()) {
	        try {
	            page = Integer.parseInt(temp);
	            if (page <= 0) {  // 페이지 번호가 0 이하일 경우 기본값 1로 설정
	                page = 1;
	            }
	        } catch (NumberFormatException e) {
	            page = 1;  // 숫자가 아닌 값이 들어오면 기본값 1로 설정
	        }
	    }

	    // 총 게시글 수 가져오기
	    int totalCnt = bdao.getBoardCnt();

	    // 페이지 설정
	    int pageSize = 10;  // 한 페이지에 보여줄 게시글 수
	    int blockSize = 10;  // 한 번에 보여줄 페이지 블록 수

	    // 시작과 끝 행 계산
	    int endRow = page * pageSize;
	    int startRow = endRow - (pageSize - 1);

	    // 페이지 블록 설정
	    int totalPage = (totalCnt + pageSize - 1) / pageSize;  // 총 페이지 수 계산
	    int startPage = ((page - 1) / blockSize) * blockSize + 1;
	    int endPage = startPage + blockSize - 1;

	    // 마지막 페이지가 총 페이지 수를 넘지 않도록 설정
	    if (endPage > totalPage) {
	        endPage = totalPage;
	    }

	    // 게시글 목록 가져오기
	    req.setAttribute("boardList", bdao.getBoardList(startRow, endRow));

	    // 페이징 관련 데이터 설정
	    req.setAttribute("totalPage", totalPage);
	    req.setAttribute("nowPage", page);
	    req.setAttribute("startPage", startPage);
	    req.setAttribute("endPage", endPage);
	    req.setAttribute("totalCnt", totalCnt);
	    
	    
	    // 포워딩 경로 설정
	   
	    forward.setPath("/app/board/boardList.jsp");
	    forward.setRedirect(false);
	    return forward;
	}


}
