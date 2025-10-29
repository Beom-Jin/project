<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>처리 결과</title>
    <script>
        window.onload = function() {
            alert("${message}");
            location.href = "${redirect}";
        }
    </script>
</head>
<body></body>
</html>