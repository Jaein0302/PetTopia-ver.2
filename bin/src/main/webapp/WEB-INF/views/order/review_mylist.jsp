<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 내가 남긴 리뷰</title>
<link href="${pageContext.request.contextPath}/resources/css/Order/review_list.css" type="text/css" rel="stylesheet">
</head>
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
   
   <!-- 내가 남긴 리뷰 -->
   <div class="col-md-9 pb-3">
     	
     	<%-- 리뷰 디테일 --%>
	<div class="popup_panel1">
     <div class="popup_bg1"></div>
       <div class="popup_contents1">
         <a href="javascript:void(0)" id="btn_popup_close1"></a>
	<div class='w-100'>
		 <table class="table viewp1 mb-0">
      	<tr>
     	  <td class="review_subject p-1" colspan="2" style="text-align:center!important;background: #f9c5276b;color: #56565a;font-size: 19px; font-weight: bold;">
     	  	
     	  </td>
     	</tr>
     	<tr style="border-bottom:0.6px solid #EDF1FF">
     	  <td class="p-1" style="text-align:left!important;font-size: 15px;color: #4a4c4b;">
     	 	<i style="color:#4a4c4b;"class="fa fa-user pl-2"></i>&nbsp; <span class="review_name pr-3" > </span>
	     	<i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp; <span class="review_date pr-3" > </span>
     	  	<span class="review_score"></span>
     	  </td>
     	</tr>
    
     	<tr>
	     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
	     	 	<div class="review_content"></div>
	     	 </td>
     	</tr>
     	</table>
	</div>
	</div>
	</div>
	<%-- 리뷰 디테일 끝--%>
	
	<div class='w-100'>
   		<h2 class='rlist' style='mb-4'>내가 남긴 리뷰</h2>
  	</div>
	
   <c:if test="${!empty boardlist}">
     <c:forEach var="b" items="${boardlist}">
    <input type="hidden" id="reviewnum" value="${b.review_num}">
    <div class="w-100 rdetail" style="cursor:pointer">
   <table class="m-0 table text-left">
    <!-- 테이블 간격 -->
	<colgroup>
	<col width="70%" />
	<col width="30%" />
	</colgroup>
      <tr class='rborder'>
		<td class="p-2" style='vertical-align:top!important;'>
		  <%-- 아이디, 날짜, 별점 --%>
		  <span class='text-small pr-3'>
		  	<i style="color:#4a4c4b;"class="fa fa-user"></i> ${b.review_id}</span>
		  <span class='text-small pr-3'>
		  	<i style="color:#4a4c4b;"class="fa fa-clock-o"></i> ${b.review_reg_date}</span>
		  <c:if test="${b.review_score==1}">
		  <i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==2}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==3}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==4}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
		  </c:if>
		  <c:if test="${b.review_score==5}">
		  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
		  </c:if>
		  <span class='text-small'>${b.review_score}.0</span>
		 <sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" id="loginid" value="${pinfo.username}">
			<c:if test="${b.review_id == pinfo.username || pinfo.username == 'admin' }">
				<a style="color:tomato;font-size:15px;cursor:pointer" class="deletechk">
				<input type="hidden" value="${b.review_num}">
					<i class="pl-3 fas fa-trash-alt"></i>&nbsp;삭제</a>
				&ensp;
				</c:if>
			</sec:authorize>
		  <%-- 제목 --%>
		  <div>
			  <span class="rsubject pt-1 text-dark">
				<c:out value="${b.review_subject}" escapeXml="true"/> 
			  </span>
		  </div>
		  <%-- 내용 --%>
		  <div class='pl-2 pr-4 pb-4 text-small'>
			  <span>
			   <c:if test="${b.review_text.length()>=50}">
		  	     		<c:out value="${b.review_text.substring(0,50)}..." />
			  	 </c:if>
			  	 <c:if test="${b.review_text.length()<50}">
		        		<c:out value="${b.review_text}"/>
		         </c:if>
			  </span>	
		  </div>
		</td>
		  
		 <%-- 썸네일 --%>
		<td class="pr-3 text-right">
		  <c:if test="${!empty b.review_image}">
		     <img class='img-thumbnail review_img'${fn:replace(b.review_image, '>', ' ')}>
		  </c:if>
		</td>
		</tr>
	 </table>
	 </div>
	 </c:forEach>
	 </c:if>
	 
	 <%--리뷰가 없는 경우--%>
	<c:if test="${empty boardlist}">
	<div class="text-center" style="margin:100px auto 400px auto">
	<h2 class="text-body">작성된 리뷰가 없습니다</h2>
	</div>
	</c:if>

	 
<!-- 페이징 처리 -->
	<div class="pagination-div">
	<ul class="pagination modal-2 text-center">
	  
	 <c:if test="${page <= 1 && listcount != 0}">
	  <li><a href="#" class="prev"><i class="fas fa-angle-double-left"></i></a></li>
	 </c:if> 
	 <c:if test="${page > 1 }">
	  <li>
		<a class="next" href="${pageContext.request.contextPath}/order/myreview?page=${page-1}"><i class="fas fa-angle-double-left"></i></a>
	  </li>
	 </c:if> 
	 
	 <c:forEach var="a" begin="${startpage}" end="${endpage}">
	 	<c:if test="${a == page}">
		 <li>
			<a class="pnum active">${a}</a>
		 </li>
	   </c:if>
	   <c:if test="${a != page }"> 
	 	 <li>
			<a class="pnum" href="${pageContext.request.contextPath}/order/myreview?page=${a}">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	  
	<c:if test="${page >= maxpage  && listcount != 0}}">
		<li class="page-item">
		  <li><a href="#" class="next"><i class="fas fa-angle-double-right"></i></a></li>
	</c:if>
	<c:if test="${page < maxpage }"> 
	     <li>
			<a class="next" href="${pageContext.request.contextPath}/order/myreview?page=${page+1}"><i class="fas fa-angle-double-right"></i></a>
		 </li>
	</c:if>
	</ul>
	</div>
   
   
   
   </div>
  </div>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/Order/review_detail.js"></script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>