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
		<input type="button" class="btn" value="작성완료" onclick="QuestionWriteOk(this.form)">
		<input type="button" class="btn" value="목록으로" onclick="showQuestionList">
		</tr>
		</tfoot>
		</table>
		</form>
	</section>
	<script type="text/javascript">
		function QuestionWriteOk(f){
			f.action="/QuestionWriteOk";
			f.submit();
		}
		function showQuestionList(){
			f.aciton="/showQuestionList";
		}
	</script>
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>