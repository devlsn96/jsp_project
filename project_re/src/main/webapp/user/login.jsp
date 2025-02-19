<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인</title>
		<!-- 구글 폰트 -->
	    <link rel="preconnect" href="https://fonts.googleapis.com" />
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Poppins:wght@300&display=swap" rel="stylesheet"/>
	    <link href="https://fonts.googleapis.com/css?family=Gamja+Flower:400" rel="stylesheet"/>
		<link href="./login.css" rel="stylesheet">
	</head>
	<body>
		<c:if test="${param.flag == false }">
			<script>
				alert("로그인 실패! 다시 시도하세요!");
			</script>
		</c:if>
		<div class="content">
	        <!-- 오늘의집 로고 -->
	        <div id="homelogo">
	            <a href="/index.jsp">
	                내일의 집
	            </a>
	        </div>
	        <!-- 로그인 폼 -->
	        <form action="/user/UserLoginOk.us" method="post" id="loginForm">
	            <div class="login">
	                <input type="text" name="user_id" id="user_id" placeholder="아이디" required>
	                <br/>
	                <input type="password" name="password" id="password" placeholder="비밀번호" required>
	                <p>
	                    <input class="btn" type="submit" value="로그인"/>
	                </p>
	            </div>
	            <!-- 비밀번호 재설정 및 회원가입 -->
	            <div class="loginSet">
	                <!-- <span class="reset_pw"><a href="/user/pw_re.jsp">비밀번호 재설정</a></span>-->        
	                <span class="join"><a href="/user/UserJoin.us">회원가입</a></span>
	            </div>
	        </form>
	        <br/>
	        <!-- 간편로그인 -->
	        <!-- <div class="sns_login">
	            <p class="sns_loginTitle">
	                SNS계정으로 간편 로그인/회원가입
	            </p>
	            <p>
	                <input type="submit" id="facebook_login" value=""/>
	                <input type="submit" id="kakao_login" value=""/>
	                <input type="submit" id="naver_login" value=""/>
	            </p>
	        </div> -->
	        <!-- 로그인 문제해결 페이지 -->
	        <div class="loginerror">
	            <a href="/qna/qna.jsp">로그인에 문제가 있으신가요?</a>
	        </div>
	    </div>    
	    <!-- 푸터 -->
	    <div class="footer">
	        &copy; <a href="/index.jsp">tomorrow home, co.</a> All Rights Reserved
	    </div>
	</body>	
</html>