package com.kh.app.shopping;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("*.sh")
public class ShoppingFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch(requestURI) {
			case "/shopping/ShoppingHome.sh":
				forward = new ProductListAction().execute(req, resp);
				//System.out.println("home_frontsend");
				break;
				
			case "/shopping/ShoppingCategory.sh":
				forward = new ShoppingCategoryAction().execute(req, resp);
				//System.out.println("category_frontsend");
				break;
			
			case "/shopping/ShoppingDetailView.sh":
				forward = new ShoppingDetailViewAction().execute(req, resp);
				break;
				
			case "/shopping/ReviewWrite.sh":
				forward = new ReviewWriteAction().execute(req, resp);
				break;
				
			case "/shopping/ShoppingCartInsert.sh":
				forward = new ShoppingCartInsertAction().execute(req, resp);
				//System.out.println("cart add front send");
				break;
				
			
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			} else {
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
		
	}
	

}
