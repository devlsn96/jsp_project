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
		case "/freeboard/BoardList.bo":
			forward = new BoardListAction().execute(req,resp);
			break;
		case "/freeboard/BoardWrite.bo":
			forward = new ActionForward(true, "/app/freeboard/boardWrite.jsp");
			break;
		case "/freeboard/BoardWriteOk.bo":
			forward = new BoardWriteOkAction().execute(req, resp);
			break;
		case "/freeboard/BoardView.bo":
			forward = new BoardViewAction().execute(req, resp);
			break;
		case "/freeboard/UpdateBoard.bo":
			forward = new UpdateBoardAction().execute(req, resp);
			break;
			
		case "/freeboard/DeleteBoard.bo":
			forward = new DeleteBoardAction().execute(req,resp);
			break;
			
		// 댓글
		case "/freeboard/AddReply.bo":
			forward = new AddReplyAction().execute(req, resp);
			break;
		case "/freeboard/UpdateReply.bo":
			forward = new UpdateReplyAction().execute(req, resp); 
			break;
		case "/freeboard/DeleteReply.bo":
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