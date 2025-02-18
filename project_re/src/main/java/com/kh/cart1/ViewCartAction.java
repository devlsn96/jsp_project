package com.kh.cart1;

import java.util.List;

import com.kh.cart.service.CartService;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.cart.dto.CartProdDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
ActionForward forward = new ActionForward();
        
        try {
            CartService cartService = new CartService();
            int cartNum = 1; // 실제로는 세션 등에서 가져와야 함
            List<CartProdDTO> cartProducts = cartService.getCartProducts(cartNum);
            
            request.setAttribute("cartProducts", cartProducts);
            forward.setPath("cart.jsp"); // 이동할 경로 설정
            forward.setRedirect(false); // 포워드 방식
        } catch (Exception e) {
            e.printStackTrace();
            // 에러 처리 로직 추가 가능
        }
        
        return forward;
    }

}
