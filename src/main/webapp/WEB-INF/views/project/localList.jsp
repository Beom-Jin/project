<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>관광지 검색</title>

<link href="/resources/css/top.css" rel="stylesheet">
<link href="resources/css/localList.css" rel="stylesheet">
</head>

<body>
<jsp:include page="top.jsp"></jsp:include>

<main class="container">
  <h2 class="page-title">선택 지역의 관광지 목록</h2>
  
  <section class="grid cols-4">
  <c:choose>
	  	<c:when test="${empty list}">
	  		<h2> 정보를 불러오는데 실패했습니다.</h2>
	  	</c:when>
	  	
	  	<c:otherwise>
	  		<c:forEach var="k" items="${list}" varStatus="v">
  				<a href="/showDetail?area=${k.d_title}">
		  			<article class="card">
					      <div class="thumb">
					      	<img src="${empty k.d_img ? '/resources/images/photo-6.jpg' :  k.d_img}">
					      </div>
					      <div class="meta">
						      <div class="place">${k.d_title}</div>
						      <span class="tag">${k.d_local}</span>
					      </div>
				    </article>
  				</a>
	  		</c:forEach>
	  	</c:otherwise>
  </c:choose>
  </section>
</main>

<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
