<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>VisitKorea - 아이디 찾기</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    :root{
      --bg:#ffffff;
      --text:#0b1b2b;
      --muted:#6b7684;
      --border:#e5e8eb;
      --input:#f8f9fa;
      --btn:#1f6feb;
      --btn-hover:#1b61d3;
      --focus:#4c9aff;
      --shadow:0 10px 25px rgba(0,0,0,.06);
      --radius:12px;
    }
    *{box-sizing:border-box}
    html,body{height:100%}
    body{
      margin:0;
      font-family:system-ui,-apple-system,Segoe UI,Roboto,Noto Sans KR,"Malgun Gothic",sans-serif;
      background:var(--bg); color:var(--text);
    }
    .wrap{min-height:100%; display:grid; place-items:center; padding:48px 16px;}
    .card{
      width:100%; max-width:840px;
      padding:32px 36px; border:1px solid var(--border);
      border-radius:20px; background:#fff; box-shadow:var(--shadow);
    }

    .brand{
      text-align:center; font-weight:800; font-size:38px; letter-spacing:.5px;
      margin:0 0 6px; color:#000;
    }
    .brand::before{
      content:""; display:inline-block; width:12px; height:12px; border-radius:50%;
      background:#1f6feb; margin-right:10px; vertical-align:middle; transform:translateY(-1px);
    }
    .subtitle{ text-align:center; margin:0 0 26px; color:#1f2937; font-size:18px; font-weight:700; }

    .section-title{ font-size:20px; font-weight:800; margin:6px 0 12px; }
    .section-desc{ color:var(--muted); margin:0 0 16px; }
    .box{
      border:1px solid var(--border); border-radius:14px; padding:18px 18px 12px; margin-bottom:16px;
      background:#fff;
    }
    .radio-row{ display:flex; align-items:center; gap:10px; margin:6px 0 10px; font-weight:700; }
    .row{ display:flex; align-items:center; gap:10px; margin:10px 0; }
    .label{ width:110px; color:#334155; font-weight:700; }
    .input{
      flex:1; height:40px; padding:0 12px;
      border:1px solid var(--border); border-radius:10px; background:var(--input);
      font-size:15px; outline:none; transition:border-color .15s, box-shadow .15s, background .15s;
    }
    .input:focus{ background:#fff; border-color:var(--focus); box-shadow:0 0 0 4px rgba(76,154,255,.15); }
    .btn{
      height:40px; padding:0 14px; border:none; border-radius:10px;
      background:var(--btn); color:#fff; font-weight:800; cursor:pointer;
    }
    .btn:hover{ background:var(--btn-hover); }

    .hint{ color:#9aa1a9; font-size:13px; margin-top:2px; }
    .divider{ height:1px; background:#f0f2f4; margin:14px 0; }

    .footer-actions{ display:flex; justify-content:center; margin-top:18px; }
    .btn-primary{ min-width:180px; height:46px; border-radius:12px; background:var(--btn); color:#fff; border:none; font-weight:800; cursor:pointer; }
    .btn-primary:hover{ background:var(--btn-hover); }

    .hidden{ display:none; }

    @media (max-width:640px){
      .row{ flex-direction:column; align-items:flex-start; }
      .label{ width:auto; }
    }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="card" aria-labelledby="title">
      <h1 id="title" class="brand">VisitKorea</h1>
      <p class="subtitle">아이디 찾는 방법을 선택해 주세요.</p>

      <h2 class="section-title">아이디찾기</h2>
      <p class="section-desc">원하시는 인증 방법을 선택하면 입력 폼이 펼쳐집니다.</p>

      <form id="findIdForm" method="post">
        <div class="box" id="emailBox">
          <label class="radio-row">
            <input type="radio" name="method" value="email" id="howEmail" checked>
            <span>본인확인 이메일로 인증</span>
          </label>
          <p class="section-desc" style="margin-top:-2px;">
            본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.
          </p>

          <div class="email-form" id="emailForm">
            <div class="row">
              <div class="label">이름</div>
              <input class="input" type="text" name="m_name" placeholder="이름 입력" id="nameEmail" autocomplete="off">
            </div>

            <div class="row">
              <div class="label">이메일 주소</div>
              <input class="input" type="email" name="m_email" placeholder="이메일 주소" id="email" autocomplete="off">
              <button type="button" class="btn" id="sendCodeBtn">인증번호 받기</button>
            </div>

            <div class="row">
              <div class="label">인증번호</div>
              <input class="input" type="text" placeholder="인증번호 6자리 숫자 입력" id="code" maxlength="6" disabled>
              <button type="button" class="btn" id="verifyBtn" disabled>확인</button>
            </div>
            <p class="hint">인증번호가 오지 않나요? 스팸함을 확인하거나, 이메일 주소를 다시 확인해 주세요.</p>
          </div>
        </div>

        <div class="box" id="phoneBox">
          <label class="radio-row">
            <input type="radio" name="method" value="phone" id="howPhone">
            <span>회원정보에 등록한 휴대전화로 인증</span>
          </label>

          <div class="hidden" id="phoneForm">
            <div class="row">
              <div class="label">이름</div>
              <input class="input" type="text" name="m_name_phone" placeholder="이름 입력" id="namePhone" autocomplete="off">
            </div>
            <div class="row">
              <div class="label">휴대전화</div>
              <input class="input" type="tel" name="m_phone" placeholder="010-1234-5678" id="phone" autocomplete="off">
            </div>
          </div>
        </div>

        <div class="footer-actions">
          <button class="btn-primary" type="submit">다음</button>
        </div>
      </form>
    </section>
  </main>

  <script>
    const howEmail = document.getElementById('howEmail');
    const howPhone = document.getElementById('howPhone');
    const emailForm = document.getElementById('emailForm');
    const phoneForm = document.getElementById('phoneForm');
    const findIdForm = document.getElementById('findIdForm');

    function toggleForms(){
      if (howEmail.checked){
        emailForm.classList.remove('hidden');
        phoneForm.classList.add('hidden');
        findIdForm.action = '/findIdByEmail';
      } else {
        emailForm.classList.add('hidden');
        phoneForm.classList.remove('hidden');
        findIdForm.action = '/findIdByPhone';
      }
    }
    howEmail.addEventListener('change', toggleForms);
    howPhone.addEventListener('change', toggleForms);
    toggleForms();

    $('#sendCodeBtn').on('click', function(){
      const name = $('#nameEmail').val();
      const email = $('#email').val();
      
      if (!name || !email) {
        alert('이름과 이메일을 입력해주세요.');
        return;
      }
      
      $(this).prop('disabled', true).text('발송 중...');
      
      $.ajax({
        url: '/sendCodeForFindId',
        type: 'post',
        data: { name: name, email: email },
        success: function(data){
          if(data === 'success'){
            alert('인증번호가 이메일로 전송되었습니다.');
            $('#code').prop('disabled', false);
            $('#verifyBtn').prop('disabled', false);
            $('#sendCodeBtn').text('재발송').prop('disabled', false);
          } else if(data === 'notfound'){
            alert('해당 정보로 가입된 회원이 없습니다.');
            $('#sendCodeBtn').text('인증번호 받기').prop('disabled', false);
          } else {
            alert('이메일 발송에 실패했습니다.');
            $('#sendCodeBtn').text('인증번호 받기').prop('disabled', false);
          }
        },
        error: function(){
          alert('서버 오류가 발생했습니다.');
          $('#sendCodeBtn').text('인증번호 받기').prop('disabled', false);
        }
      });
    });

    $('#verifyBtn').on('click', function(){
    	  const code = $('#code').val();
    	  
    	  if (!code) {
    	    alert('인증번호를 입력해주세요.');
    	    return;
    	  }
    	  
    	  $.ajax({
    	    url: '/verifyCodeForFindId',
    	    type: 'post',
    	    data: { code: code },
    	    success: function(data){
    	      if(data.startsWith('match:')){
    	        const foundId = data.split(':')[1];
    	        alert('인증 성공!\n회원님의 아이디는 "' + foundId + '" 입니다.');
    	        location.href = '/gotitle';
    	      } else if(data === 'mismatch'){
    	        alert('인증번호가 일치하지 않습니다.');
    	      } else if(data === 'expired'){
    	        alert('인증 시간이 초과되었습니다. 다시 시도해주세요.');
    	      } else {
    	        alert('인증에 실패했습니다.');
    	      }
    	    },
    	    error: function(){
    	      alert('서버 오류가 발생했습니다.');
    	    }
    	  });
    	});

    findIdForm.addEventListener('submit', function(e) {
      if (howPhone.checked) {
        const name = document.getElementById('namePhone').value;
        const phone = document.getElementById('phone').value;
        
        if (!name || !phone) {
          e.preventDefault();
          alert('모든 정보를 입력해주세요.');
          return;
        }
        
        this.action = '/findIdByPhone';
      } else {
        e.preventDefault();
        alert('이메일 인증을 완료해주세요.');
      }
    });
  </script>
</body>
</html>