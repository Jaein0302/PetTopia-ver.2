<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 1:1 문의 글 보기</title>
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

#comment>textarea{
color:black;
			border: 2px solid rgb(213, 194, 194);
    	/** outline-color 속성을 추가하면 
    	focus될 때 테두리 색상을 지정할 수 있다.**/
        outline-color: #FE6B8B;
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
     	  	<c:out value="${Aam.AAM_SUBJECT}" />
     	  </td>
     	</tr>
     	<tr style="border-bottom:0.6px solid #EDF1FF">
     	  <td class="p-1" style="text-align:left!important;font-size: 15px;color: #4a4c4b;">
     	 	<i style="color:#4a4c4b;"class="fa fa-user"></i>&nbsp; <span class="userdoc" >${Aam.AAM_NAME}</span>
     	  </td>
		  <td class="p-1" style="text-align:right!important;font-size: 14px;color: #4a4c4b;">
	     	  <i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp;&nbsp;${fn:replace(Aam.AAM_DATE, '-', '.')}&nbsp; 
     	  </td>
     	</tr>
    
     	<tr>
	     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
	     	 	<div style="white-space:pre-wrap;font-size:16px;padding:10px 15px">${Aam.AAM_CONTENT}</div>
	     	 </td>
     	</tr>
     	
		<tr>
			<td class="p-2">
			</td>
			<td class="p-2">
			<div style="text-align:right;">
		
				<a href="${pageContext.request.contextPath}/admin/admin_ask_list" style="padding-right:10px;">
				 <i class="fa-solid fa-list" style="color:#444444;"></i>
				 <span style="color:#444444;font-size:16px;font-weight:bold;">목록</span></a>
			</div>	
			</td>
		</tr>
 	</table>
 	
 	
 	<sec:authorize access="hasRole('ROLE_ADMIN')">
 	 <c:if test="${null ne Aac.AAC_DATE}">
	<button id="comment_update" class="btn btn-info float-right">수정</button>
	</c:if>
	
	<c:if test="${empty Aac.AAC_DATE}">
	<button type = "button" id="write" class="btn btn-info float-right">등록</button>
	</c:if>
 	</sec:authorize>
 	
 	
 	
 	
   </div>
  </div>
   <div id="comment">
   <sec:authorize access="hasRole('ROLE_ADMIN')">
		<div>답변 텍스트</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 <textarea rows=3 class="form-control" id="content" maxLength="1000"></textarea>
		 </sec:authorize>
		 </div>
		 
		  <input type="hidden" name="ask_list_num"
		   value="${Aam.AAM_NUMBER}" id="hidden_AAM_NUMBER">
		  
		 <c:if test="${null ne Aac.AAC_DATE}">
		 <table class="table table-striped">
		 	<thead>
		 	 <tr>
		 	 <td>답변일자</td><td>${Aac.AAC_DATE}</td>
		 	 
		 	 </tr>
		 	 <tr>
		 	 <td>답변내용</td><td>${Aac.AAC_CONTENT}</td>
		 	 
		 	 </tr>
		 	 </thead>
		 	 <tbody>
		 	 
		 	 </tbody>
		 </table>
		 </c:if>
		 
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		 
		
 </div> 


<!-- 

	<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" id="loginid" value="${pinfo.username}">
			<c:if test="${pinfo.username == 'admin' }">
				   
				   	<button id="comment_update" class="btn btn-info float-right" 
				   	onclick="location.href='${pageContext.request.contextPath}
				   	/admin/commentView?num=${Aam.AAM_NUMBER}'">답변하기</button>
				&ensp;
				</c:if>
				<a style="color:tomato;font-size:16px;cursor:pointer" 
				href="${pageContext.request.contextPath}/admin/deleteNotice?num=${Aam.AAM_NUMBER}" class="deletechk"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
				&ensp;
				
			</sec:authorize>



 -->
		
	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
</body>
<jsp:include page="../member/footer.jsp" />

<script>

// 등록 또는 수정완료 버튼을 클릭한 경우
// 버튼의 라벨이 '등록'인 경우는 댓글을 추가하는 경우
// 버튼의 라벨이 '수정완료'인 경우는 댓글을 수정하는 경우

$("#write").click(function() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	
	var content = $("#content").val().trim();
	var text_area = $("#hidden_AAM_NUMBER").val();
	console.log(content)
	console.log(text_area);
	console.log()
	
	if(!content){
		alert('내용을 입력하세요')
		return false;
	}
	
	url = "comment_add";
	//url ="../admin/comment_add"
	//여기서 ../하면  http://localhost:9600/pet_topia/admin/detail?num=23 경로는 어디지?
	//.. 이면 admin으로 갔다 거기서 add를 사용함.
	// 경로...지정어떻게?...
	//
	//?? 히든으로 처리한 것을 값을 받아와서 넘버를 넘김.
	//	url = "http://localhost:9600/pet_topia/admin/comment_add"	
			
	data = {
		"AAC_CONTENT" : content,
		"AAC_NUMBER" : text_area
	};
	
	
	
	$.ajax({
		type : "post",
		url : url,
		data : data,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },
		success : function(result) {
			$("#content").val('');
			 location.reload();
		}//success
	})// ajax end
})// $("#write") end






$("#comment_update").click(function() {
	

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	
	var content = $("#content").val().trim();
	var text_area = $("#hidden_AAM_NUMBER").val();
	console.log(content)
	console.log(text_area);
	console.log()
	
	if(!content){
		alert('내용을 입력하세요')
		return false;
	}
	
	url = "comment_update";
	//url ="../admin/comment_add"
	//여기서 ../하면  http://localhost:9600/pet_topia/admin/detail?num=23 경로는 어디지?
	//.. 이면 admin으로 갔다 거기서 add를 사용함.
	// 경로...지정어떻게?...
	//
	//?? 히든으로 처리한 것을 값을 받아와서 넘버를 넘김.
	//	url = "http://localhost:9600/pet_topia/admin/comment_add"	
			
	data = {
		"AAC_CONTENT" : content,
		"AAC_NUMBER" : text_area
	};
	
	
	
	$.ajax({
		type : "post",
		url : url,
		data : data,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },
		success : function(result) {
			$("#content").val('');
			 location.reload();
		}//success
	})// ajax end
})// $("#write") end


</script>


</html>