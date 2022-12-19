<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div class="container">
<b>비밀번호가 성공적으로 변경되었습니다.</b>
<br>
<img src="${pageContext.request.contextPath}/resources/img/Main/tabom.jpg" style="width: 250px; height: 250px">
<br>
<button>창닫기</button>
</div>

<script>
$('button').click(function(){
	window.close();
})
</script>

</body>
</html>