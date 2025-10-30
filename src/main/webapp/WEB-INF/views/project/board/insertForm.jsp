<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Form</title>
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

	<h2>Insert Form (Dynamic)</h2>
	<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>

	<div id="form-container"></div>
	<jsp:include page="../bottom.jsp"></jsp:include>

	<script type="text/javascript">
		$(document).ready(function() {
			let formHtml = `
				<form id="tourForm">
					<input type="hidden" id="b_id" name="b_id">

					<label for="b_title">제목(필수)</label> 
						<input type="text" id="b_title" name="b_title" required placeholder="제목을 입력하세요"><br> 

					<label for="b_img">이미지 URL</label>
						<input type="text" id="b_img" name="b_img" placeholder="이미지 URL"><br>

					<label for="b_content">내용</label>
						<input type="text" id="b_content" name="b_content" required><br>

					<label for="b_loc">위치(주소)</label>
						<div style="display:flex; gap:8px;">
							<input type="text" id="b_loc" name="b_loc" readonly>
							<button type="button" id="btn_loc" onclick="findAddress()">주소검색</button>
						</div>

					<label for="b_lat">위도</label>
						<input type="text" id="b_lat" name="b_lat" placeholder="33.450701"><br>

					<label for="b_lon">경도</label>
						<input type="text" id="b_lon" name="b_lon" placeholder="126.570667"><br>

					<label for="b_time">운영시간</label>
						<input type="text" id="b_time" name="b_time"><br>

					<label for="b_url">홈페이지</label>
						<input type="text" id="b_url" name="b_url"><br>

					<div style="text-align:center;">
						<button type="button" id="btn-insert">추가</button>
						<button type="reset" id="btn-reset">초기화</button>
					</div>
				</form>
			`;

			// body에 폼 추가
			$("#form-container").html(formHtml);

			$(document).on("click", "#btn-insert", function() {
				const formData = $("#tourForm").serialize();

				$.ajax({
					url: "/insertTour",
					method: "post",
					data: formData,
					success: function(res) {
						if (res === "OK") {
							alert("등록 완료!");
							location.href = "/eventMap"; // 목록 페이지로 이동
						} else {
							alert("등록 실패: " + res);
						}
					},
					error: function(err) {
						console.log(err);
						alert("서버 오류: 등록 실패");
					}
				});
			});
		});
	</script>
</body>
</html>
