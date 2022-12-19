<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<head>
	<title>펫토피아 - 수술/치료</title>
</head>

<style>
	.search {
		width : 600px;
		margin: 0 auto;
	}
	#search_word {width:70%; display : inline}
	
	#search_button {display : inline}
	
	
	
</style>

<script>
$(function(){
	
	/*
		첫번째. 위시버튼을 눌렀을때 에이잭스에서 사용자 아이디로 찜한 상품이 있는지 확인한다. 있으면 있다고 alert창 띄우기
		두번째. 없으면 에이잭스에서 사용자 아이디로 상품을 찜한다. 완료되면 완료되었다고 alert창 띄우기
	*/
	$('#wishbutton').on('click', function(){
		$.ajax({
			url: "",
			data : {},
			success: function(resp){
				if(resp == 1){ //사용자 아이디로 찜한 상품이 있을경우
					alert("해당 상품은 이미 찜한상품에 있습니다.");
				} else { //없으므로 다시 에이잭스에서 사용자 아이디로 상품을 찜한다.
					
				}
			}
		})//첫번째 ajax end

	});//wishbutton click function
	
})//ready function
			
</script>

<body>
<div class="header">
	<jsp:include page="../member/header.jsp" />
</div>


<div class="container mb-5 mainbody" style="height:150px;margin-top:220px;">  	 			
 	<div class="search">
 		<div>
	 		<form action="${pageContext.request.contextPath}/product/product_list" method="post" > 
	 			<h5>결과내 재검색</h5>
		    	<input name = "search_word" value="${search_word}" class="form-control" type="text" placeholder="검색어를 입력해 주세요" id="search_word">
		    	<button class="search-btn" type="submit" id="search_button">검색</button><hr>
		    	<input type="hidden" name="item_category" value="treat">
		    	<input type="hidden" name="search_field" value="1">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		    	
		    </form>
		</div>
		<div>
			<form class="search_select">
				<h5>성별</h5>
			  	<label><input type='checkbox' name='ITEM_SEX' value='male' >남성</label>
			 	<label><input type='checkbox' name='ITEM_SEX' value='female' >여성</label>
				<hr>
				
				<h5>크기</h5>
			  	<label><input type='checkbox' name='ITEM_WEIGHT' value='L' >대형</label>
			 	<label><input type='checkbox' name='ITEM_WEIGHT' value='M' >중형</label>
			 	<label><input type='checkbox' name='ITEM_WEIGHT' value='S' >소형</label>
				<hr>
				    
				<h5>종류</h5>
			  	<label><input type='checkbox' name='ITEM_SPECIES' value='dog' >반려견</label>
			 	<label><input type='checkbox' name='ITEM_SPECIES' value='cat' >반려묘</label>
	
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		 
			</form>
		</div>
	</div>	
</div>


<!-- 상품 나열 -->
<div class="container mb-5 mainbody" id="p_list">
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">검색결과</span></h2>
        </div>        
        <div class="row px-xl-5 pb-3">
        <c:forEach var="p" items="${productlist}">	
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0 uploadResult">
                 		<img class='img-fluid w-100' src="/pet_topia/upload${p.ITEM_IMAGE_FILE}">
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span> ${p.ITEM_CONTENT}</span>
                         <h4 class="text-truncate m-0">${p.ITEM_NAME}</h4>
                         <i class="fas fa-star"></i><span class="text-body">&nbsp;${p.ITEM_SCORE}&ensp;<span class="text-small">후기 (${p.cnt})</span></span>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>
                    	<!-- 찜하기 버튼 -->
                    	<button id="wishbutton"></button>
                    </div>
                </div>
            </div>        
         </c:forEach>            
         </div>     
     </div>
</div>
<jsp:include page="../member/footer.jsp" />
</body>
</html>