<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping_detailview</title>
<link href="/app/shopping/css/shopping_detailview.css" rel="stylesheet" type="text/css">
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
</head>
<body>
<c:set var="prod_num" value="${param.prod_num }" />
<c:set var="product" value="${requestScope.product }"/>
<c:set var="review" value="${requestScope.reivew }"/>

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
		                <a class="header-lower__item active" href="/shopping/ShoppingHome.sh">홈</a>
		                <a class="header-lower__item" href="/shopping/ShoppingCategory.sh?prod_category=furniture">카테고리</a>
		            </div>
				</nav>
          </div>
		</div>
	</div>
<script>
    // 쇼핑 메뉴 클릭 시 하단 메뉴 표시
    document.querySelector('.header-upper__item.upper__active a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.shopping-menu').style.display = 'block'; // 쇼핑 메뉴 숨기기
        document.querySelector('.community-menu').style.display = 'none'; // 커뮤니티 메뉴 보이기
    });

    // 커뮤니티 메뉴 클릭 시 하단 메뉴 표시
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

    // 커뮤니티 메뉴 클릭 시 활성화
    document.querySelector('.header-upper__item:nth-child(1) a').addEventListener('click', function(event) {
        event.preventDefault(); // 기본 링크 동작 방지
        document.querySelector('.header-upper__item.upper__active').classList.remove('upper__active');
        this.parentNode.classList.add('upper__active'); // 클릭한 메뉴에 클래스 추가
    });
</script>

