<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/writeComments.css" rel="stylesheet">

</head>
<body>
	
	<c:choose>
		<c:when test="${not empty sessionScope.m_id}">
			<c:set var="loginId" value="${sessionScope.m_id}" />
		</c:when>
		<c:otherwise>
			<c:set var="loginId" value="아이디없음" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${not empty sessionScope.m_img}">
			<c:set var="loginImg" value="${sessionScope.m_img}" />
		</c:when>
		<c:otherwise>
			<c:set var="loginImg" value="" />
		</c:otherwise>
	</c:choose>

	<div><h2>댓글작성</h2></div>
	
	<form method="post"> 
		<div class="write_container">
			<div class="textarea_div">
				<textarea rows="8" cols="100" placeholder="댓글을 입력하세요." name="com_text"></textarea>
			</div>
			<div class="button_div">
				<input type="hidden" name="area" value="${param.area}">  <!-- 화면 다시 불러올때 필요 -->
				<input type="hidden" name="com_id" value="${loginId}">
				<input type="hidden" name="com_img" value="${loginImg}">
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
		f.action="/showDetail";	
		f.submit();
	}
	</script>
</body>
</html>