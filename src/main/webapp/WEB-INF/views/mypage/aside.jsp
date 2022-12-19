<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/Main/aside.css" type="text/css" rel="stylesheet">
</head>
<body>
 <!-- 일반 회원 로그인 -->
<sec:authorize access="hasRole('ROLE_MEMBER')">
 <sec:authentication property="principal" var="pinfo"/>
      <aside>
         <h4><i class="fas fa-user-circle pr-2"></i>마이페이지</h4>
            <ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
                <li class="nav-item mn0"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
                    <li class="nav-item mn1"><a class="nav-link" href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}">예약내역</a></li>
                    <li class="nav-item mn2"><a class="nav-link" href="${pageContext.request.contextPath}/ask/myask?member_id=${pinfo.username}">내가 남긴 문의</a></li>
                    <li class="nav-item mn3"><a class="nav-link" href="${pageContext.request.contextPath}/order/myreview?member_id=${pinfo.username}">내가 남긴 리뷰</a></li>
                    <li class="nav-item mn4"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
                    <li class="nav-item mn5"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
                    <li class="nav-item mn6"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
                  </ul>
      </aside>
</sec:authorize>

 <!-- 판매자 로그인 -->	
<sec:authorize access="hasRole('ROLE_SELLER')">
 <sec:authentication property="principal" var="pinfo"/>
      <aside>
         <h4><i class="fas fa-user-circle pr-2"></i>마이페이지</h4>
            <ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
                <li class="nav-item mn0"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
                    <li class="nav-item mn4"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
                    <li class="nav-item mn5"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
                    <li class="nav-item mn7"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/SCH?member_id=${pinfo.username}">나의 일정확인</a></li>
                    <li class="nav-item mn8"><a class="nav-link" href="${pageContext.request.contextPath}/product/my_product?member_id=${pinfo.username}">내 상품 관리</a></li>
                    <li class="nav-item mn6"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
                  </ul>
      </aside>
</sec:authorize>

 <!-- Admin 로그인 -->	
<sec:authorize access="hasRole('ROLE_ADMIN')">
 <sec:authentication property="principal" var="pinfo"/>
      <aside>
         <h4><i class="fas fa-user-circle pr-2"></i>마이페이지</h4>
            <ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
                <li class="nav-item mn0"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
                    <li class="nav-item mn4"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
                    <li class="nav-item mn5"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
                    <li class="nav-item mn9"><a class="nav-link" href="${pageContext.request.contextPath}/admin/admin_list">회원 목록</a></li>
                    <li class="nav-item mn6"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
                  </ul>
      </aside>
</sec:authorize>
<script src="${pageContext.request.contextPath}/resources/js/Main/aside.js"></script>
</body>
</html>