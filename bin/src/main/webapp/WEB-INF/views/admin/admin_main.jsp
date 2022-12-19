<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Style the sidebar - fixed full height */
.sidebar {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 250px;
  background-color: #e7cc87;
  overflow-x: hidden;
  padding-top: 250px;
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- Load an icon library -->

<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
<!-- The sidebar -->
<div class="sidebar">
  <a href="${pageContext.request.contextPath}/admin/admin_notice"><i class="fa fa-fw fa-home"></i> 공지사항</a>
  <a href="#services"><i class="fa fa-fw fa-wrench"></i> 이벤트</a>
  <a href="${pageContext.request.contextPath}/admin/admin_list"><i class="fa fa-fw fa-user"></i> 회원관리</a>
  <a href="${pageContext.request.contextPath}/admin/admin_ask_list"><i class="fa fa-fw fa-envelope"></i>1:1문의</a>
</div>


</body>
</html>