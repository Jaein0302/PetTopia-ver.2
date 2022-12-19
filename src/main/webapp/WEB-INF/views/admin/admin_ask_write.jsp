<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>문의하기</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>
   h1{font-size:1.5rem; text-align:center; color:#1a92b9}
  .container{width:60%}
  label{font-weight:bold}
  #upfile{display:none}
</style>

</head>

<body>


 <sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="pinfo"/>
 
<div class="container">  
  <form action="write_to_admin_form" method="post"  name="boardform">
    
  <h1>관리자 1:1 문의 </h1>
  <div class = "form-group">
  <label for="admin_to_write_name">글쓴이</label>  <!-- 달러 아이디는 세션의 아이디. -->
  <input name ="AAM_NAME" id="AAM_NAME" value="${pinfo.username}" readOnly
     type="text" class ="form-control">
  </div>
  
  <div class="form-group">
  <label for ="admin_to_write_subject">제목</label>
  <input name ="AAM_SUBJECT" id="AAM_SUBJECT" type="text" maxlength="100"
     class ="form-control" placeholder="Enter board_subject">
  </div>
  
  <div class="form-group">
  <label for ="admin_to_write_content">내용</label>
  <textarea name ="AAM_CONTENT" id="AAM_CONTENT" rows="10" 
     class ="form-control"></textarea>
  </div>
  
  <div class = "form-group">
  <button type=submit   class="btn btn-primary">등록</button>
  <button type=reset   class="btn btn-danger">취소</button>
  </div>
  
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  

 
  </form>
  </div>
  
   </sec:authorize>
</body>
   
<script>



</script>
   
</html>