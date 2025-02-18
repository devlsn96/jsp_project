<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopping_home</title>
<link href="/app/shopping/css/shopping_home.css" rel="stylesheet" type="text/css">

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
	<div class="main_images">
		<a href="#"><img src="/app/shopping/images/home_banner1.png" alt="home_banner1"></a>
	</div>
	
	<div class="tab_wrap">
		<ul>
			<li>
				<a href="#"><span>추천</span></a>
			</li>
			<li>
				<a href="#"><span>소파</span></a>
			</li>
			<li>
				<a href="#"><span>파티션</span></a>
			</li>
			<li>
				<a href="#"><span>최근본상품</span></a>
			</li>
		</ul>
	</div>
	
	
	
		
	<div class="recommend_wrap">
		<ul>
			<%-- 추천 상품 6개 반복 --%>
			<c:forEach var="product" items="${shoppingList}">
			    <li>
			        <a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
			        	<input type="hidden" name="prod_num" value="${product.prod_num}">
			    		<input type="hidden" name="prod_category" value="${product.prod_category}">
			        	<div class="image_ex">
			        		<img src="${product.prod_image}" alt="product_image">
			            </div>
			            
			            <div class="brand_name">브랜드네임</div>
			            <span>
			                ${product.prod_name}
			            </span>
			        </a>
			        <p><b>${product.prod_price}</b></p>
			    </li>
			</c:forEach>
			<%-- 여기까지 추천 상품 6개 반복 --%>
			
		</ul>
	</div>
	
	<div class="category_wrap">
		<div class="category_title">
			<h2>카테고리</h2>
		</div>
		
		<div class="category_kind">
			<ul>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=furniture">
						<img src="/app/shopping/images/165698403420736265.avif" alt="가구">
						<p>가구</p>
					</a>
				</li>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=fabric">
						<img src="/app/shopping/images/172474528642703614.avif" alt="패브릭">
						<p>패브릭</p>
					</a>
				</li>
				<li>
					<a href="/shopping/ShoppingCategory.sh?prod_category=electronics">
						<img src="/app/shopping/images/172474529155729560.avif" alt="가전·디지털">
						<p>가전·디지털</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="product_all">
		<div class="tab_wrap">
			<ul>
				<li>
					<a href="#"><span>추천</span></a>
				</li>
				<li>
					<a href="#"><span>예쁜</span></a>
				</li>
				<li>
					<a href="#"><span>유용한</span></a>
				</li>
				<li>
					<a href="#"><span>귀여운</span></a>
				</li>
				<li>
					<a href="#"><span>오늘의딜</span></a>
				</li>
			</ul>
		</div>
		<div class="product_wrap">

			<!-- 추천 상품 4개 -->
			<c:forEach var="product" items="${shoppingAllList}">
				<div class="product_one">
				
					<a href="/shopping/ShoppingDetailView.sh?prod_num=${product.prod_num}">
						<div class="image_ex">
							<img src="${product.prod_image}">
						</div>
						<div class="description_wrap">
						<input type="hidden" name="prod_num" value="${product.prod_num}">
			    		<input type="hidden" name="prod_category" value="${product.prod_category}">
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
</body>
</html>