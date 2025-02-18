package com.kh.app.shopping;

import java.util.List;

import com.kh.app.shopping.dao.ReviewDTO;
import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShoppingDetailViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShoppingDAO sdao = new ShoppingDAO();
		
		// prod_num 형변환
        String prodNumStr = request.getParameter("prod_num");
        int prod_num = Integer.parseInt(prodNumStr);


        // 해당 상품의 리뷰 가져오기
        List<ReviewDTO> reviewList = sdao.getReviewList(prod_num);
        
        // 상품
        request.setAttribute("product", sdao.getDetail(prod_num));
        request.setAttribute("reviewList", reviewList);
        
        
        forward.setRedirect(false);
        forward.setPath("/app/shopping/shopping_detailview.jsp?prod_num=" + prod_num);
        
        return forward;
	}

}
