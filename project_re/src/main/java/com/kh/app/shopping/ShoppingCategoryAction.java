package com.kh.app.shopping;

import java.util.List;

import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.cart.dto.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShoppingCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShoppingDAO sdao = new ShoppingDAO();
		
		 String prod_category = request.getParameter("prod_category");
		
		// 해당하는 카테고리의 상품만 
		List<ProductDTO> shoppingCategoryList = sdao.getCategoryProductList(prod_category);
		
		request.setAttribute("shoppingCategoryList", shoppingCategoryList);
		
		
		 // prod_category 값에 따라 포워딩 설정
        if ("fabric".equals(prod_category)) { 
            forward.setPath("/app/shopping/shopping_category_fabric.jsp");
        } else if ("electronics".equals(prod_category)) {
            forward.setPath("/app/shopping/shopping_category_electronics.jsp");
        } else {
            forward.setPath("/app/shopping/shopping_category.jsp"); // !기본 경로!
        }

		
		return forward;
	}

}
