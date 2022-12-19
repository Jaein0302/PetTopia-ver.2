<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <jsp:include page="../member/header.jsp" />  
 <script src ="${pageContext.request.contextPath}/resources/js/list.js"></script>
 <style>
select.form-control {
	width: auto;
	margin-bottom: 2em;
	display: inline-block
}

.rows {
	text-align: right;
}

.gray {
	color: gray;
}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(1){width:8%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(2){width:50%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(3){width:14%}
   body > div > table > thead > tr:nth-child(2) > th:nth-child(4){width:17%}
    body > div > table > thead > tr:nth-child(2) > th:nth-child(5){width:11%}   
   
 </style>
 <script>
 
 var result="${result}";
 if(result == 'deleteSuccess'){
	 alert("삭제 성공입니다.")
 }else if(result =='updateSuccess'){
	 alert("회원정보가 수정되었습니다.")
 }
 
 </script>
 
 
 
 <title>MVC 게시판</title>
</head>
<body>
<div class="container">  
 <%-- 게시글이 있는 경우--%> 

  <table class="table table-striped">
   <thead>
	<tr>
	   <th colspan="3">MVC 게시판 - list</th>
	   <th colspan="2">
			<font size=3>글 개수 : ${listcount}</font>
	   </th>
	</tr>
	<tr>
		<th><div>글번호</div></th>
		<th><div>제목</div></th>
		<th><div>작성자</div></th>
		<th><div>날짜</div></th>
	</tr>	
   </thead>
   <tbody>
	<c:set var="num" value="${listcount-(page-1)*limit}"/>	
	<c:forEach var="b" items="${admin_notice_boardlist}">	
	<tr>
	<td>
	
	<c:choose>  
	 <c:when test="${b.ADN_MAINCOLUMN != 0}">
		[공지]
	</c:when> <%--sdsdsdsd --%>
	<c:otherwise> 
		<c:out value="${num}"/><%-- num 출력 --%>		
		<c:set var="num" value="${num-1}"/>	<%-- num=num-1; 의미--%>	
	</c:otherwise> 
   </c:choose>	  
	</td>
			
	  <td><%--제목 --%>
	     <div>			
			
			<a href="detail?num=${b.ADN_NUMBER}">
			 <c:out value="${b.ADN_SUBJECT}" escapeXml="true"/>
			</a> 
			
		  </div>
		</td>
		<td><div>${b.ADN_NAME}</div></td>
		<td><div>${b.ADN_DATE}</div></td>	
	   </tr>
	  </c:forEach>
	 </tbody>	
	</table>
		
	<div class="center-block">
		  <ul class="pagination justify-content-center">		
			 <c:if test="${page <= 1 }">
				<li class="page-item">
				  <a class="page-link gray">이전&nbsp;</a>
				</li>
			 </c:if>
			 <!--  1이 되면 [이전] 버튼이 비활성화가 된다. gray.... -->
			 
			 <c:if test="${page > 1 }">			
				<li class="page-item ">
				   <a href="list?page=${page-1}" 
				      class="page-link">이전&nbsp;</a>
				</li> 
			 </c:if>
			<!--  1이 아닌 경우 [이전] 버튼이 활성화가 된다. -->
				
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					<li class="page-item active" >
					   <a class="page-link">${a}</a>
					</li>
				</c:if>
			<!--  startpage와 endpage를 알아야한다.  -->
				
				
				<c:if test="${a != page }">
				    <li class="page-item">
					   <a href="list?page=${a}" 
					      class="page-link">${a}</a>
				    </li>	
				</c:if>
			</c:forEach>
			
			
			
			
			<c:if test="${page >= maxpage }">
				<li class="page-item">
				   <a class="page-link gray">&nbsp;다음</a> 
				</li>
			</c:if>
			<c:if test="${page < maxpage }">
			  <li class="page-item">
				<a href="list?page=${page+1}" 
				   class="page-link">&nbsp;다음</a>
			  </li>	
			</c:if>
		 </ul>
		</div>
	
 <%-- 게시글이 없는 경우--%>
 <c:if test="${listcount == 0 }">
	<font size=5>등록된 글이 없습니다.</font>
 </c:if>

	<button type="button" class="btn btn-info float-right">글 쓰 기</button>
</div>
</body>
</html>