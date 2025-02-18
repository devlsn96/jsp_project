package com.kh.app.shopping;

import com.kh.app.shopping.dao.ShoppingCartDTO;
import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.cart.web.dao.CartProdDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.cart.dto.CartProdDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ShoppingCartInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShoppingDAO sdao = new ShoppingDAO();
		CartProdDAO cdao = new CartProdDAO();
		CartProdDTO cart = new CartProdDTO();
		
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
        System.out.println("insertCarat 유저 ID: " + userId);
        
		
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int productCount = Integer.parseInt(request.getParameter("productCount"));
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		
		
		
		cdao.addProductToCart(sdao.getShoCartNum(userId), prod_num, productCount, prod_price);
		forward.setRedirect(true);
		forward.setPath("/cart/cart.jsp");
	    
	    
	    return forward;
	}

}
