<%@page import="com.kh.web.cart.dto.CartChangeDTO"%>
<%@page import="com.kh.cart.web.dao.JoinProdDAO"%>
<%@page import="com.kh.web.cart.dto.JoinProdDTO"%>
<%
    // 폼에서 전송된 데이터 받기
    CartChangeDTO cartnum = new CartChangeDTO();
    
cartnum.setCartnum(Integer.parseInt(request.getParameter("cartNum")));
cartnum.setProdnum(Integer.parseInt(request.getParameter("prodNum"))) ;
	
    new JoinProdDAO().deleteJoinProd(cartnum);
        
    response.sendRedirect("cart.jsp");
%>