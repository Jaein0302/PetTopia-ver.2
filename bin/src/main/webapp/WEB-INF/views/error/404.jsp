<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>404 오류</title>
<style>
div {text-align: center;margin:0 auto;}
img{display: block; margin: 0px auto;}
</style>
</head>
<body>
	<div>
		${exception}<br> 
		<img src="${pageContext.request.contextPath}/resources/img/Main/404.png"	width="300px"> 
		요청하신 <b>${url}</b> 이 존재하지 않습니다.
	</div>
</body>
</html>