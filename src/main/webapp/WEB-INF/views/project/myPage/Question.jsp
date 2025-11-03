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
			<c:choose>
				<c:when test="${empty qList}">
					<tr>
						<td colspan="3">
							질문 내역이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="q" items="${qList}" varStatus="v">
				<tr>
					<td>${v.count}</td>
					<td><a href="/showQuestionDetail?q_idx=${q.q_idx}">${q.q_title}</a></td>
					<td>${q.q_regdate}</td>
				</tr>
				</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
		<tr>
			<td>
				
			</td>
			<td colspan="2">
				<button class="btn" onclick="goQuestionWriteForm()">질문 작성하기</button>
				<button class="btn" onclick="goMyPage()">마이 페이지 가기</button>
			</td>
		</tr>
		
		</tfoot>
		</table>
	</section>
	<script type="text/javascript">
		function goQuestionWriteForm(){
			location.href="/QuestionWriteForm";
		}
		function goMyPage(){
			location.href="/showMyPage";
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>