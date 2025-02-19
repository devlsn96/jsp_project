<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link href="./join.css" rel="stylesheet">
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