<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>축제 | VisitKorea</title>

<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">

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
  aspect-ratio:4/3; background:var(--skeleton); position:relative; overflow:hidden;
}
/* ✅ 이미지가 있을 때는 ::after 숨김 */
.thumb img{
  width:100%; height:100%; object-fit:cover; position:relative; z-index:1;
}
.thumb::after{ /* 사진 비워둔 느낌의 플레이스홀더 */
  content:"";
  position:absolute; inset:16px; z-index:0;
  border:2px dashed #d1d5db; border-radius:12px;
  background:
    linear-gradient(135deg,#e5e7eb 25%, transparent 25%) -8px 0/16px 16px,
    linear-gradient(225deg,#e5e7eb 25%, transparent 25%) -8px 0/16px 16px,
    linear-gradient(315deg,#e5e7eb 25%, transparent 25%) 0px 0/16px 16px,
    linear-gradient(45deg,#e5e7eb 25%, transparent 25%) 0px 0/16px 16px;
  opacity:.7;
}
.thumb.has-image::after{display:none;} /* 이미지 있으면 플레이스홀더 제거 */

.meta{padding:14px 14px 18px}
.place{font-weight:800; margin:6px 0 8px}
.tag{
  display:inline-block; padding:6px 10px; font-size:12px; border-radius:999px;
  background:#eef2ff; color:#3730a3; font-weight:700;
}

/* 로딩 */
.loading{
  text-align:center; padding:60px 0; color:var(--muted); font-size:16px;
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
<jsp:include page="nav.jsp"></jsp:include>

<main class="container">
  <h2 class="page-title">한국의 멋과 흥이 있는 축제<span aria-hidden="true">😊</span></h2>

  <!-- ✅ 로딩 메시지 추가 -->
  <div class="loading" id="loading">관광 정보를 불러오는 중...</div>

  <!-- ✅ 카드 컨테이너 (JavaScript가 여기에 카드를 추가) -->
  <section class="grid cols-4" aria-label="추천 장소 목록" id="card-container">
    <!-- 카드들이 동적으로 추가됨 -->
  </section>

  <!-- 하단 이동 버튼 -->
  <div class="footer-cta">
    <a class="ghost-btn" href="/showMap" role="button" aria-label="지역별 여행 보기">
     지역별 여행 보기
    </a>
  </div>
</main>

<jsp:include page="bottom.jsp"></jsp:include>

<!-- ✅✅✅ 여기서부터 새로 추가된 부분 ✅✅✅ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    loadFamilyTourData();
});

function loadFamilyTourData() {
    $.ajax({
        url: "/api/familyTour",
        method: "post",
        dataType: "json",
        success: function(data) {
            console.log("API 응답:", data);
            $("#loading").hide();
            
            try {
                const items = data.response.body.items.item;
                if (!items || items.length === 0) {
                    $("#card-container").html('<p class="loading">데이터가 없습니다.</p>');
                    return;
                }
                
                let cardHtml = "";
                
                $.each(items, function(index, spot) {
                    const title = spot.title || "제목 없음";
                    const addr = spot.addr1 || "주소 정보 없음";
                    const image = spot.firstimage || "";

                    // 지역명 추출
                    let region = "기타";
                    if (addr.includes("서울")) region = "서울";
                    else if (addr.includes("부산")) region = "부산";
                    else if (addr.includes("경기")) region = "경기";
                    else if (addr.includes("강원")) region = "강원";
                    else if (addr.includes("제주")) region = "제주";
                    else if (addr.includes("인천")) region = "인천";
                    else if (addr.includes("대전")) region = "대전";
                    else if (addr.includes("대구")) region = "대구";
                    else if (addr.includes("광주")) region = "광주";
                    else if (addr.includes("울산")) region = "울산";
                    else if (addr.includes("충청")) region = "충청";
                    else if (addr.includes("전라")) region = "전라";
                    else if (addr.includes("경상")) region = "경상";
                    
                    cardHtml += '<article class="card">';
                    cardHtml += '  <div class="thumb has-image" aria-hidden="true">';

                    // ✅ 수정된 부분 시작
                    const customImages = [
                        "https://image.kkday.com/v2/image/get/w_1440%2Ch_1080%2Cc_fill%2Cq_55%2Ct_webp/s1.kkday.com/poi_63389/20210809052053_pXDBH/jpg",
                        "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/1jPF/image/tiDcf0ZMzxGVdcnGfq20LBpQWhc.jpg",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnCyHsrg8VR2D5D1RD9pcLAZ9EAlaTpxZU3Q&s",
                        "https://cdn.thetrippick.com/news/photo/202508/692_3065_212.jpg",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUzNqVwxMP6e7h08DlUCUimdENUSTx5xhUOA&s",
                        "https://wimg.heraldcorp.com/news/cms/2025/05/02/news-p.v1.20250502.d7de00c04b4b42449a53fb637ffca8cb_P1.jpg",
                        "https://contents-cdn.viewus.co.kr/image/2025/02/CP-2023-0442/image-9e0d83c8-6e6e-4b5a-8029-e2d3ab77216d.jpeg",
                        "https://tripgend.co.kr/wp-content/uploads/2025/03/batch_aGettyImages-jv11359748-1024x768.jpg",
                        	
                        		
                      ];
                    const fallbackImage = "/resources/images/map/family_default.jpg";
                    const customImage = customImages[index] || "";
                    const finalImage = customImage || image || fallbackImage;

                    cardHtml += '<img src="' + finalImage + '" alt="' + title + 
                                '" onerror="this.src=\'' + fallbackImage + '\';">';
                    // ✅ 수정된 부분 끝

                    cardHtml += '  </div>';
                    cardHtml += '  <div class="meta">';
                    cardHtml += '    <div class="place">' + title + '</div>';
                    cardHtml += '    <span class="tag">' + region + '</span>';
                    cardHtml += '  </div>';
                    cardHtml += '</article>';
                });
                
                $("#card-container").html(cardHtml);
                
            } catch(e) {
                console.error("데이터 파싱 오류:", e);
                $("#card-container").html('<p class="loading" style="color:#dc2626;">데이터를 불러오는 중 오류가 발생했습니다.</p>');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 오류:", status, error);
            $("#loading").hide();
            $("#card-container").html('<p class="loading" style="color:#dc2626;">서버 연결에 실패했습니다.</p>');
        }
    });
}
</script>
<!-- ✅✅✅ 여기까지 새로 추가된 부분 ✅✅✅ -->

</body>
</html>
