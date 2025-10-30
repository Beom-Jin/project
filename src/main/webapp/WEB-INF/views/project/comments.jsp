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
<<<<<<< HEAD

	<div class="comment_header">
		<h3> 댓글 </h3>
	</div>
	<hr>
	<div class="comment_container">
  		<div class="comment_container_info">
	  		<img src="https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2558760599.jpg">
			
			<div class="comment_container_info_user">
	  			<span>ICT1234</span>
	  			<span id="info_time">  |  2025/10-23/19:23</span>
			</div>
  		</div>
  		<div class="comment_container_info_text">
	  		<span>김밥의 고장 김천에서 명품 김밥이 탄생했다. 올해 김천김밥쿡킹대회 우승작품인 호두마요제육김밥이 상품화돼, 오는 28일 전국 CU 편의점에서 출시된다.</span>
  		</div>
	</div>
	
	<div class="comment_container">
  		<div class="comment_container_info">
	  		<img src="https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2558760599.jpg">
			
			<div class="comment_container_info_user">
	  			<span>ICT7894</span>
	  			<span id="info_time"> | 2025/10-23/19:26</span>
			</div>
  		</div>
  		<div class="comment_container_info_text">
	  		<span>라파엘 나달이 23일 서울 성동구 기아 언플러그드 그라운드에 전시된 PV5 패신저 차량과 기념 촬영을 하고 있다.</span>
  		</div> 
	</div>
	
	<!-- =========================== DB 연동하면 아래 소스 사용 ==================================== -->
	
	<%-- <c:choose>
		<c:when test="${empty 댓글vo}">
			<div>
		  		<h3 style="text-align: center;"> 작성된 댓글이 없습니다. </h3>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${댓글vo}" varStatus="v">
				<div class="comment_container">
			  		<div class="comment_container_info">
				  		<img src="${k.프로필 이미지 주소}">
						
						<div class="comment_container_info_user">
				  			<span>${k.사용자 ID}</span>
				  			<span id="info_time">  |  ${k.댓글 작성시간}</span>
						</div>
			  		</div>
			  		<div class="comment_container_info_text">
				  		<span>${k.댓글내용 }</span>
			  		</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose> --%>
	
	<input type="button" value="댓글 작성하기" onclick="commentsWrite()">
	<!-- 히든으로 게시물 번호 넘기기? -->
	<!-- 로그인중 일때만 작성 가능하게 -->

<script type="text/javascript">
	function commentsWrite()
	{
		location.href = "/writeComments";
=======
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
					  		<img src="${k.com_img}">
							
							<div class="comment_container_info_user">
					  			<span>${k.com_id}</span>
					  			<span id="info_time">  |  ${k.com_time}</span>
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
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
	}

</script>
</body>
</html>