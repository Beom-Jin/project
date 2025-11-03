<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/top.css" rel="stylesheet">
<link href="../resources/css/nav.css" rel="stylesheet">
<link href="../resources/css/bottom.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
form {
	border-radius: 5px;
	border: 1px solid gray;
}

.container {
	justify-content: center;
}

h2 {
	text-align: center;
}

li {
	text-decoration: none;
}

.btn {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 10px 14px;
	border-radius: 999px;
	border: 1px solid var(- -line);
	background: #fff;
	font-weight: 600;
	justify-content: center;
	margin: auto;
}

.btn.primary {
	background: var(- -brand);
	color: #fff;
	border-color: transparent;
	justify-content: center;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>

	<h2>개인정보 수정</h2>
	<div class="container">
		<form>
		<!-- value에 기존 데이터를 입력 받을 수 있도록 하는 기능 필요 -->
			<ul>
				<li><label>ID</label> <input type="text" value="" readonly>
				</li>
				<li><label>회원명</label> <input type="text" value=""></li>
				<li><label>성별</label> <input type="text" value=""></li>
				<li><label>나이(연령대)</label> <select name="ageRange" id="age">
						<option value="10대">10대</option>
						<option value="20대">20대</option>
						<option value="30대">30대</option>
						<option value="40대">40대</option>
						<option value="50대">50대</option>
						<option value="60대 이상">60대 이상</option>
				</select></li>
				<li><label>관심사</label>
					<!-- input의 id 속성값과 label의 for 속성값을 동일하게 해야 label을 눌러도 checkbox가 체크됨 -->
				 <input type="checkbox" id="option1"><label for="option1">관심사1</label>
				 <input type="checkbox" id="option2"><label for="option2">관심사2</label>
				 <input type="checkbox" id="option3"><label for="option3">관심사3</label>
				 <input	type="checkbox" id="option4"><label for="option4">관심사4</label>
				 <input type="checkbox" id="option5"><label for="option5">관심사5</label>
				 <input type="checkbox" id="option6"><label for="option6">관심사6</label>
				 </li>
			</ul>
			<input type="submit" value="수정하기" class="btn"> 
			<input type="reset" value="취소" class="btn">
		</form>
	</div>
	
	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>