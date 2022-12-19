<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>403 오류</title>
<style>
div {text-align: center;margin:0 auto;}
img{display: block; margin: 0px auto;}
</style>
</head>
<body>
	<div>
		${exception}<br> 
		<img src="${pageContext.request.contextPath}/resources/img/Main/403.jpeg"> <br>
		<hr>
		<h1>${key}</h1>
	</div>
</body>
</html>