<div class="wrap">
 
	<div class="container">
		<%-- <nav>
			<ol>
				<li>
					<a href="#">${product.prod_category }</a>	
					<div class="img_ex">
						<svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg>
						<path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
					</div>
				</li>
				<li>
					<a href="#">화장대·콘솔</a>
					<div class="img_ex">
						<svg class="icon" width="8" height="8" viewBox="0 0 8 8" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path></svg>
						<path d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
					</div>
				</li>
				<li>
					<a href="#">일반화장대</a>
				</li>
			</ol>
		</nav> --%>
		<div class="product_wrap">
			<div class="product_left">
				<div class="product_left_image">
					<div class="product_left_image_margin">
						<div class="product_image">
							<div class="img_ex">
								<img src="${product.prod_image }" alt="product_image">
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<div class="product_right">
			

				<div class="product_header">
					<div class="product_brand">
						<p><a href="#">브랜드네임</a></p>
					</div>
					<div class="product_name_wrap">
						<div class="product_name">
							${product.prod_name }
						</div>
						<!-- <div class="product_name_action">
							<div class="button_scrap">
								<button class="scrap">
									<svg class="icon--stroke" aria-label="스크랩" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
									<path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>
								</button>
								<span>9,999</span>
							</div>
							<div class="button_drop_down">
								<button class="drop_down">
									<svg class="icon" aria-label="공유하기" width="24" height="24" viewBox="0 0 24 24" fill="currentColor" preserveAspectRatio="xMidYMid meet"><path d="M9.64 14.646a4.5 4.5 0 1 1 0-5.292l4.54-2.476a4.5 4.5 0 1 1 .63.795l-4.675 2.55c.235.545.365 1.146.365 1.777s-.13 1.232-.365 1.777l4.675 2.55a4.5 4.5 0 1 1-.63.795l-4.54-2.476zM18 8a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM6 15.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM18 23a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path></svg>
									<path d="M9.64 14.646a4.5 4.5 0 1 1 0-5.292l4.54-2.476a4.5 4.5 0 1 1 .63.795l-4.675 2.55c.235.545.365 1.146.365 1.777s-.13 1.232-.365 1.777l4.675 2.55a4.5 4.5 0 1 1-.63.795l-4.54-2.476zM18 8a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM6 15.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM18 23a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"></path>
								</button>
							</div>
						</div> -->
					</div>
					<div class="product_rating_review">
						<div class="rating_count">
							<div class="img_ex">
								<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
							</div>
							<div class="img_ex">
								<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
							</div>
							<div class="img_ex">
								<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
							</div>
							<div class="img_ex">
								<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
							</div>
							<div class="img_ex">
								<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><defs><path id="star-path-1.000" d="M11.9996 19.7201L6.32294 22.1251C5.5626 22.4472 5.005 22.0311 5.0755 21.2188L5.60855 15.0767L1.5671 10.421C1.02579 9.79745 1.24924 9.13855 2.04358 8.95458L8.04973 7.56354L11.2287 2.28121C11.6545 1.57369 12.3502 1.5826 12.7706 2.28121L15.9496 7.56354L21.9557 8.95458C22.7602 9.1409 22.9667 9.8053 22.4322 10.421L18.3907 15.0767L18.9238 21.2188C18.9952 22.0414 18.4271 22.4432 17.6764 22.1251L11.9996 19.7201Z"></path><clipPath id="star-clip-1.000"><rect x="0" y="0" width="24" height="24"></rect></clipPath></defs><use xlink:href="#star-path-1.000" fill="#DBDBDB"></use><use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use></svg>
							</div>
						</div>
						<!-- <div class="review_count">
							<div class="review_num">30,790</div>
							<div class="review_num_text">개 리뷰</div>
						</div> -->
					</div>
					<div class="product_price">
						<div class="product_price_num">${product.prod_price }</div>
						<div class="product_price_won">원</div>
					</div>
				</div>
	<%-- 주문 정보 전달 폼 --%>
		<form id="order_form" action="/shopping/ShoppingCartInsert.sh" method="post">
				<input type="hidden" name="prod_num" value=${product.prod_num }>
				<input type="hidden" name="prod_price" value=${product.prod_price }>
				<div class="product_option">
					<div class="product_option_choice">
					
						<div class="product_option_choice_count">
						
							<div class="product_option_choice_count_button">
						       <div class="product_count_minus">
						           <button type="button" id="minusBtn">-</button>
						       </div>
						       <div class="product_count_num">
						           <button type="button" id="numBtn">1</button>
						           <input type="hidden" id="hiddenProductCount" name="productCount" value="1">
						       </div>
						       <div class="produnct_count_plus">
						           <button type="button" id="plusBtn">+</button>
						       </div>
						   </div>
						</div>
						<div class="product_option_choice_price">
						
							<%-- 총 주문금액 productCount --%>
							<div class="product_total_price_text">
								주문금액
							</div>
							<div class="product_total_price">
							    <span id="totalPrice">${product.prod_price}</span>원
							</div>
						</div>
					</div>
					
					<hr>
			<!-- 장바구니 버튼 -->
					<div class="product_option_selling">
						<input type="submit" class="button_cart" value="장바구니">
							<!-- <button type="submit" class="button_cart" onclick="addCart">
								장바구니
							</button> -->
						
						<a href="#">
    					<button class="button_buy" onclick="buyNow(event)">
      					  <span>바로구매</span>
   						 </button>
						</a>
					</div>
		</form>
					<div class="product_promotion">
						<div class="product_promotion_banner">
							<a href="#">
								<div class="img_ex">
									<img src="/app/shopping/images/172680453048550315.avif">
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="product_selling_nav_wrap">
			<div class="product_selling_nav">
			
			<!-- 페이지 스크롤 nav -->
				<ol>
					<li>
						<a class="product_selling_nav_item" href="#product_inform_description">상품정보</a>
					</li>
					<li>
						<a class="product_selling_nav_item" href="#product_review_wrap">리뷰</a>
					</li>
					<li>
						<a class="product_selling_nav_item" href="#">문의</a>
					</li>
					<li>
						<a class="product_selling_nav_item" href="#">배송/환불</a>
					</li>
					<li>
						<a class="product_selling_nav_item" href="#">추천</a>
					</li>
				</ol>
			</div>
		</div>
		
		<!-- 상품정보 -->
		<div class="product_inform_wrap">
			<div class="product_inform">
				<div class="product_inform_left">
					<div class="product_inform_detail">
						<!-- <div class="user_style">
							<div class="user_style_title">
								<span><h2>유저들의 스타일링샷</h2></span><span id="user_style_num"><h2>28,694</h2></span>
							</div>
							<div class="user_style_picture">
								<div class="picture">
									<a href="#"><div class="img_ex"></div></a>
								</div>
								<div class="picture">
									<a href="#"><div class="img_ex"></div></a>
								</div>
								<div class="picture">
									<a href="#"><div class="img_ex"></div></a>
								</div>
								<div class="picture">
									<a href="#"><div class="img_ex"></div></a>
								</div>
							</div>
							<div class="user_style_picture_all">
								<a href="#"><button>스타일링샷 전체보기 &gt;</button></a>
							</div>
							<div class="notandum">
								<p>해당 상품을 사용하는 유저들이 직접 태그한 콘텐츠로, 스타일링샷 속 상품과 실제 판매 상품이 다를 수 있습니다.</p>
							</div>
						</div> -->
						
						<!-- 상품정보 -->
						<div class="product_inform_description" id="product_inform_description">
							<!-- <div class="product_inform_description_header">
								<h2>상품정보</h2>
							</div> -->
							<div class="product_inform_description_content">
								<div class="img_ex">
									<img src="/app/shopping/images/170778069306610551.avif">
								</div>
								<div class="img_ex">
									<img src="/app/shopping/images/casamaru1.jpg">
								</div>
							</div>
						</div>
						
						<!-- 리뷰 -->
						<div class="product_review_wrap" id="product_review_wrap">
							<div class="product_review_title">
								<div class="product_review_title_left">
									<span><h2>리뷰</h2></span><span id="product_review_num"><!-- <h2>28,694</h2> --></span>
								</div>
								<div class="product_review_title_right">
									<button class="write" id="modal_review_write">리뷰쓰기</button>
								</div>
							</div>
							
							<div class="product_review_feed_wrap">
								<!-- 리뷰 평균 그래프 -->
								<!-- <div class="rating_head_wrap">
									<div class="rating_average_wrap">
										<div class="stars_average">
											<div class="stars_average_star">★★★★☆</div><div class="stars_average_num">4.8</div>
										</div>
										<div class="stars_average_bar_wrap">
											<div class="stars_average_bar_wrap2">
												
											</div>
										</div>
									</div>
								</div> -->
								
								<!-- 리뷰 nav -->
								<div class="review_wrap">
									<div class="review_filter">
										<div class="review_filter_order">
											<button class="review_filter_best">베스트순</button>
											<button class="review_filter_new">최신순</button>
											<button class="review_filter_pictuer"><!-- <div class="img_ex"></div> --><div>사진리뷰</div></button>
										</div>
									</div>
									
									<div class="review_list_wrap">
										
										<c:forEach var="review" items="${reviewList }">
										<!-- 리뷰 한 개 틀 -->
										<div class="review_list_container">
											<div class="review">
												<div class="review_user">
													<div class="profile">
														<div class="img_ex"></div>
													</div>	
													<div class="user_inform">
														<p>${review.USER_ID }</p>
														<span class="user_star">★${review.RATING }점</span>
														<span class="buy_date">${review.REVIEW_DATE} 작성</span>
													</div>
												</div>
												
												<div class="user_pictuer">
													<div class="img_ex">
														<img src="${review.IMAGES_PATH }">
													</div>
												</div>
												
												<div class="user_review_content">
													${review.REVIEW_CONTENTS }
												</div>
												<div class="like_wrap">
													<button class="button_like">
														도움이 돼요
													</button>
													<div class="like_text_wrap">
														<!-- <div class="like_num">0</div>
														<span>명에게 도움이 되었습니다.</span> -->
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
										
									</div>
									
								</div>
								
							</div>
						</div>
						
					</div>
				</div>
				<div class="product_inform_right">
					
				</div>
			</div>
		</div>
		
	</div>	
	
