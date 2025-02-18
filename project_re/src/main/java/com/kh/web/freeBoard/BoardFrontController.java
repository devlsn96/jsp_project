package com.kh.web.freeBoard;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requtURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch(requtURI) {
		case "/freeBoard/BoardList.bo":
			forward = new BoardListAction().execute(req,resp);
			break;
		case "/freeBoard/BoardWrite.bo":
			forward = new ActionForward(true, "/freeboard/boardWrite.jsp");
			break;
		case "/freeBoard/BoardWriteOk.bo":
			forward = new BoardWriteOkAction().execute(req, resp);
			break;
		case "/freeBoard/BoardView.bo":
			forward = new BoardViewAction().execute(req, resp);
			break;
		case "/freeBoard/UpdateBoard.bo":
			forward = new UpdateBoardAction().execute(req, resp);
			break;
		case "/freeBoard/DeleteBoard.bo":
			forward = new DeleteBoardAction().execute(req,resp);
			break;
			
		// 댓글
		case "/freeBoard/AddReply.bo":
			forward = new AddReplyAction().execute(req, resp);
			break;
		case "/freeBoard/UpdateReply.bo":
			forward = new UpdateReplyAction().execute(req, resp); 
			break;
		case "/freeBoard/DeleteReply.bo":
			forward = new DeleteReplyAction().execute(req, resp);
			break;
		}
		
		if (forward != null) {
		   // System.out.println("Forward Path: " + forward.getPath());  // 경로 확인용 출력
		    if (forward.isRedirect()) {
		        resp.sendRedirect(forward.getPath());
		    } else {
		        RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
		        if (disp != null) {
		            disp.forward(req, resp);
		        } else {
		           // System.out.println("RequestDispatcher is null for path: " + forward.getPath());
		        }
		    }
		} else {
		    System.out.println("Forward is null");
		}

		
	}
}