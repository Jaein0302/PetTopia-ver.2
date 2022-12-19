<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Community/write.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/Summernote/summernote-lite.css" type="text/css" rel="stylesheet">
</head>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:1100px;margin-top:220px;">
  <div class="row px-xl-5">
   <div class="col-lg-12" style="margin:0 auto;">
 		
	<table class="table text-center">
 	<thead>
   <tr style="border:none">
     <th colspan="3" class="text-left"><span class="commu">&emsp;커뮤니티&nbsp;</span><i class="fas fa-paw"></i></th>
     <th colspan="2" class="text-right">
     </th>
     </tr> 
	</thead>
	</table>
	
	<form class="mform" method="post" action="${pageContext.request.contextPath}/community/update" enctype="multipart/form-data">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo"/>
	  <input type="hidden" name="commu_num" value="${c.commu_num}">
	  <input type="hidden" name="commu_file" value="${c.commu_file}">
	  <input type="hidden" name="commu_name" value="${pinfo.username}">
	  <b>제목</b>
	  <input class="jinput" type="text" name="commu_subject" value="${c.commu_subject}" placeholder="제목을 입력해 주세요." maxlength="50" required>
	  <b>대표 이미지</b>
	  <label for="upfile">대표 이미지 업로드</label> 
	  <input class="jinput" id="upfile" type="file" name="uploadfile" accept="image/*" style="font-size:0.9rem;width:50%">
	  <span id="filevalue">${c.commu_original}</span>
	  <img src="${pageContext.request.contextPath}/resources/img/Main/remove.png" alt="파일삭제"
		 width="12px" class="remove">
	  <b class="mt-3">내용</b>
	  <textarea id="summernote" name="commu_content">${c.commu_content}</textarea>
		
		<div class="clearfix">
			<button type="submit" class="button-5 cancelbtn updateb">수정</button>
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
<script src="${pageContext.request.contextPath}/resources/js/Community/c_list.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Community/write.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/lang/summernote-ko-KR.js"></script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>