</div>
	
	
<!-- 리뷰쓰기 modal -->
<div id="modal_background" class="modal_background">
	<div class="modal_review_write_wrap">
		<span class="close">&times;</span>
		<div class="review_write_title">리뷰쓰기</div>
		<div class="review_write_title_underbar"></div>

		<form action="/shopping/ReviewWrite.sh" method="post" >
		<!-- USER_ID값 임시 지정 -->
		<%-- <input type="hidden" name="${review.USER_ID }" value="admin"> --%>
			<div class="review_product">
				<div class="review_product_inform">
					<div class="img_ex">
						<img src="${product.prod_image }" alt="product_image">
					</div>
					<div class="review_product_name">
						<input type="hidden" name="prod_num" value="${product.prod_num }">
						${product.prod_name }
					</div>
				</div>
			</div>	
			
			<div class="review_rating">
				<div class="review_rating_title">
					별점평가
				</div>
				
				<div class="review_rating_star_wrap">
			        <div class="review_rating_star">
			            <div class="review_rating_star_text">
			            	<div class="review_rating_star_text_2">만족도</div>
			                <ul>
			                    <li class="star" data-value="1">★</li>
			                    <li class="star" data-value="2">★</li>
			                    <li class="star" data-value="3">★</li>
			                    <li class="star" data-value="4">★</li>
			                    <li class="star" data-value="5">★</li>
			                </ul>
			            </div>
			            <div class="review_rating_star_choice">
			                <input type="hidden" name="RATING" id="ratingValue" value="0">
			            </div>
			        </div>
			    </div>
			</div>
			
			<div class="review_picture">
				<div class="review_rating_title">
					사진첨부(선택)
				</div>
				<div class="review_picture_description">
					사진을 첨부해주세요. (최대 1장)
				</div>
				<div class="review_picture_input">
					<button>
						<div class="icon_img">
							<svg viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M21.1 4c.5 0 .9.4.9.9v14.2c0 .5-.4.9-.9.9H2.9a.9.9 0 01-.9-.9V4.9c0-.5.4-.9.9-.9h18.2zm-.91 1.8H3.8v10.85l5.54-6.27c.12-.17.38-.17.52 0l3.1 3.54c.06.06.08.14.06.2l-.4 1.84c-.02.14.15.23.23.12l3.16-3.43a.27.27 0 01.38 0l3.79 4.12V5.8zm-3.37 4.8a1.47 1.47 0 01-1.47-1.45c0-.81.66-1.46 1.47-1.46s1.48.65 1.48 1.46c0 .8-.66 1.45-1.48 1.45z"></path></svg>
								<path d="M21.1 4c.5 0 .9.4.9.9v14.2c0 .5-.4.9-.9.9H2.9a.9.9 0 01-.9-.9V4.9c0-.5.4-.9.9-.9h18.2zm-.91 1.8H3.8v10.85l5.54-6.27c.12-.17.38-.17.52 0l3.1 3.54c.06.06.08.14.06.2l-.4 1.84c-.02.14.15.23.23.12l3.16-3.43a.27.27 0 01.38 0l3.79 4.12V5.8zm-3.37 4.8a1.47 1.47 0 01-1.47-1.45c0-.81.66-1.46 1.47-1.46s1.48.65 1.48 1.46c0 .8-.66 1.45-1.48 1.45z"></path>
							</svg>
						</div>
						<div class="review_picture_input_text"><!-- <input type="file" name="IMAGES_PATH" value="IMAGES_PATH"> -->사진 첨부하기</div>
					</button>
				</div>
			</div>
			
			<div class="review_write">
				<div class="review_rating_title">
					리뷰작성
				</div>
				<textarea name="REVIEW_CONTENTS" placeholder="자세하고 솔직한 리뷰는 다른 고객에게 큰 도움이 됩니다."></textarea>
			</div>
			
			<input type="submit" class="review_upload" value="완료">
		</form>
	</div>
