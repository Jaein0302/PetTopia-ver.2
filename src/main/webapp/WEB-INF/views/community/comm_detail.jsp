<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
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
</style>
<body>
<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>

 <div class="container mb-5 mainbody" style="height:500%;margin-top:220px;">
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
	<form class="mform mb-0 pb-0" method="post" action="">
	<input type="hidden" name="commu_num" id="num" value="${c.commu_num}">
     <table class="table viewp1 mb-0">
      	<tr>
     	  <td class="p-1" colspan="2" style="text-align:center!important;background: #f9c5276b;color: #56565a;font-size: 19px; font-weight: bold;">
     	  	<c:out value="${c.commu_subject}" />
     	  </td>
     	</tr>
     	<tr style="border-bottom:0.6px solid #EDF1FF">
     	  <td class="p-1" style="text-align:left!important;font-size: 15px;color: #4a4c4b;">
     	 	<i style="color:#4a4c4b;"class="fa fa-user"></i>&nbsp; <span class="userdoc" >${c.commu_name}</span></div>
     	  </td>
		  <td class="p-1" style="text-align:right!important;font-size: 14px;color: #4a4c4b;">
	     	  <i style="color:#4a4c4b;"class="fa fa-clock-o"></i>&nbsp;&nbsp;${fn:replace(c.commu_date, '-', '.')}&nbsp; <span style="font-size:12px">|</span>&nbsp;  
	     	  <i style="color:#4a4c4b;"class="fa fa-eye"></i>&nbsp;&nbsp;${c.commu_readcount}
     	  </td>
     	</tr>
    
     	<tr>
	     	 <td colspan="2" style="text-align:left!important;height:200px;border:none;padding-top:20px">
	     	 	<div style="white-space:pre-wrap;font-size:16px;padding:10px 15px">${c.commu_content}</div>
	     	 </td>
     	</tr>
     	
		<tr>
			<td class="p-2">
				<b style="color:#444444;font-size:16px;"><i class="far fa-comment-dots"></i>&ensp;댓글 ${c.cnt}개</b>
			</td>
			<td class="p-2">
			<div style="text-align:right;">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo"/>
			<input type="hidden" id="loginid" value="${pinfo.username}">
			<c:if test="${c.commu_name == pinfo.username || pinfo.username == 'admin' }">
				<a style="color:#0ab9a0;font-size:16px" 
				   href="${pageContext.request.contextPath}/community/modifyView?num=${c.commu_num}"><i class="fas fa-edit"></i>&nbsp;수정</a>
				&ensp;
				<a style="color:tomato;font-size:16px;cursor:pointer" class="deletechk"><i class="fas fa-trash-alt"></i>&nbsp;삭제</a>
				&ensp;
				</c:if>
			</sec:authorize>
				<a href="${pageContext.request.contextPath}/community/list" style="padding-right:10px;">
				 <i class="fa-solid fa-list" style="color:#444444;"></i>
				 <span style="color:#444444;font-size:16px;font-weight:bold;">목록</span></a>
			</div>	
			</td>
		</tr>
 	</table>
 	</form>
 	<!-- 댓글 -->
 			<div class="mform mt-0 text-left" id="comment">
				<!-- <button class="btn btn-info float-left">총 50자까지 가능합니다.</button> -->
				<textarea rows=3 class="comment-textarea"
					      id="content" maxLength="50"></textarea>
					      
				 <sec:authorize access="isAnonymous()">
				  <button id="write1" class="btn btn-primary text-dark">댓글 등록</button>
				 </sec:authorize>
				 <sec:authorize access="isAuthenticated()">
				  <button id="write" class="btn btn-primary text-dark">댓글 등록</button>
				 </sec:authorize>
					      
					<table class="mt-4 table">
					  <tbody>
					
				      </tbody>
				    </table>
				<div id="message"></div>
				</div>
	
   </div>
  </div>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/Community/view.js"></script>
<script>
$(function(){
	$(".deletechk").click(function () {
	    Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $(location).attr('href','${pageContext.request.contextPath}/community/delete?num=${c.commu_num}'); 	
			  }
			})
	    
	});
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
		
		//로그인 후 댓글쓰기 가능
		$("#write1").click(function () {
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
		
});
</script>
</body>
<jsp:include page="../member/footer.jsp" />
</html>