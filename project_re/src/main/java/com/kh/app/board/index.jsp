<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>예쁜템들 모여사는 오늘의집</title>
    <!-- seo meta tag 생략 -->

    <!-- CSS Reset -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"> -->

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

    <link rel="stylesheet" href="css/style.css" />
    
  </head>
  <body>
    <!-- 전체 레이아웃--------------------------------------------------------------->
    <div class="wrap">
      <!-- 상단 네비게이션 영역 ---------------------------------------------------->
      <header class="header">
        <!-- 네비게이션 상단 ------------------------------------------------------->
        <div class="header-upper">
          <div class="inner">
            <i class="fas fa-bars searchMenu"></i>
            <div class="header-upper__inner">
              <div class="header-upper__logo"><a href="/index">내일의 집</a></div>
              <div class="header-upper__nav">
                <ul>
                  <li class="header-upper__item upper__active">
                    <a href="">커뮤니티</a>
                  </li>
                  <li class="header-upper__item"><a href="">쇼핑</a></li>
                </ul>
              </div>
            </div>
       <div class="header-upper__service">
  <div class="header-upper__searchBar">
    <i class="fas fa-search"></i>
    <input type="text" placeholder="오늘의집 통합검색" />
  </div>
  <a href="<%=request.getContextPath()%>/cart/cart.jsp"><i class="fas fa-shopping-cart"></i></a>
  <ul>
    <li><a href="/user/UserLogin.us">로그인</a></li>
    <li><a href="/user/UserJoin.us">회원가입</a></li>
    <li>
    <button class="header-upper__serviceBt">고객센터</button>
    <!-- 고객센터 관련 리스트 -->
    <div class="header-upper__serviceLists" style="display: none;"> <!-- 기본적으로 숨김 -->
      <ul>
        <li><a href="/board/BoardList.no"><h4>공지사항</h4></a></li>
        <li><a href=""><h4>채팅방</h4></a></li>
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
 

<!-- 네비게이션 하단----------------------------------------------------------- -->
 <div class="header-lower">
    <div class="inner">
       <nav>
       			<div class="community-menu">
              <a class="header-lower__item active" href="">홈</a>
              <a class="header-lower__item" href="/board/BoardList.bo">게시판</a>
              <a class="header-lower__item" href="/app/qna/qna.jsp">Q&A</a>
              </div>
               <!-- 쇼핑 하단 메뉴 추가 -->
           		 <div class="shopping-menu" style="display: none;"> <!-- 기본적으로 숨김 -->
                <a class="header-lower__item active" href="">홈</a>
                <a class="header-lower__item" href="">카테고리</a>
            </div>
            </nav>
          </div>
        </div>
      </header>
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

 <!-- 홈 페이지 전체 영역------------------------------------------------------------- -->
   <div class="home-page">
      <!-- 홈 페이지 상단 이미지 ------------------------------------------------------->
        <div class="container home-header">
          <div class="home-header__upper">
            <div>
              <img
                src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/project/172413869284381328.png?w=850&h=510&c=c"
                alt="홈페이지 메인 이미지" width="828" height="600"
              />
              <div class="home-header-tit">
                <h4>우리집으로</h4>
                <a href="#">보러가기</a>
              </div>
            </div>
          </div>

          <div class="home-header__lower">
            <div class="home-header__lower-banner">
              <ul class="banner-slider">
                <li class="banner-item">         
                </li>
                <li class="banner-item">
                  <a href="">
                    <img
                      class="row-img"
                      src="https://image.ohou.se/i/bucketplace-v2-development/static/home_banner/sign_up_web_v2.png?gif=1&w=512"
                      alt="베너 이미지1"
                    />                  
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>   

