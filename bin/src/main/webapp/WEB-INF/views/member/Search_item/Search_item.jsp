<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 통합검색페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/search_item.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>

<div class="container mb-5 mainbody" style="height:1500px;margin-top:230px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		<div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">'${item}'검색 결과 총 
            <c:if test="${!empty lc}">
            ${lc}
            </c:if>
            <c:if test="${empty lc}">
            0
            </c:if>건</span></h2>
        </div>
        <hr>
        
  <div class="main">

	<input id="tab1" type="radio" name="tabs" checked>
	<label for="tab1"><i class="fas fa-border-all"></i>&ensp;전체보기 (
	        <c:if test="${!empty lc}">
            ${lc}
            </c:if>
            <c:if test="${empty lc}">
            0
            </c:if>)</label>
	
	<input id="tab2" type="radio" name="tabs">
	<label for="tab2">수술/치료(
	        <c:if test="${!empty tc}">
            ${tc}
            </c:if>
            <c:if test="${empty tc}">
            0
            </c:if>)</label>
	
	<input id="tab3" type="radio" name="tabs">
	<label for="tab3">교육 (
		    <c:if test="${!empty ec}">
            ${ec}
            </c:if>
            <c:if test="${empty ec}">
            0
            </c:if>)</label>
	
	<input id="tab4" type="radio" name="tabs">
	<label for="tab4">미용 (
			<c:if test="${!empty bc}">
            ${bc}
            </c:if>
            <c:if test="${empty bc}">
            0
            </c:if>)</label>
	
		  <div class="content mt-3">  
			  <div id="content1">
				<jsp:include page='Search_item_all.jsp' />
			  </div>
	
			  <div id="content2">
				<jsp:include page='Search_item_treat.jsp' />
			  </div>
	
			  <div id="content3">
				<jsp:include page='Search_item_edu.jsp' />
			  </div>
	
			  <div id="content4">
				<jsp:include page='Search_item_beauty.jsp' />
			  </div>
		  </div>
	
		</div>

   </div>
  </div>
 </div>

    
<jsp:include page="../footer.jsp" />
</body>
</html>