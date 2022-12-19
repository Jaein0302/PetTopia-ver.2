<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">
<link href="${pageContext.request.contextPath}/resources/css/Product/productlist.css" type="text/css" rel="stylesheet">

<head>
	<title>펫토피아 - 수술/치료</title>
</head>

<style>
.postb {
    font-size: 17px;
    width: 94px;
    height: 17px!important;
    margin: 0!important;
    background-color: #f0c16a;
}

.button-5 {
    align-items: center;
    background-clip: padding-box;
    border: 1px solid transparent;
    border-radius: 0.25rem;
    box-shadow: rgb(0 0 0 / 2%) 0 1px 3px 0;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: inline-flex;
    font-family: "JUA",sans-serif;
    font-size: 26px;
    justify-content: center;
    line-height: 1;
    margin: 0 37px;
    min-height: 42px;
    padding: 10px 20px;
    position: relative;
    top: 5px;
    text-decoration: none;
    transition: all 250ms;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    vertical-align: baseline;
    width: 150px;
}
</style>

<script>


$(function(){
	/*
		첫번째. 위시버튼을 눌렀을때 에이잭스에서 사용자 아이디로 찜한 상품이 있는지 확인한다. 있으면 있다고 alert창 띄우기
		두번째. 없으면 에이잭스에서 사용자 아이디로 상품을 찜한다. 완료되면 완료되었다고 alert창 띄우기
	*/
	

	//검색 checkbox 한개만 선택
	$("input[name='ITEM_SEX']").click(function(){
	if($("input[name='ITEM_SEX']").prop('checked')){
		 $("input[name='ITEM_SEX']").prop('checked',false);
		 $(this).prop('checked',true);
		}
	})
	
	$(".search_select").on('click', "input[name='ITEM_WEIGHT']", function(){
	    if(this.checked) {
	        const checkboxes = $("input[name='ITEM_WEIGHT']");
	        for(let ind = 0; ind < checkboxes.length; ind++){
	            checkboxes[ind].checked = false;
	        }
	        this.checked = true;
	    } else {
	        this.checked = false;
	    }
	})
	
	$("input[name='ITEM_SPECIES']").click(function(){
	if($("input[name='ITEM_SPECIES']").prop('checked')){
		 $("input[name='ITEM_SPECIES']").prop('checked',false);
		 $(this).prop('checked',true);
		}
	})
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	//검색 ajax
	$("input[type='checkbox']").on('change', function(){
		var ITEM_SEX = $("input[name='ITEM_SEX']:checked").val();
		var ITEM_WEIGHT = $("input[name='ITEM_WEIGHT']:checked").val();
		var ITEM_SPECIES = $("input[name='ITEM_SPECIES']:checked").val();
		
		ITEM_SEX = ToNull(ITEM_SEX);
		ITEM_WEIGHT = ToNull(ITEM_WEIGHT);
		ITEM_SPECIES = ToNull(ITEM_SPECIES);
		
		console.log("ITEM_SEX=" + ITEM_SEX);
		console.log("ITEM_WEIGHT=" + ITEM_WEIGHT);
		console.log("ITEM_SPECIES=" + ITEM_SPECIES);
		
		$.ajax({
			type : "post",
			url : "search",
			data : {
					"ITEM_SEX" : ITEM_SEX,
					"ITEM_WEIGHT" : ITEM_WEIGHT,
					"ITEM_SPECIES" : ITEM_SPECIES
					},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(rdata) {
				$("#searchlist").remove();
				var output = '<div class="row px-xl-5 pb-3" id="searchlist">'
				$(rdata.list).each(function(){
					      output += '<div class="col-lg-3 col-md-6 col-sm-12 pb-1">'
						  +             '<div class="card product-item border-0 mb-4" >'
						  +                 '<div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0 uploadResult">'
						  +               		'<img class="img-fluid w-100" src="/pet_topia/upload' + this.ITEM_IMAGE_FILE + '"'
						  +               		' onclick="location.href=${pageContext.request.contextPath}/product/detail?ITEM_ID=' + this.ITEM_ID + '">'
						  +                 '</div>'
						  +                 '<div class="card-body border-left border-right p-0 pt-2 text-center">'
						  +                 	 '<span>' + this.seller_name + '</span>'
						  +                      '<h4 class="text-truncate m-0">' + this.ITEM_NAME + '</h4>'
						  +                      ' <i class="fas fa-star"></i><span class="text-body">&nbsp;' + this.ITEM_SCORE
						  +						 ' &ensp;<span class="text-small">후기 (' + this.cnt + ')</span></span>'
						  +                 '</div>'
						  +                 '<div class="card-footer d-flex justify-content-between bg-light border">'
						  +                 	'<span class="text-dark price" style="margin:0;font-color:black">';
						  var ITEM_PRICE = this.ITEM_PRICE.toLocaleString('ko-KR');						  
						  output +=			ITEM_PRICE + '원</span>'
						  +                  	'<a href="javascript:void(0)" class="btn border wishbutton">'
						  +               			'<i class="fas fa-heart text-primary"></i>'
						  +            			'</a>'
						  +            			'<input type="hidden" value="' + this.ITEM_ID + '">'
						  +                 '</div>'
						  +             '</div>'
						  +         '</div>';					      
				})			
				output += '</div>';
				$("#p_list").append(output);

			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	})
	
	//undefined, null값 빈문자열로 바꾸기
	function ToNull(data) {
		if (String(data) == 'undefined' || String(data) == 'null') {
	        return ''
	    } else {
	        return data
	    }
	}

})//ready function
</script>

<body>

<div class="header">
	<jsp:include page="../member/header.jsp" />
</div>


<div class="container body">  	 			
 	<div class="search">
 		<div>
	 		<form action="${pageContext.request.contextPath}/product/product_list" method="post" > 
	 			<h5>결과내 재검색</h5>
	 			<h1>ProductList2 입니다</h1>
		    	<input name = "search_word" value="${search_word}" class="form-control" type="text" placeholder="검색어를 입력해 주세요" id="search_word">
		    	<input class="button-5 postb" type="submit" value="검색" id="search_button" style="padding:10px 20px">
		    	<input type="hidden" name="item_category" value="${category}">
		    	<input type="hidden" name="search_field" value="1">
		    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">		    	
		    </form>
		</div>
		<c:if test="${category == 'treat'}">
		<hr>
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
		</c:if>
	</div>	
</div>


<!-- 상품 나열 -->
<div class="container mb-5">
    <div class="container-fluid pt-5"  id="p_list">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">검색결과</span></h2>
        </div>        
        <div class="row px-xl-5 pb-3" id="searchlist">
        <c:forEach var="p" items="${productlist}">	
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" >
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0 uploadResult">
                 		<img class='img-fluid w-100' src="/pet_topia/upload${p.ITEM_IMAGE_FILE}" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span> ${p.seller_name}</span>
                         <h4 class="text-truncate m-0">${p.ITEM_NAME}</h4>
                         <i class="fas fa-star"></i><span class="text-body">&nbsp;${p.ITEM_SCORE}&ensp;<span class="text-small">후기 (${p.cnt})</span></span>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	<span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>
                    	<!-- 찜하기 버튼 -->
                    	<a href="javascript:void(0)" class="btn border wishbutton">
                  			<i class="fas fa-heart text-primary"></i>
               			</a>
               			<input type="text" value="${p.ITEM_ID}">
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