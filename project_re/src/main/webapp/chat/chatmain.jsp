<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%
    // request 객체에서 userId 값 가져오기
    String userId = (String) request.getAttribute("userId");
%>
<html>
<head>
    <title>채팅방</title>
    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Poppins:wght@300&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Gamja+Flower:400"
      rel="stylesheet"
    />

    <!-- 아이콘 용 폰트 어썸 -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
      integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
    	* {
		    padding: 0;
		}
    
    	.header_wrap{
    		background-color: #fff;
			width: 100%;
			height:auto;
			margin: a auto;
		}
		
		.inner {
		    max-width: 1136px;
		    margin: 0 auto;
		}
		
		.header-upper{
			padding: 10px 50px;
			border-bottom: 1px solid #ededed;
		}
		
		.header-upper .inner {
		    display: flex;
		    flex-flow: row nowrap;
		    justify-content: space-between;
		    align-items: center;
		    height: 60px;
		}
		
		.searchMenu {
		  font-size: 1.5rem;
		  color: #35c5f0;
		  cursor: pointer;
		}
		
		.header-upper__inner {
		    display: flex;
		    align-items: center;
		}
		
		.header-upper__logo {
		    font-family: "Gamja Flower";
		  	font-weight: 700;
		  	cursor: pointer;
		  	font-size: 28.8px;
		  	margin-right: 2rem;
		}
		
		.header-uppper__nav ul {
		    display: flex;
		}
		
		.header-upper__item {
		    font-weight: bold;
		    margin-right: 1rem;
		    cursor: pointer;
		}
		
		.header-upper__item.upper__active {
		    color: #35c5f0;
		}
		
		.header-upper__service {
		    display: flex;
		    justify-content: flex-end;
		    align-items: center;
		    color: #757575;
		    font-weight: bold;
		}
		
		.header-upper__searchBar {
		    display: flex;
		    align-items: center;
		    border: 1px solid #dbdbdb;
		    border-radius: 0.3rem;
		    margin-right: 1rem;
		    padding-left: 8px;
		    margin-left: 200px;
		    line-height: 48px;
		}
		
		.header_wrap .header-upper__searchBar input {
		    border: none;
		    width: 230px;
		    margin-left: 0.5rem;
		    margin-bottom: 0;
		}
		
		.header-upper__service ul {
		    display: flex;
		}
		
		.header-upper__service ul li {
		    cursor: pointer;
		    line-height: 38px;
		    /* border-right: 1px solid #757575; */
		}
		
		
		.header-upper__service ul li a {
		    margin: 0 9px 0 8px;
		    display: inline-block;
		}
		
		ul, li, a, button {
		    all: unset;
		    cursor: pointer;
		}
		
		.header-upper__serviceBt {
		    width: 100px;
		    height: 22px;
		    color: #757575;
		    padding: 8px 0;
		    background: #fff;
		    border-radius: 5px;
		    text-align: center;
		    line-height: 22px;
		    cursor: pointer;
		    position: relative;
		    font-size: 16px;
		}
		
		/* 고객센터 버튼 호버 스타일 */
		.header-upper__serviceBt:hover {
		  background: #f0f0f0; /* 호버 시 배경색 변경 */
		}
		.header-upper__lists {
		  position: absolute; /* 절대 위치 설정 */
		  z-index: 999; /* 최상위 레이어 설정 */
		  top: 70px; /* 상단에서 70px 떨어진 위치 */
		  background: #fff; /* 배경색 설정 */
		  border: 1px solid #dbdbdb; /* 테두리 설정 */
		  border-radius: 6px; /* 모서리 둥글게 처리 */
		  box-shadow: 0 4px 10px 0 rgb(209, 209, 209); /* 그림자 효과 */
		  width: 320px; /* 너비 설정 */
		  display: none; /* 초기에는 숨김 */
		  transition: 1s; /* 전환 효과 설정 */
		}
		
		.header-upper__lists ul{
			display: inline-block;
			hegiht: auto;
		}
		
		.header-upper__lists ul li a {
			padding: 16px 20.8px;
		    margin: 0 9px 0 8px;
		    display: inline-block;
		    height: 52px;
		}
		
		.header-upper__lists ul li a h4{
			padding-bottom: 8px;
		}
		
		.header_wrap .header-upper__lists ul li a p{
			font-size: 12.8px;
		}
		
		/* 고객센터 하단 목록 스타일 */
		.header-upper__serviceLists {
		  position: absolute; /* 절대 위치 설정 */
		  z-index: 999; /* 최상위 레이어 설정 */
		  top: 70px; /* 상단에서 70px 떨어진 위치 */
		  background: #fff; /* 배경색 설정 */
		  border: 1px solid #dbdbdb; /* 테두리 설정 */
		  border-radius: 6px; /* 모서리 둥글게 처리 */
		  box-shadow: 0 4px 10px 0 rgb(209, 209, 209); /* 그림자 효과 */
		  width: 320px; /* 너비 설정 */
		  display: none; /* 초기에는 숨김 */
		  transition: 1s; /* 전환 효과 설정 */
		  flex-direction: column; /* 세로 방향으로 배치 */
		}
		
		/* 고객센터 하단 목록 표시 */
		.header-upper__serviceLists.openServiceMenu {
		  display: flex; /* 메뉴 표시: 플렉스 레이아웃으로 설정 */
		}
		
		.header-upper__service ul li a {
		    margin: 0 9px 0 8px;
		}
		
		.header-upper__serviceLists a {
		  display: flex; /* 플렉스 박스 레이아웃 사용 */
		  flex-direction: column; /* 세로 방향으로 배치 */
		  justify-content: flex-start; /* 시작 부분 정렬 */
		  align-items: flex-start; /* 시작 부분 정렬 */
		  padding: 1rem 1.3rem; /* 패딩 설정 */
		  cursor: pointer; /* 커서 스타일 변경 */
		}
		
		/* 마지막 항목의 하단 패딩 설정 */
		.header-upper__serviceLists a:last-child {
		  padding-bottom: 1rem; /* 하단 패딩 설정 */
		}
		
		/* 하단 목록 내 제목 스타일 */
		.header-upper__serviceLists a h4 {
		  color: #424242; /* 글자 색상 설정 */
		  font-size: 1rem; /* 글자 크기 설정 */
		  padding-bottom: 0.5rem; /* 하단 패딩 설정 */
		}
		
		.header-upper__serviceLists {
		    position: absolute;
		    z-index: 999;
		    top: 70px;
		    background: #fff;
		    border: 1px solid #dbdbdb;
		    border-radius: 6px;
		    box-shadow: 0 4px 10px 0 rgb(209, 209, 209);
		    width: 320px;
		    display: none;
		    transition: 1s;
		    flex-direction: column;
		}
		
		.header-upper__writeBt {
		    width: 100px;
		    height: 22px;
		    color: #fff;
		    padding: 8px 0 10px;
		    background: #35c5f0;
		    border-radius: 5px;
		    text-align: center;
		    line-height: 22px;
		    cursor: pointer;
		    position: relative;
		    font-size: 16px;
		}
		
		.header-upper__writeBt::after {
		    font-family: "Font Awesome 5 Free";
		    font-weight: 900;
		    content: "\f078";
		    margin-left: 0.5rem;
		}
		
		.header-lower{
			padding: 0 50px;
			border-bottom: 1px solid #ededed;
			overflow-x: auto;
		    overflow-y: hidden;
		}
		
		.header-lower .inner {
			width: 1136px;
		    justify-content: space-between;
		    align-items: center;
		    height: 50px;
		    padding-left: 0px;
		    display: flex;
		    
		}
		
		.header-lower .inner nav {
		    display: flex;
		    flex-flow: row nowrap;
		    justify-content: flex-start;
		    align-items: center;
		    color: #424242;
		    margin-left: 0;
		}
		
		.header-lower .inner div {
		    display: inline-block;
		    font-size: 1rem;
		    font-weight: 700;
		    color: #424242;
		    cursor: pointer;
		}
		
		.header-lower__item.active {
		    border-bottom: 2px solid #35c5f0;
		}
		
		.header-lower__item {
		    font-size: 1rem;
		}
		
		.header-lower__item {
		    font-weight: 700;
		    color: #424242;
		    cursor: pointer;
		    /* margin: 8px 0; */
		    padding: 11px 10px;
		    /* position: relative; */
		    flex-shrink: 0;
		}
		
		.header-lower .inner div {
		    display: inline-block;
		    font-size: 1rem;
		    font-weight: 700;
		    color: #424242;
		    cursor: pointer;
		}
		
    
        /* 전반적인 레이아웃 스타일 */
        /* body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        } */
        
        body{
        	 padding: 0 !important;
        }
        
        .wrap {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        .chat-container {
            background-color: white;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }

        /* 제목 스타일 */
        .chat-title {
            text-align: center;
            background-color: #35C5F0;
            color: white;
            padding: 10px;
            font-size: 20px;
            font-weight: bold;
        }

        /* 채팅창 */
        .chatbox {
            border-bottom: 1px solid #ccc;
            height: 300px;
            overflow-y: auto;
            padding: 10px;
            background-color: #fafafa;
        }

        /* 입력 섹션 */
        .input-section {
            display: flex;
            flex-direction: column;
            padding: 15px;
        }

        input[type="text"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: calc(100% - 22px); /* 패딩과 보더 보정 */
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="text"]::placeholder {
            color: #aaa;
        }

        button {
            padding: 10px;
            background-color: #35C5F0;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }


        /* 채팅 메시지 스타일 */
        .chat-message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #e1f5fe;
            text-align: left;
        }

        .chat-message .sender {
            font-weight: bold;
            color: #007BFF;
        }

        .chat-message .message-text {
            margin-top: 5px;
            color: #333;
        }

        .chat-message.receiver {
            background-color: #c8e6c9;
        }

        /* 스크롤바 스타일 */
        .chatbox::-webkit-scrollbar {
            width: 5px;
        }

        .chatbox::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 10px;
        }

        .chatbox::-webkit-scrollbar-track {
            background-color: #fafafa;
        }
    </style>

    <script>
        window.onload = function() {
            // 함수 호출
            loadMessages();
        };

        function sendMessage() {
            var message = document.getElementById('message').value;
            var sendID = document.getElementById('sendID').value;
            var userID = document.getElementById('userID').value;

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'sendMessage.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onload = function() {
                loadMessages(userID);  // 메시지 전송 후 채팅창 업데이트
            };

            xhr.send('userID=' + encodeURIComponent(userID) + '&sendID=' + encodeURIComponent(sendID) + '&message=' + encodeURIComponent(message));
            
            document.getElementById('message').value = '';  // 입력 필드 초기화
        }

        function loadMessages(userID) {
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'getMessages.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                var chatbox = document.getElementById('chatbox');
                chatbox.innerHTML = xhr.responseText;  // 채팅창에 메시지 표시

                // 스크롤을 맨 아래로 이동
                chatbox.scrollTop = chatbox.scrollHeight; // 스크롤 위치 조정
            };
            xhr.send('userID=' + encodeURIComponent(userID));
        }
    </script>
