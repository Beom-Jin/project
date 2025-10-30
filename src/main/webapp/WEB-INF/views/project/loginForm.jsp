<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VisitKorea 로그인</title>
<style>
:root {
  --ink:#0f172a;
  --muted:#64748b;
  --line:#e2e8f0;
  --brand:#2563eb;
  --brand-2:#06b6d4;
  --bg:#f8fafc;
  --white:#fff;
}

body {
	margin: 0;
	font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,sans-serif;
	background: var(--bg);
	color: var(--ink);
}

/* ====== 헤더 (VisitKorea 로고) ====== */
#header {
	max-width: 1200px;
	margin: 40px auto 10px;
	padding: 0 24px;
	text-align: center;
}

/* ====== 로고 스타일 ====== */
.title {
	font-size: 50px;
	font-weight: 900;
	display: inline-flex;
	align-items: center;
	gap: 10px;
	color: var(--ink);
	text-decoration: none;
}

/* ● 파란 점 추가 */
.title::before {
	content: "";
	width: 14px;
	height: 14px;
	border-radius: 50%;
	background: linear-gradient(135deg, var(--brand), var(--brand-2));
	display: inline-block;
}

/* 링크 상태 공통 스타일 */
.title:link,
.title:visited,
.title:hover,
.title:active {
	color: var(--ink);
	text-decoration: none;
}

.title:hover {
	filter: brightness(0.95);
	cursor: pointer;
}

/* ====== 컨테이너 ====== */
#container {
	width: min(600px, 90%);
	margin: 40px auto;
	background: var(--white);
	border: 1px solid var(--line);
	border-radius: 16px;
	padding: 36px 40px;
	box-shadow: 0 10px 30px rgba(2,6,23,.06);
}

h2 {
	text-align: center;
	margin: 0 0 24px;
	font-size: 24px;
}

fieldset { border: none; padding: 0; margin: 0; }
legend { display: none; }

ul { list-style: none; padding: 0; margin: 0; }

li {
	display: flex;
	align-items: center;
	gap: 12px;
	margin: 14px 0;
}

li label {
	width: 100px;
	text-align: right;
	color: var(--muted);
	font-weight: 600;
}

input[type="text"], input[type="password"] {
	flex: 1;
	padding: 10px 12px;
	border: 1px solid var(--line);
	border-radius: 10px;
	font-size: 15px;
}

input[type="text"]:focus, input[type="password"]:focus {
	outline: none;
	border-color: #93c5fd;
	box-shadow: 0 0 0 4px rgba(37,99,235,.15);
}

/* ====== 버튼 ====== */
#buttons {
	display: flex;
	justify-content: center;
	gap: 12px;
	margin: 24px 0 10px;
}

input[type="submit"], input[type="reset"] {
	width: 130px;
	padding: 10px 0;
	border-radius: 999px;
	border: 1px solid var(--line);
	font-weight: 700;
	background: var(--white);
	cursor: pointer;
}

input[type="submit"] {
	background: var(--brand);
	color: #fff;
	border-color: transparent;
}

input[type="submit"]:hover { filter: brightness(.95); }
input[type="reset"]:hover { background: #f1f5f9; }

/* ====== 회원가입 안내 ====== */
.signup {
	text-align: center;
	color: var(--muted);
	font-size: 14px;
}

.signup a {
	color: var(--brand);
	font-weight: 600;
	text-decoration: none;
}

/* ====== SNS 로그인 ====== */
#sns_login {
	margin-top: 32px;
	text-align: center;
}

#sns_login p {
	margin-bottom: 10px;
	color: var(--muted);
	font-weight: 600;
}

#sns_login a {
	display: inline-block;
	margin: 0 6px;
	width: 160px;
}

#sns_login a img {
	width: 100%;
	height: 44px;
	border-radius: 8px;
	display: block;
	object-fit: cover;
}
</style>
</head>

<body>
	<!-- ✅ 파란 점 + 클릭 시 메인홈 이동 -->
	<div id="header">
		<a class="title" href="<c:url value='/gotitle'/>">VisitKorea</a>
	</div>

	<div id="container">
		<h2>일반 로그인</h2>

<<<<<<< HEAD
<<<<<<< HEAD
		<form action="/membersLoginOK" method="post">
=======
		<form action="/membersLogin" method="post" autocomplete="off">
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
=======
		<form action="/membersLogin" method="post" autocomplete="off">
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
			<fieldset>
				<legend>로그인</legend>
				<ul>
					<li>
						<label for="m_id">ID</label>
<<<<<<< HEAD
<<<<<<< HEAD
						<input type="text" id="m_id" name="m_id" required>
					</li>
					<li>
						<label for="m_pw">PW</label>
						<input type="password" id="m_pw" name="m_pw" required>
=======
=======
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
						<input type="text" id="m_id" name="m_id" autocomplete="off" required>
					</li>
					<li>
						<label for="m_pw">PW</label>
						<input type="password" id="m_pw" name="m_pw" autocomplete="new-password" required>
<<<<<<< HEAD
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
=======
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
					</li>
				</ul>

				<div id="buttons">
					<input type="submit" value="로그인">
					<input type="reset" value="취소">
				</div>

				<div class="signup">
					회원 가입 하시겠습니까? 
					<a href="/membersJoinForm">회원가입</a>
				</div>
			
			
				<div class="signup">
					아이디 또는 비밀번호를 잊으셨습니까? 
					<a href="/findidorpassword">아이디 또는 비밀번호 찾기</a>
				</div>
			
			
			
			</fieldset>
		</form>

		<div id="sns_login">
			<p>SNS 계정으로 로그인</p>
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=c2ffaab66fa1da745f7177871cb07570&redirect_uri=http://localhost:8090/kakaologin">
				<img src='<c:url value="/resources/images/kakao_login_medium_narrow.png" />' alt="카카오 로그인">
			</a>
			<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=n4mbOLpaA5uQlZ15nhlp&state=STATE_STRING&redirect_uri=http://localhost:8090/naverlogin">
				<img src='<c:url value="/resources/images/login_naver.png" />' alt="네이버 로그인">
			</a>
		</div>
	</div>

	<c:if test="${loginchk == 'fail' }">
		<script>alert("아이디나 비밀번호가 틀렸습니다.");</script>
	</c:if>
	<c:if test="${sessionScope.loginchk == 'required' }">
		<script>alert("로그인 후 사용 가능");</script>
	</c:if>
</body>
<<<<<<< HEAD
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
=======
</html>
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
