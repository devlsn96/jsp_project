<%@page import="chat.dao.ChatDTO"%>
<%@page import="chat.dao.ChatDAO"%>
<%@ page import="java.io.*, javax.servlet.*, java.util.*" %>
<%
	String userID = request.getParameter("userID");
	String sendID = request.getParameter("sendID");
	String message = request.getParameter("message");

	ChatDTO cdto = new ChatDTO();
	cdto.setUserID(userID);
	cdto.setSendID(sendID);
	cdto.setMessage(message);
	if(message!=""){
		System.out.println("message:" + message);
		new ChatDAO().insertChat(cdto);
	}

%>