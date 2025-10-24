<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>VisitKorea 스타일 데모</title>

<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/mainHomePage.css" rel="stylesheet">
<link href="/resources/css/slider.css" rel="stylesheet">
<link href="/resources/css/popup.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- 히어로 -->
	<div class="container hero">
		<div class="panel" aria-label="프로모션 배너">
			<div class="bg" aria-hidden="false">
				<div class="slide-container">
					<div class="slide_pic fade">
						<a href="이미지 클릭시 이동할 주소">
							<img alt="" src="/resources/images/photo-1.jpg">
						</a>
					</div>
					<div class="slide_pic fade">
						<a href="이미지 클릭시 이동할 주소">
							<img alt="" src="/resources/images/photo-2.jpg">
						</a>
					</div>
					<div class="slide_pic fade">
						<a href="이미지 클릭시 이동할 주소">
							<img alt="" src="/resources/images/photo-3.jpg">
						</a>
					</div>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a> 
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
			</div>

			<div class="content">
				<span class="k-badge" id="content_day">가을여행주간 · 10.15–11.10</span>
				<h1 id="content_h1">단풍 물든 코리아: 지금 가기 좋은 국내 명소</h1>
				<p id="content_p">잘 알려진 핫플레이스부터 현지인이 사랑하는 스폿까지, 여행 큐레이션으로 가볍게
					떠나보세요.</p>
				<div class="chips">
					<span class="chip">#서울야경</span>
					<span class="chip">#감성카페</span>
					<span class="chip">#한옥스테이</span>
					<span class="chip">#가을단풍</span>
				</div>
			</div>
		</div>
	</div>

	<!-- 지역별 여행 -->
	<section class="container">
		<div class="sec-head">
			<h2>지역별 여행지 추천</h2>
			<a href="/showMap">지역별 지도 보기</a>
		</div>
		<div class="grid cols-4">
			<a href="http://localhost:8090/showDetail?area=%EC%84%9C%EC%9A%B8">
				<article class="card">
					<div class="thumb">
						<img src="/resources/images/example/Seoul2.jpg" alt="">
					</div>
					<div class="meta">
						<span class="tag">서울</span>
						<div class="title">광화문</div>
						<p class="desc">'빛이 퍼져나간다' 는 의미를 지닌 민주주의와 역사적 사건이 얽힌 대한민국의 상징적인 공간.</p>
					</div>
				</article>
			</a>

			<a href="http://localhost:8090/showDetail?area=%EB%B6%80%EC%82%B0">
				<article class="card">
					<div class="thumb">
						<img
							src="/resources/images/example/Busan2.jpg" alt="">
					</div>
					<div class="meta">
						<span class="tag">부산</span>
						<div class="title">청사포 다릿돌 전망대</div>
						<p class="desc">바다 위를 걷는 듯한 경험과 함께 수려한 해안 경관, 일출, 낙조를 감상 할 수 있는 공간.</p>
					</div>
				</article>
			</a>
			
			<a href="http://localhost:8090/showDetail?area=%EC%A0%9C%EC%A3%BC">
				<article class="card">
					<div class="thumb">
						<img
							src="/resources/images/example/Jeju2.jpg" alt="">
					</div>
					<div class="meta">
						<span class="tag">제주</span>
						<div class="title">성산일출봉</div>
						<p class="desc">수성화산활동으로 만들어진 응회구, 99개의 기암괴석, 화산활동으로 빚어진 독특한 지층.</p>
					</div>
				</article>
			</a>
			
			<a href="http://localhost:8090/showDetail?area=%EA%B0%95%EC%9B%90%EB%8F%84">
				<article class="card">
					<div class="thumb">
						<img
							src="/resources/images/example/Gangwon2.jpg" alt="">
					</div>
					<div class="meta">
						<span class="tag">강원</span>
						<div class="title">대관령 양떼목장</div>
						<p class="desc">강원도 평창군에 위치한 '한국의 알프스', 하늘 아래 첫 동네라는 표현에 걸맞은 천혜의 설경.</p>
					</div>
				</article>
			</a>
		</div>
	</section>

	<!-- 테마 큐레이션 -->
	<section class="container">
		<div class="sec-head">
			<h2>테마별 여행</h2>
			<a href="#">더 알아보기</a>
		</div>
		<div class="grid cols-3">
			<article class="card">
				<div class="thumb hero">
					<img
						src="https://wimg.heraldcorp.com/news/cms/2025/04/17/news-p.v1.20250417.573fc4e739ab46878b4581d78a8f1395_P1.jpg"
						alt="반려동물과 함께">
				</div>
				<div class="meta">
					<div class="title">반려동물과 함께</div>
					<p class="desc">펫프렌드리 숙소·식당·공원 추천</p>
				</div>
			</article>

			<article class="card">
				<div class="thumb hero">
					<img
						src="https://sojoong.joins.com/wp-content/uploads/sites/4/2020/09/1.jpg"
						alt="차박 & 캠핑">
				</div>
				<div class="meta">
					<div class="title">차박 & 캠핑</div>
					<p class="desc">차량 접근 용이한 캠핑지 모음</p>
				</div>
			</article>

			<article class="card">
				<div class="thumb hero">
					<img
						src="https://d2phebdq64jyfk.cloudfront.net/media/article/91b5b261e92b48b1b6fbe6c94d4e4dba.jpg"
						alt="한류 성지투어">
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
                <h2>축제 · 행사</h2>
                <a href="#">캘린더 보기</a>
            </div>
            <div class="strip">
                <!-- 왼쪽 큰 카드(샘플 이미지) -->
                <div class="big">
                    <div class="thumb">
                        <img src="https://img.hankyung.com/photo/202411/ZN.38596435.1.jpg" alt="불꽃축제" />
                    </div>
                    <div class="overlay" aria-hidden="true"></div>
                    <div class="caption">
                        <div style="font-weight: 800; font-size: 20px">불꽃 축제 2025</div>
                        <div style="opacity: 0.9">10.28 · 부산 광안리 해변</div>
                    </div>
                </div>

                <div class="grid cols-2">
                    <article class="card">
                        <div class="thumb">
                            <img src="https://img.etoday.co.kr/pto_db/2019/07/20190726153503_1350707_1200_876.jpg" alt="비빔밥 축제" />
                        </div>
                        <div class="meta">
                            <span class="tag">전주</span>
                            <div class="title">비빔밥 축제</div>
                            <p class="desc">먹거리 공연 체험이 모두 한자리에</p>
                        </div>
                    </article>

                    <article class="card">
                        <div class="thumb">
                            <img src="http://www.adinews.co.kr/news/photo/202211/60223_108486_229.jpg" alt="탈춤 페스티벌" />
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

    <!-- 공지 안내 팝업 (가운데 크게) -->
