<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="../resources/css/top.css" rel="stylesheet">
<link href="../resources/css/nav.css" rel="stylesheet">
<link href="../resources/css/bottom.css" rel="stylesheet">
<link href="../resources/css/mainHomePage.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style type="text/css">
	h2{
		text-align: center;
	}
	

</style>

</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<jsp:include page="../nav.jsp"></jsp:include>
	<br>
	<h2>마이 페이지</h2>
	<br>
	<br>
	<section class="container">
		<div class="grid cols-4">
			<a href="/showInformationUpdateForm">
				<article class="card">
					<div class="thumb">
						<img
							src="https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2558760599.jpg"
							alt="프로필">
					</div>
					<div class="meta">
						<div class="title">개인정보 수정하기</div>
						<p class="desc">개인정보를 수정할 수 있습니다.</p>
					</div>
				</article>
			</a> 
			<a href="/showBookmark">
				<article class="card">
					<div class="thumb">
						<img
							src="https://www.shutterstock.com/image-vector/bookmark-symbol-icon-vector-design-600nw-1430282765.jpg"
							alt="북마크">
					</div>
					<div class="meta">
						<div class="title">북마크 보기</div>
						<p class="desc">북마크한 관광지를 볼 수 있습니다.</p>
					</div>
				</article>
			</a>
			<a href="/showTravelReview">
				<article class="card">
					<div class="thumb">
						<img
							src="https://cdn-icons-png.flaticon.com/512/1355/1355036.png"
							alt="여행후기">
					</div>
					<div class="meta">
						<div class="title">여행 후기내역 보기</div>
						<p class="desc">작성한 여행 후기를 볼 수 있습니다.</p>
					</div>
				</article>
				<a href="/showQuestionList">
				<article class="card">
					<div class="thumb">
						<img
							src="https://www.shutterstock.com/image-vector/black-question-mark-silhouette-isolated-600nw-2470080699.jpg"
							alt="질문">
					</div>
					<div class="meta">
						<div class="title">질문 내역 보기</div>
						<p class="desc">질문한 내역을 볼 수 있습니다.</p>
					</div>
				</article>
					</a>
				
		</div>
	</section>

	<jsp:include page="../bottom.jsp"></jsp:include>
</body>
</html>