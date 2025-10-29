<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>축제 · 행사 | VisitKorea</title>

<!-- ✅ CSS 파일 추가 -->
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">

<style>
.table-container {
  width: 90%;
  margin: 40px auto;
  font-family: "Segoe UI", sans-serif;
}

table {
  width: 100%;
  border-collapse: collapse;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
  cursor: default;
}

.paging li:hover:not(.now):not(.disable) {
  background-color: #e6f0ff;
}

.paging li.disable {
  color: #bbb;
  cursor: not-allowed;
  border-color: #eee;
}
</style>
</head>
<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d94238101cfb7c23687adf0e173a7da"></script>
	
	<!-- ✅ 헤더와 네비게이션 추가 -->
	<jsp:include page="top.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>

 	<div class="table-container"></div>

	<a class="nav-link" href="/createDB">데이터 생성</a>
	<a class="nav-link" href="/showList">데이터 조회</a>
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 100%; height: 350px;"></div>

	<jsp:include page="bottom.jsp"></jsp:include>

	<script type="text/javascript">	
		
		$(document).ready(function() {		
			loadTourList1(1);	
			// 내일 작업
			//fn_go_map(list.b_lat, list.b_lon);
			console.log("list :", ${list});
		});		

		function fn_go_page(pageNo){
			loadTourList1(pageNo);	
		}		
		
		function loadTourList(pageNo) {

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
		
		function loadTourList1(pageNo) {
			console.log(pageNo);
			
			const params = { cPage: pageNo };
			 
			$(".table-container").empty(); // 초기화 작업		    
			$.ajax({
				url : "/showTourList", 
				method : "post",
				data : params,
				dataType : "json",  
				success : function(data) {
					//console.log("받은 데이터:", data); 	
					
			    	const list = data.list;
			    	const paging = data.paging; 
					
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
						table +="<td><a href='javascript:void(0);' onclick='fn_go_map(\"" + obj.b_lat + "\", \"" + obj.b_lon + "\")'>" + obj.b_loc + "</a></td>";
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
				},
				error : function() {
					alert("읽기실패");
				}
			});			
		}
		
		function fn_go_map(b_lat, b_lon) {
			console.log("b_lat:", b_lat, "b_lon:", b_lon);
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				//center : new kakao.maps.LatLng(b_lat, b_lon), // 지도의 중심좌표
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);			 
			 
		}
		
	</script>
</body>
</html>