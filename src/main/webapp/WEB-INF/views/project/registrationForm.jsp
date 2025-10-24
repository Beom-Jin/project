<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 | VisitKorea</title>
<style>
:root{
  --ink:#0f172a; --muted:#64748b; --line:#e2e8f0;
  --brand:#2563eb; --brand-2:#06b6d4;
  --bg:#f8fafc; --white:#fff;
}

*{box-sizing:border-box} /* ✅ 오버플로우 방지 기본값 */

body{
  margin:0;
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,sans-serif;
  background:var(--bg);
  color:var(--ink);
}

/* ===== 헤더(파란 점 + 로고, 클릭시 메인) ===== */
#header{
  max-width:1200px;
  margin:40px auto 10px;
  padding:0 24px;
  text-align:center;
}
.title{
  font-size:50px; font-weight:900;
  display:inline-flex; align-items:center; gap:10px;
  color:var(--ink); text-decoration:none;
}
.title::before{
  content:""; width:14px; height:14px; border-radius:50%;
  background:linear-gradient(135deg,var(--brand),var(--brand-2));
  display:inline-block;
}
.title:link,.title:visited,.title:hover,.title:active{
  color:var(--ink); text-decoration:none;
}

/* ===== 카드 컨테이너 ===== */
#container{
  width:min(760px, 92%);           /* ✅ 카드 너비 고정 + 반응형 */
  margin:40px auto;
  background:var(--white);
  border:1px solid var(--line);
  border-radius:16px;
  padding:32px 28px;               /* ✅ 내부 패딩 */
  box-shadow:0 10px 30px rgba(2,6,23,.06);
  overflow:hidden;                 /* ✅ 혹시 모를 넘침 가림 */
}

h2{
  text-align:center; margin:0 0 16px; font-size:26px;
}
hr{border:none; border-top:1px solid var(--line); margin:8px 0 20px}

/* ===== 폼 레이아웃: 2열 그리드(라벨/필드) ===== */
.form-grid{
  display:grid;
  grid-template-columns: 140px 1fr;  /* ✅ 라벨 고정폭 / 입력 유동폭 */
  gap:14px 14px;
  align-items:center;
}

/* 라벨 */
.form-grid label{
  text-align:right;
  color:var(--muted);
  font-weight:700;
  padding-right:6px;
  white-space:nowrap;
}

/* 모든 입력 요소 공통: 카드 밖으로 절대 안 나가게 */
.form-grid input[type="text"],
.form-grid input[type="password"],
.form-grid select{
  width:100%;
  max-width:100%;    /* ✅ 부모 폭 초과 금지 */
  min-width:0;       /* ✅ flex/grid 초과 방지 */
  padding:10px 12px;
  border:1px solid var(--line);
  border-radius:10px;
  font-size:15px;
  background:#fff;
}
.form-grid input:focus, .form-grid select:focus{
  outline:none; border-color:#93c5fd; box-shadow:0 0 0 4px rgba(37,99,235,.12);
}

/* 여러 칸이 한 줄에 들어가는 행(주민번호/휴대폰/이메일 앞부분) */
.inline{
  display:flex; gap:10px; align-items:center; flex-wrap:nowrap;
}
.inline > input{ flex:1 1 0; min-width:0; } /* ✅ 칸들이 균등하게 맞춤 */
.inline > select{ flex:0 0 140px; }         /* 이메일 도메인 드롭다운 폭 */

/* ID 중복확인 버튼이 입력을 밀어내지 않도록 */
.id-row{
  display:flex; gap:10px; align-items:center;
}
.id-row input{ flex:1 1 auto; min-width:0; }
.id-row button{
  flex:0 0 auto; padding:10px 14px;
  border:1px solid var(--line); border-radius:10px;
  background:#f8fafc; cursor:pointer; font-weight:600;
}
.id-row button:hover{ background:#eef2ff; }

/* 제출 버튼 */
.actions{
  display:flex; justify-content:center; margin-top:18px;
}
.actions input[type="submit"]{
  width:220px; padding:12px 0; font-weight:700;
  background:var(--brand); color:#fff; border-radius:999px;
  border:1px solid var(--line); cursor:pointer;
}
.actions input[type="submit"]:hover{ filter:brightness(.95); }

/* ===== 반응형: 폭이 좁아지면 1열로 자동 전환 ===== */
@media (max-width:640px){
  .form-grid{ grid-template-columns: 1fr; }
  .form-grid label{ text-align:left; }
}
</style>
</head>
<body>

  <!-- 파란 점 + VisitKorea 로고 (메인 이동) -->
  <div id="header">
    <a class="title" href="<c:url value='/gotitle'/>">VisitKorea</a>
  </div>

  <div id="container">
    <h2>회원가입</h2>
    <hr>

    <form action="/registrationOk" method="post">
      <div class="form-grid">
        <!-- 이름 -->
        <label for="name">이름</label>
        <input id="name" type="text" placeholder="이름을 입력하세요" required>

        <!-- 주민등록번호 -->
        <label>주민등록번호</label>
        <div class="inline">
          <input type="text" placeholder="주민등록번호" required>
          <span>-</span>
          <input type="text" placeholder="주민등록번호" required>
        </div>

        <!-- ID + 중복확인 -->
        <label for="uid">ID</label>
        <div class="id-row">
          <input id="uid" type="text" placeholder="ID를 입력하세요" required>
          <button type="button">중복확인</button>
        </div>

        <!-- 비밀번호 -->
        <label for="pw">비밀번호</label>
        <input id="pw" type="password" placeholder="비밀번호를 입력하세요" required>

        <!-- 비밀번호 확인 -->
        <label for="pw2">비밀번호 확인</label>
        <input id="pw2" type="password" placeholder="비밀번호를 다시 입력하세요" required>

        <!-- 휴대폰 번호 -->
        <label>휴대폰 번호</label>
        <div class="inline">
          <input type="text" required>
          <span>-</span>
          <input type="text" required>
          <span>-</span>
          <input type="text" required>
        </div>

        <!-- 이메일 -->
        <label for="email">이메일</label>
        <div class="inline">
          <input id="email" type="text" placeholder="이메일을 입력하세요" required>
          <span>@</span>
          <select>
            <option value="naver.com">naver.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="daum.net">daum.net</option>
            <option value="">직접 입력</option>
          </select>
        </div>
      </div>

      <div class="actions">
        <input type="submit" value="회원가입 신청">
      </div>
    </form>
  </div>
</body>
</html>
