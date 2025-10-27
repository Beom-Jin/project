<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
  font-family: "Segoe UI", sans-serif;
  background-color: #f8f9fa;
  margin: 0;
}

/* 전체 콘텐츠 래퍼 */
.main-container {
  width: 90%;
  margin: 100px auto 60px;
}

/* 드롭다운 */
.dropdown-controls {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  gap: 8px;
  margin-bottom: 15px;
  font-size: 14px;
}

.dropdown-controls select {
  padding: 5px 8px;
  border-radius: 6px;
  border: 1px solid #ccc;
}

/* 테이블 */
.table-container {
  width: 100%;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  overflow: hidden;
}

table {
  width: 100%;
  border-collapse: collapse;
}

thead {
  background-color: #4a90e2;
  color: #fff;
}

th, td {
  padding: 12px 15px;
  text-align: center;
  border-bottom: 1px solid #eee;
}

tbody tr:hover {
  background-color: #f7faff;
}

td img {
  width: 80px;
  height: auto;
  border-radius: 8px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

/* 페이징 */
tfoot {
  background-color: #fafafa;
  text-align: center;
}

.paging {
  list-style: none;
  display: inline-flex;
  gap: 8px;
  padding: 0;
  margin: 15px 0;
}

.paging li {
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 6px 12px;
  background-color: #fff;
  cursor: pointer;
  transition: all 0.2s;
}

.paging li.now {
  background-color: #4a90e2;
  color: #fff;
  font-weight: bold;
}

.paging li:hover:not(.now):not(.disable) {
  background-color: #e6f0ff;
}

.paging li.disable {
  color: #bbb;
  cursor: not-allowed;
  border-color: #eee;
}

/* 지도 */
#map {
  width: 100%;
  height: 400px;
  margin-top: 25px;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}



