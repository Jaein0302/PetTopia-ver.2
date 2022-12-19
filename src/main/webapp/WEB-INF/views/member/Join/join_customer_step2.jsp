<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 본인인증</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
</head>
<style>
.mform{width:600px!important}
.clearfix {margin: 39px 57.5px!important}
.jinput{width:300px!important}
.text-dark{opacity:0.7}
.text-dark:hover{opacity:1}
</style>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>
 <div class="container mb-5" style="margin-top:20px;">
   <div class="container-fluid offer pt-5">
    <div class="text-center">
 	<jsp:include page="join_step.jsp" />
	</div>
   <form class="mform customer" name="joinform" 
   		 action="${pageContext.request.contextPath}/main/join_customer_step3" method="post">
	<h1>본인인증</h1>
	<hr>
	<div style="margin: 30px 0 56px 86px;">
	<b>이메일&ensp;<i class="fas fa-check chk_email" style="display:none"></i></b>
	<input type="text" class="jinput mb-4" name="member_email" placeholder="이메일 주소를 입력해주세요" maxlength="30" required>
	<input type="button" class="button-5 postb gomail" value="코드발송" style="padding:10px 20px">
	<span class="message" id="email_message"></span>
	
	<b>인증코드&ensp;<i class="fas fa-check chk_code" style="display:none"></i></b>
	<input type="hidden" class="jinput mail_code">
	<input type="text" class="jinput" name="mail_code" placeholder="인증코드를 입력해주세요" maxlength="10" required>
	<input type="button" class="button-5 postb go_chk_code" value="인증하기" style="padding:10px 20px">
	</div>
		
	<div class="clearfix mt-4">
		<button type="submit" class="button-5 cancelbtn updateb">다음단계</button>
		<button type="button" class="button-5 submitbtn signoutb">취소</button>
	</div>
	 <input type="hidden" name="agree" value="">
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
</div>
	<jsp:include page="../footer.jsp" />
	<script src="${pageContext.request.contextPath}/resources/js/Main/customer.js"></script>
</body>
</html>