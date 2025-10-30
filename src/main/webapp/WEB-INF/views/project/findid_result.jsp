<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기 결과 | VisitKorea</title>
<style>
:root {
  --ink:#0f172a; --muted:#64748b; --line:#e2e8f0;
  --brand:#2563eb; --brand-2:#06b6d4;
  --bg:#f8fafc; --white:#fff;
}

* {box-sizing:border-box}

body {
  margin:0;
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,sans-serif;
  background:var(--bg);
  color:var(--ink);
  display:flex;
  justify-content:center;
  align-items:center;
  min-height:100vh;
}

.container {
  width:min(500px, 90%);
  background:var(--white);
  border:1px solid var(--line);
  border-radius:16px;
  padding:48px 40px;
  box-shadow:0 10px 30px rgba(2,6,23,.06);
  text-align:center;
}

.logo {
  font-size:42px;
  font-weight:900;
  display:inline-flex;
  align-items:center;
  gap:10px;
  color:var(--ink);
  margin-bottom:24px;
}

.logo::before {
  content:"";
  width:12px;
  height:12px;
  border-radius:50%;
  background:linear-gradient(135deg,var(--brand),var(--brand-2));
  display:inline-block;
}

.success-icon {
  width:80px;
  height:80px;
  margin:0 auto 24px;
  background:linear-gradient(135deg,#10b981,#059669);
  border-radius:50%;
  display:flex;
  align-items:center;
  justify-content:center;
}

.success-icon svg {
  width:48px;
  height:48px;
  fill:#fff;
}

.title {
  font-size:24px;
  font-weight:700;
  margin-bottom:16px;
}

.subtitle {
  font-size:16px;
  color:var(--muted);
  margin-bottom:32px;
}

.result-box {
  background:#f1f5f9;
  border-radius:12px;
  padding:24px;
  margin:24px 0;
}

.result-box .label {
  font-size:14px;
  color:var(--muted);
  margin-bottom:8px;
}

.result-box .value {
  font-size:28px;
  font-weight:700;
  color:var(--brand);
  letter-spacing:2px;
}

.join-date {
  font-size:14px;
  color:var(--muted);
  margin-top:8px;
}

.btn-group {
  display:flex;
  gap:12px;
  margin-top:32px;
}

.btn {
  flex:1;
  padding:14px 0;
  border:none;
  border-radius:10px;
  font-size:16px;
  font-weight:700;
  cursor:pointer;
}

.btn-primary {
  background:var(--brand);
  color:#fff;
}

.btn-primary:hover {
  filter:brightness(.95);
}

.btn-secondary {
  background:#fff;
  color:var(--ink);
  border:1px solid var(--line);
}

.btn-secondary:hover {
  background:#f8fafc;
}
</style>
</head>
<body>

<div class="container">
  <div class="logo">VisitKorea</div>

  <c:choose>
    <c:when test="${not empty foundId}">
      <div class="success-icon">
        <svg viewBox="0 0 24 24">
          <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/>
        </svg>
      </div>

      <h1 class="title">아이디를 찾았습니다</h1>
      <p class="subtitle">회원님의 아이디 정보입니다.</p>

      <div class="result-box">
        <div class="label">아이디</div>
        <div class="value">${foundId}</div>
        <c:if test="${not empty regDate}">
          <div class="join-date">가입일: ${regDate}</div>
        </c:if>
      </div>

      <div class="btn-group">
        <button class="btn btn-secondary" onclick="location.href='/membersLoginForm'">
          로그인
        </button>
        <button class="btn btn-primary" onclick="location.href='/findidorpassword'">
          비밀번호 찾기
        </button>
      </div>
    </c:when>

    <c:otherwise>
      <h1 class="title">아이디를 찾을 수 없습니다</h1>
      <p class="subtitle">입력하신 정보와 일치하는 아이디가 없습니다.</p>

      <div class="btn-group">
        <button class="btn btn-secondary" onclick="location.href='/getid'">
          다시 시도
        </button>
        <button class="btn btn-primary" onclick="location.href='/membersJoinForm'">
          회원가입
        </button>
      </div>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>