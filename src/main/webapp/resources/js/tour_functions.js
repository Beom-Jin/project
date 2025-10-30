//getElementById
//getElementsByTagName
//getElementsByClassName
//document.querySelector
//document.querySelectorAll
//Node.children
//Node.first/lastElementChild
//Node.previous/nextElementSibling

// 목록 테이블
function loadTourList(pageNo) {
	console.log(pageNo);	
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

				// 테이블 시작
				let table = `
					<table>
						<thead>
							<tr>
								<th>순번</th>
								<th>b_title</th>
								<th>b_img</th>
								<th>b_content</th>
								<th>b_loc</th>
								<th>b_time</th>
								<th>b_url</th>
								<th>b_hits</th>
							</tr>
						</thead>
				`;

				table += "<tbody>";
					// 데이터 행 생성
					$.each(list, function (i, obj) {
						table += `
							<tr>
								<td><a href="javascript:void(0);" onclick="fn_upDate('${obj.b_idx}')">${i + 1}</a></td>
								<td>${obj.b_title}</td>
								<td><img src="${obj.b_img}" style="width:100px; height:auto; border-radius:8px;"/></td>
								<td>${obj.b_content ? obj.b_content.substring(0, 30) : ''}</td>
								<td><a href="javascript:void(0);" onclick="fn_go_map('${obj.b_lat}', '${obj.b_lon}', '0')">${obj.b_loc}</a></td>
								<td>${obj.b_time}</td>
								<td><a href="${obj.b_url}" target="_blank">${obj.b_url}</a></td>
								<td>${obj.b_hits}</td>
							</tr>
						`;
					});
				table += "</tbody>";	
				
				// 테이블 본문 닫기
				table += `						
						<tfoot>
							<tr>
								<td colspan="8">
									<ol class="paging">
				`;

				// 이전 버튼
				if (paging.beginBlock <= paging.pagePerBlock) {
					table += `<li class="disable">이전으로</li>`;
				} else {
					table += `<li><a href="javascript:void(0);" onclick="fn_go_page(${paging.beginBlock - paging.pagePerBlock});">이전으로</a></li>`;
				}

				// 페이지 번호
				for (let k = paging.beginBlock; k <= paging.endBlock; k++) {
					if (k === paging.nowPage) {
						table += `<li class="now"><a href="javascript:void(0);" onclick="fn_go_page(${k});">${k}</a></li>`;
					} else {
						table += `<li><a href="javascript:void(0);" onclick="fn_go_page(${k});">${k}</a></li>`;
					}
				}

				// 다음 버튼
				if (paging.endBlock >= paging.totalPage) {
					table += `<li class="disable">다음으로</li>`;
				} else {
					table += `<li><a href="javascript:void(0);" onclick="fn_go_page(${paging.endBlock + 1});">다음으로</a></li>`;
				}

				// 마무리
				table += `
									</ol>
								</td>
							</tr>
						</tfoot>					
				`;
				table += "</table>";	

				$(".table-container").html(table);

				fn_go_map(list[0].b_lat, list[0].b_lon, 1);
		},
		error : function() {
			alert("읽기실패");
		}
	});			
} 

function fn_go_page(pageNo){
	loadTourList(pageNo);	
}		


function fn_upDate(b_idx) {
	loadTourVOPre(b_idx);	
}

// 업데이트 전 업데이트 항목 조회 
function loadTourVOPre(b_idx) {
	console.log("loadTourVOPre :", b_idx);	
	const params = { b_idx : b_idx };
	 
	$.ajax({
		url : "/updateTourPre", 
		method : "post",
		data : params,
		dataType : "json",  
			success : function(data) {			
				//console.log(data);	    	
				const vo = data.vo;
				const res = data.res; 	
				//console.log(vo);				
				//console.log(res);							

				if (res === "OK") {
					  // 페이지 이동을 위해 일반 Controller로 이동 
						// Controller 에서 session 저장 처리 
						location.href = "/tourUpdate?b_title="+vo.b_title+"&b_content="+vo.b_content+"&b_theme="+vo.b_theme+"&b_idx="+vo.b_idx; 

					}					
			},
			error : function() {
				alert("읽기실패");
		}
	});			
} 


function validateForm() {
	const url = document.getElementById("b_img").value.trim();
	if (url && !/^https?:\/\/.+/i.test(url)) {
		alert("이미지 URL은 http:// 또는 https://로 시작해야 합니다.");	
		return false;
	}
	return true;
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


function findAddress() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 전체 주소
			var fullAddr = data.address;
			document.getElementById("b_loc").value = fullAddr;
			
			// 위도, 경도 자동 입력은 인증 오류가 나서 안됨(401)
			// Rest API 키 입력 
			//getCoords(fullAddr);
		}
	}).open();
}

function getCoords(address) {
	console.log("address : " , address)
	fetch("https://dapi.kakao.com/v2/local/search/address.json?query=" + encodeURIComponent(address), {
		headers: { Authorization: "c7f8f317d8e608e8c29c74acce4d43f8" } 
	})			
	.then(response => response.json())
	.then(data => {
		if (data.documents.length > 0) {
			const lat = data.documents[0].y;
			const lon = data.documents[0].x;
			document.getElementById("b_lat").value = lat;
			document.getElementById("b_lon").value = lon;
		} else {
			alert("좌표를 찾을 수 없습니다.");
		}
	})
	.catch(err => console.error(err));
}		

	