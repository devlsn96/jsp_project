<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
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
    .header_wrap{
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
    height: 40px;
    border: 1px solid #dbdbdb;
    border-radius: 0.3rem;
    margin-right: 1rem;
    padding-left: 8px;
    margin-left: 200px;
}

.header-upper__searchBar input {
    border: none;
    width: 230px;
    margin-left: 0.5rem;
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

.header-upper__lists ul li a p{
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
	 .container {
	    max-width: 1100px;
	    margin: 0 auto;
	    padding: 20px;
	}
	
	.category-container {
	    display: flex;
	    justify-content: center;
	    margin-bottom: 20px;
	}
	
	.category {
	    display: inline-block;
	    padding: 10px 20px;
	    margin: 10px;
	    background-color: #f0f0f0;
	    cursor: pointer;
	    border-radius: 5px;
	    text-align: center;
	}
	
	.category.selected {
	    background-color: #007bff;
	    color: white;
	}
	
	.category:hover {
	    background-color: #ddd;
	}
	
	.title {
	    font-size: 24px;
	    font-weight: bold;
	    margin-top: 20px;
	}
	
	.info {
	    margin-top: 10px;
	    color: #888;
	    display: flex;
	    justify-content: space-between;
	}
	
	.content {
	    margin-top: 20px;
	    padding: 20px;
	    border: 1px solid #ccc;
	}
	
	.button-container {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.btn-list {
	    background-color: #007bff;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 16px;
	    text-decoration: none;
	    display: inline-block;
	}
	
	.btn-list:hover {
	    background-color: #0056b3;
	}
	
	/* 댓글 스타일 */
	.comments-container {
	    margin-top: 30px;
	    padding: 20px;
	    border-top: 1px solid #ccc;
	}
	
	.comment {
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
	    width: 100%;
	    
	    margin-bottom: 15px;
        border: 1px solid #ccc;
        padding: 10px;
        border-radius: 5px;
        background-color: #f9f9f9;
	}
	
	.comment textarea {
	    display: block;
	    width: 100%;
	    margin: 0;
	    padding: 5px;
	    text-align: left;
	    box-sizing: border-box;
	    height: auto;
	    min-height: 65px;
	    resize: none;
	    white-space: normal;
	    line-height: 1.5;
	    overflow-y: hidden;
	    word-wrap: break-word;
	    border: 1px solid #ccc;
	    font-size: 14px;
	    background-color: transparent;
	}
	
	/* 버튼 스타일 */
	.btn-action {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    border-radius: 4px;
	    padding: 5px 10px;
	    cursor: pointer;
	    font-size: 14px;
	    margin: 5px;
	}
	
	.btn-action:hover {
	    background-color: #0056b3;
	}
	
	/* 댓글 작성 폼 스타일 */
	.reply-form {
	    margin-top: 20px;
	    border: 1px solid #ddd;
	    padding: 15px;
	}
	
	.reply-form input,
	.reply-form textarea {
	    width: 100%;
	    padding: 10px;
	    margin: 5px 0;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	
	.reply-form button {
	    background-color: #28a745;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    font-size: 16px;
	}
	
	.reply-form button:hover {
	    background-color: #218838;
	}
	
	/* 수정/삭제 버튼 스타일 */
	.edit-delete-buttons {
	    display: flex;
	    gap: 10px;
	}
	
	.edit-delete-buttons .btn-action {
	    padding: 5px 15px;
	}
	
	/* 기본 textarea 스타일 */
	textarea {
	    width: 100%;
	    padding: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    resize: none;
	    font-size: 16px;
	    box-sizing: border-box;
	}
	
	/* readonly 상태일 때 textarea를 텍스트처럼 보이게 변경 */
	textarea[readonly] {
	    background-color: transparent;  /* 배경을 투명하게 */
	    border: none;  /* 테두리를 없앰 */
	    color: #333;  /* 텍스트 색상 */
	    font-size: 16px;
	    padding: 0;
	    line-height: 1.5;
	    height: auto;
	    resize: none;  /* 크기 조절 불가 */
	    box-shadow: none;  /* 그림자 제거 */
	    overflow: hidden;  /* 스크롤바 제거 */
	}
	
	/* 수정 가능 상태 (readonly 해제)일 때 textarea 스타일 */
	textarea.editable {
	    background-color: #fff;  /* 흰색 배경 */
	    border: 1px solid #007bff;  /* 테두리 파란색 */
	    color: #333;  /* 텍스트 색상 */
	    padding: 10px;
	    resize: vertical;  /* 크기 조정 가능 */
	}
	
	.image-preview {
	    max-width: 100%; 
	    height: auto;
    }
    </style>

    <script>
    
    	// 게시판 수정, 삭제
    	
	    function enableEdit() {
	        // 제목과 내용을 편집 가능하게 함
	        document.getElementById('title').readOnly = false;
	        document.getElementById('content').readOnly = false;
	        
	        // editable 클래스 추가
	        document.getElementById('content').classList.add('editable');
	        
	        // 저장 버튼 표시
	        document.getElementById('saveButton').style.display = 'inline-block';
	
	        // 수정 버튼 숨기기
	        document.getElementById('editButton').style.display = 'none';
	    }
	
	
	    function submitForm() {
	        // hidden input 필드에 현재 값을 저장해서 서버로 전송
	        document.getElementById('hiddenTitle').value = document.getElementById('title').value;
	        document.getElementById('hiddenContent').value = document.getElementById('content').value;
	    }
	
	    function confirmDelete() {
	        return confirm("정말 이 게시글을 삭제하시겠습니까?");
	    }    
	    
	    
	    // 댓글 수정, 삭제 
	    
	    function updateReply(commentnum) {
	        let textarea = document.getElementById('reply' + commentnum);
	        	
	        // textarea 활성화
	        textarea.readOnly = false;
	
	        // 높이 자동 조정
	        textarea.style.height = 'auto';
	        textarea.style.height = textarea.scrollHeight + 'px';
	        textarea.scrollTop = 0; 
	            
	        // 수정 완료 버튼 보이기
	        document.getElementById('updateForm' + commentnum).style.display = 'block';
	        	
	        console.log("Reply " + commentnum + " is now editable");
	    }
        
        function prepareReplyUpdate(commentnum) {
            // textarea의 수정된 값을 hidden input에 저장
            let textarea = document.getElementById('reply' + commentnum);
            let hiddenInput = document.getElementById('content' + commentnum);
            hiddenInput.value = textarea.value;
        }

        function deleteReply(commentnum) {
            if (confirm("정말 이 댓글을 삭제하시겠습니까?")) {
                location.href = "${pageContext.request.contextPath}/board/DeleteReply.bo?commentnum=" + commentnum + "&boardid=" + ${board.boardid};
            }
        }
        
        function goToPage(page) {
            if (page === 'qna') {
                location.href = '${pageContext.request.contextPath}/app/qna/qna.jsp';
            } else if (page === 'board') {
                location.href = '/board/BoardList.bo';
            }
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
		              <a class="header-lower__item active" href="">홈</a>
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


    <c:set var="board" value="${requestScope.board}" />
    <c:set var="replylist" value="${requestScope.replylist}" />

    <div class="container">
    
        <div class="title">
            제목: <input type="text" id="title" name="title" value="${board.title}" readonly />
        </div>
        
        <div class="info">
            <div>작성자: ${board.userid }</div>
            
            <!-- 수정, 삭제 버튼 -->
            <div class="edit-delete-buttons">
                <!-- 수정 버튼 -->
                <button id="editButton" class="btn-action" onclick="enableEdit()">수정</button>
                <!-- 삭제 버튼 -->
                <form action="${pageContext.request.contextPath}/board/DeleteBoard.bo" method="POST"  onsubmit="return confirmDelete();">
                    <input type="hidden" name="boardid" value="${board.boardid}">
                    <button type="submit" class="btn-action" >삭제</button>
                </form>
            </div>
        </div>

        <!-- 내용 출력 -->
        <div class="content">
            <textarea id="content" name="content" rows="10" readonly>${board.content}</textarea>
        </div>
		
<%--         <!-- 첨부된 이미지가 있을 경우 이미지 출력 -->
        <c:if test="${board != null && not empty board.imagePath}">
            <div>
                <h4>첨부 이미지</h4>
                <img src="${board.imagePath}" alt="첨부 이미지" class="image-preview">
            </div>
        </c:if>		 --%>
		
		
        <!-- 저장 버튼 -->
        <div class="button-container">
            <form action="${pageContext.request.contextPath}/board/UpdateBoard.bo" method="POST">
                <input type="hidden" name="boardid" value="${board.boardid}">
                <input type="hidden" id="hiddenTitle" name="title" value="">
                <input type="hidden" id="hiddenContent" name="content" value="">
                <button type="submit" id="saveButton" class="btn-action" style="display:none;" onclick="submitForm()">저장</button>
            </form>
        </div>
			
			
			  <!-- **댓글** 출력 -->
	    <div class="comments-container">
	        <h3>댓글</h3>
	
	        <c:choose>
	            <c:when test="${replylist != null and fn:length(replylist) > 0}">
	                <c:forEach var="reply" items="${replylist}">
	                    <div class="comment">
	                        <div><strong>${reply.userid}</strong></div>
	                        <textarea name="content" id="reply${reply.commentnum}" readonly  style="height:auto;">
							    ${reply.content}
							</textarea>
							
							<!-- **댓글** 수정 버튼 -->
							<button class="btn-action" onclick="updateReply(${reply.commentnum})">수정하기</button>
							
							<!-- **댓글** 수정 완료 버튼 -->
							<form action="${pageContext.request.contextPath}/board/UpdateReply.bo" method="post" id="updateForm${reply.commentnum}" style="display:none;" onsubmit="prepareReplyUpdate(${reply.commentnum})">
							    <input type="hidden" name="commentnum" value="${reply.commentnum}">
							    <input type="hidden" name="content" id="content${reply.commentnum}">
							    <input type="hidden" name="boardid" value="${board.boardid}">
							    <button type="submit" class="btn-action">수정 완료</button>
							</form>
	
							<!-- **댓글** 삭제 버튼 -->
	                        <button class="btn-action" onclick="deleteReply(${reply.commentnum})">삭제</button>
	                    </div>
	                </c:forEach>
	            </c:when>
	            <c:otherwise>
	                <p>작성된 댓글이 없습니다.</p>
	            </c:otherwise>
	        </c:choose>
    	</div>

	    <!-- **댓글** 작성 폼 -->
	    <div class="reply-form">
	        <h3>댓글 작성</h3>
	        <form name="replyForm" action="${pageContext.request.contextPath}/board/AddReply.bo" method="post">
	            <input type="hidden" name="boardid" value="${board.boardid}">
	            <textarea name="content" placeholder="댓글을 입력하세요" rows="4" style="resize: none;"></textarea>
	            <button type="submit">댓글 등록</button>
	        </form>
	    </div>
			
			
			
	<div class="button-container">
	        <button type="button" class="btn-list" onclick="location.href='/board/BoardList.bo'">목록</button>
	</div>

    </div>


</body>
</html>
