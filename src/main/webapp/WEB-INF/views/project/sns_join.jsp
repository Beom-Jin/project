<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 전화번호 입력 </title>
<style type="text/css">
	#container{
		width: 500px;
		margin: 50px auto;
		text-align: left;
	}
	h2{text-align: center;}
	fieldset {
		padding: 20px;
		border: 1px solid #ccc;
	}
	ul{
		list-style-type: none;
		padding: 0;
	}
	li{
		margin: 10px 0;
		display: flex;
		align-items: center;
	}
	label {
		width: 120px;
		flex-shrink: 0
    }
    input[type="text"]{
    	padding: 5px;
    	flex: 1;
    }
	#buttons{
		text-align: center;
		margin-top: 20px;
	}
	
	input[type="submit"]{
    	width: 120px;
    }
</style>
</head>
<body>
	<div id="container">
		<h2>추가 정보 입력</h2>
		<form action="/sns_join_ok" method="post" onsubmit="return validateForm();">
			<fieldset>
				<legend> 전화번호 입력 </legend>
				<ul>
					<li>
						<label for="m_phone">휴대폰 번호</label>
						<input type="text" name="m_phone" id="m_phone" placeholder="010-1234-5678" required>
					</li>
				</ul>
				<div id="buttons">
					<input type="submit" value="SNS 가입">
				</div>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		function validateForm() {
			const phone = document.querySelector("#m_phone").value ;
			// 정규식
			const regex = /^010-\d{4}-\d{4}$/;
			
			if(!regex.test(phone)){
				alert("전화번호는 010-0000-0000 형식으로 입력하세요.");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>