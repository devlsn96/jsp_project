package com.kh.app.shopping;

import java.util.List;

import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.cart.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();
        ShoppingDAO sdao = new ShoppingDAO();
        
        // 6개의 상품 목록 가져오기
        List<ProductDTO> shoppingList = sdao.getProductList();
        
        // 모든 상품 목록 가져오기
        List<ProductDTO> shoppingAllList = sdao.getAllProductList();
        
        // 상품 목록을 request에 저장하기
        request.setAttribute("shoppingList", shoppingList);
        request.setAttribute("shoppingAllList", shoppingAllList);
        
        
        
        System.out.println(shoppingList);
        System.out.println(shoppingAllList);
        
        forward.setPath("/app/shopping/shopping_home.jsp");
        forward.setRedirect(false);
        
        return forward;
    }
	
}
