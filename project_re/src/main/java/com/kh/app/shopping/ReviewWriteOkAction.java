package com.kh.app.shopping;

import com.kh.app.shopping.dao.ReviewDTO;
import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReviewWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		ShoppingDAO sdao = new ShoppingDAO();
		ReviewDTO review = new ReviewDTO();
		
		String REVIEW_CONTENTS = request.getParameter("REVIEW_CONTENTS");
		
		review.setREVIEW_CONTENTS(REVIEW_CONTENTS);
		
		forward.setRedirect(true);
		
		if(sdao.insertReview(review)) {
			int PROD_NUM = sdao.getSeq();
			forward.setPath("/shopping/ShoppingDetailView.sh?pord_num="+PROD_NUM);
		} else {
			forward.setPath("/shopping/ShoppingDetailView.sh?flag=false");
		}
		
		return forward;
	}

}
