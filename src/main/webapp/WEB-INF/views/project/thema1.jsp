<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>가족 여행 | VisitKorea</title>

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

.page-title{font-size:28px; font-weight:800; margin:8px 0 18px}

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

.grid{display:grid; gap:20px; margin-top:24px}
.grid.cols-4{grid-template-columns:repeat(4,1fr)}
@media (max-width:1024px){.grid.cols-4{grid-template-columns:repeat(3,1fr)}}
@media (max-width:780px){.grid.cols-4{grid-template-columns:repeat(2,1fr)}}
@media (max-width:520px){.grid.cols-4{grid-template-columns:1fr}}

.card{
  background:var(--card); border:1px solid var(--line); border-radius:var(--radius-sm);
  box-shadow:var(--shadow); overflow:hidden;
  transition:transform .15s ease, box-shadow .15s ease;
}
.card:hover{transform:translateY(-2px); box-shadow:0 16px 36px rgba(2,6,23,.10), 0 3px 12px rgba(2,6,23,.06)}
.thumb{
  aspect-ratio:4/3; background:var(--skeleton); position:relative; overflow:hidden;
}
.thumb img{
  width:100%; height:100%; object-fit:cover; position:relative; z-index:1;
}
.thumb::after{
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
.thumb.has-image::after{display:none;}

.meta{padding:14px 14px 18px}
.place{font-weight:800; margin:6px 0 8px}
.tag{
  display:inline-block; padding:6px 10px; font-size:12px; border-radius:999px;
  background:#eef2ff; color:#3730a3; font-weight:700;
}

.loading{
  text-align:center; padding:60px 0; color:var(--muted); font-size:16px;
}

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
  <h2 class="page-title">가족들과 여행하기 좋은 곳<span aria-hidden="true">😊</span></h2>

  <div class="loading" id="loading">관광 정보를 불러오는 중...</div>

  <section class="grid cols-4" aria-label="추천 장소 목록" id="card-container">
  </section>

  <div class="footer-cta">
    <a class="ghost-btn" href="/showMap" role="button" aria-label="지역별 여행 보기">
     지역별 여행 보기
    </a>
  </div>
</main>

<jsp:include page="bottom.jsp"></jsp:include>

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
                
                // ✅ API 데이터와 DB 지역명 정확히 매칭
                const regionMapping = {
                    "아산": ["아산시", "염치읍"],
                    "남원": ["남원시", "어현동", "천거동"],
                    "산청": ["산청군", "금서면"],
                    "파주": ["파주시", "문산읍"],
                    "평창": ["평창군", "대관령"],
                    "창녕": ["창녕군", "창녕읍"],
                    /* "성남": ["성남시", "중원구"], */
                    "동해": ["동해시", "구미동"],
                    "광주": ["광주", "북구", "동문대로"]
                 
                
                };
                
                function extractRegion(spatialCoverage) {
                    if (!spatialCoverage) return "기타";
                    
                    // 각 지역명의 키워드로 매칭
                    for (let region in regionMapping) {
                        for (let keyword of regionMapping[region]) {
                            if (spatialCoverage.includes(keyword)) {
                                return region;
                            }
                        }
                    }
                    return "기타";
                }
                
                let cardHtml = "";
                
                $.each(items, function(index, spot) {
                    const title = spot.title || "제목 없음";
                    const spatialCoverage = spot.spatialCoverage || "";
                    const image = spot.firstimage || "";

                    // ✅ 정확한 지역명 추출
                    const region = extractRegion(spatialCoverage);
                    
                    console.log(`📍 ${index + 1}. ${title} → 지역: ${region} (원본: ${spatialCoverage})`);
                    
                    // ✅ d_local을 정확히 전달
                    cardHtml += '<a href="/showThemaDetail?local=' + encodeURIComponent(region) + '" style="display:block;">';
                    cardHtml += '<article class="card">';
                    cardHtml += '  <div class="thumb has-image" aria-hidden="true">';

                    const customImages = [
                        "https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=6651d26e-9602-40fb-98e3-778bcc7adaf0",
                        "https://cdn.3hoursahead.com/v2/content/image-comp/e1847fe0-2b69-40c9-9aa8-6e38809b9f7f.webp",
                        "http://www.golftimes.co.kr/news/photo/202504/134968_62751_3340.jpg",
                        "https://www.dmzgondola.com/assets/images/sub/sights-imjingak-10.jpg",
                        "https://www.snowfestival.net/asset/images/travel/travel_s01_img01.jpg",
                        "https://minio.nculture.org/amsweb-opt/multimedia_assets/120/28939/8855/c/28939-medium-size.jpg",
                        "https://www.dongtuni.com/upload/webzine/148/content/544-745114c37a17.jpg",
                        "https://bbkk.kr/d/t/4/4513_DSC_0054.jpg"
                    ];
                    const fallbackImage = "/resources/images/map/family_default.jpg";
                    const customImage = customImages[index] || "";
                    const finalImage = customImage || image || fallbackImage;

                    cardHtml += '<img src="' + finalImage + '" alt="' + title + 
                                '" onerror="this.src=\'' + fallbackImage + '\';">';

                    cardHtml += '  </div>';
                    cardHtml += '  <div class="meta">';
                    cardHtml += '    <div class="place">' + title + '</div>';
                    cardHtml += '    <span class="tag">' + region + '</span>';
                    cardHtml += '  </div>';
                    cardHtml += '</article>';
                    cardHtml += '</a>';
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

</body>
</html>