<!-- 홈 페이지 쇼트컷  ---------------------------------------------------------->
  <nav class="container home-shortcut">
      <ul class="home-shortcut__container">
          <li class="home-shortcut__item">
              <a href="https://store.ohou.se/exhibitions/13439?affect_type=Home&affect_id=0">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/172680501313170478.png?w=130"
                  alt="가을패브릭 바로가기 이미지"
                />
                <h4>가을패브릭</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="https://store.ohou.se/exhibitions/12390?affect_type=Home&affect_id=0">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167198007152582471.png?w=130"
                  alt="오늘의 딜 바로가기 이미지"
                />
                <h4>오늘의 딜</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/171151340329557503.png?w=256"
                  alt="집들이 바로가기 이미지"
                />
                <h4>집들이</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="http://localhost:8082/cart/cart.jsp">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/170184318298899959.png?w=256"
                  alt="행운출첵 바로가기 이미지"
                />
                <h4>행운출첵</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167198012024333402.png?w=256"
                  alt="빠른배송 바로가기 이미지"
                />
                <h4>빠른배송</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/167198022841390557.png?w=256"
                  alt="리모델링 바로가기 이미지"
                />
                <h4>리모델링</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/171506668154149690.png?w=256"
                  alt="입주청소 바로가기 이미지"
                />
                <h4>입주청소</h4>
              </a>
            </li>
            <li class="home-shortcut__item">
              <a href="">
                <img
                  src="https://image.ohou.se/i/bucketplace-v2-development/uploads/shortcut/home_feed_shortcut_sets/172007068270659981.png?w=256"
                  alt="살림살이 바로가기 이미지"
                />
                <h4>살림살이</h4>
              </a>
            </li>
          </ul>
        </nav>
        <!-- 홈 페이지 스토리 영역 -->
        <section class="container home-section home-stories">
          <h3 class="home-section__tit">오늘의 스토리</h3>
          <ul class="home-stories__content">
            <li class="home-stories__item">
              <article>
                <a href="">
                  <div class="home-stories__item__wrap">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/projects/cover_images/164318713825111761.jpg?gif=1&w=360&h=240&c=c"
                      alt="통통 튀는 레트로 키치 하우스"
                    />
                  </div>
                  <h4>통통 튀는 레트로 키치 하우스</h4>
                </a>
              </article>
            </li>
            <li class="home-stories__item">
              <article>
                <a href="">
                  <div class="home-stories__item__wrap">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/164216751229719039.jpg?gif=1&w=360&h=240&c=c"
                      alt="다락방이 있는 화이트 하우스!"
                    />
                  </div>
                  <h4>다락방이 있는 화이트 하우스!</h4>
                </a>
              </article>
            </li>
            <li class="home-stories__item">
              <article>
                <a href="">
                  <div class="home-stories__item__wrap">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/projects/164208672775576782.png?gif=1&w=360&h=240&c=c"
                      alt="40년된 빌라의 변신!"
                    />
                  </div>
                  <h4>40년된 빌라의 변신!</h4>
                </a>
              </article>
            </li>
            <div class="home-stories__content__menu-wrap">
              <div class="home-stories__content__menu">
                <a class="home-stories__content__menu__entry" href="">
                  <div>예쁜 집 구경하기</div>
                  <div>집들이</div>
                </a>
                <a class="home-stories__content__menu__entry" href="">
                  <div>전문가 시공사례</div>
                  <div>전문가 집들이</div>
                </a>
                <a class="home-stories__content__menu__entry" href="">
                  <div>인테리어 꿀팁 총 정리</div>
                  <div>노하우</div>
                </a>
              </div>
            </div>
          </ul>
        </section>

 <!-- 홈 페이지 카테고리 상품 찾기 영역 -->
   <section class="container home-section home-category">
        <div class="home-category__wrap">
          <h3 class="home-section__tit">카테고리별 상품 찾기</h3>
            <ul class="home-category__contents">
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/164333421927911367.png?gif=1&w=144&h=144&c=c"
                      alt="가구 이미지"
                    />
                    <h4>가구</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823225115177697.png?gif=1&w=144&h=144&c=c"
                      alt="페브릭 이미지"
                    />
                    <h4>페브릭</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823225665741013.png?gif=1&w=144&h=144&c=c"
                      alt="조명 이미지"
                    />
                    <h4>조명</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823226017937426.png?gif=1&w=144&h=144&c=c"
                      alt="가전 이미지"
                    />
                    <h4>가전</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823226903946200.png?gif=1&w=144&h=144&c=c"
                      alt="주방용품 이미지"
                    />
                    <h4>주방용품</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823227719846773.png?gif=1&w=144&h=144&c=c"
                      alt="데코/식물 이미지"
                    />
                    <h4>데코/식물</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/162823228178967968.png?gif=1&w=144&h=144&c=c"
                      alt="수납/정리 이미지"
                    />
                    <h4>수납/정리</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/163609843911228804.png?gif=1&w=144&h=144&c=c"
                      alt="생활용품 이미지"
                    />
                    <h4>생활용품</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/164333398177552131.png?gif=1&w=144&h=144&c=c"
                      alt="서랍/수납장 이미지"
                    />
                    <h4>서랍/수납장</h4>
                  </a>
                </div>
              </li>
              <li class="home-category__item__wrap">
                <div>
                  <a href="">
                    <img
                      src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_home_categories/163575474448469686.png?gif=1&w=144&h=144&c=c"
                      alt="생필품 이미지"
                    />
                    <h4>생필품</h4>
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </section>

