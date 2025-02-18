package board.controller;

import java.io.IOException;

import board.action.BoardListAction;
import chat.action.ActionForward;
import board.action.BoardDetailAction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.no")
public class BoardFrontcontroller extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String rquestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch(rquestURI) {
		case "/board/BoardList.no":
			forward = new BoardListAction().execute(req, resp);
			break;
		case "/board/BoardDetail.no":
			forward = new BoardDetailAction().execute(req, resp);
			break;
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}
}
