package com.kh.app.shopping;

import java.sql.Date;
import java.util.Calendar;

import com.kh.app.shopping.dao.ReviewDTO;
import com.kh.app.shopping.dao.ShoppingDAO;
import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ReviewWriteAction implements Action {
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward forward = new ActionForward();
      ShoppingDAO sdao = new ShoppingDAO();
      /* ReviewDTO review = new ReviewDTO(); */
      ReviewDTO review = new ReviewDTO();
      
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
       System.out.println("리뷰작성 - 세션에 저장된 유저 ID: " + userId);


      int prod_num = Integer.parseInt(request.getParameter("prod_num"));
      String REVIEW_CONTENTS = request.getParameter("REVIEW_CONTENTS");
      String RATING = request.getParameter("RATING");
      
      // REVIEW_DATE를 현재 날짜로 설정
        Date currentDate = new Date(Calendar.getInstance().getTimeInMillis());
        review.setREVIEW_DATE(currentDate); // 현재 날짜 설정
        
      
      review.setREVIEW_CONTENTS(REVIEW_CONTENTS);
      review.setPROD_NUM(prod_num);
      review.setUSER_ID(userId);
      review.setIMAGES_PATH(null);
      if (RATING != null && !RATING.isEmpty()) {
           review.setRATING(Double.parseDouble(RATING));
       }
      
      if(sdao.addReview(review)) {
			int PROD_NUM = sdao.getSeq();
			forward.setPath("/shopping/ShoppingDetailView.sh?pord_num="+PROD_NUM);
		} else {
			forward.setPath("/shopping/ShoppingDetailView.sh?flag=false");
		}
      
      
      return forward;
   }

}
