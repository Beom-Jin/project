<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크 보기</title>
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	table {
		margin : auto;
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th, td{
		border: 1px solid black;
	}
	h2{
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>
	<h2>북마크 보기</h2>
	<section class="container">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>관광지 제목</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td><a>XX 지역의 OO 관광지</a></td>
			</tr>
		</tbody>
		<tfoot>
			<!-- 페이징  -->
		</tfoot>
		</table>
	</section>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>