</head>
<body>
<div class="header_wrap">
		<div class="header-upper">
			<div class="inner">
				<div class="header-upper__inner">
					<div class="header-upper__logo">
						<a href="/index.jsp">내일의 집</a>
					</div>
				
					<div class="header-uppper__nav">
						<ul>
							<li class="header-upper__item upper__active">
								<a href="">커뮤니티</a>
							</li>
							<li class="header-upper__item">
								<a href="">쇼핑</a>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="header-upper__service">
					<div class="header-upper__searchBar">
					    <i class="fas fa-search"></i>
					    <input type="text" placeholder="오늘의집 통합검색">
					 </div>
					 
					 <a href="/cart/cart.jsp">
					 	<i class="fas fa-shopping-cart"></i>
					 </a>
					 <ul>
					 <%
					        // 세션에 사용자 정보가 있는지 확인
					        String user_id = (String)session.getAttribute("user_id");
					        if (user_id == null) {
					            // 로그인되지 않은 상태
					    %>
					      	<li><a href="/user/UserLogin.us">로그인</a></li>
					    	<li><a href="/user/UserJoin.us">회원가입</a></li>
					    <%
					        } else {
					            // 로그인된 상태
					    %>
					        <li><a href="/user/UserLogout.us">로그아웃</a></li>
					    <%
					        }
					    %>
					    <button class="header-upper__serviceBt">고객센터</button>
					    <!-- 고객센터 관련 리스트 -->
					    <div class="header-upper__serviceLists" style="display: none;"> <!-- 기본적으로 숨김 -->
				      <ul>
				        <li><a href="/board/BoardList.no"><h4>공지사항</h4></a></li>
				        <li><a href="/chat/chatmain.ch"><h4>채팅방</h4></a></li>
				      </ul>
				   	 </div>
				    </li>
				    <li>
				      <button class="header-upper__writeBt">글쓰기</button>
				      <div class="header-upper__lists" style="display: none;"> <!-- 기본적으로 숨김 -->
				        <ul>
				          <li><a href=""><h4>사진 올리기</h4><p>우리 집의 공간과 나의 일상을 기록해 보세요.</p></a></li>
				          <li><a href=""><h4>집들이 글쓰기</h4><p>집에 관한 이야기를 글로 작성해 보세요.</p></a></li>
				          <li><a href=""><h4>노하우 글쓰기</h4><p>다양한 인테리어 노하우를 공유해 주세요.</p></a></li>
				          <li><a href=""><h4>상품 리뷰 글쓰기</h4><p>상품 리뷰를 작성하고 포인트도 받아 보세요.</p></a></li>
				          <li><a href=""><h4>시공 전문가 리뷰쓰기</h4><p>시공 전문가 리뷰를 작성하고 포인트도 받아보세요.</p></a></li>
				          <li><a href=""><h4>인테리어 질문하기</h4><p>인테리어 고수들과 전문가들에게 질문해 보세요.</p></a></li>
				        </ul>
				      </div>
				      <script>
				    document.querySelector('.header-upper__writeBt').addEventListener('click', function() {
				      const lists = document.querySelector('.header-upper__lists');
				      // 토글 기능을 적용
				      if (lists.style.display === 'none' || lists.style.display === '') {
				        lists.style.display = 'block'; // 보이게
				      } else {
				        lists.style.display = 'none';  // 숨기기
				      }
				    });
				    
				    document.querySelector('.header-upper__serviceBt').addEventListener('click', function() {
				        const serviceLists = document.querySelector('.header-upper__serviceLists');
				        // 토글 기능을 적용
				        if (serviceLists.style.display === 'none' || serviceLists.style.display === '') {
				          serviceLists.style.display = 'block'; // 보이게
				        } else {
				          serviceLists.style.display = 'none';  // 숨기기
				        }
				      });
				  </script>
				    </li>
				  </ul>
				</div>
			</div>
		</div>
		
		<div class="header-lower">
			<div class="inner">
		       <nav>
	       			<div class="community-menu">
		              <a class="header-lower__item" href="/index.jsp">홈</a>
		              <a class="header-lower__item" href="/board/BoardList.bo">게시판</a>
		              <a class="header-lower__item" href="/app/qna/qna.jsp">Q&amp;A</a>
		              </div>
		               <!-- 쇼핑 하단 메뉴 추가 -->
		           		 <div class="shopping-menu" style="display: none;"> <!-- 기본적으로 숨김 -->
		                <a class="header-lower__item active" href="/shopping/ShoppingHome.sh">홈</a>
		                <a class="header-lower__item" href="/shopping/ShoppingCategory.sh?prod_category=furniture">카테고리</a>
		            </div>
				</nav>
          </div>
		</div>
	</div>
<script>
    // 커뮤니티 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.community-menu').style.display = 'block'; // 커뮤니티 메뉴 보이기
        document.querySelector('.shopping-menu').style.display = 'none'; // 쇼핑 메뉴 숨기기
    });

    // 쇼핑 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item:last-child a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.shopping-menu').style.display = 'block'; // 쇼핑 메뉴 보이기
        document.querySelector('.community-menu').style.display = 'none'; // 커뮤니티 메뉴 숨기기
    });
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });

    // 쇼핑 메뉴 클릭 시 활성화
    document.querySelector('.header-upper__item:last-child a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });
</script>

<div class="wrap">
    <div class="chat-container">
        <div class="chat-title">채팅방</div> <!-- 채팅방 제목 추가 -->
        <div id="chatbox" class="chatbox">
            <!-- 채팅 메시지가 여기 표시됨 -->
        </div>
        <div class="input-section">
            <input type="text" id="userID" placeholder="유저아이디를 입력하세요">
            <input type="hidden" id="sendID" value=<%=userId %>>
            <input type="text" id="message" placeholder="메시지를 입력하세요">
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>
</div>
</body>
</html>
