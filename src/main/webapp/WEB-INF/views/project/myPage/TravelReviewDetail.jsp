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
		width: var(--max);
		height: 600px;
		border-collapse: collapse;
		border : 1px solid black;
		margin: auto;
	}
	thead{
		border: 1px solid black;
		background-color: var(--brand);
	}
	th, td{
		border: 1px solid black;
		align-items: center;
	}
	h2{
		text-align: center;
	}
	input{
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
		<tbody>
			<tr>
				<th>글 제목</th>
				<td>1</td>
			</tr>
			<tr>
				<th>글 작성자</th>
				<td>admin</td>
			</tr>
			<tr>
				<th>글 작성일</th>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>여행지 내용 어쩌구</td>
			</tr>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="3">
		<a><input type="button" class="btn" value="목록으로"></a>
		<a><input type="button" class="btn" value="수정하기"></a>
		<input type="button" class="btn" value="뒤로가기">
		</tr>
		</tfoot>
		</table>
	</section>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>