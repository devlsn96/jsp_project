package com.kh.app.shopping;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShoppingHomeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
			
		forward.setPath("/app/shopping/shopping_home.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
	
}
