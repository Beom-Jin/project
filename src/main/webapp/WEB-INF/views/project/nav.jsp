<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 내비 -->
	
	<nav>
		<div class="nav-wrap" role="navigation" aria-label="주요 카테고리">
			<a class="nav-link" href="/showMap" target="_self">지역별 여행</a>
			<a class="nav-link" href="/gothema" target="_self">테마별 여행</a> 
			<a class="nav-link" href="/eventMap" target="_self">축제⦁ 행사</a> 
		</div>
	</nav>
	<script>
	function goMyPage(){
	if("${sessionScope.loginchk}" !== "ok")
	{
		alert("로그인 이후 작성 가능합니다.");
		return;
	}else{
		location.href="/showMyPage";
	}
	}
	</script>
</body>
</html>