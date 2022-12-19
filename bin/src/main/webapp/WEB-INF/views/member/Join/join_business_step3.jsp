<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 - 기업 회원가입</title>
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
	
	<b style="display:none">기업명&ensp;<i class="fas fa-check chk_name" style="display:none"></i></b>
	<input type="hidden" class="jinput" name="member_name" value="${member_name}" placeholder="이름을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required>
	
	<b style="display:none">대표자성명&ensp;<i class="fas fa-check chk_bname" style="display:none"></i></b>
	<input type="hidden" class="jinput bname" placeholder="대표자성명을 입력해주세요"  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required value="정윤수">
	
	<b style="display:none">개업일자&ensp;<i class="fas fa-check chk_bdate" style="display:none"></i></b>
	<input type="hidden" class="jinput bdate" placeholder="Ex) YYYYMMDD" maxlength="8" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"  required value="20131219">
	
	<b style="display:none">사업자 등록번호&ensp;<i class="fas fa-check chk_bno" style="display:none"></i></b>
	<input type="hidden" class="jinput" id="regnum" name="member_regnum"  value="${member_regnum}" placeholder="Ex) 1234567890" maxlength="10" style="width:305px" required value="1208806529">
	<input class="button-5 postb regnum" type="button" value="인증"  id="b_regnum" style="padding:10px 20px;display:none">
	
	<b style="display:none">업종&ensp;<i class="fas fa-check chk_btype" style="display:none"></i></b>
	<select class="selectType" style="padding:8px 20px;margin-right:3px;display:none">
		<option value="선택">업종선택</option>
		<option value="동물병원">동물병원</option>
		<option value="애견미용">애견미용</option>
		<option value="훈련기관">훈련기관</option>
		<option value="기타">직접입력</option>
	</select>
	<input type="hidden" class="jinput inputText" name="member_btype" value="${member_btype}"  placeholder="업종을 선택해주세요" style="width:268px" required readOnly  onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" >
	
	<b>우편번호&ensp;<i class="fas fa-check chk_post" style="display:none"></i></b>
	<input type="text" class="jinput" id="post1" name="member_post" placeholder="우편번호를 검색해주세요" maxlength="5" style="width:200px" readOnly required>
	<input class="button-5 postb" type="button" value="우편검색"  id="postcode" style="padding:10px 20px">
	
	<b>주소&ensp;<i class="fas fa-check chk_address" style="display:none"></i></b>
	<input type="text" class="jinput" id="address" name="member_address" placeholder="주소를 입력해주세요" required>
	<span class="message" id="address_message"></span>
	
	<b>연락처&ensp;<i class="fas fa-check chk_tell" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_tell" placeholder="연락처를 입력해주세요" required>
	<span class="message" id="tell_message"></span>
	
	<b>이메일&ensp;<i class="fas fa-check chk_email" style="display:none"></i></b>
	<input type="text" class="jinput" name="member_email" placeholder="이메일 주소를 입력해주세요" maxlength="30" required>
	<span class="message" id="email_message"></span>
	
	
	<div class="clearfix">
		<button type="submit" class="button-5 cancelbtn updateb">가입</button>
		<button type="reset" class="button-5 submitbtn signoutb">취소</button>
	</div>
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
</div>
	<jsp:include page="../footer.jsp" />
	<script src="${pageContext.request.contextPath}/resources/js/Main/join.js"></script>
</body>
</html>