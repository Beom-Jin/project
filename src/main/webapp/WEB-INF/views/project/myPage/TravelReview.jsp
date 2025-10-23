<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 후기 보기</title>
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/top.css" rel="stylesheet">
<link href="../resources/css/nav.css" rel="stylesheet">
<link href="../resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	table{
		border : 1px solid black;
		border-collapse : collapse;
		margin: auto;
	}
	thead{
		border: 1px solid black;
		background-color: var(--brand);
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
	<h2>여행 후기</h2>
	<section class="container">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>후기 제목</th>
				<th>후기 작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td><a href="/showTravelReviewDetail">후기 1번</a></td>
				<td>2025-10-21</td>
			</tr>
		</tbody>
		<tfoot>
		<!-- 페이징 추가 -->
		</tfoot>
		</table>
	</section>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>