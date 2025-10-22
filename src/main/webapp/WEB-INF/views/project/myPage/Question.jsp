<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문내역 보기</title>
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/top.css" rel="stylesheet">
<link href="../resources/css/nav.css" rel="stylesheet">
<link href="../resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	table{
		margin: auto;
		border: 1px solid black;
		border-radius: 5px;
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
	
	<section class="container">
	<h2>질문 내역</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>질문 제목</th>
				<th>질문 일자</th>
			</tr>
		</thead>
		<tbody>
		<!-- 번호에 해당하는 td 는 varStatus v로 반복문. 제목, 일자 td 는 변수 k에 의한 DB에서의 데이터 입력 -->
			<tr>
				<td>1</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<td>2</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<td>3</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<td>4</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<td>5</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<td>6</td>
				<td>질문 있습니다.</td>
				<td>2025-10-21</td>
			</tr>
		
		</tbody>
		<tfoot>
			<!-- 페이징 -->
		</tfoot>
		</table>
	</section>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>