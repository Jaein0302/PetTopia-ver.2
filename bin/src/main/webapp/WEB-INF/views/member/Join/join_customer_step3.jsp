<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 개인 회원가입</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
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
   <form class="mform customer" name="joinform" action="${pageContext.request.contextPath}/main/joinProcess" method="post">
	<h1>정보입력</h1>
	<hr>
	<b>아이디&ensp;<i class="fas fa-check chk_id" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_id" placeholder="아이디를 입력해주세요" required maxlength="12">
	<span class="message" id="message"></span>
	
	<b>비밀번호&ensp;<i class="fas fa-check chk_pass" style="display:none"></i></b>
	<input type="password" class="jinput" name="member_password" placeholder="비밀번호를 입력해주세요" maxlength="20"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required >
	<span class="message" id="pass_message"></span>
	
	<b>비밀번호 확인&ensp;<i class="fas fa-check chk_passchk" style="display:none"></i></b>
	<input type="password" class="jinput" name="passwordchk" placeholder="비밀번호 확인을 입력해주세요" maxlength="20"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required>
	<span class="message" id="passchk_message"></span>
	
	<b>이름&ensp;<i class="fas fa-check chk_name" style="display:none"></i></b>
	<input type="text"  class="jinput" name="member_name" placeholder="이름을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required>
	
	<b>우편번호&ensp;<i class="fas fa-check chk_post" style="display:none"></i></b>
	<input type="text" class="jinput" id="post1" name="member_post" placeholder="우편번호를 검색해주세요" maxlength="5" style="width:200px" readOnly required>
	<input class="button-5 postb" type="button" value="우편검색"  id="postcode" style="padding:10px 20px">
	
	<b>주소&ensp;<i class="fas fa-check chk_address" style="display:none"></i></b>
		<input type="text" class="jinput" id="address" name="member_address" placeholder="주소를 입력해주세요" required>
	<span class="message" id="address_message"></span>
	
	<b>연락처&ensp;<i class="fas fa-check chk_tell" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_tell" placeholder="연락처를 입력해주세요" required>
	<span class="message" id="tell_message"></span>
	
	<b style="display:none">이메일&ensp;<i class="fas fa-check chk_email" style="display:none"></i></b>
	<input type="hidden" class="jinput" name="member_email" value="${member_email}" maxlength="30" required>
	
	<div class="clearfix">
		<button type="submit" class="button-5 cancelbtn updateb">가입</button>
		<button type="button" class="button-5 submitbtn signoutb">취소</button>
	</div>
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
</div>
	<jsp:include page="../footer.jsp" />
	<script src="${pageContext.request.contextPath}/resources/js/Main/join.js"></script>
</body>
</html>