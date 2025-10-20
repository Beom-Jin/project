<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

.checked {
  color: orange;
}

html {
	scroll-behavior: smooth;
}

img {
	width: 600px;
	height: 500px;
}

.detail_title {
	margin-top: 60px;
	text-align: center;
}

.detail_body {
	display: flex;
  	justify-content: center;
}

.detail_body_item {
	width: 600px;
}

#item_tap {
	text-align: left;
}

#map { 
	margin-top: 40px;
}


/* ======================== 탭 스타일 부분 시작 ===============================*/
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}

.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

.tab button:hover {
  background-color: #ddd;
}

.tab button.active {
  background-color: #ccc;
}

.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
/* ======================== 탭 스타일 부분 끝 ===============================*/
</style>



</head>
<body>
	<div class="container">
		<!-- Tab 구성 부분 -->
		<div class="tab">
		 <!--  <button class="tablinks" onclick="moveScroll('#location_picture')"> 사진보기 </button> -->
		  <a href="#item_img"><button class="tablinks" onclick="moveScroll('#location_picture')"> 사진보기 </button></a>
		  <a href="#item_tap"><button class="tablinks" onclick="moveScroll('#item_tap')"> 상세정보 </button></a>
		  <a href="#map"><button class="tablinks" onclick="moveScroll('comment')"> 댓글 </button></a>
		</div>
	
		<div class="detail_title">
			<p><h1>${area}</h1></p>
			<p><h2> ${area} 여행지 리스트 </h2>	</p>
			<p><h3>${area} 의 관광지 간략한 소개</h1></p>
		</div>
		
		<div class="detail_body" id="location_picture">
			<div class="detail_body_item">
				<div>
					<img alt="" id="item_img" src="/resources/images/bear.jpg">
					<div>
						<div id="item_tap"><span><h2> 상세정보 </h2></span></div><hr><br>
						<div id="item_body"><span> 전통을 담은 한방 트리트먼트를 바탕으로 몸과 마음을 회복해
						 내재된 아름다움을 되찾도록 도와주는 설화수 플래그십 스토어.
						 설화수가 추구하는 미의 가치를 체험할 수 있는 감각적인 공간이다.
						 예로부터 우리 조상들은 여성의 아름다움을 가꾸는 데 필요한 지혜를 모으고 그 방법을 기록했다.
						 대표적으로 전통 고전인 『본초강목』이나 『동의보감』 등의 책에서는
						 한방 약재를 이용해 아름다움을 가꾸는 다양한 방법을 소개하고 있다.
						 이렇게 귀한 한방 성분으로 몸과 마음의 아름다움을 동시에 지켜내기 위해
						 노력해 온 전통의 비법을 담고
						 그 가치를 이어나가기 위한 곳이 바로 ‘설화수 플래그십 스토어’다.</span>
						 
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 
						 <span> 전통을 담은 한방 트리트먼트를 바탕으로 몸과 마음을 회복해
						 내재된 아름다움을 되찾도록 도와주는 설화수 플래그십 스토어.
						 설화수가 추구하는 미의 가치를 체험할 수 있는 감각적인 공간이다.
						 예로부터 우리 조상들은 여성의 아름다움을 가꾸는 데 필요한 지혜를 모으고 그 방법을 기록했다.
						 대표적으로 전통 고전인 『본초강목』이나 『동의보감』 등의 책에서는
						 한방 약재를 이용해 아름다움을 가꾸는 다양한 방법을 소개하고 있다.
						 이렇게 귀한 한방 성분으로 몸과 마음의 아름다움을 동시에 지켜내기 위해
						 노력해 온 전통의 비법을 담고
						 그 가치를 이어나가기 위한 곳이 바로 ‘설화수 플래그십 스토어’다.</span>
						 
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 
						 <span> 전통을 담은 한방 트리트먼트를 바탕으로 몸과 마음을 회복해
						 내재된 아름다움을 되찾도록 도와주는 설화수 플래그십 스토어.
						 설화수가 추구하는 미의 가치를 체험할 수 있는 감각적인 공간이다.
						 예로부터 우리 조상들은 여성의 아름다움을 가꾸는 데 필요한 지혜를 모으고 그 방법을 기록했다.
						 대표적으로 전통 고전인 『본초강목』이나 『동의보감』 등의 책에서는
						 한방 약재를 이용해 아름다움을 가꾸는 다양한 방법을 소개하고 있다.
						 이렇게 귀한 한방 성분으로 몸과 마음의 아름다움을 동시에 지켜내기 위해
						 노력해 온 전통의 비법을 담고
						 그 가치를 이어나가기 위한 곳이 바로 ‘설화수 플래그십 스토어’다.</span>
						 
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 <br>
						 </div>
					</div>
				</div>
				
			<!-- 카카오 지도를 표시할 div -->
			<div id="map" style="width: 100%; height: 350px;"></div>
			
			<div id="star_body">
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>		
			</div>
			</div>
		</div>
	</div>

	<!-- =============================== 카카오맵 ==================================  -->
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e684ace65f4252ccaf39ed6a6b1bef1"></script>
	<script>
		function geo_map(lat, lon) {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(lat, lon);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwContent = '<div style="padding:5px;"><a href="https://ictedu.co.kr" target="_blank"> 관광지 이름</a></div>', 
			iwPosition = new kakao.maps.LatLng(lat, lon); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		}
	</script>
	<script type="text/javascript">
		navigator.geolocation.getCurrentPosition(function(position) {
			const lat = position.coords.latitude;
			const lon = position.coords.longitude;

			geo_map(lat, lon);
		});
	</script>
	
	
</body>
</html>