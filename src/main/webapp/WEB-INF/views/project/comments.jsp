<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comments</title>

<link href="resources/css/comments.css" rel="stylesheet">

</head>
<body>
	<form method="post" action="/writeComments">
		<div class="comment_header">
			<h3> 댓글 </h3>
		</div>
		<hr>
		
		<!-- =========================== DB 연동하면 아래 소스 사용 ==================================== -->
		
		<c:choose>
			<c:when test="${empty comList}">
				<div>
			  		<h3 style="text-align: center;"> 작성된 댓글이 없습니다. </h3>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="k" items="${comList}" varStatus="v">
					<div class="comment_container">
				  		<div class="comment_container_info">
					  		<img src="${empty k.com_img ? '/resources/images/LoginImg.png' :  k.com_img}">
							
							<div class="comment_container_info_user">
					  			<span>${k.com_id}</span>
					  			<span id="info_time">&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${k.com_time}</span>
							</div>
				  		</div>
				  		<div class="comment_container_info_text">
					  		<span>${k.com_text }</span>
				  		</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<input type="hidden" name="area" value="${param.area}">
		<input type="button" value="댓글 작성하기" onclick="commentsWrite(this.form)">
	</form>
	
	<!-- 로그인중 일때만 작성 가능하게 -->

<script type="text/javascript">
	function commentsWrite(f)
	{
		f.submit();
	}

</script>
</body>
</html>