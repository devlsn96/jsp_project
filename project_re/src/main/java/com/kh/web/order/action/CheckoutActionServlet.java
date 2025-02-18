package com.kh.web.order.action;

import java.io.IOException;

import com.kh.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order/checkoutAction")
public class CheckoutActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // CheckoutAction 인스턴스 생성
        CheckoutAction checkoutAction = new CheckoutAction();
        
        // ActionForward 객체를 통해 처리 결과를 받아옴
        ActionForward forward = checkoutAction.execute(request, response);
        
        // ActionForward의 경로로 리다이렉트 또는 포워드
        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getPath());
            } else {
                request.getRequestDispatcher(forward.getPath()).forward(request, response);
            }
        }
    }
}
