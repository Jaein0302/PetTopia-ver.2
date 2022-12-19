<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>문의하기</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>

</style>
</head>
<body>
문의하기 했던 게시글이 나옴.
admin_ask_list 모델앤뷰 값이 전달이 됩니다.

넘어갔는지 = ${ask}


<button class="btn btn-primary" type="submit">문의하기</button>

</body>
<script>
$(function(){
	$("button").click(function(){
		location.href="admin_ask_write";
	})
})
</script>	
	
</html>