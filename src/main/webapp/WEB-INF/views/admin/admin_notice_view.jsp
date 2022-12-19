<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="${pageContext.request.contextPath}/resources/css/Community/list.css" type="text/css" rel="stylesheet">
</head>
<style>
.mform {
    background-color: #fefefe;
    margin: 1% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    width: 87%; /* Could be more or less, depending on screen size */
    padding: 16px;
}
.comment-textarea{
    width: 83%;
    height: 90px;
    vertical-align: middle;
    margin: 0px;
    border: 2px solid rgb(237, 241, 255);
    resize: none;
    padding:10px
}
#write, #write1{
    vertical-align: middle;
    width: 14.3%;
    height: 90px;
    font-size:1.17em;
    opacity:1
}
#write:hover, #write1:hover{
	opacity:0.8
}
#comment table tbody tr,#comment table tbody tr td{
border:none;
padding:6px 15px
}
</style>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:500%;margin-top:220px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
	
     <table class="table viewp1 mb-5">
      	<tr>
     	  <td class="p-1" colspan="2" style="text-align:center!important;background: #f9c5276b;color: #56565a;font-size: 19px; font-weight: bold;">
     	  	<c:out value="${abn.ABN_SUBJECT}" />
     	  </td>
     	</tr>
     	<tr style="border-bottom:0.6px solid #EDF1FF">
     	  <td class="p-1" style="text-align:left!important;font-size: 15px;color: #4a4c4b;">
     	 	<i style="color:#4a4c4b;"class="fa fa-user"></i>&nbsp; <span class="userdoc" >${abn.ABN_NAME}</span>
     	  </td>
		  <td class="p-1" style="text-align:right!important;font-size: 14px;color: #4a4c4b;">
	     	  <i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp;&nbsp;${fn:replace(abn.ABN_DATE, '-', '.')}&nbsp; 
     	  </td>
     	</tr>
    
     	<tr>
	     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
	     	 	<div style="white-space:pre-wrap;font-size:16px;padding:10px 15px">${abn.ABN_CONTENT}</div>
	     	 </td>
     	</tr>
     	
		<tr>
			<td class="p-2">
			</td>
			<td class="p-2">
			<div style="text-align:right;">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" id="loginid" value="${pinfo.username}">
			<c:if test="${abn.ABN_NAME == pinfo.username || pinfo.username == 'admin' }">
				<a style="color:#0ab9a0;font-size:16px" 
				   href="${pageContext.request.contextPath}/admin/updateNoticeView?num=${abn.ABN_NUMBER}"><i class="fas fa-edit"></i>&nbsp;수정</a>
				&ensp;
				<a style="color:tomato;font-size:16px;cursor:pointer" 
				href="${pageContext.request.contextPath}/admin/deleteNotice?num=${abn.ABN_NUMBER}" class="deletechk"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
				&ensp;
				</c:if>
			</sec:authorize>
				<a href="${pageContext.request.contextPath}/admin/admin_notice" style="padding-right:10px;">
				 <i class="fa-solid fa-list" style="color:#444444;"></i>
				 <span style="color:#444444;font-size:16px;font-weight:bold;">목록</span></a>
			</div>	
			</td>
		</tr>
 	</table>
   </div>
  </div>
 </div>
</body>
<jsp:include page="../member/footer.jsp" />
</html>