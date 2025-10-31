<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VisitKorea - 비밀번호 찾기</title>
  <style>
    :root{
      --brand:#1f6feb;
      --brand-d:#1b61d3;
      --bg:#ffffff;
      --text:#111827;
      --muted:#6b7280;
      --line:#e5e7eb;
      --panel:#fff;
      --input:#f8fafc;
      --shadow:0 10px 24px rgba(0,0,0,.06);
      --radius:12px;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0; background:var(--bg); color:var(--text);
      font-family:system-ui,-apple-system,Segoe UI,Roboto,Noto Sans KR,"Malgun Gothic",sans-serif;
    }
    .topbar{ background:var(--brand); color:#fff; }
    .topbar .inner{
      max-width:1080px; margin:0 auto; padding:12px 16px;
      display:flex; align-items:center; gap:18px;
    }
    .brand{
      font-weight:800; letter-spacing:.2px; display:flex; align-items:center; gap:10px; margin-right:auto;
    }
    .brand::before{
      content:""; width:10px; height:10px; border-radius:50%; background:#fff; opacity:.9; display:inline-block;
    }
    .tabs{ display:flex; gap:8px; }
    .tab{
      color:#e7f0ff; text-decoration:none; font-weight:700;
      padding:8px 12px; border-radius:10px; opacity:.95;
    }
    .tab.active{ background:#0f58d9; color:#fff; opacity:1; }
    .wrap{ max-width:980px; margin:28px auto 56px; padding:0 16px; }
    .path{ color:#9aa1a9; font-size:13px; text-align:right; margin-top:-6px; }
    h1.title{ font-size:22px; margin:10px 0 8px; font-weight:800; }
    .desc{ color:var(--muted); margin:0 0 16px; }
    .panel{
      border:1px solid var(--line); border-radius:16px; background:var(--panel);
      box-shadow:var(--shadow); padding:18px 22px; margin-bottom:18px;
    }
    .row{ display:flex; align-items:center; gap:10px; margin:12px 0; }
    .radio{ display:flex; align-items:center; gap:10px; font-weight:700; }
    .sub{ color:var(--muted); font-size:14px; margin:4px 0 0 26px; }
    .divider{ height:1px; background:#eef1f4; margin:12px 0; }
    
    /* 입력 필드 추가 */
    .input-group{ margin:16px 0; }
    .input-group label{ display:block; font-weight:700; margin-bottom:8px; color:var(--text); }
    .input{ 
      width:100%; height:40px; padding:0 12px; border:1px solid var(--line); 
      border-radius:10px; background:var(--input); font-size:15px;
    }
    .input:focus{ 
      outline:none; border-color:var(--brand); 
      box-shadow:0 0 0 4px rgba(31,111,235,.15); background:#fff; 
    }
    
    .info-box{
      background:#f1f5f9; border-radius:10px; padding:16px; margin-bottom:16px;
    }
    .info-box .label{ font-size:13px; color:var(--muted); margin-bottom:4px; }
    .info-box .value{ font-size:18px; font-weight:700; color:var(--text); }
    
    .footer-actions{ display:flex; justify-content:center; margin-top:22px; }
    .btn{
      min-width:180px; height:46px; border:none; border-radius:12px;
      background:var(--brand); color:#fff; font-weight:800; cursor:pointer;
      box-shadow:0 6px 20px rgba(31,111,235,.25);
    }
    .btn:hover{ background:var(--brand-d); }
    
    @media (max-width:640px){
      .tabs{ display:none; }
    }
  </style>
</head>
<body>
  <header class="topbar">
    <div class="inner">
      <div class="brand">VisitKorea</div>
      <nav class="tabs" aria-label="계정 복구"></nav>
    </div>
  </header>
  
  <main class="wrap">
    <h1 class="title">비밀번호 찾기</h1>
    <p class="desc">본인 확인을 위해 정보를 입력해주세요.</p>
    
    <!-- 아이디 표시 -->
    <div class="info-box">
      <div class="label">아이디</div>
      <div class="value">${m_id}</div>
    </div>
    
    <!-- 인증 방법 선택 -->
    <section class="panel">
      <form action="/resetPassword" method="post">
        <input type="hidden" name="m_id" value="${m_id}">
        
        <div class="input-group">
          <label for="m_name">이름</label>
          <input type="text" name="m_name" id="m_name" class="input" 
                 placeholder="가입 시 입력한 이름" autocomplete="off" required>
        </div>
        
        <div class="input-group">
          <label for="m_email">이메일</label>
          <input type="email" name="m_email" id="m_email" class="input" 
                 placeholder="가입 시 입력한 이메일" autocomplete="off" required>
        </div>
        
        <div class="divider"></div>
        
        <div class="footer-actions">
          <button class="btn" type="submit">비밀번호 재설정</button>
        </div>
      </form>
    </section>
  </main>
</body>
</html>