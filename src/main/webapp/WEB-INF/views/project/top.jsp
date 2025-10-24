<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바</title>

<link href="/resources/css/top.css" rel="stylesheet">
<!-- <link href="/resources/css/mainHomePage.css" rel="stylesheet"> -->
</head>

<body>

<!-- 헤더 -->
  <header class="topbar">
    <div class="container wrap">
      <a class="logo" href="/showMain"><span class="logo-dot"></span><span>VisitKorea</span></a>
      <div class="search" role="search">
        <svg class="ico-left" viewBox="0 0 24 24" aria-hidden="true"><path d="M15.5 14h-.79l-.28-.27a6.5 6.5 0 1 0-.71.71l.27.28v.79L20 21l1-1-5.5-6zM10 15a5 5 0 1 1 0-10 5 5 0 0 1 0 10z"/></svg>
        <input placeholder="어디로 떠나고 싶나요? (예: 제주, 서울, 한옥)" aria-label="검색" />
        <svg class="ico-right" viewBox="0 0 24 24" aria-hidden="true"><path d="M3 12h18M13 5l7 7-7 7" stroke="#94a3b8" stroke-width="2" fill="none" stroke-linecap="round"/></svg>
      </div>
      <div class="quick">
         <a class="btn" href="${pageContext.request.contextPath}/LoginForm">로그인</a>
       	 <a class="btn" href="${pageContext.request.contextPath}/RegistrationForm">회원가입</a>
      </div>
    </div>
  </header>


</body>
</html>