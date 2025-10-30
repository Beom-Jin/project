<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입 | VisitKorea</title>
<<<<<<< HEAD
=======
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
<style>
:root{
  --ink:#0f172a; --muted:#64748b; --line:#e2e8f0;
  --brand:#2563eb; --brand-2:#06b6d4;
  --bg:#f8fafc; --white:#fff;
}

<<<<<<< HEAD
*{box-sizing:border-box} /* ✅ 오버플로우 방지 기본값 */
=======
*{box-sizing:border-box}
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

body{
  margin:0;
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,sans-serif;
  background:var(--bg);
  color:var(--ink);
}

<<<<<<< HEAD
/* ===== 헤더(파란 점 + 로고, 클릭시 메인) ===== */
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
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

<<<<<<< HEAD
/* ===== 카드 컨테이너 ===== */
#container{
  width:min(760px, 92%);           /* ✅ 카드 너비 고정 + 반응형 */
=======
#container{
  width:min(760px, 92%);
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
  margin:40px auto;
  background:var(--white);
  border:1px solid var(--line);
  border-radius:16px;
<<<<<<< HEAD
  padding:32px 28px;               /* ✅ 내부 패딩 */
  box-shadow:0 10px 30px rgba(2,6,23,.06);
  overflow:hidden;                 /* ✅ 혹시 모를 넘침 가림 */
=======
  padding:32px 28px;
  box-shadow:0 10px 30px rgba(2,6,23,.06);
  overflow:hidden;
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
}

h2{
  text-align:center; margin:0 0 16px; font-size:26px;
}
hr{border:none; border-top:1px solid var(--line); margin:8px 0 20px}

