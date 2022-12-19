<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<title>펫토피아 - 아이디/비밀번호 찾기</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>
  <div class="container mb-5 mainbody" style="height:930px;margin-top: 200px;">
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
            <form method="GET" action="${pageContext.request.contextPath}/main/Find_id">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn">
                    <div class="position-relative" style="z-index: 1;">
                        <h2 class="font-weight-semi-bold mb-4">회원 아이디 찾기</h2>
                    </div>
                    <b class="text-dark text-left">이름 (기업명)</b>
                    <input type="text" class="jinput" name="member_name" placeholder="이름 or 기업명을 입력해주세요"><br>
                    <b class="text-dark text-left">이메일</b>
                    <input type="text" class="jinput" name="member_email" placeholder="이메일 주소를 입력해주세요"><br>
                    <input class="btn btn-primary p-2 mt-3 findbtn" type="submit" value="아이디 찾기">
                </div>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </div>
            <div class="col-md-6 pb-4">
             <form method="POST" action="${pageContext.request.contextPath}/main/Find_pass">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn">
                    <div class="position-relative" style="z-index: 1;">
                        <h2 class="font-weight-semi-bold mb-4">회원 비밀번호 찾기</h2>
                    </div>
                    <b class="text-dark text-left">아이디</b>
                    <input type="text" class="jinput" name="member_id" placeholder="아이디를 입력해주세요"><br>
                    <b class="text-dark text-left">이름 (기업명)</b>
                    <input type="text" class="jinput" name="member_name" placeholder="이름 or 기업명을 입력해주세요"><br>
                    <b class="text-dark text-left">이메일</b>
                    <input type="text" class="jinput" name="member_email" placeholder="이메일 주소를 입력해주세요"><br>
                    <input class="btn btn-primary p-2 findbtn" type="submit" value="비밀번호 찾기">                    
                </div>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </div>
        </div>
    </div>
    </div>
<jsp:include page="../footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
var message = "${message}";
if(message == 'fail'){
    Swal.fire({
	   icon: 'error',
	   title: '등록된 정보가 없습니다.',
	 })
  };
</script>
</body>
</html>