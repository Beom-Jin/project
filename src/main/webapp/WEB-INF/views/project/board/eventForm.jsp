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
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/nav.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
</head>
<body>
		
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaokey}&libraries=services"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<!-- /js/tour_functions.js include -->
	<script src="/js/tour_functions.js"></script>
		
	<jsp:include page="../top.jsp"></jsp:include>	
	<jsp:include page="../nav.jsp"></jsp:include>	
		  
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

	<!-- <a class="nav-link" href="/createDB">데이터 생성</a>
	<a class="nav-link" href="/createDB1">데이터 생성1</a>
	<a class="nav-link" href="/createDB2">데이터 생성2</a>
	<a class="nav-link" href="/showList">데이터 조회</a>
	<a class="nav-link" href="/tourInsert">데이터 추가</a> -->
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width: 100%; height: 350px;"></div>

	<jsp:include page="../bottom.jsp"></jsp:include>

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

	</script>
</body>
</html>