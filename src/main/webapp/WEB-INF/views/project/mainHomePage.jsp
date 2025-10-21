<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>VisitKorea 스타일 데모</title>


	<link href="/resources/css/mainHomePage.css" rel="stylesheet">
	<link href="/resources/css/slider.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
  <!-- 내비 -->
  <nav>
    <div class="nav-wrap" role="navigation" aria-label="주요 카테고리">
      <a class="nav-link" href="/showMap" target="_self">지역별 여행</a>
      <a class="nav-link" href="/showTheme">테마별 여행</a>
      <a class="nav-link" href="#">축제 ⦁ 행사</a>
      <a class="nav-link" href="#">고객 지원</a>
      <a class="nav-link" href="#">마이 페이지</a>
    </div>
  </nav>

  <!-- 히어로 -->
  <div class="container hero">
    <div class="panel" aria-label="프로모션 배너">
      <div class="bg" aria-hidden="false">
        <div class="slide-container">
	        <div class="slide_pic fade">
				<a href="이미지 클릭시 이동할 주소"><img alt="" src="/resources/images/photo-1.jpg"></a>
			</div>
			<div class="slide_pic fade">
				<a href="이미지 클릭시 이동할 주소"><img alt="" src="/resources/images/photo-2.jpg"></a>
			</div>
			<div class="slide_pic fade">
				<a href="이미지 클릭시 이동할 주소"><img alt="" src="/resources/images/photo-3.jpg"></a>
			</div>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	  		<a class="next" onclick="plusSlides(1)">&#10095;</a>
      	</div>
      </div>

      <div class="content">
        <span class="k-badge" id="content_day">가을여행주간 · 10.15–11.10</span>
        <h1 id="content_h1">단풍 물든 코리아: 지금 가기 좋은 국내 명소</h1>
        <p id="content_p">잘 알려진 핫플레이스부터 현지인이 사랑하는 스폿까지, 여행 큐레이션으로 가볍게 떠나보세요.</p>
        <div class="chips">
          <span class="chip">#서울야경</span><span class="chip">#감성카페</span><span class="chip">#한옥스테이</span><span class="chip">#가을단풍</span>
        </div>
      </div>
    </div>
  </div>

  <!-- 오늘의 추천 -->
  <section class="container">
    <div class="sec-head">
      <h2>오늘의 추천</h2><a href="#">전체 보기</a>
    </div>
    <div class="grid cols-4">
      <article class="card">
        <div class="thumb">
          <img src="https://korean.visitseoul.net/data/kukudocs/seoul2133/20220518/202205181617250471.jpg" alt="북촌 한옥 골목">
        </div>
        <div class="meta">
          <span class="tag">서울</span>
          <div class="title">북촌 한옥 골목 산책</div>
          <p class="desc">전통과 현대가 공존하는 골목길. 카페·전통체험으로 반나절 코스 추천.</p>
        </div>
      </article>

      <article class="card">
        <div class="thumb">
          <img src="https://www.visitbusan.net/uploadImgs/files/cntnts/20191229160529389" alt="광안리 해변">
        </div>
        <div class="meta">
          <span class="tag">부산</span>
          <div class="title">광안리 해변 드라이브</div>
          <p class="desc">해변 산책 후 근처 맛집까지. 야경이 아름다운 광안대교 뷰.</p>
        </div>
      </article>

      <article class="card">
        <div class="thumb">
          <img src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/729e9473-9590-4923-aec0-e72a3fe7d18d.jpg" alt="제주 오름">
        </div>
        <div class="meta">
          <span class="tag">제주</span>
          <div class="title">새벽 오름 라이트 코스</div>
          <p class="desc">가벼운 등산과 일출 포인트 소개. 초보자도 즐길 수 있어요.</p>
        </div>
      </article>

      <article class="card">
        <div class="thumb">
          <img src="https://www.snowfestival.net/asset/images/travel/travel_s01_img01.jpg" alt="대관령 양떼목장">
        </div>
        <div class="meta">
          <span class="tag">강원</span>
          <div class="title">대관령 양떼목장</div>
          <p class="desc">초록 초원과 구름 바다. 가족과 함께 힐링 산책.</p>
        </div>
      </article>
    </div>
  </section>

  <!-- 테마 큐레이션 -->
  <section class="container">
    <div class="sec-head">
      <h2>테마별 여행</h2><a href="#">더 알아보기</a>
    </div>
    <div class="grid cols-3">
      <article class="card">
        <div class="thumb hero">
          <img src="https://wimg.heraldcorp.com/news/cms/2025/04/17/news-p.v1.20250417.573fc4e739ab46878b4581d78a8f1395_P1.jpg" alt="반려동물과 함께">
        </div>
        <div class="meta">
          <div class="title">반려동물과 함께</div>
          <p class="desc">펫프렌드리 숙소·식당·공원 추천</p>
        </div>
      </article>

      <article class="card">
        <div class="thumb hero">
          <img src="https://sojoong.joins.com/wp-content/uploads/sites/4/2020/09/1.jpg" alt="차박 & 캠핑">
        </div>
        <div class="meta">
          <div class="title">차박 & 캠핑</div>
          <p class="desc">차량 접근 용이한 캠핑지 모음</p>
        </div>
      </article>

      <article class="card">
        <div class="thumb hero">
          <img src="https://d2phebdq64jyfk.cloudfront.net/media/article/91b5b261e92b48b1b6fbe6c94d4e4dba.jpg" alt="한류 성지투어">
        </div>
        <div class="meta">
          <div class="title">한류 성지투어</div>
          <p class="desc">드라마·예능 촬영지 따라가기</p>
        </div>
      </article>
    </div>
  </section>

  <!-- 축제 · 행사 -->
  <section class="container">
    <div class="sec-head">
      <h2>축제 · 행사</h2><a href="#">캘린더 보기</a>
    </div>
    <div class="strip">
      <!-- 왼쪽 큰 카드(샘플 이미지) -->
      <div class="big">
        <div class="thumb">
          <img src="https://img.hankyung.com/photo/202411/ZN.38596435.1.jpg" alt="불꽃축제">
        </div>
        <div class="overlay" aria-hidden="true"></div>
        <div class="caption">
          <div style="font-weight:800; font-size:20px">불꽃 축제 2025</div>
          <div style="opacity:.9">10.28 · 부산 광안리 해변</div>
        </div>
      </div>

      <div class="grid cols-2">
        <article class="card">
          <div class="thumb">
            <img src="https://img.etoday.co.kr/pto_db/2019/07/20190726153503_1350707_1200_876.jpg" alt="비빔밥 축제">
          </div>
          <div class="meta">
            <span class="tag">전주</span>
            <div class="title">비빔밥 축제</div>
            <p class="desc">먹거리 공연 체험이 모두 한자리에</p>
          </div>
        </article>

        <article class="card">
          <div class="thumb">
            <img src="http://www.adinews.co.kr/news/photo/202211/60223_108486_229.jpg" alt="탈춤 페스티벌">
          </div>
          <div class="meta">
            <span class="tag">안동</span>
            <div class="title">탈춤 페스티벌</div>
            <p class="desc">월영교 야간 산책과 함께 즐기는 공연</p>
          </div>
        </article>
      </div>
    </div>
  </section>
  
  <jsp:include page="bottom.jsp"></jsp:include>
  
  <script type="text/javascript">
  /*=============================슬라이더==============================  */
  let slideIndex = 2;
  showSlides(slideIndex);

 function plusSlides(n)
 {
   showSlides(slideIndex += n);
 }

 function showSlides(n)
 {
   let i;
   let slides = document.getElementsByClassName("slide_pic");
   
   if (n > slides.length) {slideIndex = 1}
   
   if (n < 1) {slideIndex = slides.length}
   
   for (i = 0; i < slides.length; i++)
   {
     slides[i].style.display = "none";
   }
   slides[slideIndex-1].style.display = "block";
 //  console.log("현재 n값 = ", n);
   changeText(n);  
 }
 
  function changeText(n)
 {
	 switch(n)
	 {
	 case 2:
		 document.getElementById("content_day").innerHTML = "가을여행주간 · 55.55–55.55";
		 document.getElementById("content_h1").innerHTML = "단풍 안물든 코리아: 명소";
		 document.getElementById("content_p").innerHTML = "잘 알려진 핫플레이스부터 현";
		 break;
		 
	 case 3:
		 document.getElementById("content_day").innerHTML = "가을여행주간 · 11.11–22.22";
		 document.getElementById("content_h1").innerHTML = "651651ㄹㅈㄷㄻㄴㅇㅎ 명소";
		 document.getElementById("content_p").innerHTML = "잘 알매ㅗㅓ대쟘호맿현하할하어라헝ㄹ";
		 break;
		 
	 case 4:
		 document.getElementById("content_day").innerHTML = "가을여행주간 · 10.15–11.10";
		 document.getElementById("content_h1").innerHTML = "단풍 물든 코리아: 지금 가기 좋은 국내 명소";
		 document.getElementById("content_p").innerHTML = "잘 알려진 핫플레이스부터 현지인이 사랑하는 스폿까지, 여행 큐레이션으로 가볍게 떠나보세요.";
		 break;
	 }
 }
  
 setInterval(() => showSlides(slideIndex += 1), 2000); 
 /*=============================슬라이더 끝==============================  */
  </script>
  
</body>
</html>