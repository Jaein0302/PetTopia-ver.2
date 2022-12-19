<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 사업자인증</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
</head>
<style>
.mform{width:600px!important}
.clearfix {margin: 39px 57.5px!important}
.jinput{width:400px!important}
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
   		 action="${pageContext.request.contextPath}/main/join_business_step3" method="post">
	<h1>사업자등록번호 인증</h1>
	<hr>
	
	<div style="margin: 30px 0 56px 86px;">
	<b>기업명&ensp;<i class="fas fa-check chk_name" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_name" placeholder="기업명을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required>
	
	<b>대표자성명&ensp;<i class="fas fa-check chk_bname" style="display:none"></i></b>
	<input type="text" class="jinput bname" placeholder="대표자성명을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required value="정윤수">
	
	<b>개업일자&ensp;<i class="fas fa-check chk_bdate" style="display:none"></i></b>
	<input type="text" class="jinput bdate" placeholder="Ex) YYYYMMDD" maxlength="8" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required value="20131219">
	
	<b>업종&ensp;<i class="fas fa-check chk_btype" style="display:none"></i></b>
	<select class="selectType" style="padding:8px 20px;margin-right:3px">
		<option value="선택">업종선택</option>
		<option value="동물병원">동물병원</option>
		<option value="애견미용">애견미용</option>
		<option value="훈련기관">훈련기관</option>
		<option value="기타">직접입력</option>
	</select>
	<input type="text" class="jinput inputText" name="member_btype" 
	        placeholder="업종을 선택해주세요" style="width:267px!important" required readOnly  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" >
	
	
	<b>사업자 등록번호&ensp;<i class="fas fa-check chk_bno" style="display:none"></i></b>
	<input type="text" class="jinput" id="regnum" name="member_regnum" 
		   placeholder="Ex) 1234567890" maxlength="10" style="width:305px!important" required value="1208806529">
	<input class="button-5 postb regnum" type="button" value="인증"  id="b_regnum" style="padding:10px 20px">
	<br><span class="message" id="reg_message"></span>
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
	<script src="${pageContext.request.contextPath}/resources/js/Main/business.js"></script>
</body>
</html>