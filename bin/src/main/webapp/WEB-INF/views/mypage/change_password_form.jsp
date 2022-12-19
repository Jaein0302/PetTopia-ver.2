<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

</script>
</head>
<body>
	<div class="container">
	 <form action="changePW_Proccess" method="post" id="changePW">
		<b>비밀번호</b>
		<input type="password" class="jinput" id="member_pass" name="member_pass">
		<div id="pass_message"></div>
		<b>비밀번호 확인</b>
		<input type="password" class="jinput" id="member_pass_check"name="member_pass_check">
		
		
		<button type="submit" id="confirm" class="button-5 cancelbtn updateb">변경하기</button>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 </form>
	 
	</div>
	
	<script>

	$('#confirm').click(function (){
		
		if($('#member_pass').val() != $('#member_pass_check').val() ){
			alert("비밀번호를 확인하세요");
			return false;
		} else {
			var pattern=/^[a-zA-Z0-9]{8,20}$/;
			
			if(!pattern.test($('#member_pass').val())){
				alert("숫자와 영문자 조합으로만 8~20자 가능합니다.");
				return false;
			 }else{
			    alert("사용 가능한 비밀번호 입니다.");
			 }
		}
	})
	
	
	</script>
</body>
</html>