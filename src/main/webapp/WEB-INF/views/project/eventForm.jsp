<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table {
		width: 800px;
		margin-top: 50px;
		border-collapse: collapse;
	}
	
	table, th, td {
		border: 1px solid green;
		text-align: left;
	}
</style>

<title>Event Form</title>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>		
	<table>
	<div class="table-container">
    <tr>
        <th>게시물 제목</th>
        <td></td>
    </tr>
    <tr>
        <th>이미지주소 or 게시물 설명</th>
        <td></td>
    </tr>
    <tr>
        <th>위치주소</th>
        <td></td>
    </tr>
    <tr>
        <th>기간</th>
        <td></td>
    </tr>
    <tr>
        <th>홈페이지주소</th>
        <td></td>
    </tr>
    <tr>
        <th>조회수</th>
        <td></td>
    </tr>
	</div>
	</table>
	
	<a class="nav-link" href="/createDB">데이터 생성</a>
	<a class="nav-link" href="/showList">데이터 조회</a>
	
	<jsp:include page="bottom.jsp"></jsp:include>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">	
		$(document).ready(function() {			
			$(".table-container").empty(); // 초기화 작업
			$.ajax({
				url : "/showTourList", 
				method : "post",
				dataType : "json",  
				success : function(data) {
					console.log("받은 데이터:", data); 	
					
			    	const rows = data.list;
			    	const paging = data.paging; 
					
			    	let table = "<table>";
			    	table += "<thead>";
			    	table += "<tr>";
			    	table += "<th>b_title</th><th>b_img</th><th>b_content</th><th>b_loc</th><th>b_time</th><th>b_url</th><th>b_hits</th>" ;
			    	table += "</tr>";
			    	table += "</thead>";
			    	table += "<tbody>";
			    	$.each(rows, function(i, obj) {
						table +="<tr>";
						//table +="<td>"+(i+1)+"</td>";
						table +="<td>"+ obj.b_title +"</td>";						
						//table +="<td>"+ obj.b_img +"</td>";
						table +="<td><img src='" + obj.b_img + "' style='width:100px; height:auto; border-radius:8px;'/></td>";
						table +="<td>"+ obj.b_content.substring(0, 30) + "</td>";
						table +="<td>"+ obj.b_loc +"</td>";
						table +="<td>"+ obj.b_time +"</td>";
						//table +="<td>"+ obj.b_url +"</td>";
						//table +="<td><a href='"+ obj.b_url +"'</a></td>";
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
						 table += "<li><a href='#' class='page-link' data-page='" + (paging.beginBlock - paging.pagePerBlock) + "'>이전으로</a></li>";
					 }
				
					 // 블록 안의 페이지 번호
					 for (let k = paging.beginBlock; k <= paging.endBlock; k++) {
						 if (k === paging.nowPage) {
						 	 table += "<li class='now'>" + k + "</li>";
						 } else {
							 table += "<li><a href='#' " + k + ">" + k + "</a></li>";
						 }
					 }
				
					 // 다음 버튼
					 if (paging.endBlock >= paging.totalPage) {
						 table += "<li class='disable'>다음으로</li>";
					 } else {
						 table += "<li><a href='/showTourList?cPage=' " + (paging.endBlock + 1) + ">다음으로</a></li>";
						 // <li><a href="/bbs_list?cPage=${paging.endBlock + 1}">다음으로</a></li>
					 }				
					 table += "</ol></td></tr></tfoot>";
 			    	 
 			    	 
 			    	 
			    	 table += "</table>";	
			    	 $(".table-container").append(table);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		
		});			
	</script>
</body>
</html>