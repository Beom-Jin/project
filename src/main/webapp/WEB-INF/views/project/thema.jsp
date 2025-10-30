<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>테마별 여행 | VisitKorea</title>

<!-- ✅ 컨텍스트 경로 (예: /프로젝트명). 반드시 style 바깥! -->
<script>
  const CTX = '${pageContext.request.contextPath}';
</script>
=======
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>테마별 여행 | VisitKorea</title>

<!-- ✅ CSS 파일 추가 -->
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

<style>
:root{
  --bg:#ffffff;
  --ink:#0f172a; --ink-2:#334155; --muted:#64748b; --line:#e2e8f0;
  --brand:#2563eb; --brand-2:#06b6d4;
  --pill:#f1f5f9; --card:#ffffff;
  --shadow: 0 6px 24px rgba(2,6,23,.08), 0 2px 8px rgba(2,6,23,.06);
  --radius:16px; --radius-sm:10px; --max:1200px;
}
*{box-sizing:border-box}
html,body{height:100%}
body{
  margin:0;
  font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,AppleSDGothicNeo,Malgun Gothic,Pretendard,system-ui,sans-serif;
  color:var(--ink);
  background:var(--bg);
}
a{color:inherit; text-decoration:none}
img{max-width:100%; display:block}
.container{max-width:var(--max); margin:0 auto; padding:0 20px}

<<<<<<< HEAD

=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
/* 타이틀 */
.page-title{text-align:center; font-size:34px; font-weight:900; margin:50px 0 30px}

