<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>VisitKorea 스타일 데모</title>
  
  <link href="/resources/css/sup.css" rel="stylesheet">

 <style>
 /* ---------- 서브메뉴 (드롭다운) ---------- */
.submenu {
  display: none;
  position: absolute;  /* 절대 위치로 떠 있게 */
  top: 120%;           /* 부모 메뉴 바로 아래에 붙도록 */
  left: 0;
  background: #f9fafb;
  border: 1px solid var(--line);
  border-radius: 8px;
  padding: 8px 12px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  min-width: 160px;
  z-index: 1000;       /* 다른 요소 위로 */
}

.has-sub {
  position: relative; /* submenu의 기준 위치 */
}

.submenu a {
  padding: 6px 0;
  white-space: nowrap; /* 줄바꿈 방지 */
  font-size: 14px;
  color: var(--ink-2);
}

.submenu a:hover {
  color: var(--ink);
  font-weight: 600;
}

/* hover 시만 보이게 */
.has-sub:hover .submenu {
  display: flex;
  flex-direction: column;
}

:root {
  --bg: #ffffff;
  --ink: #0f172a;
  --ink-2: #334155;
  --muted: #64748b;
  --line: #e2e8f0;
  --brand: #2563eb;
  --radius: 12px;
  --max: 1000px;
  --shadow: rgba(0,0,0,0.05) 0 2px 6px;
}

body {
  font-family: "Pretendard", "Noto Sans KR", sans-serif;
  background: var(--bg);
  color: var(--ink);
  margin: 0;
  padding: 20px;
}

.notice-wrap {
  max-width: var(--max);
  margin: 0 auto;
}

.notice-wrap h2 {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 12px;
}

.notice-header {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 12px;
  gap: 6px;
}

.notice-header input {
  border: 1px solid var(--line);
  border-radius: var(--radius);
  padding: 6px 10px;
  font-size: 14px;
  outline: none;
}

.search-btn {
  border: 1px solid var(--line);
  border-radius: var(--radius);
  padding: 6px 12px;
  background: #f9fafb;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.2s;
}
.search-btn:hover {
  background: var(--brand);
  color: #fff;
}

.notice-list {
  list-style: none;
  margin: 0;
  padding: 0;
  border-top: 2px solid var(--ink);
}

.notice-list li {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 10px;
  border-bottom: 1px solid var(--line);
  transition: background 0.2s;
}

.notice-list li:hover {
  background: #f0f7ff;
}

.notice-list .label {
  flex-shrink: 0;
  margin-right: 10px;
  color: var(--muted);
  font-size: 14px;
}

.notice-list a {
  flex: 1;
  color: var(--ink);
  text-decoration: none;
  transition: color 0.2s;
}

.notice-list li:hover a {
  color: var(--brand);
}

.notice-list .date {
  flex-shrink: 0;
  margin-left: 20px;
  font-size: 14px;
  color: var(--muted);
}

.pagination {
  display: flex;             
  justify-content: center;   /* 가로 중앙 정렬 */
  align-items: center;
  gap: 8px;                  /* 버튼 간격 */
  margin: 40px auto;         /* 위아래 여백 + 가로 중앙 */
}

.pagination a {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 36px;
  height: 36px;
  font-size: 14px;
  color: #6b7280;
  border-radius: 6px;
  text-decoration: none;
  transition: all 0.2s;
}

.pagination a:hover {
  background: #f3f4f6;
  color: #2563eb;
}

.pagination a.active {
  background: #111827;  /* 검정색 박스 */
  color: #fff;
  font-weight: 600;
}





 </style>
 
</head>
<body>

<!-- 상단 헤더 -->
<header class="topbar">
  <div class="container wrap">
   

    <!-- 가운데: 로고 -->
    <a class="logo" href="/mainHomePage">
      VISITKOREA
    </a>

    <!-- 오른쪽: 회원가입 + 로그인 -->
    <div class="auth">
      <a href="${pageContext.request.contextPath}/RegistrationForm">회원가입</a>
      <a class="btn" href="${pageContext.request.contextPath}/LoginForm">로그인</a>
    </div>
  </div>
</header>

