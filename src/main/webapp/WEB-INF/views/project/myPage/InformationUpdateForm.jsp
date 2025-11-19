<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>개인정보 수정 | VisitKorea</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
:root{
  --ink:#0f172a; --muted:#64748b; --line:#e2e8f0;
  --brand:#2563eb; --brand-2:#06b6d4;
  --bg:#f8fafc; --white:#fff;
}

*{box-sizing:border-box}

body{
  margin:0;
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,sans-serif;
  background:var(--bg);
  color:var(--ink);
}

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

#container{
  width:min(760px, 92%);
  margin:40px auto;
  background:var(--white);
  border:1px solid var(--line);
  border-radius:16px;
  padding:32px 28px;
  box-shadow:0 10px 30px rgba(2,6,23,.06);
  overflow:hidden;
}

h2{
  text-align:center; margin:0 0 16px; font-size:26px;
}
hr{border:none; border-top:1px solid var(--line); margin:8px 0 20px}

.form-grid{
  display:grid;
  grid-template-columns: 140px 1fr;
  gap:14px 14px;
  align-items:center;
}

.form-grid label{
  text-align:right;
  color:var(--muted);
  font-weight:700;
  padding-right:6px;
  white-space:nowrap;
}

.form-grid input[type="text"],
.form-grid input[type="password"],
.form-grid input[type="email"],
.form-grid input[type="number"],
.form-grid select{
  width:100%;
  max-width:100%;
  min-width:0;
  padding:10px 12px;
  border:1px solid var(--line);
  border-radius:10px;
  font-size:15px;
  background:#fff;
}
.form-grid input:focus, .form-grid select:focus{
  outline:none; border-color:#93c5fd; box-shadow:0 0 0 4px rgba(37,99,235,.12);
}

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

.id-check-result{
  grid-column: 2;
  font-size: 14px;
  margin-top: -10px;
}

.actions{
  display:flex; justify-content:center; margin-top:18px;
}
.actions input[type="submit"]{
  width:220px; padding:12px 0; font-weight:700;
  background:var(--brand); color:#fff; border-radius:999px;
  border:1px solid var(--line); cursor:pointer;
}
.actions input[type="submit"]:hover{ filter:brightness(.95); }

@media (max-width:640px){
  .form-grid{ grid-template-columns: 1fr; }
  .form-grid label{ text-align:left; }
}
#cancel_button{
	border-radius: 999px;
    border: 1px solid var(--line);
    background: #fff;
    align-items: center;
	margin-left : 10px;
	margin-right : 10px;
}
</style>

</head>
<body>

  <div id="header">
    <a class="title" href="<c:url value='/gotitle'/>">VisitKorea</a>
  </div>

  <div id="container">
    <h2>개인정보 수정</h2>
    <hr>

    <form action="/informationupdateOk" method="post" >
      <div class="form-grid">
        <label for="m_name">이름(수정불가)</label>
        <input id="m_name" name="m_name" type="text" value="${mvo.m_name }"  readonly>

        <label for="m_id">ID(수정불가)</label>
        <div class="id-row">
          <input id="m_id" name="m_id" type="text" value="${mvo.m_id }" readonly>
        </div>
        



        <label for="m_email">이메일(수정불가)</label>
        <input id="m_email" name="m_email" type="email" value="${mvo.m_email }" autocomplete="off" readonly>

        <label for="m_tel">전화번호</label>
        <input id="m_tel" name="m_tel" type="text" value="${mvo.m_tel }" autocomplete="off">

        <label for="m_gender">성별</label>
        <select id="m_gender" name="m_gender" autocomplete="off" >
          <option value="" ${mvo.m_gender == null ? 'selected' : ''}>선택</option>
          <option value="남" ${mvo.m_gender == '남' ? 'selected' : ''}>남성</option>
          <option value="여" ${mvo.m_gender == '여' ? 'selected' : ''}>여성</option>
        </select>

        <label for="m_age">나이</label>
        <input id="m_age" name="m_age" type="number" min="1" max="120" placeholder="나이" autocomplete="off" value="${mvo.m_age}">


        <label for="m_hobby1">취미 1</label>
        <input id="m_hobby1" name="m_hobby1" type="text" autocomplete="off" value="${mvo.m_hobby1}">

        <label for="m_hobby2">취미 2</label>
        <input id="m_hobby2" name="m_hobby2" type="text" autocomplete="off" value="${mvo.m_hobby2}">

        <label for="m_hobby3">취미 3</label>
        <input id="m_hobby3" name="m_hobby3" type="text" autocomplete="off" value="${mvo.m_hobby3}">

        <label for="m_hobby4">취미 4</label>
        <input id="m_hobby4" name="m_hobby4" type="text" autocomplete="off" value="${mvo.m_hobby4}">
      </div>

      <div class="actions">
        <input type="submit" value="개인정보 수정">
        <button id="cancel_button">취소</button>
      </div>
    </form>
  </div>
</body>
</html>