<div id="popupNotice" class="mini-popup center hidden" role="dialog" aria-label="공지 안내">
  <button class="popup-close" onclick="closePopup('popupNotice')" aria-label="닫기">×</button>
  <h3>공지 안내</h3>
  <p>
    10월 25일(금) 오전 2시~4시 시스템 점검이 예정되어 있습니다.<br />
    이용에 불편을 드려 죄송합니다.
  </p>
  <div class="mini-footer">
    <label><input type="checkbox" id="hideNotice" /> 오늘 하루 보지 않기</label>
    <button class="btn-primary" onclick="closePopup('popupNotice')">확인</button>
  </div>
</div>

<!-- 광고 팝업 (오른쪽 하단) -->
<div id="popupAd" class="mini-popup right hidden" role="region" aria-label="광고 팝업">
  <button class="popup-close" onclick="closePopup('popupAd')" aria-label="닫기">×</button>
  <h3> 추천 여행지 </h3>
  <a href="https://www.visitkorea.or.kr/" target="_blank" rel="noopener">
    <img src="/resources/images/popupimage1.jpg" alt="광고 배너" onerror="this.style.display='none'" />
  </a>
  <div class="mini-footer">
    <label><input type="checkbox" id="hideAd" /> 오늘 하루 보지 않기</label>
  </div>
</div>
  
  
  <script src="/resources/js/popup.js"></script>

</body>
</html>