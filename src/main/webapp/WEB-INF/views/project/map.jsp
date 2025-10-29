<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/top.css" rel="stylesheet">
<link href="/resources/css/bottom.css" rel="stylesheet">
<link href="/resources/css/mainHomePage.css" rel="stylesheet">

<link href="/resources/css/map.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<div class="map_container">
		<div class="mapbody">
			<img alt="" id="w_map" src="/resources/images/map/map-su.png" usemap="#use_map-su">
			<map name="use_map-su">
	   			<area onmouseover="on_mouse_area('Gyeonggi')" onmouseout="off_mouse_area()" target="_self" id="Gyeonggi" alt="경기도" href="" coords="305,145,297,199,332,227,326,291,219,325,195,253,269,235,250,185,200,198,170,189,238,98,264,113" shape="poly">
	   			<area onmouseover="on_mouse_area('Seoul')" onmouseout="off_mouse_area()" target="_self" id="Seoul" alt="서울" href="" coords="207,218,220,208,235,197,241,221,240,230,218,234" shape="poly">
			    <area onmouseover="on_mouse_area('Busan')" onmouseout="off_mouse_area()" target="_self" id="Busan" alt="부산" href="" coords="512,664,526,651,542,642,557,626,568,623,565,642,557,655,531,670" shape="poly">
			    <area onmouseover="on_mouse_area('Chungbuk')" onmouseout="off_mouse_area()" target="_self" id="Chungbuk" alt="충청북도" href="" coords="279,341,334,299,414,286,414,304,451,307,451,320,431,331,434,345,391,346,375,365,364,373,346,390,345,404,357,411,353,438,350,457,373,464,373,481,361,495,345,498,331,489,323,464,310,455,316,430,305,414,293,417,279,387,295,365" shape="poly">
			    <area onmouseover="on_mouse_area('Chungnam')" onmouseout="off_mouse_area()" target="_self" id="Chungnam" alt="충청남도" href="" coords="110,342,129,355,158,313,191,328,208,347,249,331,264,342,280,361,268,365,246,363,245,383,255,402,258,424,265,435,256,452,263,462,272,471,287,472,299,473,312,469,316,485,319,500,302,486,304,506,290,496,285,479,250,486,233,473,216,475,202,481,198,495,182,500,159,469,165,433,151,396,149,373,136,393,102,373" shape="poly">
			    <area onmouseover="on_mouse_area('Daegu')" onmouseout="off_mouse_area()" target="_self" id="Daegu" alt="대구" href="" coords="445,518,449,526,455,527,464,516,476,506,488,509,489,525,484,534,479,543,478,552,469,546,458,553,453,563,454,571,445,570,439,564,449,553,444,548,458,540,443,531" shape="poly">
			    <area onmouseover="on_mouse_area('Daejeon')" onmouseout="off_mouse_area()" target="_self" id="Daejeon" alt="대전" href="" coords="286,422,292,424,299,428,303,435,301,443,298,454,295,465,292,452,280,452,278,468,271,450,273,432" shape="poly">
			    <area onmouseover="on_mouse_area('Gangwon')" onmouseout="off_mouse_area()" target="_self" id="Gangwon" alt="강원도" href="" coords="259,73,380,77,407,64,426,28,445,61,455,89,487,143,532,193,578,284,555,300,508,298,479,299,445,293,427,287,419,270,389,278,377,267,360,284,345,288,348,259,357,211,335,203,317,197,313,166,326,146,313,135,301,128,293,107,278,110,277,93,261,101,251,84" shape="poly">
			    <area onmouseover="on_mouse_area('Gyeongsangbuk')" onmouseout="off_mouse_area()" target="_self" id="Gyeongsangbuk" alt="경상북도" href="" coords="358,396,365,391,377,389,372,380,385,378,395,376,388,366,397,357,417,350,426,361,440,356,450,350,451,338,454,327,476,315,498,311,521,306,542,305,561,313,567,302,577,293,585,305,585,324,587,348,595,355,596,375,590,403,591,426,582,446,586,468,592,484,589,498,593,506,602,508,607,502,616,497,613,513,605,532,603,546,596,562,576,565,575,554,562,549,550,553,539,563,529,575,516,568,508,579,496,584,483,580,471,579,465,570,464,561,480,558,493,552,491,541,500,517,490,497,470,502,454,514,441,515,437,531,447,539,435,539,435,549,440,557,431,556,432,570,412,568,415,549,397,533,379,530,369,516,368,506,382,476,394,465,381,451,360,446,364,420,369,408,364,403" shape="poly">
			    <area onmouseover="on_mouse_area('Gyeongsangnam')" onmouseout="off_mouse_area()" target="_self" id="Gyeongsangnam" alt="경상남도" href="" coords="323,587,328,568,333,548,346,535,362,529,380,537,396,540,401,552,405,563,398,571,410,574,427,573,437,579,448,578,458,576,466,579,478,588,490,589,501,586,516,580,526,576,534,576,526,583,528,590,538,591,551,604,565,611,559,616,551,618,542,626,530,632,527,641,512,644,502,654,498,661,491,668,480,658,475,645,463,653,470,671,449,668,440,683,452,688,448,731,429,695,415,696,405,704,394,699,393,674,385,680,376,690,350,700,343,672,329,658,320,637,334,607" shape="poly">
			    <area onmouseover="on_mouse_area('Incheon')" onmouseout="off_mouse_area()" target="_self" id="Incheon" alt="인천" href="" coords="166,212,175,207,182,210,191,214,186,222,187,230,191,236,185,247,174,239,172,231,179,221,169,220" shape="poly">
			    <area onmouseover="on_mouse_area('Jeollabuk')" onmouseout="off_mouse_area()" target="_self" id="Jeollabuk" alt="전라북도" href="" coords="163,510,188,508,202,501,212,494,212,484,229,482,233,491,244,497,254,492,264,494,268,486,276,485,280,498,283,509,295,512,308,512,324,505,336,505,353,506,358,517,353,525,335,535,324,545,314,581,313,589,326,611,316,629,296,619,285,628,265,628,253,622,242,633,237,604,225,599,219,614,200,598,187,603,182,620,166,627,154,622,146,612,149,601,183,586,154,581,150,571,174,550,196,551,183,539,199,525,171,527" shape="poly">
			    <area onmouseover="on_mouse_area('Jeollanam')" onmouseout="off_mouse_area()" target="_self" id="Jeollanam" alt="전라남도" href="" coords="122,648,141,613,144,624,151,635,159,642,171,638,185,630,193,618,195,607,206,607,211,613,213,620,225,617,230,608,234,624,234,634,241,639,258,637,277,638,290,638,296,630,308,636,312,650,319,662,329,673,337,685,339,698,325,704,312,705,323,721,342,721,347,736,331,739,323,758,315,729,303,710,282,718,286,734,292,747,300,763,277,789,253,780,279,748,264,733,234,654,215,639,191,641,171,657,173,672,186,679,194,685,209,680,230,676,236,664,268,740,242,750,225,766,218,790,200,791,185,820,163,820,130,774,115,744,106,673" shape="poly">
			    <area onmouseover="on_mouse_area('Sejong')" onmouseout="off_mouse_area()" target="_self" id="Sejong" alt="세종" href="" coords="252,369,271,379,273,393,279,401,283,414,276,425,265,417,265,405,259,392,254,386" shape="poly">
			    <area onmouseover="on_mouse_area('Ulsan')" onmouseout="off_mouse_area()" target="_self" id="Ulsan" alt="울산" href="" coords="548,567,551,560,569,560,569,568,577,572,588,568,598,568,598,588,585,601,586,619,581,626,570,616,569,603,559,603,550,594,534,584,541,575" shape="poly">
			    <area onmouseover="on_mouse_area('Jeju')" onmouseout="off_mouse_area()" target="_self" id="Jeju" alt="제주" href="" coords="110,992,133,972,199,960,212,970,216,984,207,1000,165,1015,129,1019,115,1023,100,1015,95,999" shape="poly">
			    <area onmouseover="on_mouse_area('Gwangju')" onmouseout="off_mouse_area()" target="_self" id="Gwangju" alt="광주" href="" coords="191,651,202,654,216,646,221,654,227,661,225,666,220,673,210,674,198,678,196,672,181,671,179,662,185,657" shape="poly">
			</map>
		</div>
		 <div class="title">
			<span id="title_text1">놀러갈곳</span><br>
			<span id="title_text2"> 여행지 확인하기</span>
			<div class="title_img_body">
				<img alt="" id="title_img1" src="/resources/images/example/home1.jpg">
				<img alt="" id="title_img2" src="/resources/images/example/home2.jpg">
			</div>
		</div>
	</div>
	
	<jsp:include page="bottom.jsp"></jsp:include>
	
	<script type="text/javascript">
	function on_mouse_area(area)
	{		
		let element = document.getElementById(area);
		let altText = element.alt;
		
		document.getElementById('w_map').src = "/resources/images/map/map-su_" + area + ".png";
		document.getElementById('title_img1').src = "/resources/images/example/" + area + "1.jpg";
		document.getElementById('title_img2').src = "/resources/images/example/" + area + "2.jpg";
		element.href = "/getLocalList?local=" + altText;
		document.getElementById('title_text1').textContent = altText;
	}
	
	function off_mouse_area()
	{
		document.querySelector('#w_map').src = '/resources/images/map/map-su.png';
	}
	</script>
</body>
</html>