</style>
<title>Event Form</title>
</head>
<body>
		
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e684ace65f4252ccaf39ed6a6b1bef1&libraries=services"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		
	<jsp:include page="top.jsp"></jsp:include>	
	<jsp:include page="nav.jsp"></jsp:include>	
		  
	<!-- 우측 상단 드롭다운 -->
	<div class="dropdown-controls">
	  <label for="perPageSelect">한 페이지:</label>
	  <select id="perPageSelect">
	    <option value="3">3개</option>
	    <option value="5">5개</option>
	    <option value="10">10개</option>
	  </select>
	  
	  <label for="categorySelect">분류:</label>
	  <select id="categorySelect">
	    <option value="1">전체1</option>
	    <option value="2">분류2</option>
	    <option value="3">분류3</option>
	    <option value="4">분류4</option>
	    <option value="5">분류5</option>
	    <option value="6">분류6</option>
	    <option value="7">분류7</option>
	  </select>

	</div> 	

	<div class="table-container"></div>	

	<a class="nav-link" href="/createDB">데이터 생성</a>
	<a class="nav-link" href="/showList">데이터 조회</a>
	<a class="nav-link" href="/tourInsert">데이터 추가</a>
	<a class="nav-link" href="/tourUpdate">데이터 변경</a>
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 100%; height: 350px;"></div>

	<jsp:include page="bottom.jsp"></jsp:include>

	<script type="text/javascript">		
		let numPage = 3; // 기본값
		let categoryData = 1; // 기본값
		
		$(document).ready(function() {		
		    // 드롭다운 변경 시 한 페이지 항목 수 변경하고 1페이지로 다시 로드
		    const sel = document.getElementById('perPageSelect');
		    const category = document.getElementById('categorySelect');
		    
		    console.log("sel :", sel.value);
		    console.log("category :", category.value);
		    
		    if (sel) {
		      sel.value = String(numPage); // 초기값 일치
		      
		      sel.addEventListener('change', function() {
		        numPage = parseInt(this.value, 10) || 3;
		        console.log("numPage :", numPage);
		        loadTourList(1); // 변경되면 1페이지로 재호출
	          });
			}
		    
		    //const category = document.getElementById('categorySelect');
		    
		    if (category) {
		    	category.value = String(categoryData); // 초기값 일치		        
		        
		    	category.addEventListener('change', function() {		    	
			    	categoryData = parseInt(this.value, 10) || 1;
			        console.log("categoryData :", categoryData);
		        	loadTourList(1); // 변경되면 1페이지로 재호출
	          });
			}
		    
			loadTourList(1);
		});	
		    
		    
		function fn_go_page(pageNo){
			loadTourList(pageNo);	
		}		
		
		
		function loadTourList(pageNo) {
			//console.log(pageNo);
			
			const params = { cPage : pageNo,  numPage : numPage, categoryData : categoryData };
			 
			$(".table-container").empty(); // 초기화 작업		    
			$.ajax({
				url : "/showTourList", 
				method : "post",
				data : params,
				dataType : "json",  
				success : function(data) {			    	
					
					const list = data.list;
			    	const paging = data.paging; 					

			    	// 데이터 없을 때 처리
		            if (list.length === 0) {
		                $(".table-container").html("<p style='text-align:center; margin-top:20px;'>조회된 데이터가 없습니다.</p>");
		                return;
		            }			    	
			    	
			    	let table = "<table>";
			    	table += "<thead>";
			    	table += "<tr>";
			    	table += "<th>b_title</th><th>b_img</th><th>b_content</th><th>b_loc</th><th>b_time</th><th>b_url</th><th>b_hits</th>" ;
			    	table += "</tr>";
			    	table += "</thead>";
			    	table += "<tbody>";
			    	$.each(list, function(i, obj) {
						table +="<tr>";
						table +="<td>"+ obj.b_title +"</td>";						
						table +="<td><img src='" + obj.b_img + "' style='width:100px; height:auto; border-radius:8px;'/></td>";
						table +="<td>"+ obj.b_content.substring(0, 30) + "</td>";
						//table +="<a href='javascript:void(0);' onclick='fn_go_map(" + obj.b_lat + "," + obj.b_lon + "); '><td>"+ obj.b_loc +"</td></a>";
						table +="<td><a href='javascript:void(0);' onclick='fn_go_map(\"" + obj.b_lat + "\", \"" + obj.b_lon + "\", \"" + 0 +"\")'>" + obj.b_loc + "</a></td>";
						table +="<td>"+ obj.b_time +"</td>";
						table += '<td><a href="' + obj.b_url + '" target="_blank">' + obj.b_url + '</a></td>';
						table +="<td>"+ obj.b_hits +"</td>";
						table +="</tr>";													
					 });						
 			    	 table += "</tbody>";
 			    	
 			    	 table += "<tfoot><tr><td colspan='7'><ol class='paging'>";

					 // 이전 버튼					 
					 if (paging.beginBlock <= paging.pagePerBlock) {
						 table += "<li class='disable'>이전으로</li>";						 
					 } else {
						 table += "<li><a href='javascript:void(0);' onclick='fn_go_page(" + (paging.beginBlock - paging.pagePerBlock) + "); '>이전으로</a></li>";
					 }
				
					 // 블록 안의 페이지 번호
					 for (let k = paging.beginBlock; k <= paging.endBlock; k++) {
						 if (k === paging.nowPage) {
							 table += "<li class='now'><a href='javascript:void(0);' onclick='fn_go_page(" + k + "); '>" + k + "</a></li>";
						 } else {
							 table += "<li><a href='javascript:void(0);' onclick='fn_go_page(" + k + "); '>" + k + "</a></li>";
						 }
					 }
				
					 // 다음 버튼
					 if (paging.endBlock >= paging.totalPage) {
						 table += "<li class='disable'>다음으로</li>";
					 } else {
						 table += "<li><a href='javascript:void(0);' onclick='fn_go_page(" + (paging.endBlock + 1) + "); '>다음으로</a></li>";
					 }				
					 table += "</ol></td></tr></tfoot>"; 			    	 
 			    	 
			    	 table += "</table>";	
			    	 $(".table-container").append(table);

			    	 fn_go_map(list[0].b_lat, list[0].b_lon, 1);
				},
				error : function() {
					alert("읽기실패");
				}
			});			
		}
		
		function fn_go_map(b_lat, b_lon, first) {
			console.log("b_lat:", b_lat, "b_lon:", b_lon, "first:", first);
			let lat = b_lat;
			let lon = b_lon;

			if(first === 1){
				navigator.geolocation.getCurrentPosition(function(position) {					
					lat = position.coords.latitude;
					lon = position.coords.longitude;					
					
					geo_map(lat, lon);
				});
			}else{
				geo_map(lat, lon);
			}
			 
		}
		
	    function geo_map(lat, lon) {
	    	//let h = new kakao.maps.LatLng(lat, lon);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				level : 3  // 지도의 확대 레벨
				//center : h , 
				//level : 3  // 지도의 확대 레벨
				
			};
	
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
		}
		
		
		
		
		function loadTourListOld(pageNo) {

			const params = { cPage: pageNo };

			$.ajax({
				url: "/showTourList",
				method: "post",
				data: params,
				dataType: "json",
				success: function (data) {
					const list = data.list;
					const paging = data.paging;

					console.log("📦 data:", data);

					// 테이블이 없으면 생성
					if ($(".table-container table").length === 0) {
						const table = `
							<table>
								<thead>
									<tr>
										<th>b_title</th>
										<th>b_img</th>
										<th>b_content</th>
										<th>b_loc</th>
										<th>b_time</th>
										<th>b_url</th>
										<th>b_hits</th>
									</tr>
								</thead>
								<tbody></tbody>
								<tfoot>
									<tr><td colspan="7"><ol class="paging"></ol></td></tr>
								</tfoot>
							</table>
						`;
						$(".table-container").html(table);
					}

					let $tbody = $(".table-container table tbody");
					console.log("tbody 찾은 후:", $tbody.length);

					let tbodyHtml = "";

					$.each(list, function (i, obj) {
						// null-safe 데이터 처리
						const title   = obj.b_title || "";
						const content = (obj.b_content || "").substring(0, 30);
						const b_loc   = obj.b_loc || "";
						const b_img   = obj.b_img || "";
						const b_time  = obj.b_time || "";
						const b_url   = obj.b_url || "";
						const b_hits  = obj.b_hits || "";

						console.log(`▶ [${i}]`, title, content, b_loc);

						tbodyHtml += `
							<tr>
								<td>${title}</td>
								<td><img src="${b_img}" style="width:100px; height:auto; border-radius:8px;"/></td>
								<td>${content}</td>
								<td>${b_loc}</td>
								<td>${b_time}</td>
								<td><a href="${b_url}" target="_blank">${b_url}</a></td>
								<td>${b_hits}</td>
							</tr>
						`;
					});

					console.log("tbodyHtml:", tbodyHtml);
					$tbody.html(tbodyHtml);

					// ✅ 페이지네이션 처리
					let pagingHtml = "";

					if (paging.beginBlock <= paging.pagePerBlock) {
						pagingHtml += `<li class="disable">이전으로</li>`;
					} else {
						pagingHtml += `<li><a href="javascript:void(0);" onclick="fn_go_page(${paging.beginBlock - paging.pagePerBlock});">이전으로</a></li>`;
					}

					for (let k = paging.beginBlock; k <= paging.endBlock; k++) {
						if (k === paging.nowPage) {
							pagingHtml += `<li class="now"><a href="javascript:void(0);" onclick="fn_go_page(${k});">${k}</a></li>`;
						} else {
							pagingHtml += `<li><a href="javascript:void(0);" onclick="fn_go_page(${k});">${k}</a></li>`;
						}
					}

					if (paging.endBlock >= paging.totalPage) {
						pagingHtml += `<li class="disable">다음으로</li>`;
					} else {
						pagingHtml += `<li><a href="javascript:void(0);" onclick="fn_go_page(${paging.endBlock + 1});">다음으로</a></li>`;
					}

					$(".table-container table tfoot .paging").html(pagingHtml);
					
				},

				error: function (xhr, status, error) {
					console.error("❌ AJAX 오류:", status, error);
					alert("읽기 실패");
				},
			});
		}		
		
	</script>
</body>
</html>