</div>
	

<script>
	// 모달 열기 버튼, 모달 창, 닫기 버튼 요소 가져오기
	var modal = document.getElementById("modal_background");
	var btn = document.getElementById("modal_review_write");
	var span = document.getElementsByClassName("close")[0];

	// 버튼 클릭 시 모달 열기
	btn.onclick = function() {
		modal.style.display = "block";
	}

	// 닫기 버튼 클릭 시 모달 닫기
	span.onclick = function() {
		modal.style.display = "none";
	}

	// 모달 바깥쪽을 클릭하면 모달 닫기
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	
	// product 수량 버튼 동작 및 주문 금액 계산
	let productCount = 1;
	const productPrice = parseInt("${product.prod_price}".replace(/,/g, "")); // 가격에서 ',' 제거 후 숫자로 변환
	const totalPriceElement = document.getElementById("totalPrice"); // 주문 금액 요소
	const hiddenProductCount = document.getElementById("hiddenProductCount"); // 숨겨진 필드
	
	// - 버튼 클릭 시 수량 감소
	document.getElementById("minusBtn").addEventListener("click", function() {
	    if (productCount > 1) {
	        productCount--;
	        document.getElementById("numBtn").innerText = productCount;
	        hiddenProductCount.value = productCount; // 수량 업데이트
	        updateTotalPrice();
	    }
	});
	
	// + 버튼 클릭 시 수량 증가
	document.getElementById("plusBtn").addEventListener("click", function() {
	    productCount++;
	    document.getElementById("numBtn").innerText = productCount;
	    hiddenProductCount.value = productCount; // 수량 업데이트
	    updateTotalPrice();
	});
	
	// 수동으로 수량 입력
	document.getElementById("numBtn").addEventListener("click", function() {
	    const userInput = prompt("수량을 입력하세요:", productCount);
	    if (userInput !== null && !isNaN(userInput) && parseInt(userInput) > 0) {
	        productCount = parseInt(userInput);
	        document.getElementById("numBtn").innerText = productCount;
	        hiddenProductCount.value = productCount; // 수량 업데이트
	        updateTotalPrice();
	    }
	});
	
	// 주문 금액 업데이트
	function updateTotalPrice() {
	    const totalPrice = productPrice * productCount;
	    totalPriceElement.innerText = totalPrice.toLocaleString(); // 콤마 추가하여 금액 표시
	}
	
	
	// 장바구니 onclick
	function addCart() {
	    const productCount = document.getElementById("hiddenProductCount").value;
	    window.location.href = "?productCount=" + productCount; // 장바구니 페이지로 이동
	}
	
	function buyNow(event) {
	    event.preventDefault(); // 기본 클릭 이벤트 방지
	    const productCount = document.getElementById("hiddenProductCount").value;
	    const prodNum = document.querySelector("input[name='prod_num']").value; // 제품 번호 가져오기
	    const prodPrice = document.querySelector("input[name='prod_price']").value; // 제품 가격 가져오기
	    
	    // 주문 페이지로 이동
	    window.location.href = "/order/order.jsp?prod_num=" + prodNum + "&prod_price=" + prodPrice + "&productCount=" + productCount; 
	}

	// 별점 매기기
	const stars = document.querySelectorAll('.star');
    const ratingInput = document.getElementById('ratingValue');

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const starValue = parseFloat(star.dataset.value);
            ratingInput.value = starValue; // Set the rating value

            // Reset the stars
            stars.forEach(s => s.classList.remove('selected'));
            star.classList.add('selected');
            
            // Highlight the previous stars (0.5 increments)
            stars.forEach((s, index) => {
                if (index < starValue) {
                    s.classList.add('selected');
                }
            });
        });
    });
    
</script>
</body>
</html>