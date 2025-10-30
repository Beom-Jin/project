<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 40px;
}
h2 {
	text-align: center;
	margin-bottom: 20px;
}
form {
	width: 90%;
	margin: 0 auto 30px auto;
	background-color: #f8f8f8;
	border: 1px solid #ccc;
	border-radius: 10px;
	padding: 20px;
}
form label {
	display: inline-block;
	width: 120px;
	font-weight: bold;
}
form input {
	width: 70%;
	padding: 6px;
	margin: 6px 0;
	border: 1px solid #ccc;
	border-radius: 6px;
}
form button {
	padding: 8px 16px;
	margin: 10px 4px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}
#btn-insert {
	background-color: #4CAF50;
	color: white;
}
#btn-reset {
	background-color: #777;
	color: white;
}
</style>
<link href="../resources/css/top.css" rel="stylesheet">
<link href="../resources/css/nav.css" rel="stylesheet">
<link href="../resources/css/bottom.css" rel="stylesheet">

</head>

<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="/js/tour_functions.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>	
	<div id="form-container"></div>	
	<jsp:include page="../bottom.jsp"></jsp:include>
	
	<h2>Update Form (Dynamic)</h2>	
	<%
    // 쿼리 파라미터 받기
    String b_title = request.getParameter("b_title");
    String b_content = request.getParameter("b_content");
    String b_theme = request.getParameter("b_theme");
    String b_idx = request.getParameter("b_idx");
	%>

	<script type="text/javascript">
		$(document).ready(function() {
			let formHtml = `
				<form id="tourForm">
					<input type="hidden" name="b_idx" value="<%=b_idx%>">
					<label for="b_title">제목(필수)</label> 
						<input type="text" id="b_title" name="b_title" value="<%=b_title%>" ><br> 

					<label for="b_content">내용</label>
						<input type="text" id="b_content" name="b_content" value="<%= b_content %>"><br>

					<label for="b_theme">테마</label>
						<input type="text" id="b_theme" name="b_theme" value="<%= b_theme %>" ><br>

					<div style="text-align:center;">
						<button type="button" id="btn-update">변경</button>
						<button type="reset" id="btn-reset">초기화</button>
					</div>
				</form>
			`;

			// body에 폼 추가
			$("#form-container").html(formHtml);

			$(document).on("click", "#btn-update", function() {
				const formData = $("#tourForm").serialize();

				$.ajax({
					url : "/updateTour",
					method : "post",
					data : formData,
					success : function(res) {
						if (res === "OK") {
							alert("변경 완료");
							location.href = "/eventMap"; // 목록 페이지로 이동
						} else {
							alert("등록 실패: " + res);
						}
					},
					error : function(err) {
						console.log(err);
						alert("변경 실패");
					}
				});
			});
			
		});
	</script>
</body>
</html>
