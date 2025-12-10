<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 수정하기</title>
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
		margin: auto;
		overflow: hidden;
	}
	th, td{
		border: 1px 0 1px 0 solid #eee;
		text-align: center;
	}
	h2{
		text-align: center;
	}
	input{
		justify-content: center;
	}
	.border-radius-top{
		border-top-left-radius: 12px;
	}
	.border-radius-bottom{
		border-bottom-left-radius: 12px;
	}
	th{
		width: 30%;
		background-color: #4a90e2;
	}
	td{
		width : 70%;
		border-top : 1px solid black;
		border-bottom: 1px solid black;
		border-right: 1px solid black;
	}
	td input[type="text"],td textarea {
    width: 80%;
    height: 80%;
    margin: 5px 3px;        
    box-sizing: border-box;
}
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>
	<h2>질문 내용 수정하기</h2>
	<section class="container">
	<form method="post">
	<table>
		<tbody>
			<tr>
				<th class="border-radius-top">질문 제목</th>
				<td><input type="text" name="q_title" value="${qVO.q_title}"></td>
			</tr>
			<tr>
				<th>질문 작성자</th>
				<td>admin</td>
			</tr>
			<tr>
				<th>질문 작성일</th>
				<td>${qVO.q_regdate}</td>
			</tr>
			<tr>
				<th class="border-radius-bottom">질문내용</th>
				<td><textarea name="q_content" cols="40" rows="50">${qVO.q_content}</textarea></td>
			</tr>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="2">
		<input type="hidden" name="q_idx" value="${qVO.q_idx}">
		<input type="button" class="btn" value="수정완료" onclick="QuestionUpdateOk(this.form)">
		<input type="button" class="btn" value="수정취소" onclick="showQuestionDetail(this.form)">
		</tr>
		</tfoot>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function QuestionUpdateOk(f){
			f.action="/QuestionUpdateOk"
			f.submit();
		}
		
		function showQuestionDetail(f){
			f.action="/showQuestionDetail"
			f.submit();
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>