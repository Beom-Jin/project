<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/mainHomePage.css" rel="stylesheet">
<link href="/resources/css/slider.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 내비 -->
	<nav>
		<div class="nav-wrap" role="navigation" aria-label="주요 카테고리">
			<a class="nav-link" href="/showMap" target="_blank">지역별 여행</a> <a
				class="nav-link" href="#">테마별 여행</a> <a class="nav-link" href="#">축제
				⦁ 행사</a> <a class="nav-link" href="/showSupport">고객 지원</a> <a class="nav-link"
				href="#">마이 페이지</a>
		</div>
	</nav>
	
	
	
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>