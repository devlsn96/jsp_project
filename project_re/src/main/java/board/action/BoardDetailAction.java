package board.action;

import board.dao.BoardDAO;
import chat.action.ActionForward;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		
		int boardID = 
				Integer.parseInt(request.getParameter("boardID")); 
		
		request.setAttribute("boardDetail", bdao.getBoardDetail(boardID));
		
		forward.setPath("/board/boardDetail.jsp");
		forward.setRedirect(false);	// forward 이동
		
		
		return forward;
	}

}
