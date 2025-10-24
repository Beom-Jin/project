<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>테마로 만나는 장소</title>
<style>
:root{
  --bg:#ffffff;
  --ink:#0f172a; --ink-2:#334155; --muted:#667085; --line:#e5e7eb;
  --brand:#2563eb; --brand-2:#06b6d4;
  --pill:#f1f5f9; --card:#ffffff; --skeleton:#f3f4f6;
  --shadow:0 10px 30px rgba(2,6,23,.08), 0 2px 10px rgba(2,6,23,.06);
  --radius:16px; --radius-sm:12px; --max:1100px;
}
*{box-sizing:border-box}
html,body{height:100%}
body{margin:0; font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,system-ui,sans-serif; color:var(--ink); background:var(--bg)}
a{color:inherit; text-decoration:none}
.container{max-width:var(--max); margin:0 auto; padding:24px 20px}

/* 헤더 */
.page-title{font-size:28px; font-weight:800; margin:8px 0 18px}

/* 상단 배너(이미지 대신 비어있는 영역) */
.hero{
  border:1px solid var(--line); border-radius:var(--radius);
  background:linear-gradient(90deg,#f9fafb,#f8fafc);
  box-shadow:var(--shadow);
  display:grid; grid-template-columns:1fr auto; gap:12px;
  padding:22px 24px; align-items:center;
}
.hero .msg{line-height:1.5}
.hero .msg .title{font-weight:800; font-size:18px}
.hero .btn{
  display:inline-flex; align-items:center; justify-content:center;
  width:42px; height:42px; border-radius:999px; border:1px solid var(--line); background:#fff;
}
.hero .btn:hover{border-color:#cbd5e1}

/* 카드 그리드 */
.grid{display:grid; gap:20px; margin-top:24px}
.grid.cols-4{grid-template-columns:repeat(4,1fr)}
@media (max-width:1024px){.grid.cols-4{grid-template-columns:repeat(3,1fr)}}
@media (max-width:780px){.grid.cols-4{grid-template-columns:repeat(2,1fr)}}
@media (max-width:520px){.grid.cols-4{grid-template-columns:1fr}}

/* 카드 */
.card{
  background:var(--card); border:1px solid var(--line); border-radius:var(--radius-sm);
  box-shadow:var(--shadow); overflow:hidden;
  transition:transform .15s ease, box-shadow .15s ease;
}
.card:hover{transform:translateY(-2px); box-shadow:0 16px 36px rgba(2,6,23,.10), 0 3px 12px rgba(2,6,23,.06)}
.thumb{
  aspect-ratio:4/3; background:var(--skeleton); position:relative;
}
.thumb::after{ /* 사진 비워둔 느낌의 플레이스홀더 */
  content:"";
  position:absolute; inset:16px;
  border:2px dashed #d1d5db; border-radius:12px;
  background:
    linear-gradient(135deg,#e5e7eb 25%, transparent 25%) -8px 0/16px 16px,
    linear-gradient(225deg,#e5e7eb 25%, transparent 25%) -8px 0/16px 16px,
    linear-gradient(315deg,#e5e7eb 25%, transparent 25%) 0px 0/16px 16px,
    linear-gradient(45deg,#e5e7eb 25%, transparent 25%) 0px 0/16px 16px;
  opacity:.7;
}
.meta{padding:14px 14px 18px}
.place{font-weight:800; margin:6px 0 8px}
.tag{
  display:inline-block; padding:6px 10px; font-size:12px; border-radius:999px;
  background:#eef2ff; color:#3730a3; font-weight:700;
}

/* 하단 버튼 */
.footer-cta{display:flex; justify-content:center; margin:26px 0 6px}
.ghost-btn{
  display:inline-flex; align-items:center; gap:8px;
  padding:11px 16px; border-radius:999px; border:1px solid var(--line);
  background:#fff; font-weight:700;
}
.ghost-btn:hover{border-color:#cbd5e1}
</style>
</head>
<body>

<jsp:include page="top.jsp"></jsp:include>

<main class="container">
  <h2 class="page-title">반려 동물과 함께 <span aria-hidden="true">😊</span></h2>

  <!-- 상단 배너 (비워둔 그래픽 영역 + 텍스트 + 버튼) -->
 
  <!-- 카드 8개 (이미지 칸은 플레이스홀더) -->
  <section class="grid cols-4" aria-label="추천 장소 목록">
    <!-- 1 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물1</div>
        <span class="tag">반려 동물1</span>
      </div>
    </article>
    <!-- 2 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물2</div>
        <span class="tag">반려 동물2</span>
      </div>
    </article>
    <!-- 3 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물3</div>
        <span class="tag">반려 동물3</span>
      </div>
    </article>
    <!-- 4 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물4</div>
        <span class="tag">반려 동물4</span>
      </div>
    </article>
    <!-- 5 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물5</div>
        <span class="tag">반려 동물5</span>
      </div>
    </article>
    <!-- 6 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물6</div>
        <span class="tag">반려 동물6</span>
      </div>
    </article>
    <!-- 7 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물7</div>
        <span class="tag">반려 동물7</span>
      </div>
    </article>
    <!-- 8 -->
    <article class="card">
      <div class="thumb" aria-hidden="true"></div>
      <div class="meta">
        <div class="place">반려 동물8</div>
        <span class="tag">반려 동물8</span>
      </div>
    </article>
  </section>

  <!-- 하단 이동 버튼 -->
  <div class="footer-cta">
    <a class="ghost-btn" href="#" role="button" aria-label="여행지도에서 더 많은 추천테마 보기">
      여행지도에서 더 많은 추천테마 보기 →
    </a>
  </div>
</main>

<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>
