<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/writeComments.css" rel="stylesheet">

</head>
<body>
	<div><h2>댓글작성</h2></div>
	
	<form method="post"> 
		<div class="write_container">
			<div class="textarea_div">
				<textarea rows="8" cols="100" placeholder="댓글을 입력하세요."></textarea>
			</div>
			<div class="button_div">
				<input type="button" value="댓글작성" onclick="writeOK()">
				<input type="button" value="목록" onclick="golist()">
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
	
	function writeOK()
	{
		
	}
	
	function golist()
	{
		
	}
	</script>
</body>
</html>