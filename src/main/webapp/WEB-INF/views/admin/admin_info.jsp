<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원정보)</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join.css" rel="stylesheet" type="text/css">
</head>
<style>
.jinput{width:80%;}
.info{margin:0 auto;}
</style>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  
   <!-- 사이드바 -->	  
   <div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
   </div>
   
	<div class="col-md-9 pb-3">
     
	   <div class='w-100 m-2'>
	   		 <a href="${pageContext.request.contextPath}/admin/admin_list"><span>회원 목록&emsp;>&emsp;</span></a>
	   		 <span class="commu pr-4" style='font-weight: bold;'><span class="p-subTitle">${m.member_id}</span>&nbsp;님의 회원 정보</span>
	   </div>   
   
   <div class="info p-4">
	<b>아이디</b>
	<input type="text" class="jinput" name="member_id" value="${m.member_id}" readOnly>

	<b>이름</b>
	<input type="text" class="jinput" name="member_name" value="${m.member_name}" readOnly>
	
	<c:if test="{!empty m.member_regnum}">
	<b>사업자 등록번호</b>
	<input type="text" class="jinput" name="member_regnum" value="${m.member_regnum}" readOnly>
	
	<b>업종</b>
	<input type="text" class="jinput" name="member_btype" value="${m.member_btype}" readOnly>
	</c:if>
	
	<b>우편번호</b>
	<input type="text" class="jinput" name="member_post" value="${m.member_post}" readOnly>
	
	<b>주소</b>
	<input type="text" class="jinput" name="member_address" value="${m.member_address}" readOnly>
	
	<b>연락처</b>
	<input type="text" class="jinput" name="member_tell" value="${m.member_tell}" readOnly>
	
	<b>이메일</b>
	<input type="text" class="jinput" name="member_email" value="${m.member_email}" readOnly>
   	
   </div>
</div></div></div>
<jsp:include page="../member/footer.jsp" />
</body>
</html>