/* 테마 버튼 */
.theme-menu{display:flex; justify-content:center; flex-wrap:wrap; gap:28px; padding:20px; margin-bottom:40px}
.theme-btn{width:90px; height:90px; border-radius:50%; background:#fff; border:2px solid var(--line); display:flex; flex-direction:column; justify-content:center; align-items:center; box-shadow:var(--shadow); transition:all .25s ease; cursor:pointer}
.theme-btn img{width:48px; height:48px; margin-bottom:6px}
.theme-btn span{font-size:13px; font-weight:600; color:var(--muted)}
.theme-btn:hover{transform:translateY(-4px); border-color:var(--brand)}
.theme-btn.active{border:2px solid var(--brand); background:linear-gradient(145deg,var(--brand),var(--brand-2)); color:#fff}
.theme-btn.active span{color:#fff}

/* 컨텐츠 카드 */
.theme-display{max-width:1000px; margin:0 auto 80px; background:var(--card); border-radius:var(--radius); box-shadow:var(--shadow); overflow:hidden; text-align:center; transition:opacity .3s}
.theme-display img{width:100%; height:420px; object-fit:cover}
.theme-info{padding:24px 40px 40px}
.theme-info h2{font-size:28px; margin:0 0 10px}
.theme-info p{font-size:15px; color:var(--muted); line-height:1.6; margin:0 0 16px}
.theme-info a{display:inline-block; background:var(--brand); color:#fff; text-decoration:none; border-radius:999px; padding:10px 22px; font-weight:600}
.theme-info a:hover{filter:brightness(.9)}
</style>
</head>
<body>

<<<<<<< HEAD
<jsp:include page="top.jsp"></jsp:include>
=======
<!-- ✅ 헤더와 네비게이션 추가 -->
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

<div class="container">
  <h1 class="page-title">테마별 여행 추천</h1>

  <!-- 버튼 영역 -->
  <div class="theme-menu">
    <div class="theme-btn" data-theme="family">
      <img src="https://img.icons8.com/color/96/family.png" alt="가족여행">
      <span>가족여행</span>
    </div>
    <div class="theme-btn" data-theme="pet">
      <img src="https://cdn-icons-png.flaticon.com/512/194/194279.png" alt="반려동물">
      <span>반려동물</span>
    </div>
    <div class="theme-btn" data-theme="medical">
      <img src="https://cdn-icons-png.flaticon.com/512/2966/2966327.png" alt="의료관광">
      <span>의료관광</span>
    </div>
    <div class="theme-btn" data-theme="healing">
      <img src="https://img.icons8.com/color/96/forest.png" alt="힐링여행">
      <span>힐링여행</span>
    </div>
    <div class="theme-btn" data-theme="festival">
      <img src="https://img.icons8.com/color/96/confetti.png" alt="축제">
      <span>축제</span>
    </div>
    <div class="theme-btn" data-theme="carcamping">
      <img src="https://img.icons8.com/color/96/suv.png" alt="차박">
      <span>차박</span>
    </div>
    <div class="theme-btn" data-theme="koreaculture">
      <img src="https://img.icons8.com/color/96/south-korea.png" alt="한류">
      <span>한류</span>
    </div>
  </div>

  <!-- 컨텐츠 영역 -->
  <div class="theme-display" id="theme-display"></div>
</div>

<jsp:include page="bottom.jsp"></jsp:include>

<script>
<<<<<<< HEAD
/* ========= ✅ 추가: 테마 → 상세 JSP 매핑 ========= */
const VIEW_BY_THEME = {
  family:      "thema1",  // 가족여행
  pet:         "thema2",  // 반려동물
=======
/* 테마 → 상세 JSP 매핑 */
const VIEW_BY_THEME = {
  family:      "thema1",
  pet:         "thema2",
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
  medical:     "thema3",
  healing:     "thema4",
  festival:    "thema5",
  carcamping:  "thema6",
  koreaculture:"thema7"
};
<<<<<<< HEAD
/* ========= ✅ 끝 ========= */

/* 기존 데이터 그대로 */
=======

>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
var themes = {
  family: {
    title:"가족과 함께하는 즐거운 여행",
    desc:"아이와 부모 모두가 행복한 공간! 자연 체험, 놀이, 힐링까지 모두 담은 가족 여행지를 추천합니다.",
    img:"https://vj-prod-website-cms.s3.ap-southeast-1.amazonaws.com/adhgj-1751511985354.jpg"
  },
  pet: {
    title:"반려동물과 함께 떠나는 여행",
    desc:"우리 집 멍멍이, 냥냥이와 함께 즐기는 여행지! 숙소, 카페, 산책로까지 함께할 수 있어요.",
    img:"https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1600&q=80"
  },
  medical: {
    title:"건강과 여유를 동시에, 의료관광",
    desc:"한류 의료기술과 힐링이 결합된 웰니스 여행. 한국의 대표적인 의료관광지로 떠나보세요.",
    img:"http://www.doctorstimes.com/news/photo/201807/197779_36375_1833.jpg"
  },
  healing: {
    title:"지친 마음을 달래는 힐링여행",
    desc:"자연 속 명상, 숲속 산책, 조용한 사찰 체험으로 마음의 평화를 찾아보세요.",
    img:"https://cdn.ardentnews.co.kr/news/photo/202505/6075_28465_2420.jpg"
  },
  festival: {
    title:"한국의 멋과 흥이 있는 축제",
    desc:"사계절마다 펼쳐지는 지역 축제! 먹거리, 볼거리, 즐길거리로 가득한 현장을 만나보세요.",
    img:"https://www.hanwha.co.kr/upload/news/press/2024/09/02/1725244282547_77.jpg"
  },
  carcamping: {
    title:"나의 차와 함께 떠나는 여행",
    desc:"내 차가 굴러가는 곳, 그곳이 나의 여행지. 감성 차박 포인트를 소개합니다.",
    img:"https://kixxman.com/files/attach/images/140/973/016/dd4bbc30443215d7ee61f7f5a705e57a.png"
  },
  koreaculture: {
    title:"우리의 것이 가장 세계적인 것이다",
    desc:"전 세계를 사로잡은 한류! K-팝, K-드라마, K-푸드와 함께 떠나는 대한민국 대표 한류 관광지.",
    img:"https://cdn.m-joongang.com/news/photo/202409/20240920_1_340356.jpg"
  }
};

var buttons = document.querySelectorAll(".theme-btn");
var display = document.getElementById("theme-display");

<<<<<<< HEAD
// 카드 렌더
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
function render(themeKey){
  var data = themes[themeKey];
  if (!data) return;

  display.style.opacity = 0;

  var labelEl = document.querySelector('.theme-btn[data-theme="'+ themeKey +'"] span');
  var label = labelEl ? labelEl.innerText : "추천지";

<<<<<<< HEAD
  /* ✅ 변경: a 태그 href를 테마별 상세 페이지로 */
  var view = VIEW_BY_THEME[themeKey] || "thema1";
  var href = CTX + '/' + view + '?theme=' + encodeURIComponent(themeKey);
=======
  var view = VIEW_BY_THEME[themeKey] || "thema1";
  var href = '/' + view + '?theme=' + encodeURIComponent(themeKey);
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff

  setTimeout(function(){
    display.innerHTML =
      '<img src="' + data.img + '" alt="' + data.title + '"' +
      ' referrerpolicy="no-referrer"' +
      ' onerror="this.src=\'https://images.unsplash.com/photo-1519681393784-d120267933ba?auto=format&fit=crop&w=1600&q=80\';">' +
      '<div class="theme-info">' +
        '<h2>' + data.title + '</h2>' +
        '<p>' + data.desc + '</p>' +
        '<a class="view-link" href="'+ href +'">' + label + ' 보기 →</a>' +
      '</div>';
    display.style.opacity = 1;
  }, 120);

  var current = document.querySelector('.theme-btn.active');
  if (current) current.classList.remove('active');
  var target = document.querySelector('.theme-btn[data-theme="'+ themeKey +'"]');
  if (target) target.classList.add('active');
}

<<<<<<< HEAD
// 버튼 클릭 연결 (기존 그대로: 미리보기만 변경)
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
for (var i=0; i<buttons.length; i++){
  buttons[i].addEventListener('click', function(){
    var key = this.getAttribute('data-theme');
    render(key);
  });
}

<<<<<<< HEAD
// 초기 렌더 (가족여행)
=======
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
document.addEventListener('DOMContentLoaded', function(){
  render('family');
});
</script>

</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
