<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<!-- 구글 폰트 -->
   <link rel="preconnect" href="https://fonts.googleapis.com" />
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
   <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Poppins:wght@300&display=swap" rel="stylesheet"/>
   <link href="https://fonts.googleapis.com/css?family=Gamja+Flower:400" rel="stylesheet"/>
	<style>
	  	body {
	    padding-top: 40px;
	    margin: auto;
		}
		.join_title{
			font-size: 20px;
		  		font-weight: bold;
		}
		/* 로그인 폼의 전체적인 스타일 */
		.content {
		   margin: 0 auto;
		  		padding: 60px 0;
		          width: 360px;
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
		
		/* SNS 로그인 타이틀 스타일 */
		.sns_login {
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
		.btn_element{
			margin-bottom: 30px;
		 			padding-top: 2px;
		}
		.input_element{
		    margin-bottom: 12px;
		    font-size: 16px;
		    line-height: 20px;
		    font-weight: 700;
		    color: #2F3438;
		    letter-spacing: -0.3px;
		    word-break: keep-all;
		}
		.input_title{
		    margin-bottom: 12px;
		 			font-size: 16px;
		 			line-height: 20px;
		    font-weight: 700;
		    color: #2F3438;
		    letter-spacing: -0.3px;
		    word-break: keep-all;
		}
		.input_context{
			margin-bottom: 10px;
		    font-size: 11px;
		    line-height: 18px;
		    color: #828C94;
		    letter-spacing: -0.3px;
		}
		/* 입력 필드 스타일 */
		input {
		    width: 100%;
		    padding: 14px;
		    margin-bottom: 0;
		    border: 1px solid #ddd;
		    font-size: 14px;
		    box-sizing: border-box;
		    border-radius: 6px 6px 6px 6px;
		}
			#btn_id {
		    font-weight: bold;
		    background-color: #35c5f0;  /* 파란색 배경 */
		    color: white ; /* 흰색 글씨 */
		    border: none ;
		    padding: 12px;
		    font-size: 16px;
		    width: 100%;
		    border-radius: 6px;
		    margin-top: 10px;
		    transition: background-color 0.3s;
		}
		#btn_id:hover {
		    background-color: #2aa2c6; /* 더 진한 파란색 배경 */
		}
		
		/* 포커스 및 활성 상태 추가 */
		#btn_id:focus {
		    outline: none; /* 포커스 시 기본 테두리 제거 */
		    background-color: #35c5f0; /* 포커스 시 배경색 유지 */
		}
		/* 회원가입 버튼에 대한 스타일 */
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
		.login_qna{
			color: #424242;
		    font-size: 15px;
		    text-align: center;
		    margin-top: 30px;
		}
		a {
			text-decoration: none;
		    font-weight: bold;
		    display: inline-block;
		    padding-left: 10px;
		}
	</style>
</head>
<body>
	<div id="homelogo">
            <a href="/index.jsp">
                내일의 집
            </a>
    </div>
	<div class="content">
		<div>
			<h1 class="join_title">회원가입</h1>
	        <hr/>
	        <!-- 회원가입 폼 -->
		    <form action="/user/UserJoinOk.us" method="post" name="joinForm">
		        <!-- 아이디 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>아이디</p>
		        		<input type="text" name="user_id" id="user_id" placeholder="아이디" required>
		        	</label>
		        </div>
		        <!-- 아이디 중복인증 -->
		       <div class="btn_element">
		        	<button type="button" class="btn" id="btn_id" onclick="checkId()">아이디 중복확인</button>		        	
		        </div>
		        <!-- 비밀번호 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>비밀번호</p>
		        		<div class="input_context">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</div>
		        		<input type="password" name="password" id="password" placeholder="비밀번호" required>
		        	</label>
		        </div>
		        <!-- 비밀번호 확인 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>비밀번호 확인</p>
		        		<input type="password" name="password_re" id="password_re" placeholder="비밀번호 확인" required>
		        	</label>
		        </div>
		     	<!-- 이름 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>이름</p>
		        		<input type="text" name="name" id="name" placeholder="이름"/>
		        	</label>
		        </div>
		        <!-- 이메일 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>이메일</p>
		        		<input type="text" name="email" id="email" placeholder="이메일">
		        	</label>
		        </div>
		        <!-- 닉네임 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>닉네임</p>
		        		<input type="text" name="nickname"  id="nickname" placeholder="별명 (2~20자)">
		        	</label>
		        </div>
		        <!-- 휴대폰 번호 입력 -->
		        <div class="input_element">
		        	<label class="input_title">
		        		<p>휴대폰 번호</p>
		        		<input type="text" name="tel" id="tel" placeholder="휴대폰">
		        	</label>
		        </div>
		        <!-- 가입 버튼 -->
		        <div>
		        	<input type="submit" class="btn" value="회원가입하기" onclick="return sendit()"/>
		        </div>
		    </form>
		    <!-- 로그인 페이지로 돌아가기 -->
		    <p class="login_qna">
		    	이미 아이디가 있으신가요? <a href="/user/UserLogin.us">로그인</a>
		    </p>
		</div>
	</div>
	<script src="./user.js"></script>
</body>
</html>