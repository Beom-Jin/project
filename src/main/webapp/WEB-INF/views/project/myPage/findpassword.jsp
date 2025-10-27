<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>VisitKorea - 비밀번호 찾기</title>
  <style>
    :root{
      --brand:#1f6feb;     /* 상단 파란 줄 및 포인트 */
      --brand-d:#1b61d3;   /* hover */
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

    /* 상단 바 + 단계 탭 */
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

    /* 본문 */
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

    .footer-actions{ display:flex; justify-content:center; margin-top:22px; }
    .btn{
      min-width:180px; height:46px; border:none; border-radius:12px;
      background:var(--brand); color:#fff; font-weight:800; cursor:pointer;
      box-shadow:0 6px 20px rgba(31,111,235,.25);
    }
    .btn:hover{ background:var(--brand-d); }

    /* 입력폼(옵션) */
    .input{ height:40px; padding:0 12px; border:1px solid var(--line); border-radius:10px; background:var(--input); }
    .input:focus{ outline:none; border-color:var(--brand); box-shadow:0 0 0 4px rgba(31,111,235,.15); background:#fff; }

    @media (max-width:640px){
      .tabs{ display:none; }
    }
  </style>
</head>
<body>
  <!-- 상단 파란 줄 -->
  <header class="topbar">
    <div class="inner">
       <div class="brand">VisitKorea</div>
      <nav class="tabs" aria-label="계정 복구">
       
      </nav>
    </div>
  </header>

  <main class="wrap">
    
    <h1 class="title">비밀번호 찾기</h1>
    <p class="desc">비밀번호를 찾을 방법을 선택해 주세요.</p>

    <!-- 상단 인증 선택 패널 -->
    <section class="panel">
      <label class="radio">
        <input type="radio" name="how" checked>
        <span>회원정보에 등록한 휴대전화로 인증 <span style="color:#9aa1a9; font-weight:500;">(+** *-**-****)</span></span>
      </label>

      <div class="divider"></div>

      <label class="radio">
        <input type="radio" name="how">
        <span>본인확인 이메일로 인증 <span style="color:#9aa1a9; font-weight:500;">(st******@j*******.naver.com)</span></span>
      </label>
    </section>


    <div class="footer-actions">
      <button class="btn" type="button">다음</button>
    </div>
  </main>
</body>
</html>


    