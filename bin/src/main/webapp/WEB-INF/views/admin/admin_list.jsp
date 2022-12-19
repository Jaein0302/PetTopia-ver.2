<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원관리 시스템 관리자모드(회원목록 보기)</title>
 <jsp:include page="../member/header.jsp" />  
 <!-- 검색어를 입력한 후 다시 memberList.net으로 온 경우 검색 필드와 검색어가 나타나도록 합니다. -->
 <style>
table caption {
	caption-side: top;
	text-align: center
}

h1 {
	text-align: center
}

li .gray {
	color: gray;
}

body>div>table>tbody>tr>td:last-child>a {
	color: red
}

form {
	margin: 0 auto;
	width: 80%;
	text-align: center
}

select {
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	outline: none;
}

.container {
	width: 60%
}

td:nth-child(1) {
	width: 33%
}

.input-group {
	margin-bottom: 3em
}
</style>
<script src="${pageContext.request.contextPath}/resources/static/Admin/js/list.js"></script>
 <script>
 $(function(){
	 //검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
 	var selectedValue = '${search_field}'
 	if(selectedVaule = '-1')
 		/* -1일 경우 전체 다 나 온 다 .
 		*/
 		$("#viewcount").val(selectedValue);
 	
 	//검색 버튼을 클릭한 경우
 	$("button").click(function(){
 		//검색어 공백 유효성 검사를 합니다.
 		if($("input").val()==''){
 			alert("검색어를 입력하세요.");
 			$("input").focus();
 			return false;
 		}//if val() 끝
 		
 	var word = $(".input-group input").val();
 		if(selectedValue ==2){
 			pattern = /^[0-9]{2}$/;
 			if(!pattern.test(word)){
 				alert("나이는 형식에 맞게 입력하세오(두자리 숫자)");
 				return false;
 			}
 		}else if(selectedValue==3){
 			if(word != "남" && word !="여"){
 				alert("남 또는 여를 입력하세요");
 				return false;
 			}
 		}
 		
 	})//버튼끝
 	
 	//검색어 입력창에 플래스홀더가 나타나도록 합니다.
 	
 	$("#viewcount").change(function(){
 		selectedValue = $(this).val();
 		$("input").val('');
 		message= ["아이디","이름","나이","여 또는 남"]
 		$("input").attr("placeholder",message[selectedValue]+"입력하세요");
 	}) //chane end
 	
 	
 	//회원 목록의 삭제를 클릭한  경우
 	$("tr > td:nth-child(3) > a").click(function(){
 		var answer = confirm("정말 삭제하시겠습니까?");
 		console.log(answer);// 취소를 클릭한 경우 - false
 		if(!answer){ //취소를 클릭한 경우
 			event.preventDefault(); //이동하지 않습니다.	
 		}
 	
 	})//삭제 클릭 end
 	
 	
 
 
 })//펑션 끝
 
 </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/export_excel"
class="excel_link">Export to EXCEL</a>
<a href="${pageContext.request.contextPath}/admin/export_pdf"
class="pdf_link">Export to PDF</a>
<div class="container">  
	<form action="${pageContext.request.contextPath}/admin/admin_list" method="post">
		<div class="input-group">
			<select id ="viewcount" name="search_field">
				<option value="0" selected>아이디</option>
				<option value="1">이름</option>
				<option value="2">나이</option>
				<option value="3">성별</option>
			</select>
				<input name ="search_word" type="text" class="form-control"
					placeholder="아이디를 입력하세요" value="${search_word}" >
			<!--  유지하려고 앞에서 ..setAttribue 다 담아옴.. -->
				<button class="btn btn-primary" type="submit">검색</button>
		
		<!--  list.js에서 이게 있었음 .  . . .  		
				$("button").click(function(){
		location.href="write";
	})
	
	-->
	
				
		</div>
	</form>
	
	
 <c:if test="${listcount>0}">
  <table class="table table-striped">
   <thead>
	<tr>
	   <th colspan="2">MVC 게시판 - 회원 정보 list</th>
	   <th><font size=3>글 개수 : ${listcount}</font> </th>
	</tr>
	<tr>
		<th><div>아이디</div></th>
		<th><div>이름</div></th>
		<th><div>삭제</div></th>
		
	</tr>	
   </thead>
   
   
   <tbody>
		<c:forEach var="m" items="${memberlist}">	
			<tr>
			<td><a href="info?id=${m.member_id}">${m.member_id}</a></td>
			<td>${m.member_name}</td>
			<td><a href="delete?id=${m.member_id}">삭제</a></td>
			</tr>
		</c:forEach>
	 </tbody>	
	</table>
	<div>
		  <ul class="pagination justify-content-center">	
		  
		  	
			 <c:if test="${page <= 1 }">
			 <!--  페이지의미는 현재페이지를 의미함 유알에 나온 1이라는 값임. -->
				<li class="page-item">
				  <a class="page-link gray">이전&nbsp;</a>
				</li> 
			 </c:if>
			 
			 <c:if test="${page > 1 }">			
				<li class="page-item ">
				<a href="${pageContext.request.contextPath}/admin_list?page=${page - 1}&search_field=${search_field}&search_word=${search_word}"
							class="page-link">이전&nbsp;</a>
				<!--  기존에 써놨던것 시작 --  -->
				<!--  a href="${pageContext.request.contextPath}/member/list?page=${page-1}&search_field=${search_field}&search_word=${search_word}"
				class="page-link">이전</a>&nbsp;</a> -->
					<!--  기존에 써놨던것 끝. --  -->
				<!--  이전이니까 하나뺀다고 한다. -->
				
				</li> 
			 </c:if>
					
					
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page }">
							<li class="page-item  active">
							   <a class="page-link">${a}</a>
							</li>
						</c:if>
						
						<c:if test="${a != page }">
						<c:url var="go" value="admin_list">
						<!--  아래 이게 url을 만든다는것을 알겠는데 list가 맵핑의 리스트의미인가?.  .. -->
							<!--  c:url var="go" value="${pageContext.request.contextPath}/member/list" -->
								<c:param name="search_field" value="${search_field}" />
								<c:param name="search_word"  value="${search_word}" />
								<c:param name="page"         value="${a}" />
							</c:url>
							<li class="page-item">
							   <a href="${go}" class="page-link">${a}</a>
							</li>
						</c:if>
					</c:forEach>

			
			<c:if test="${page >= maxpage }">
				<li class="page-item">
				   <a class="page-link gray">&nbsp;다음</a> 
				</li>
			</c:if>
			<c:if test="${page < maxpage }">
				<c:url var="next" value="admin_list">
						<c:param name="search_field" value="${search_field}"/>
						<c:param name="search_word" value="${search_word}"/>
						<c:param name="page" value="${page+1}"/>
				</c:url>
			  <li class="page-item">
				<li class="page-item">
					<a href="${next}" class="page-link">&nbsp;다음</a>
			 	 </li>	
			</c:if>
		 </ul>
		</div>
 </c:if>
 </div>
	
 <%-- 회원이 없는 경우--%>
 <c:if test="${listcount == 0  &&empty search_word}">
	<h1>회원이 없습니다.</h1>
 </c:if>
 
 <c:if test="${listcount == 0  &&!empty search_word}">
	<h1>검색결과가 없습니다.</h1>
 </c:if>
		
	
</body>
</html>