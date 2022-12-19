<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>회원관리 시스템 회원수정 페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.mform{width:600px!important}
.clearfix {margin: 39px 57.5px!important}
.text-dark{opacity:0.7}
.text-dark:hover{opacity:1}
#changePW {
	width: 150px!important;
	}
</style>

</head>
<body>
<jsp:include page="../member/header.jsp"/>
<div class="container mb-5">
	<div class="row">
	<jsp:include page="./aside.jsp" />
			
   <form class="mform" name="updateform" action="updateProcess" method="post">
	<h1>회원 정보 수정</h1>
	<hr>
	<b>아이디</b>
	<input type="text" class="jinput" name="member_id" value="${memberinfo.member_id}" readonly>
	
	<b>비밀번호</b>
	<input type="password" class="jinput" name="member_password" value="${memberinfo.member_password}" readonly>
	<input class="button-5 postb" type="button" value="비밀번호 변경하기"  id="changePW" style="padding:10px 20px">
	<br><br>
	
	<b>이름</b>
	<input type="text" class="jinput" name="member_name" value="${memberinfo.member_name}" placeholder="Enter name" 
		   required>
		   
	<b>우편번호</b>
	<input type="text" class="jinput" id="member_post" name="member_post" placeholder="우편번호를 검색해주세요"
		maxlength="5" style="width:200px" value="${memberinfo.member_post}" readOnly required
		style="width:">
	<input class="button-5 postb" type="button" value="우편검색"  id="postcode" style="padding:10px 20px">
	
	<b>주소</b>
	<input type="text" class="jinput" id="member_address" name="member_address"
		maxlength="2" placeholder="주소를 입력해주세요" value="${memberinfo.member_address} " required>
	<span class="message" id="address_message"></span>
	
	<b>이메일 주소</b>
	<input type="text" class="jinput" name="member_email"  value="${memberinfo.member_email}" placeholder="Enter email"
		required><span id="email_message"></span>
	
	<div class="clearfix mt-4">
		<button type="submit" class="button-5 cancelbtn updateb">수정하기</button>
		<button type="button" class="button-5 submitbtn signoutb">취소</button>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	</div>
</div>
<script>
$('#postcode').click(function(){
	//window.open("post.html", "post", "width=400, height=500, scrollbars=yes");
	Postcode();
	$("#post_message").html("");
	checkpost=true;
	$("#address_message").html("");
	checkaddress=true;
});	

function Postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	console.log(data.zonecode)
            var fullRoadAddr = data.roadAddress;
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            $('#member_post').val(data.zonecode);
            $('#member_address').val(fullRoadAddr);
            if(data.zonecode!=="") {$(".chk_post").show();}
            if(fullRoadAddr!=="") {$(".chk_address").show();}
        }
    }).open();
}//function Postcode()

$('#changePW').click(function(){
	window.open("goto_changePW","post","width=300, height=500");
})
</script>
</body>
</html>