<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Order/write.css" type="text/css" rel="stylesheet">
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
	     <th colspan="3" class="text-left">
	     			<span class="commu">
	     				&emsp;리뷰 작성&nbsp;
	     			</span>
	     				<i class="fas fa-camera"></i>
	     </th>
     	 <th colspan="2" class="text-right">
     	 <span class='pr-5'>
	     	&lt; 반려견 놀이훈련 &gt; <span class='text-small pl-1'>2022.10.1(토) 방문</span>
	     </span>
     	 </th>
     	</tr> 
	</thead>
	</table>
	
<form class="mform" method="post" action="${pageContext.request.contextPath}/order/add" enctype="multipart/form-data">
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo"/>
	  <input type="hidden" name="review_id" value="${pinfo.username}">
	  <input type="hidden" name="review_item_id" value="10001">
	  <div class="rating-message">
	  	 <span class="bounce arrow-bounce pr-1"><i class="fa fa-2x fa-chevron-down"></i></span>
	  	 별점을 남겨주세요
	  </div>
	  <input type='hidden' id='starrating' name='review_score' value='3'>
	  
	  <div class="rating">
		  <label class="star1">
		    <input type="radio" name="rating" value="5" title="5 stars">
		  </label>
		  <label class="star2">
		    <input type="radio" name="rating" value="4" title="4 stars">
		  </label>
		  <label class="star3 selected">
		    <input type="radio" name="rating" value="3" title="3 stars">
		  </label>
		  <label class="star4">
		    <input type="radio" name="rating" value="2" title="2 stars">
		  </label>
		  <label class="star5">
		    <input type="radio" name="rating" value="1" title="1 star">
		  </label>
		</div>
	  
	  
	  <b style='margin-top: 5rem !important'>리뷰 제목</b>
	  <input class="jinput" type="text" name="review_subject" placeholder="제목을 입력해 주세요." maxlength="50" required>
	  
	  <b class="mt-2">리뷰 내용</b>
	  <textarea id="summernote" name="review_content"></textarea>
	
	  <div class="clearfix">
		 <button type="submit" class="button-5 cancelbtn updateb">등록</button>
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
<script src="${pageContext.request.contextPath}/resources/js/Order/review_write.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/Summernote/lang/summernote-ko-KR.js"></script>
<script>
//별점 매기기
$('.rating input').change(function () {
	  var $radio = $(this);
	  $('.rating .selected').removeClass('selected');
	  $radio.closest('label').addClass('selected');
	  
	  if($(".star1").hasClass("selected") === true) {
			$('#starrating').val('5');
		}else if($(".star2").hasClass("selected") === true) {
			$('#starrating').val('4');
		}else if($(".star3").hasClass("selected") === true) {
			$('#starrating').val('3');
		}else if($(".star4").hasClass("selected") === true) {
			$('#starrating').val('2');
		}else if($(".star5").hasClass("selected") === true) {
			$('#starrating').val('1');
		}
	  
});


</script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>