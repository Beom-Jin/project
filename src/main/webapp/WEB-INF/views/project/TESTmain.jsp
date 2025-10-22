<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>


<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	width: 100%;
	height: 100vh;
	overflow: hidden;
}

.container_slider {
	width: 100%;
	height: 100%;
	perspective: 500px;
	transform-style: preserve-3d;
}

.slide {
	transition: 0.5s;
	width: 200px;
	box-shadow: 0 10px 50px gray;
	height: 300px;
	background: white;
	border: 1px solid red;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%)
}

.slide:nth-of-type(1){  
  transform:translate(calc(-50%*5.1),-50%) translateZ(-120px);
}
.slide:nth-of-type(2){  
  transform:translate(calc(-50%*5.1),-50%) translateZ(-100px);
}
.slide:nth-of-type(3){
  transform:translate(calc(-50%*3.1),-50%) translateZ(-50px);
}
.slide:nth-of-type(4){
   transform:translate(calc(-50%*1.1),-50%) translateZ(50px) ;
}
.slide:nth-of-type(5){
    transform:translate(calc(-50%*-0.9),-50%) translateZ(-50px) ;
}
.slide:nth-of-type(6){
  transform:translate(calc(-50%*-2.9),-50%) translateZ(-100px) ;
}
.slide:nth-of-type(7){
  transform:translate(calc(-50%*-2.9),-50%) translateZ(-120px) ;
}

/*버튼 */
.buttons {
	position: absolute;
	z-index: 1;
	bottom: 1em;
	left: 50%;
	transform: translate(-50%);
}

.slide img{
	width: 200px;
	height: 300px;
}
</style>


</head>
<body>
	<div class="container_slider">
		<div class='slide'>
			<a href="/showMap"><img alt="" src="/resources/images/photo-1.jpg"></a>
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/photo-2.jpg">
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/photo-3.jpg">
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/photo-4.jpg">
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/photo-5.jpg">
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/photo-6.jpg">
		</div>
		<div class='slide'>
			<img alt="" src="/resources/images/bear.jpg">
		</div>
	</div>

	<div class='buttons'>
		<button id="prev"> 뒤로 </button>
		<button id="next">앞으로</button>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			  $("#prev").on("click", function() {
				const slides = document.querySelectorAll(".slide")
				$(".container_slider").append(slides[0])
			});

			$("#next").on("click", function() {
				const slides = document.querySelectorAll(".slide")
				$(".container_slider").prepend(slides[slides.length-1])
			});  
			
			 function nextslide()
			{
				const slides = document.querySelectorAll(".slide")
				$(".container_slider").prepend(slides[slides.length-1])
			}
			
			setInterval(() => nextslide(), 2000); 
		});
	</script>
</body>
</html>