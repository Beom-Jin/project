<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;"><h2>댓글작성</h2></div>
	
	<form method="post"> 
		<div class="write_container">
			<textarea rows="4" cols="30" placeholder="댓글을 입력하세요."></textarea>
			
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