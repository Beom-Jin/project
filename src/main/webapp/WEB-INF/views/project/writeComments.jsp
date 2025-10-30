<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/writeComments.css" rel="stylesheet">

<%
	String loginId = (String)session.getAttribute("세션아이디저장값");

	if(loginId != null && !loginId.equals(""))
	{
		loginId = (String)session.getAttribute("세션아이디저장값");	// 세션에 저장된 로그인id 가져오기
	}
	else 
	{
		loginId = "아이디없음";
	}
%>

</head>
<body>
	<div><h2>댓글작성</h2></div>
	
	<form method="post"> 
		<div class="write_container">
			<div class="textarea_div">
				<textarea rows="8" cols="100" placeholder="댓글을 입력하세요." name="com_text"></textarea>
			</div>
			<div class="button_div">
				<input type="hidden" name="area" value="${param.area}">  <!-- 화면 다시 불러올때 필요 -->
				<input type="hidden" name="com_id" value="<%= loginId %>">
				<input type="hidden" name="com_img" value="aa11ss22">
				<input type="hidden" name="detail_board" value="${param.area}">
				<input type="button" value="댓글작성" onclick="writeOK(this.form)">
				<input type="button" value="목록" onclick="golist(this.form)">
			</div>
		</div>
	</form>
	
	<script type="text/javascript">	
	function writeOK(f)
	{
		f.action="/comWriteOk";	
		f.submit();
	}
	
	function golist(f)
	{
		f.action="/showDetail";	/* f.action 사용하면 get으로 받아야함 */
		f.submit();
	}
	</script>
</body>
</html>