<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>

<title>공지사항 글 작성</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>
 
   h1{font-size:1.5rem; text-align:center; color:#1a92b9}
  .container{width:60%}
  label{font-weight:bold}
  #upfile{display:none}
     .fa-exclamation-circle{font-size: 28px!important;color:#6F6F6F!important;}
  select {
    height: calc(1.5em + 0.75rem + 2px);
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	outline: none;
	width: 100px;
}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Community/write.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/Summernote/summernote-lite.css" type="text/css" rel="stylesheet">
</head>

<body>

  
  
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 " style="height:1100px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
       
   <table class="table text-center">
    <thead>
   <tr style="border:none">
     <th colspan="3" class="text-left"><span class="commu">&emsp;공지사항&nbsp;</span><i class="fas fa-exclamation-circle"></i></th>
     <th colspan="2" class="text-right">
     </th>
     </tr> 
   </thead>
   </table>
   
<form class="mform" method="post" action="${pageContext.request.contextPath}/admin/admin_write_notice" enctype="multipart/form-data">
	
	<b>카테고리</b>
	<select class="mb-4" id="viewcount" name="ABN_DIVISION">
               <option value="중요" >중요</option>
               <option value="일반" selected>일반</option>

            </select>
            
            
   <sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="pinfo"/>
     <input type="hidden" name="ABN_NAME" value="${pinfo.username}">
     <b>제목</b>
     <input class="jinput" type="text" name="ABN_SUBJECT" placeholder="제목을 입력해 주세요." maxlength="50" required>
     

     
     <b class="mt-3">내용</b>
     <textarea id="summernote" name="ABN_CONTENT"></textarea>
   
       <!--  사진첨부가 에디터 자체내에 있으므로 보드에서 쓰던것을 쓰지 않음. -->
       
     <input class="jinput" id="upfile" type="file" name="uploadfile" accept="image/*" style="font-size:0.9rem;width:50%">
     <span id="filevalue"></span>
  
     <div class="clearfix">
       <button type="submit" class="button-5 cancelbtn updateb" style='margin-right:2em!important'>등록</button>
       <button type="reset" class="button-5 submitbtn signoutb">취소</button>
     </div>
   
    </sec:authorize>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
   
   </div>
  </div>
 </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Admin/summernote.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/lang/summernote-ko-KR.js"></script>
</body>
   
<script>



</script>
   
</html>