<!-- 오늘의 딜 영역 -->
<section class="container home-section">
   <div class="home-section__wrap">
      <h3 class="home-section__tit">오늘의딜</h3>
          <ul class="home-section__container">
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/161250856124523233.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">오토엔알로</h4>
                      <p class="home-section__item__sub">
                        1+1 마이크로화이바/에어로쿨 항균 일반/경추형 베개솜 6종
                        모음전
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">66%</div>
                        <div class="home-section__item__price">11,900 </div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.7</div>
                        <div class="home-section__item__reviews">
                          리뷰 3,452
                        </div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160375875541696132.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">하벤홈</h4>
                      <p class="home-section__item__sub">
                        9존 인생 매트리스토퍼 3color(MS/S/Q)
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">56%</div>
                        <div class="home-section__item__price">30,400</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.6</div>
                        <div class="home-section__item__reviews">
                          리뷰 12,565
                        </div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/163609331904264148.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">집드리</h4>
                      <p class="home-section__item__sub">
                        [해외] 귀여운 댕댕이 삼형제 소프트 러그 발매트 댕댕이
                        삼형젬 3size
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">50%</div>
                        <div class="home-section__item__price">8,900</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.4</div>
                        <div class="home-section__item__reviews">리뷰 91</div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/164197475359375972.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">삼성전자</h4>
                      <p class="home-section__item__sub">삼성 드럼+건조기</p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">30%</div>
                        <div class="home-section__item__price">2,349,000</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.9</div>
                        <div class="home-section__item__reviews">리뷰 45</div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/162545794032326794.jpeg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">
                        바이브라이프(VIBE LIFE)
                      </h4>
                      <p class="home-section__item__sub">
                        LED 바이프폴 무드등_6colors
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">22%</div>
                        <div class="home-section__item__price">24,000</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.7</div>
                        <div class="home-section__item__reviews">
                          리뷰 2,775
                        </div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/159002840208731500.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">홈앤하우스</h4>
                      <p class="home-section__item__sub">
                        라탄 패턴 햄퍼(60L/80L) 3colors
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">41%</div>
                        <div class="home-section__item__price">18,900</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.7</div>
                        <div class="home-section__item__reviews">
                          리뷰 7,830
                        </div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/164325577717270205.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">베스트리빙</h4>
                      <p class="home-section__item__sub">
                        라탄/철제 정원 야외 카페 티테이블/야외테이블/야외가구
                        6종
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">53%</div>
                        <div class="home-section__item__price">73,900 외</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.3</div>
                        <div class="home-section__item__reviews">리뷰 200</div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/163964060931505832.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">좋은느낌</h4>
                      <p class="home-section__item__sub">
                        (25%쿠폰) 울트라슬림 날개/입는 오버나이트/팬티라이너
                        모음
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">29%</div>
                        <div class="home-section__item__price">26,800 외</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.7</div>
                        <div class="home-section__item__reviews">리뷰 499</div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
              <li class="home-section__item">
                <article>
                  <a href="">
                    <div class="home-section__img-wrap">
                      <img
                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/deals/163287455382441783.jpg?gif=1&w=360&h=360&c=c&q=0.8"
                        alt="오늘의 세일 상품 이미지"
                      />
                    </div>
                    <div class="home-section__item__details">
                      <h4 class="home-section__item__tit">디에이트</h4>
                      <p class="home-section__item__sub">
                        [1+1] 내열유리 밀크저기/계량컵/머그컵 인기상품 모음
                      </p>
                      <div class="home-section__item__sale">
                        <div class="home-section__item__percent">58%</div>
                        <div class="home-section__item__price">9,900 외</div>
                      </div>
                      <div class="home-section__item__review">
                        <div class="home-section__item__grade">4.8</div>
                        <div class="home-section__item__reviews">리뷰 102</div>
                      </div>
                    </div>
                  </a>
                </article>
              </li>
            </ul>
          </div>
        </section>
        <footer class="footer">
          <div class="footer-upper">
            <div>
              <h4><a href="">고객센터</a></h4>
              <a class="footer-number" href="">1670-1234</a>
              <span>평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</span>
            </div>
            <ul>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 384 512"
                  >
                    <path
                      d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 512 512"
                  >
                    <path
                      d="M325.3 234.3L104.6 13l280.8 161.2-60.1 60.1zM47 0C34 6.8 25.3 19.2 25.3 35.3v441.3c0 16.1 8.7 28.5 21.7 35.3l256.6-256L47 0zm425.2 225.6l-58.9-34.1-65.7 64.5 65.7 64.5 60.1-34.1c18-14.3 18-46.5-1.2-60.8zM104.6 499l280.8-161.2-60.1-60.1L104.6 499z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 320 512"
                  >
                    <path
                      d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"
                    /></svg
                ></a>
              </li>
              <li>
                <a href=""
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 448 512"
                  >
                    <path
                      d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"
                    /></svg
                ></a>
              </li>
            </ul>
          </div>
          <ul class="footer-lower">
            <li><a href="">브랜드 스토리</a></li>
            <li><a href="">회사소개</a></li>
            <li><a href="">채용정보</a></li>
            <li><a href="">이용약관</a></li>
            <li><a href="">개인정보처리방침</a></li>
            <li><a href="">공지사항</a></li>
            <li><a href="">고객센터</a></li>
            <li><a href="">고객의 소리</a></li>
            <li><a href="">전문가 등록</a></li>
          </ul>
        </footer>
      </div>
    </div>

    <script src="write.js"></script>
    
  </body>
</html>