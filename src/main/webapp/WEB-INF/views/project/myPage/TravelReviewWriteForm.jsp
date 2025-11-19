<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 후기 작성하기</title>
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
	th{
		width: 30%;
		border-top-left-radius: 20px;
		border-bottom-left-radius: 20px;
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
	<h2>여행 후기 쓰기</h2>
	<section class="container">
		<form method="get">
	<table>
		<tbody>
			<tr>
				<th>글 제목</th>
				<td>
					<input type="text" name="r_title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="r_content" rows="8" cols="50">
					</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
		<tr>
		<td colspan="2">
		<input type="button" class="btn" value="작성완료" onclick="travelReviewWriteOk(this.form)">
		<input type="button" class="btn" value="목록으로" onclick="showTravelReview()">
		</tr>
		</tfoot>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function travelReviewWriteOk(f){
			f.action="/TravelReviewWriteOk";
			f.submit();
		}
		function showTravelReview(){
			location.href="/showMyPage";
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>