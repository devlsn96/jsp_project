<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping_category</title>
<link href="/app/shopping/css/shopping_category.css" rel="stylesheet" type="text/css">

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
	svg[Attributes Style] {
	    width: 12;
	    height: 12;
	    fill: currentcolor;
	}

	vg:not(:root) {
	    overflow-clip-margin: content-box;
	    overflow: hidden;
	}
</style>
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
							<li class="header-upper__item">
								<a href="">커뮤니티</a>
							</li>
							<li class="header-upper__item upper__active">
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
	       			<div class="community-menu" style="display: none;">
		              <a class="header-lower__item" href="/index.jsp">홈</a>
		              <a class="header-lower__item" href="/board/BoardList.bo">게시판</a>
		              <a class="header-lower__item" href="/app/qna/qna.jsp">Q&amp;A</a>
		              </div>
		           		 <div class="shopping-menu">
		                <a class="header-lower__item" href="/shopping/ShoppingHome.sh">홈</a>
		                <a class="header-lower__item active" href="/shopping/ShoppingCategory.sh?prod_category=furniture">카테고리</a>
		            </div>
				</nav>
          </div>
		</div>
	</div>
<script>
    // 커뮤니티 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.shopping-menu').style.display = 'block'; // 쇼핑 메뉴 숨기기
        document.querySelector('.community-menu').style.display = 'none'; // 커뮤니티 메뉴 보이기
    });

    // 쇼핑 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item:nth-child(1) a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.shopping-menu').style.display = 'none'; // 쇼핑 메뉴 보이기
        document.querySelector('.community-menu').style.display = 'block'; // 커뮤니티 메뉴 숨기기
    });
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });

    // 쇼핑 메뉴 클릭 시 활성화
    document.querySelector('.header-upper__item:nth-child(1) a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });
</script>
<div class="wrap">


	<div class="category_wrap">
		<div class="sidebar_wrap">
			<div class="title">
				<a href="/shopping/ShoppingCategory.sh?prod_category=furniture">가구</a>
			</div>
			<div class="tree">
				<ul class="category_other_title">
					<li>
						<a href="/shopping/ShoppingCategory.sh?prod_category=fabric">패브릭</a>
					</li>
					<li>
						<a href="/shopping/ShoppingCategory.sh?prod_category=electronics">가전·디지털</a>
					</li>
				</ul>
			</div>
			<div>
				
			</div>
		</div>
		<div class="contents_wrap">
			<div class="contents_head">
				<div class="category_header">
					가구
				</div>
				<div class="banner">
					<div class="img_ex">
						<a href="#">
							<img src="/app/shopping/images/category_banner.png">
						</a>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>단일주일만!기간 한정 세일</h2>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172681601431268572.avif">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172681590559176598.avif">
							</a>
						</div>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>가구 구매 전 둘러보기</h2>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172051681633391123.webp">
							</a>
						</div>
					</div>
				</div>
				
				<div class="contents_body">
					<div class="title">
						<h2>오직 내일의집에서만 만나요</h2>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172605056237521217.webp">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172605056686185622.webp">
							</a>
						</div>
					</div>
					<div class="title_image">
						<div class="img_ex1">
							<a href="#">
								<img src="/app/shopping/images/172560946471144444.webp">
							</a>
						</div>
						<div class="img_ex2">
							<a href="#">
								<img src="/app/shopping/images/172560946465667132.webp">
							</a>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="contents_body">
			
				<div class="product_wrap">

				<!-- 추천 상품 4개 -->
				<c:forEach var="product" items="${shoppingCategoryList}">
					<div class="product_one">
						<a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
							<input type="hidden" name="prod_num" value="${product.prod_num}">
				    		<%-- <input type="hidden" name="prod_category" value="${product.prod_category}"> --%>
							<div class="image_ex">
								<img src="${product.prod_image}">
							</div>
							<div class="description_wrap">
								<div class="description_brand">
									브랜드네임
								</div>
								<div class="description_content">
									${product.prod_name}
								</div>
								<div class="description_price">
									${product.prod_price}
								</div>
								<div class="description_rating">
									<div class="icon_star"><img src="/app/shopping/images/icon_star.png" alt="icon_star"></div>
									<div class="rating_num"><strong>4.5</strong> </div>
									<div class="review_num">리뷰 999</div>
								</div>
								<div class="description_etc">
									<div class="special">특가</div><div class="free">무료배송</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				<!-- 여기까지 추천 상품 4개 반복 -->

			</div>
				
			</div>
		</div>
	</div>	
</div>
	
<script>
	
	// category_open button을 클릭하면 category_expanded에 show class를 추가하고 
	// .show css가 적용되도록한다.
	document.addEventListener('DOMContentLoaded', function() {
    const openButtons = document.querySelectorAll('.category_open');
    
    openButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryExpanded = this.closest('li').querySelector('.category_expanded');
            categoryExpanded.classList.toggle('show'); // 'show' 클래스 토글
	        });
	    });
	});

</script>
</body>
</html>