<<<<<<< HEAD
/* ===== 폼 레이아웃: 2열 그리드(라벨/필드) ===== */
.form-grid{
  display:grid;
  grid-template-columns: 140px 1fr;  /* ✅ 라벨 고정폭 / 입력 유동폭 */
=======
.form-grid{
  display:grid;
  grid-template-columns: 140px 1fr;
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
  gap:14px 14px;
  align-items:center;
}

<<<<<<< HEAD
/* 라벨 */
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
.form-grid label{
  text-align:right;
  color:var(--muted);
  font-weight:700;
  padding-right:6px;
  white-space:nowrap;
}

<<<<<<< HEAD
/* 모든 입력 요소 공통: 카드 밖으로 절대 안 나가게 */
.form-grid input[type="text"],
.form-grid input[type="password"],
.form-grid select{
  width:100%;
  max-width:100%;    /* ✅ 부모 폭 초과 금지 */
  min-width:0;       /* ✅ flex/grid 초과 방지 */
=======
.form-grid input[type="text"],
.form-grid input[type="password"],
.form-grid input[type="email"],
.form-grid input[type="number"],
.form-grid select{
  width:100%;
  max-width:100%;
  min-width:0;
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
  padding:10px 12px;
  border:1px solid var(--line);
  border-radius:10px;
  font-size:15px;
  background:#fff;
}
.form-grid input:focus, .form-grid select:focus{
  outline:none; border-color:#93c5fd; box-shadow:0 0 0 4px rgba(37,99,235,.12);
}

<<<<<<< HEAD
/* 여러 칸이 한 줄에 들어가는 행(주민번호/휴대폰/이메일 앞부분) */
.inline{
  display:flex; gap:10px; align-items:center; flex-wrap:nowrap;
}
.inline > input{ flex:1 1 0; min-width:0; } /* ✅ 칸들이 균등하게 맞춤 */
.inline > select{ flex:0 0 140px; }         /* 이메일 도메인 드롭다운 폭 */

/* ID 중복확인 버튼이 입력을 밀어내지 않도록 */
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
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

<<<<<<< HEAD
/* 제출 버튼 */
=======
.id-check-result{
  grid-column: 2;
  font-size: 14px;
  margin-top: -10px;
}

>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
.actions{
  display:flex; justify-content:center; margin-top:18px;
}
.actions input[type="submit"]{
  width:220px; padding:12px 0; font-weight:700;
  background:var(--brand); color:#fff; border-radius:999px;
  border:1px solid var(--line); cursor:pointer;
}
.actions input[type="submit"]:hover{ filter:brightness(.95); }

<<<<<<< HEAD
/* ===== 반응형: 폭이 좁아지면 1열로 자동 전환 ===== */
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
@media (max-width:640px){
  .form-grid{ grid-template-columns: 1fr; }
  .form-grid label{ text-align:left; }
}
</style>
<<<<<<< HEAD
</head>
<body>

  <!-- 파란 점 + VisitKorea 로고 (메인 이동) -->
=======
<script>
let idChecked = false;

function checkId() {
    const m_id = $("#m_id").val();
    
    if(m_id.trim() === "") {
        alert("아이디를 입력하세요.");
        return;
    }
    
    $.ajax({
        url: "/checkId",
        type: "post",
        data: { m_id: m_id },
        success: function(data) {
            if(data === "available") {
                $("#id-check-result").html("✔ 사용 가능한 아이디입니다.").css("color", "green");
                idChecked = true;
            } else if(data === "duplicate") {
                $("#id-check-result").html("✖ 이미 사용 중인 아이디입니다.").css("color", "red");
                idChecked = false;
            } else {
                alert("오류가 발생했습니다.");
                idChecked = false;
            }
        },
        error: function() {
            alert("서버 오류가 발생했습니다.");
            idChecked = false;
        }
    });
}

function validateForm() {
    if(!idChecked) {
        alert("아이디 중복확인을 해주세요.");
        return false;
    }
    
    const pw = $("#m_pw").val();
    const pwConfirm = $("#m_pw_confirm").val();
    
    if(pw !== pwConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }
    
    return true;
}

$(document).ready(function() {
    $("#m_id").on("input", function() {
        idChecked = false;
        $("#id-check-result").html("");
    });
});
</script>
</head>
<body>

>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
  <div id="header">
    <a class="title" href="<c:url value='/gotitle'/>">VisitKorea</a>
  </div>

  <div id="container">
    <h2>회원가입</h2>
    <hr>

<<<<<<< HEAD
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
=======
    <form action="/membersJoin" method="post" onsubmit="return validateForm()" autocomplete="off">
      <div class="form-grid">
        <label for="m_name">이름 *</label>
        <input id="m_name" name="m_name" type="text" placeholder="이름을 입력하세요" autocomplete="off" required>

        <label for="m_id">ID *</label>
        <div class="id-row">
          <input id="m_id" name="m_id" type="text" placeholder="ID를 입력하세요" autocomplete="off" required>
          <button type="button" onclick="checkId()">중복확인</button>
        </div>
        
        <span></span>
        <div id="id-check-result" class="id-check-result"></div>

        <label for="m_pw">비밀번호 *</label>
        <input id="m_pw" name="m_pw" type="password" placeholder="비밀번호를 입력하세요" autocomplete="new-password" required>

        <label for="m_pw_confirm">비밀번호 확인 *</label>
        <input id="m_pw_confirm" type="password" placeholder="비밀번호를 다시 입력하세요" autocomplete="new-password" required>

        <label for="m_email">이메일 *</label>
        <input id="m_email" name="m_email" type="email" placeholder="example@example.com" autocomplete="off" required>

        <label for="m_tel">전화번호</label>
        <input id="m_tel" name="m_tel" type="text" placeholder="010-1234-5678" autocomplete="off">

        <label for="m_gender">성별</label>
        <select id="m_gender" name="m_gender" autocomplete="off">
          <option value="">선택</option>
          <option value="남">남성</option>
          <option value="여">여성</option>
        </select>

        <label for="m_age">나이</label>
        <input id="m_age" name="m_age" type="number" min="1" max="120" placeholder="나이" autocomplete="off">

        <label for="m_int">관심사</label>
        <input id="m_int" name="m_int" type="text" placeholder="예: 여행, 사진" autocomplete="off">

        <label for="m_hobby1">취미 1</label>
        <input id="m_hobby1" name="m_hobby1" type="text" autocomplete="off">

        <label for="m_hobby2">취미 2</label>
        <input id="m_hobby2" name="m_hobby2" type="text" autocomplete="off">

        <label for="m_hobby3">취미 3</label>
        <input id="m_hobby3" name="m_hobby3" type="text" autocomplete="off">

        <label for="m_hobby4">취미 4</label>
        <input id="m_hobby4" name="m_hobby4" type="text" autocomplete="off">
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
      </div>

      <div class="actions">
        <input type="submit" value="회원가입 신청">
      </div>
    </form>
  </div>
</body>
</html>
