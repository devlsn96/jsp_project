<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style>
		/* 전체 콘텐츠 중앙 정렬 */
		body {
		    display: flex;
		    flex-direction: column;
		    height: 100vh;
		    margin: 0;
		    background-color: #f9f9f9;
	
		}
		/* 로그인 폼의 전체적인 스타일 */
		.content {
		    width: 100%;
		    max-width: 300px;
		    margin: auto;
		    padding: 30px;
		    text-align: center;
		}
		
		/* 로고 스타일 */
		#homelogo {
			width: auto;
	   		height: 50px;
	   		margin: 0 auto;
		}
		
		#homelogo a {
			font-family: "Gamja Flower";
			font-weight: 700;
		    font-size: 26px;
	    	cursor: pointer;
		    color: #35c5f0;
		    margin-bottom: 30px;
		    text-decoration: none;
		}
		
		/* 입력 필드 스타일 */
		#user_id,
		#password {
		    width: 100%;
		    padding: 14px;
		    margin-bottom: 0;
		    border: 1px solid #ddd;
		    font-size: 14px;
		    box-sizing: border-box;
		}
		#user_id{ border-radius: 6px 6px 0 0; }
	    #password{ border-radius: 0 0 6px 6px; }
		
		/* 포커스 시 배경색 변경 */
		#user_id:focus, #password:focus {
		    /* 포커스 시 연한 파란색 */
		    border: 2px solid powderblue;  
		}
	
		/* 포커스 벗어났을 때 */
		#user_id:blur, #password:blur {
		    /* 포커스가 없을 때 빨강 */
		   border: 2px solid red;  
		}
		
		/* 로그인 버튼 스타일 */
		.btn {
			font-weight: bold;
		    background-color: #35c5f0;
		    color: white;
		    border: none;
		    padding: 12px;
		    font-size: 16px;
		    width: 100%;
		    border-radius: 6px;
		    margin-top: 10px;
		    transition: background-color 0.3s;
		    cursor: pointer; 
		}
		
		.btn:hover {
		    background-color: #2aa2c6;
		}
		
		/* 비밀번호 재설정 및 회원가입 스타일 */
		.loginSet {
		    width: 100%;
	    	text-align: center;
		}
		
		.loginSet a {
		    color: inherit;
		    text-decoration: none;
			margin-left: 0;
			font-size: 12px;
		}
		
		.loginSet a:hover {
		    text-decoration: none;
		}
		
		/* SNS 로그인 타이틀 스타일 */
		.sns_loginTitle {
		    font-size: 12px;
		    margin: 35px 0 15px;
		    color: #757575;
		    font-weight: normal;
		    line-height: 1.33;
		    text-align: center;
		}
		
		/* SNS 로그인 버튼 스타일 */
		.sns_login input{
			width: 40px;  			/* 버튼의 너비 */
			height: 40px; 			/* 버튼의 높이 */
			display: inline-block; 	/* 요소가 인라인 블록으로 표시되도록 설정 */
			border-radius: 50%; 	/* 원형으로 만들기 위해 테두리를 둥글게 */
			border: none; 			/* 테두리 제거 */
			cursor: pointer; 		/* 마우스 커서를 포인터로 변경 */
		}
		#facebook_login{ 
			background-color: blue;
			background: url('/user/img/facebook_logo.png') no-repeat center center; /* 이미지 경로 삽입 */
		    background-size: 40px 40px; /* 이미지 크기 조정 */
		    border: none; /* 테두리 제거 */
		}
		#kakao_login{ 
			background-color: yellow;
			background: url('/user/img/kakao_logo.png') no-repeat center center; /* 이미지 경로 삽입 */
		    background-size: 40px 40px; /* 이미지 크기 조정 */
		    border: none; /* 테두리 제거 */
		}
		#naver_login{ 
			background-color: green;
			background: url('/user/img/naver_logo.png') no-repeat center center; /* 이미지 경로 삽입 */
		    background-size: 40px 40px; /* 이미지 크기 조정 */
		    border: none; /* 테두리 제거 */
		}
		
		/* 로그인 문제 해결 링크 스타일 */
		.loginerror{
		    margin-top: 24px;
	    	font-size: 14px;
	   		line-height: 18px;
		}
		
		.loginerror a{
			text-decoration: none;
			color: #c2c8cc;
		}
		
		/* 푸터 스타일 */
		.footer {
		    font-size: 12px;
		    color: #999;
		    text-align: center;
		    margin-top: auto;
	        padding: 20px;
		}
		
		.footer a {
		    text-decoration: none;
		    color: #999;
		}
	</style>
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
            <a href="/app/qna/qna.jsp">로그인에 문제가 있으신가요?</a>
        </div>
    </div>    
    <!-- 푸터 -->
    <div class="footer">
        &copy; <a href="/index.jsp">tomorrow home, co.</a> All Rights Reserved
    </div>
</body>
</html>