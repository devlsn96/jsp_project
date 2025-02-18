package com.kh.cart1;

import java.io.IOException;

import javax.swing.text.DefaultEditorKit.DefaultKeyTypedAction;

import com.kh.web.action.Action;
import com.kh.web.action.ActionForward;
import com.kh.web.action.DefaultAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/cartController")
public class FrontController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Action actionInstance = null;
        
        
        if ("viewCart".equals(action)) {
            actionInstance = new ViewCartAction();
        } else {
            actionInstance = new DefaultAction(); // 기본 액션으로 DefaultAction 사용
        }

        ActionForward forward = actionInstance.execute(request, response);

        if (forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
        } else {
            request.getRequestDispatcher(forward.getPath()).forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
