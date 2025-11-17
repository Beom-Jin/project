<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin: auto;
		overflow: hidden;
	}
	th, td{
		border: 1px 0 1px 0 solid #bebebe;
		text-align: center;
	}
	h2{
		text-align: center;
	}
	input{
		justify-content: center;
	}
	th{
		width: 30%;
		border-top-left-radius: 20px;
		border-bottom-left-radius: 20px;
		background-color: #4a90e2;
	}
	tr{
		border-top : 1px solid #bebebe;
	}
	td{
		width : 70%;
		border-top-right-radius: 20px;
		border-right: 1px solid #eee;
	}
	
</style>
</head>
<body>
<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>
	<h2>여행 후기</h2>
	<section class="container">
		<form method="post">
	<table>
		<tbody>
			<tr>
				<th >글 제목</th>
				<td>${rVO.r_title}</td>
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
				<th >내용</th>
				<td>${rVO.r_content}</td>
			</tr>
		
		</tbody>
		<tfoot>
		<tr>
		<td colspan="3">
		<input type="hidden" name="r_idx" value="${rVO.r_idx}">
		<input type="button" class="btn" value="목록으로" onclick="showTravelReview(this.form)">
		<input type="button" class="btn" value="수정하기" onclick="travelReviewUpdate(this.form)">
		<input type="button" class="btn" value="삭제하기" onclick="travelReviewDelete(this.form)">
		</tr>
		</tfoot>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function showTravelReview(f){
			f.action="/showTravelReview"
			f.submit();
		}
		
		function travelReviewUpdate(f){
			f.action="/TravelReviewUpdateForm"
			f.submit();
		}
		
		function travelReviewDelete(f){
			f.action="/TravelReviewDelete"
			f.submit();
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>