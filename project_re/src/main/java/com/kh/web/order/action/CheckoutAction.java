package com.kh.web.order.action;

import com.kh.web.action.ActionForward;
import com.kh.web.action.Action;
import com.kh.web.order.dao.OrdersDAO;
import com.kh.web.order.dto.OrdersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckoutAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = new ActionForward();

        // 세션에서 사용자 ID를 가져오기
        String userId = (String) request.getSession().getAttribute("user_id");
        if (userId == null) {
            // 로그인이 되어 있지 않으면 로그인 페이지로 리다이렉트
            forward.setPath("/user/login.jsp");
            forward.setRedirect(true); // 로그인 페이지로 리다이렉트
            return forward;
        }

        // 주문 정보를 받아오기
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        int totalProdCnt = Integer.parseInt(request.getParameter("totalProdCnt"));
        String addrDetail = request.getParameter("addrDetail");
        String zipCode = request.getParameter("zipCode");
        String tel = request.getParameter("tel");
        String reqMessage = request.getParameter("req");
        
        System.out.println("userId: " + userId);
        System.out.println("totalPrice: " + totalPrice);
        System.out.println("totalProdCnt: " + totalProdCnt);
        System.out.println("addrDetail: " + addrDetail);
        System.out.println("zipCode: " + zipCode);
        System.out.println("tel: " + tel);
        System.out.println("reqMessage: " + reqMessage);
        // OrdersDTO 객체 생성
        OrdersDTO order = new OrdersDTO();
        order.setUserId(userId);
        order.setTotalPrice(totalPrice);
        order.setTotalProdCnt(totalProdCnt);
        order.setAddrDetail(addrDetail);
        order.setZipCode(zipCode);
        order.setTel(tel);
        order.setReq(reqMessage);

        try {
            // DAO를 통해 DB에 주문 정보 저장
            OrdersDAO ordersDAO = new OrdersDAO();
            int orderNum = ordersDAO.saveOrder(order); // 수정된 메서드 사용

            // 주문 성공 메시지 설정
            request.setAttribute("message", "구매가 완료되었습니다! 주문 번호: " + orderNum);
            request.setAttribute("orderNum", orderNum);
            // 주문 확인 페이지로 포워드
            forward.setPath("/order/orderConfirmation.jsp");
            forward.setRedirect(false); // 포워드 방식으로 이동

        } catch (Exception e) {
            e.printStackTrace();
            // 오류 발생 시 에러 페이지로 이동
            request.setAttribute("message", "주문 처리 중 오류가 발생했습니다. 다시 시도해주세요.");
            forward.setPath("/error/errorPage.jsp");
            forward.setRedirect(false); // 포워드 방식으로 에러 페이지로 이동
        }

        return forward;
    }
}
