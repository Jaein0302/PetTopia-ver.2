<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../member/header.jsp"/>
	<div class="container mb-5">
		<div class="row">
			<jsp:include page="./aside.jsp" />
			<form class="mform" name="passcheck" action="withdraw_process" method="post" id="form">
				<h1>회원 탈퇴</h1><hr>
				
			<div class="secession-step1-notice" style="text-align: left">
                <section>
                    <ul>
                        <li>회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.</li><br>
                        <li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li><br>
                        <li>유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간 만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.</li><br>
                        <li>회원탈퇴 후 펫토피아 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br>상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.</li><br>
                        <li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li><hr><br><br>
                    </ul>
                </section>
        	</div>
        	
        	<label>비밀번호 입력</label>
        	<input type="password" class="jinput" name="password" id="password">
        	<label>비밀번호 확인</label>
        	<input type="password" class="jinput" name="password_check" id="password_check">
        	<div class="clearfix mt-4">
        	<button type="submit" class="button-5 cancelbtn signoutb" id="sbmbutton">탈퇴하기</button>
        	<button type="button" class="button-5 submitbtn">취소</button>
        	</div>
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	
	<script>
		$('#sbmbutton').click( function(){
			
			if( $('#password').val() != $('#password_check').val()){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return false;
			}
		})
	
	
	</script>
</body>
</html>