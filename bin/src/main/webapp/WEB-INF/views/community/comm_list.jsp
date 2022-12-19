<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/Community/list.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1000px;margin-top:220px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 	
 	<table class="table text-center m-0">
 	<!-- 테이블 간격 -->
	<colgroup>
	<col width="40%" />
	<col width="29%" />
	<col width="31%" />
	</colgroup>
 	<thead>
 	<tr style="border:none">
 	<th colspan="1" class="text-left">
 		<a style='color:#6F6F6F;' href='${pageContext.request.contextPath}/community/list'>
 			<span class="commu">&emsp;커뮤니티&nbsp;</span><i class="fas fa-paw"></i>
    	</a>
    </th>
    <th colspan="1" class="text-center">
     <c:if test="${listcount>0}">
     <span><i class="fas fa-star"></i>추천 게시글 TOP 5&emsp;</span>
	     <div class="block">
		    <ul id="ticker">
		    <c:forEach var="h" items="${hlist}" end="4"  varStatus="status">
		        <li><a href="detail?num=${h.commu_num}">
		        <span class="text-count">${status.index+1}</span>
		        <span class="text-body">
		       	 <c:if test="${h.commu_subject.length()>=12}">
		  	     		<c:out value="${h.commu_subject.substring(0,12)}..." />
			  	 </c:if>
			  	 <c:if test="${h.commu_subject.length()<12}">
		        		<c:out value="${h.commu_subject}" escapeXml="true"/>
		         </c:if>
		        </span>
	  			<span class="text-comment text-small">[<c:out value="${h.cnt}"/>]</span>
		        </a></li>
		    </c:forEach>
		    </ul>
		</div>
		</c:if>
	</th>
	<th colspan="1" class="text-right">
	
	<!-- 글쓰기 버튼 -->
	 <div class="text-right">
	 <sec:authorize access="isAnonymous()">
	  <input type="button" class="button-5 postb cowrite" value="글쓰기" >&emsp;&emsp;
	 </sec:authorize>
	 <sec:authorize access="isAuthenticated()">
	  <input type="button" class="button-5 postb" value="글쓰기" onclick="location.href='${pageContext.request.contextPath}/community/write'" >&emsp;&emsp;&emsp;
	  </sec:authorize>
	 </div>
	
	</th>
	</tr>
	</thead>
	</table>
	
	<!-- 커뮤니티 리스트 -->
	<c:if test="${listcount>0}">
	<c:set var="num" value="${listcount-(page-1)*limit}" />
	<div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
       	<c:forEach var="b" items="${boardlist}">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card border-0 mb-4" onclick="location.href='detail?num=${b.commu_num}'">
                    
                    <%-- 썸네일 --%>
                    <div class="card-header position-relative overflow-hidden border p-0 thumbnail-div">
                         <c:if test="${!empty b.commu_file && (!empty b.commu_thumbnail || empty b.commu_thumbnail)}">
                         <img class='cthumbnail img-fluid w-100' style="object-fit: cover;" src="/pet_topia/upload${b.commu_file}">
                    	 </c:if>
                    	 <c:if test="${empty b.commu_file && !empty b.commu_thumbnail}">
                    	 <img class='cthumbnail img-fluid w-100' style="object-fit: cover;"${fn:replace(b.commu_thumbnail, '>', ' ')}>
                    	 </c:if>
                    	 <c:if test="${empty b.commu_file && empty b.commu_thumbnail}">
                    	 <c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 4) %></c:set>
                    	 <img class='cthumbnail img-fluid w-100' src="${pageContext.request.contextPath}/resources/img/Community/${ran}.jpg">
                    	 </c:if>
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-left">
                        
                        <%-- 제목 --%>
                        <b class="text-truncate text-dark"  style="font-size:15px">&ensp;
					  	    	 <c:if test="${b.commu_subject.length()>=12}">
						  	     		<c:out value="${b.commu_subject.substring(0,10)}..." />
							  	 </c:if>
							  	 <c:if test="${b.commu_subject.length()<12}">
						        		<c:out value="${b.commu_subject}" escapeXml="true"/>
						         </c:if>
					  		<span class="text-comment text-small">[<c:out value="${b.cnt}"/>]</span>
                        </b>
                    </div>
                    <div class="card-footer bg-light border text-small">
                    		<b>${b.commu_name}</b><br>
	  						<span>${fn:replace(b.commu_date, '-', '.')}</span> · 
	  						<span>조회 ${b.commu_readcount}</span>
                    </div>
                </div>
            </div>
         </c:forEach>
        </div>
    </div>
	</c:if>
	<%--게시글이 없는 경우--%>
	<c:if test="${listcount==0 && empty search_word}">
	<div class="text-center" style="margin-top:100px">
	<h2 class="text-body">게시글이 없습니다&ensp;<i class="fas fa-sad-tear"></i></h2>
	</div>
	</c:if>
	<c:if test="${listcount == 0 && !empty search_word}">
	<div class="text-center" style="margin-top:100px">
	<h2 class="text-body">검색 결과가 없습니다</h2>
	</div>
	</c:if>	
	 
<!-- 검색 창 -->
	 <div class="search-div text-center m-4">
	 <form method="get" action="${pageContext.request.contextPath}/community/list">
	 <select id="viewcount" name="search_field">
	 <option value="0" selected>제목</option>
	 <option value="1">내용</option>
	 <option value="2">작성자</option>
	 </select>
	 <input id='mySearchinput' type="text" class="search_word" name="search_word" value="">
	 <input type="submit" class="button-5 postb" value="검색" style="min-height:40px;width:15%">
	 </form>
	 </div>
	 
<!-- 페이징 처리 -->
	<div class="pagination-div">
	<ul class="pagination modal-2 text-center">
	  
	 <c:if test="${page <= 1 && listcount != 0}">
	  <li><a href="#" class="prev"><i class="fas fa-angle-double-left"></i></a></li>
	 </c:if> 
	 <c:if test="${page > 1 }">
	  <li>
		<a class="next" href="${pageContext.request.contextPath}/community/list?page=${page-1}&search_word=${search_word}"><i class="fas fa-angle-double-left"></i></a>
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
			<a class="pnum" href="${pageContext.request.contextPath}/community/list?page=${a}&search_word=${search_word}">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	  
	<c:if test="${page >= maxpage  && listcount != 0}}">
		<li class="page-item">
		  <li><a href="#" class="next"><i class="fas fa-angle-double-right"></i></a></li>
	</c:if>
	<c:if test="${page < maxpage }"> 
	     <li>
			<a class="next" href="${pageContext.request.contextPath}/community/list?page=${page+1}&search_word=${search_word}"><i class="fas fa-angle-double-right"></i></a>
		 </li>
	</c:if>
	</ul>
	</div>
   </div>
  </div>
 </div>
<script>
$(function(){
	//로그인 후 글쓰기 가능
	$(".cowrite").click(function () {
	    Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '로그인 후 이용가능합니다.',
					showConfirmButton: false,
					timer: 1000
				})
	});
	//추천 게시글
	var ticker = function()
	{
	   setTimeout(function(){
	       $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
	       {
	           $(this).detach().appendTo('ul#ticker').removeAttr('style');
	       });
	       ticker();
	   }, 2000);
	};
	ticker();
	
	//검색어 입력창에 placeholder 나타나도록 합니다.
	$("#viewcount").change(function(){
		selectedValue = $(this).val();
		$("#mySearchinput").val('');
		message = ["제목","내용", "작성자"]
		$("#mySearchinput").attr("placeholder", message[selectedValue] + " 입력하세요");
	})//$("#viewcount") change end
});
</script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>