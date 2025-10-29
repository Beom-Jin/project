<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객지원</title>
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="/resources/css/mainHomePage.css" rel="stylesheet">
<link href="/resources/css/slider.css" rel="stylesheet">


</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<a href="/showNotice">공지사항 보기</a>
	<a href="/showFAQ">자주 묻는 질문 보기</a>
	
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>