<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/Main/aside.css" type="text/css" rel="stylesheet">
</head>
<style>
   .sidebar {
  height: 100%;
  width: 160px;
  background-color: #e7cc87;
  overflow-x: hidden;
  margin-top: 50px;
  padding: 70px 0;
}

/* Style sidebar links */
.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
}

/* Style links on mouse-over */
.sidebar a:hover {
  color: #f1f1f1;
}

/* Style the main content */
.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}

/* Add media queries for small screens (when the height of the screen is less than 450px, add a smaller padding and font-size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
<body>

      <aside>
	    <div class="sidebar">
	  <a href="${pageContext.request.contextPath}/admin/admin_notice"><i class="fa fa-fw fa-home"></i> 공지사항</a>
	  <sec:authorize access="hasRole('ROLE_ADMIN')">
	  <a href="${pageContext.request.contextPath}/admin/admin_list"><i class="fa fa-fw fa-user"></i> 회원관리</a>
	  </sec:authorize>
	  <a href="${pageContext.request.contextPath}/admin/admin_ask_list"><i class="fa fa-fw fa-envelope"></i>1:1문의</a>
	  </div>
      </aside>

<script src="${pageContext.request.contextPath}/resources/js/Main/aside.js"></script>
</body>
</html>