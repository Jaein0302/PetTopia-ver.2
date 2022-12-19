<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 <sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal" var="pinfo"/>
		<aside>
			<h4>마이페이지</h4>
				<ul class="nav nav-pills flex-column" id="myPageName" style="width: 200px">
					 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/order/list">예약내역</a></li>
	                 <li class="nav-item"><a class="nav-link" href="#">내가 남긴 문의</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/order/myreview?member_id=${pinfo.username}">내가 남긴 리뷰</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}">내 글</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}">내 댓글</a></li>
	                 <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
               	</ul>
		</aside>
</sec:authorize>
</body>
</html>