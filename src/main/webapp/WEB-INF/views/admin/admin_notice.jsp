<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
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
   
     .fa-exclamation-circle{font-size: 28px!important;color:#6F6F6F!important;}

 </style>
 
 
 
 <script>
 
 var result="${result}";
 if(result == 'deleteSuccess'){
    alert("삭제 성공입니다.")
 }else if(result =='updateSuccess'){
    alert("회원정보가 수정되었습니다.")
 }
 
 </script>
 
 
 
 <title>펫토피아 - 공지사항</title>
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
	  <jsp:include page="admin_aside.jsp" />
   </div>

	<div class="col-md-9 pb-3">
    <table class="table text-center">
    <thead>
   <tr style="border:none">
     <th colspan="3" class="text-left"><span class="commu">공지사항&nbsp;</span><i class="fas fa-exclamation-circle"></i></th>
     <th colspan="2" class="text-right">
     </th>
     </tr> 
   </thead>
   </table>



 <c:choose>
    
       <c:when test = "${listcount > 0}">
       

  <table class="table table-striped">
   <thead>
   <tr>
      <th colspan="3"></th>
      <th colspan="2">
         <font size=3></font>
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
   
   <!-- 중요공지는 계속 위에 위치해 있어야 하고
   		일반공지는 그냥 나오고 페이징 처리가 되야함 -->
   <c:forEach var="main" items="${division_main_list}">
   <tr>
   
   <td><div>중요</div>
   <td><%--제목 --%>
        <div style="color:tomato!important">         
         <i class="fa-solid fa-circle-exclamation"></i>
         <a href="detailNotice?num=${main.ABN_NUMBER}">
          <c:out value="${main.ABN_SUBJECT}" escapeXml="true"/>
         </a> 
         
        </div>
      </td>
      <td><div>${main.ABN_NAME}</div></td>
      <td><div>${main.ABN_DATE}</div></td>   
      </tr>
     </c:forEach>
   
   
   
   
   
   <c:set var="num" value="${num}"/>   
   <c:forEach var="b" items="${admin_notice_boardlist}">   
   <tr>
   <td>
      <c:out value="${num}"/><%-- num 출력 --%>      
      <c:set var="num" value="${num-1}"/>   <%-- num=num-1; 의미--%>   
   </td>
         
     <td><%--제목 --%>
        <div>         
         
         <a href="detailNotice?num=${b.ABN_NUMBER}">
          <c:out value="${b.ABN_SUBJECT}" escapeXml="true"/>
         </a> 
         
        </div>
      </td>
      <td><div>${b.ABN_NAME}</div></td>
      <td><div>${b.ABN_DATE}</div></td>   
      </tr>
     </c:forEach>
    </tbody>   
   </table>
      

   
 <%-- 게시글이 없는 경우--%>

 
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
               <a href="admin_notice?page=${page-1}" 
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
                  <a href="admin_notice?page=${a}" 
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
            <a href="admin_notice?page=${page+1}" 
               class="page-link">&nbsp;다음</a>
           </li>   
         </c:if>
       </ul>
      </div>
      
  </c:when>
  <c:otherwise>
  등록된 글이 없습니다.
  </c:otherwise>
  
  </c:choose>
  
  
      
 <!-- 이름이 admin일때 말고 권한이 role_admin일때로 바꾸자 -->
 <sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="pinfo"/>
    <c:if test="${pinfo.username == 'admin'}">
   <button type="button" id="noitce_button" class="btn btn-info float-right">글쓰기</button>
   </c:if>
</sec:authorize>


</div></div></div>
</body>
<script>
$("#noitce_button").click(function(){
   location.href="admin_write_notice";
})

</script>
</html>