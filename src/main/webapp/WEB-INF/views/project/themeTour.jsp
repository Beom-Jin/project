<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테마별 관광정보</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
        }
        
        h1 {
            text-align: center;
            color: white;
            font-size: 2.5rem;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        /* 탭 메뉴 */
        .tab-menu {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        
        .tab-btn {
            padding: 12px 30px;
            background: rgba(255,255,255,0.2);
            border: 2px solid rgba(255,255,255,0.3);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 25px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        
        .tab-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        
        .tab-btn.active {
            background: white;
            color: #667eea;
            border-color: white;
        }
        
        /* 로딩 스피너 */
        .loading {
            text-align: center;
            padding: 50px;
            color: white;
            font-size: 20px;
            display: none;
        }
        
        .spinner {
            border: 4px solid rgba(255,255,255,0.3);
            border-top: 4px solid white;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* 카드 그리드 */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        
        .tour-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }
        
        .tour-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        }
        
        .tour-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .card-content {
            padding: 20px;
        }
        
        .card-title {
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        .card-address {
            color: #666;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 10px;
        }
        
        .card-badge {
            display: inline-block;
            padding: 5px 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
        }
        
        /* 에러 메시지 */
        .error-message {
            text-align: center;
            padding: 50px;
            background: rgba(255,255,255,0.2);
            border-radius: 15px;
            color: white;
            font-size: 18px;
            backdrop-filter: blur(10px);
        }
        
        /* 통계 정보 */
        .stats {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .stat-item {
            background: rgba(255,255,255,0.2);
            padding: 15px 30px;
            border-radius: 25px;
            color: white;
            backdrop-filter: blur(10px);
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            display: block;
        }
        
        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        /* 반응형 */
        @media (max-width: 768px) {
            h1 {
                font-size: 1.8rem;
            }
            
            .card-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 15px;
            }
            
            .tab-btn {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🌏 테마별 관광정보</h1>
        
        <!-- 탭 메뉴 -->
        <div class="tab-menu">
            <button class="tab-btn active" onclick="loadData('areaList')">🏛️ 전체</button>
            <button class="tab-btn" onclick="loadData('touristSpots')">🗺️ 관광지</button>
            <button class="tab-btn" onclick="loadData('festivals')">🎉 축제</button>
            <button class="tab-btn" onclick="loadData('seoul')">🏙️ 서울</button>
            <button class="tab-btn" onclick="loadData('restaurants')">🍴 음식점</button>
        </div>
        
        <!-- 통계 정보 -->
        <div class="stats">
            <div class="stat-item">
                <span class="stat-number" id="totalCount">0</span>
                <span class="stat-label">총 데이터 수</span>
            </div>
            <div class="stat-item">
                <span class="stat-number" id="currentPage">1</span>
                <span class="stat-label">현재 페이지</span>
            </div>
        </div>
        
        <!-- 로딩 표시 -->
        <div class="loading" id="loading">
            <div class="spinner"></div>
            <p>데이터를 불러오는 중입니다...</p>
        </div>
        
        <!-- 카드 그리드 -->
        <div class="card-grid" id="cardGrid"></div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        // 페이지 로드시 전체 데이터 불러오기
        $(document).ready(function() {
            loadData('areaList');
        });
        
        // 데이터 로드 함수
        function loadData(type) {
            // 모든 탭 버튼 비활성화
            $('.tab-btn').removeClass('active');
            // 클릭한 버튼 활성화
            event.target.classList.add('active');
            
            // 로딩 표시
            $('#loading').show();
            $('#cardGrid').html('');
            
            // API 호출
            $.ajax({
                url: '/api/themeTour/' + type,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    console.log('API 응답:', data);
                    $('#loading').hide();
                    
                    if (data.response && data.response.body && data.response.body.items) {
                        const items = data.response.body.items.item;
                        const totalCount = data.response.body.totalCount || 0;
                        const pageNo = data.response.body.pageNo || 1;
                        
                        // 통계 업데이트
                        $('#totalCount').text(totalCount);
                        $('#currentPage').text(pageNo);
                        
                        if (items && items.length > 0) {
                            displayCards(items, type);
                        } else {
                            $('#cardGrid').html('<div class="error-message">데이터가 없습니다.</div>');
                        }
                    } else {
                        $('#cardGrid').html('<div class="error-message">데이터 형식이 올바르지 않습니다.</div>');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('API 호출 실패:', error);
                    $('#loading').hide();
                    $('#cardGrid').html('<div class="error-message">데이터를 불러오는데 실패했습니다.<br>잠시 후 다시 시도해주세요.</div>');
                }
            });
        }
        
        // 카드 표시 함수
        function displayCards(items, type) {
            let html = '';
            
            items.forEach(function(item) {
                const title = item.title || '제목 없음';
                const addr = item.addr1 || '주소 정보 없음';
                const image = item.firstimage || 'https://via.placeholder.com/400x300?text=No+Image';
                const contentTypeId = item.contenttypeid || '';
                
                // 타입별 배지
                let badge = '';
                switch(type) {
                    case 'touristSpots':
                        badge = '관광지';
                        break;
                    case 'festivals':
                        badge = '축제';
                        break;
                    case 'seoul':
                        badge = '서울';
                        break;
                    case 'restaurants':
                        badge = '음식점';
                        break;
                    default:
                        badge = getContentTypeName(contentTypeId);
                }
                
                html += `
                    <div class="tour-card">
                        <img src="${image}" alt="${title}" onerror="this.src='https://via.placeholder.com/400x300?text=No+Image'">
                        <div class="card-content">
                            <h3 class="card-title">${title}</h3>
                            <p class="card-address">📍 ${addr}</p>
                            <span class="card-badge">${badge}</span>
                        </div>
                    </div>
                `;
            });
            
            $('#cardGrid').html(html);
        }
        
        // 콘텐츠 타입 이름 반환
        function getContentTypeName(typeId) {
            const types = {
                '12': '관광지',
                '14': '문화시설',
                '15': '축제',
                '25': '여행코스',
                '28': '레포츠',
                '32': '숙박',
                '38': '쇼핑',
                '39': '음식점'
            };
            return types[typeId] || '기타';
        }
    </script>
</body>
</html>
