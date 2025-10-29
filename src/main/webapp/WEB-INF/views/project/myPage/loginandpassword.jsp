
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>visitkorea - 비밀번호 찾기</title>
  <style>
    :root{
      --bg:#ffffff;
      --text:#0b1b2b;
      --muted:#6b7684;
      --border:#e5e8eb;
      --input:#f8f9fa;
      --brand:#12b886;        /* 상단 브랜드 포인트(연한 그린 톤 유지, 필요시 변경) */
      --btn:#1f6feb;          /* 다음 버튼 파란색 */
      --btn-hover:#1b61d3;
      --focus:#4c9aff;
      --shadow:0 10px 25px rgba(0,0,0,.06);
      --radius:14px;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Noto Sans KR, Apple SD Gothic Neo, "Malgun Gothic", sans-serif;
      background: var(--bg);
      color: var(--text);
    }
    .wrap{
      min-height:100%;
      display:grid;
      place-items:center;
      padding:48px 16px;
    }
    .card{
      width:100%;
      max-width:560px;
      padding:56px 48px 40px;
      border:1px solid var(--border);
      border-radius:24px;
      box-shadow: var(--shadow);
      background:#fff;
    }
    .brand{
      text-align:center;
      font-weight:800;
      font-size:40px;
      letter-spacing:.5px;
      margin:0 0 8px;
      color:var(--brand);
    }
    .subtitle{
      text-align:center;
      margin:0 0 28px;
      color:#1f2937;
      font-size:18px;
      line-height:1.55;
      font-weight:700;
    }

    .field{
      position:relative;
      margin:12px 0 18px;
    }
    .input{
      width:100%;
      height:56px;
      padding:0 16px 0 44px;
      border:1px solid var(--border);
      border-radius: var(--radius);
      background: var(--input);
      outline:none;
      font-size:16px;
      transition: border-color .15s, box-shadow .15s, background .15s;
    }
    .input:focus{
      background:#fff;
      border-color: var(--focus);
      box-shadow: 0 0 0 4px rgba(76,154,255,.15);
    }
    .icon{
      position:absolute;
      left:14px; top:50%;
      transform:translateY(-50%);
      width:20px; height:20px;
      opacity:.55;
    }
    .btn{
      display:block;
      width:100%;
      height:56px;
      border:none;
      border-radius: var(--radius);
      background: var(--btn);
      color:#fff;
      font-weight:800;
      font-size:18px;
      cursor:pointer;
      transition: background .15s, transform .02s ease-in-out;
    }
    .btn:hover{ background: var(--btn-hover); }
    .btn:active{ transform: translateY(1px); }

    .help{
      margin-top:14px;
      text-align:center;
      color: var(--muted);
      font-size:14px;
    }
    .help a{
      color:#1484ff;
      text-decoration:none;
      font-weight:700;
    }
    .help a:hover{
      text-decoration:underline;
    }

    .footer{
      margin-top:42px;
      text-align:center;
      color:#a0a7b3;
      font-size:13px;
      letter-spacing:.2px;
    }

    @media (max-width:480px){
      .card{padding:40px 18px 28px; border-radius:18px}
      .brand{font-size:34px}
      .subtitle{font-size:16px}
    }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="card" aria-labelledby="title">
      <h1 id="title" class="brand">visitkorea</h1>
      <p class="subtitle">비밀번호를 찾고자 하는 아이디를 입력해주세요.</p>

      <form action="#" method="post" autocomplete="on" novalidate>
        <label class="field" aria-label="아이디 입력">
          <!-- 간단한 user 아이콘 (SVG) -->
          <svg class="icon" viewBox="0 0 24 24" aria-hidden="true">
            <circle cx="12" cy="8" r="4" fill="currentColor"/>
            <path d="M4 20c0-4 4-6 8-6s8 2 8 6" fill="currentColor"/>
          </svg>
          <input class="input" type="text" name="userId"
                 placeholder="아이디 또는 단체 아이디" inputmode="email" />
        </label>

        <button type="submit" class="btn">다음</button>

        <p class="help">
          아이디가 기억나지 않는다면? <a href="#">아이디 찾기</a>
        </p>
      </form>

      <p class="footer">VISITKOREA | 회원정보 고객센터</p>
    </section>
  </main>
</body>
</html>
