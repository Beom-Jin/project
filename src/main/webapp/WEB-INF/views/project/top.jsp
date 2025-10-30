<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바</title>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

<header class="topbar">
	<div class="container">
		<div class="wrap">
			<!-- 로고 -->
			<a href="/gotitle" class="logo"> <span class="logo-dot"></span> <span>VisitKorea</span>
			</a>

			<!-- 검색 -->
			<div class="search">
				<svg class="ico-left" viewBox="0 0 20 20">
					<path
						d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" /></svg>
				<input type="text" placeholder="여행지, 테마, 축제 검색" />
				<svg class="ico-right" viewBox="0 0 20 20">
					<path
						d="M10 3.5a1.5 1.5 0 013 0V4a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-.5a1.5 1.5 0 000 3h.5a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-.5a1.5 1.5 0 00-3 0v.5a1 1 0 01-1 1H4a1 1 0 01-1-1v-3a1 1 0 00-1-1h-.5a1.5 1.5 0 010-3H2a1 1 0 001-1V6a1 1 0 011-1h3a1 1 0 001-1v-.5z" /></svg>
			</div>

			


			<div class="spacer"></div>

			<!-- 로그인 여부에 따라 다르게 표시 -->
			<div class="quick">
				<c:choose>
					<c:when test="${sessionScope.loginchk == 'ok'}">
						<!-- 로그인 상태 -->
						<div class="user-welcome">
							<span class="welcome-text"> <strong>${sessionScope.m_name}</strong>님
								안녕하세요
							</span>
						</div>
						<a href="/showMyPage" class="btn btn-outline">마이페이지</a>
						<a href="/membersLogout" class="btn">로그아웃</a>
					</c:when>
					<c:otherwise>
						<!-- 비로그인 상태 -->
						<a href="/membersLoginForm" class="btn btn-outline">로그인</a>
						<a href="/membersJoinForm" class="btn">회원가입</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</header>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const openapiBtn = document.getElementById('openapiBtn');
    
    if (openapiBtn) {
        openapiBtn.addEventListener('click', function() {
            window.location.href = '/themeTour';
        });
    }
});
</script>
