<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${tvo.d_title} | VisitKorea</title>
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
<link href="/resources/css/mainHomePage.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/detail.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<!-- Tab 구성 부분 -->
	<div class="container">
		<div class="tab">
		  <a href="#item_img"><button class="tablinks"> <span id="tab_text">사진보기</span></button></a>
		  <a href="#item_tap"><button class="tablinks"> <span id="tab_text">상세정보</span></button></a>
		  <a href="/thema1"><button class="tablinks"> <span id="tab_text">목록</span></button></a>
		</div>
		
		<div class="detail_title">
			<!-- ✅ DB에서 가져온 d_local 표시 -->
			<p><h1>${tvo.d_local}</h1></p>
			<!-- ✅ DB에서 가져온 d_title 표시 -->
			<p id="item_img"><h2>${tvo.d_title}</h2></p>
		</div>
		
		<div class="detail_body">
			<div class="detail_body_item">
				<div>
					<!-- ✅ DB에서 가져온 d_img 표시 -->
					<img alt="${tvo.d_title}" src="${tvo.d_img}" 
					     onerror="this.src='/resources/images/map/family_default.jpg';">
					
					<div>
						<div id="item_tap"><span><h2> 상세정보 </h2></span></div><hr><br>
						<div id="item_body">
							<span>
								<!-- ✅ DB에서 가져온 d_content 표시 -->
								<c:choose>
									<c:when test="${not empty tvo.d_content}">
										${tvo.d_content}
									</c:when>
									<c:otherwise>
										상세 정보가 제공되지 않습니다.
									</c:otherwise>
								</c:choose>
						 	</span>
						</div>
						 
						<div id="item_info">
							<table>
								<tr>
									<!-- ✅ DB에서 가져온 d_title 표시 -->
									<th>- 명칭</th>
									<td>${tvo.d_title}</td>
									
									<!-- ✅ DB에서 가져온 d_time 표시 -->
									<th>- 영업시간</th>
									<td>
										<c:choose>
											<c:when test="${not empty tvo.d_time}">
												${tvo.d_time}
											</c:when>
											<c:otherwise>
												정보 없음
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<!-- ✅ DB에서 가져온 d_tel 표시 -->
									<th>- 전화번호</th>
									<td>
										<c:choose>
											<c:when test="${not empty tvo.d_tel}">
												${tvo.d_tel}
											</c:when>
											<c:otherwise>
												정보 없음
											</c:otherwise>
										</c:choose>
									</td>
									
									<!-- ✅ DB에서 가져온 d_addr 표시 -->
									<th>- 주소</th>
									<td>
										<c:choose>
											<c:when test="${not empty tvo.d_addr}">
												${tvo.d_addr}
											</c:when>
											<c:otherwise>
												정보 없음
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</div> 
					</div>
				</div>
				
			
			</div>
		</div>
	</div>
	<hr>
	<jsp:include page="bottom.jsp"></jsp:include>
	
	<!-- ✅ 카카오맵 스크립트 (선택사항) -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaokey}&libraries=services"></script>
	<script>
	// 지도 표시 코드 (필요시 추가)
	var mapContainer = document.getElementById('map');
	if (mapContainer) {
	    var mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567),
	        level: 3
	    };
	    var map = new kakao.maps.Map(mapContainer, mapOption);
	}
	</script>
</body>
</html>