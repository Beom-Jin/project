<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 보기</title>
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
		justify-content: center;
	}
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>
	<h2>질문 상세보기</h2>
	<section class="container">
		<form method="post">
	<table>
		<tbody>
			<tr>
				<th>질문 제목</th>
				<td>${qVO.q_title}</td>
			</tr>
			<tr>
				<th>질문 작성자</th>
				<td>admin</td>
			</tr>
			<tr>
				<th>질문 작성일</th>
				<td>2025-10-21</td>
			</tr>
			<tr>
				<th>질문내용</th>
				<td>${qVO.q_content}</td>
			</tr>
		
		</tbody>
		<tfoot>
		<tr>
		<td colspan="3">
		<input type="hidden" name="q_idx" value="${qVO.q_idx}">
		<input type="button" class="btn" value="목록으로" onclick="showQuestionList(this.form)">
		<input type="button" class="btn" value="수정하기" onclick="QuestionUpdate(this.form)">
		<input type="button" class="btn" value="삭제하기" onclick="QuestionDelete(this.form)">
		</tr>
		</tfoot>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function showQuestionList(f){
			f.action="/showQuestionList"
			f.submit();
		}
		
		function QuestionUpdate(f){
			f.action="/QuestionUpdateForm"
			f.submit();
		}
		
		function QuestionDelete(f){
			f.action="/QuestionDelete"
			f.submit();
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>