<!-- 네비게이션 메뉴 -->
<nav class="nav">
  <div class="container menu">
    
    <!-- 테마별 여행 -->
    <div class="has-sub">
      <a href="${pageContext.request.contextPath}/supThema" >테마별 여행</a>
      <div class="submenu">
        <a href="/supSubject/supForeign">외국인 카테고리 관리</a>
        <a href="/supSubject/supMedical">의료 관광 카테고리 관리</a>
        <a href="/supSubject/supPicLoc">사진명소 카테고리 관리</a>
      </div>
    </div>

    <!-- 지역별 여행 -->
    <div class="has-sub">
      <a href="${pageContext.request.contextPath}/supTravel">지역별 여행</a>
      <div class="submenu">
        <a href="/supSubject/supLocation">자치단체별 여행지 관리</a>
      </div>
    </div>

    <!-- 카테고리별 -->
    <div class="has-sub">
      <a href="${pageContext.request.contextPath}/supCategory">카테고리별</a>
      <div class="submenu">
        <a href="/supSubject/supAccom">숙소 카테고리 관리</a>
        <a href="/supSubject/supEvent">행사 카테고리 관리</a>
        <a href="/supSubject/supPet">반려동물 카테고리 관리</a>
        <a href="/supSubject/supCamping">캠핑 카테고리 관리</a>
      </div>
    </div>

    <!-- 로그인/사용자 정보 -->
    <div class="has-sub">
      <a href="${pageContext.request.contextPath}/supCustomer">로그인/사용자 정보</a>
      <div class="submenu">
        <a href="/supSubject/supUserList">사용자 목록 관리</a>
        <a href="/supSubject/supUserAuto">사용자 권한 설정</a>
      </div>
    </div>

    <!-- 고객 지원 -->
    <div class="has-sub">
      <a href="${pageContext.request.contextPath}/supMember" class="active">고객 지원</a>
      <div class="submenu">
        <a href="/supSubject/supNotice">공지사항 관리</a>
        <a href="/supSubject/supQNA">Q&A 관리</a>
        <a href="/supSubject/supFestival">지역 축제 관리</a>
      </div>
    </div>

  </div>
</nav>

<script>
  // 상위 메뉴 클릭 시 active 이동
  document.querySelectorAll(".nav .menu > .has-sub > a, .nav .menu > a").forEach(link => {
    link.addEventListener("click", function(e) {
      // 기존 active 제거
      document.querySelectorAll(".nav .menu > .has-sub > a, .nav .menu > a")
        .forEach(a => a.classList.remove("active"));
      // 클릭한 메뉴만 active 추가
      this.classList.add("active");
    });
  });

  // 서브 메뉴 클릭 시에도 상위 메뉴가 active 유지
  document.querySelectorAll(".nav .menu .has-sub .sub a").forEach(subLink => {
    subLink.addEventListener("click", function() {
      // 서브 메뉴가 속한 상위 메뉴 찾기
      const parent = this.closest(".has-sub").querySelector("a");
      if (parent) {
        document.querySelectorAll(".nav .menu > .has-sub > a, .nav .menu > a")
          .forEach(a => a.classList.remove("active"));
        parent.classList.add("active");
      }
    });
  });
  
//페이지네이션 클릭 시 active 클래스 이동
  document.addEventListener("DOMContentLoaded", () => {
   const pageLinks = document.querySelectorAll(".pagination a");

   pageLinks.forEach(link => {
     link.addEventListener("click", function(e) {
       

       // "다음 >"는 active 적용 안 함
       if (this.textContent.trim() === "다음 >") return;

       pageLinks.forEach(a => a.classList.remove("active")); // 전체 active 제거
       this.classList.add("active"); // 현재 클릭된 버튼만 active
     });
   });
 });
</script>


<div class="notice-board">
  <h2>공지사항</h2>
  <ul class="notice-list">
    <li>
      <span class="label">[공지]</span>
      <a href="#">공지 사항 1</a>
      <span class="date">2025-10-17</span>
    </li>
    <li>
      <span class="label">[공지]</span>
      <a href="#">공지 사항 2</a>
      <span class="date">2025-10-16</span>
    </li>
    <li>
      <span class="label">[공지]</span>
      <a href="#"> 공지 사항 3</a>
      <span class="date">2025-10-16</span>
    </li>
    <li>
      <span class="label">[공지]</span>
      <a href="#">공지 사항 4</a>
      <span class="date">2025-10-15</span>
    </li>
  </ul>
</div>




  <!-- 페이지네이션 -->
<div class="pagination">
  <a href="#" class="prev">&lt;</a>
  <a href="#">1</a>
  <a href="#" class="active">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#" class="next">&gt;</a>
</div>





<!-- 푸터 -->
<footer>
<div class="container foot-wrap">
  <div>
    <div class="links" aria-label="푸터 링크">
      <a href="/supSubject.supCompanyInfo">회사소개</a>
      <a href="/supSubject.supTou">이용약관</a>
      <a href="/supSubject.supPolicy">개인정보처리방침</a>
      <a href="/supSubject.supMember">고객센터</a>
    </div>
    <p class="copy">© 2025 VisitKorea Demo · 본 페이지는 학습·포트폴리오 용도의 정적 UI 예시입니다.</p>
  </div>
  <div style="justify-self:end; align-self:center">
    <a class="btn" href="#">맨 위로</a>
  </div>
</div>
</footer>

</body>
</html>
