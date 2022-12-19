<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 수술/치료</title>
<link href="${pageContext.request.contextPath}/resources/css/Product/detail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Popperjs -->
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js"></script>
<!--Tempus Dominus JavaScript -->
<script src="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/js/tempus-dominus.js"></script>
<!-- Tempus Dominus Styles -->
<link href="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/css/tempus-dominus.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
<style>
   #tab1, #tab2, #tab3, #tab4 {position : relative;
                        left : 20px;
                        }
   span img { width : 30px}
   .btn-primary:hover, .btn-primary:active{
   	color:#404040!important;
   	opacity:0.7
   }
</style>

<script>
var result = "${result}";

$(function() {	
	
	if(result == 'addSuccess'){
		alert("상품 문의 성공입니다.");
	}
	
	$(".purchase").on('click', function(){
		if($("#datetimepicker1Input").val() == ''){
			alert("예약날짜와 시간을 설정해주세요");
		} else {
			location.href = "${pageContext.request.contextPath}/product/order_view?"
					+"ITEM_ID=${productdata.ITEM_ID}"
					+"&member_id=" + $("input[name='member_id']").val();
		}
	})//purchase click function
		   
	
	
	
	$('#wishButton').on('click',function(){
		
		var item_id = $('#hidden_itemID').val();
		
		$.ajax({
			url: "is_inmywish",
			data : {"ITEM_ID" : item_id }, //앞에는 파라미터로 넘길 이름 뒤에는 넣을 값
			success: function(resp){
				//console.log(resp);
				if(resp != "null" ){ //사용자 아이디로 찜한 상품이 있을경우
					alert("해당 상품은 이미 찜한상품에 있습니다.");
				} else { //없으므로 다시 에이잭스에서 사용자 아이디로 상품을 찜한다.
					
					
					$.ajax({
						url:"addWish",
						data: {"ITEM_ID" : item_id},
						success: function(resp){
							//console.log(resp)
							if (resp != null) {
								alert("상품이 성공적으로 찜목록에 담겼습니다.");
							} else{
								alert("상품을 찜목록에 담는중 오류가 발생했습니다.");
							}
						}//inner success
					})//inner ajax
					
					
					
				}
			},//outter success
		})//outer ajax end
	})//wish button click function
	
	
	
	//수정성공하면 alert
   	var result = "${result}";
	if(result == "updatesuccess") {
		alert("문의 수정이 완료되었습니다");
	}
	
	
	
});

</script>

</head>

<body>
   <jsp:include page="../member/header.jsp" />

   <div class="container mb-5">
   <div class="row align-items-center justify-content-center detail">
      <div class="col-sm-11">
         <br>
         <div>
          	<a href="${pageContext.request.contextPath}/main/main" class='text-body'>
	         	<i class="fas fa-home"></i>
	         </a>
	         &ensp;&gt;&ensp;
	             			<b>
	             				<c:if test="${productdata.ITEM_CATEGORY eq 'treat'}">
	                     	 	<a href="${pageContext.request.contextPath}/product/product_list?item_category=treat" class='text-body'>
	                     	 	수술/치료
	                     	 	</a>
	                     	 	</c:if>
	                     	 	<c:if test="${productdata.ITEM_CATEGORY eq 'beauty'}">
	                     	 	<a href="${pageContext.request.contextPath}/product/product_list?item_category=beauty" class="text-body">
	                     	 	미용
	                     	 	</a>
	                     	 	</c:if>
	                     	 	<c:if test="${productdata.ITEM_CATEGORY eq 'education'}">
	                     	 	<a href="${pageContext.request.contextPath}/product/product_list?item_category=education" class="text-body">
	                     	 	교육
	                     	 	</a>
	                     	 	</c:if>
	                     	</b>
	        &ensp;&gt;&ensp;
	        <b>상품 상세보기</b>
         </div>
         <hr style="height: 2px; opacity: 1; background-color:#404040; margin: 0 auto">
         <br>
         
         
         <div class="container">
            <div class="row px-xl-5 detailbox">
               <div class="uploadResult col-md-6">
                       <img class='img-fluid w-30' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}">
               </div>
                  <div class="col-md-6 text-left" style='position:relative'>
                        
                      <div class='border-bottom pb-3'>
	                       <span>${productdata.ITEM_CONTENT}</span>
	                       <h2 class='m-0'>${productdata.ITEM_NAME}</h2>
	                       
	                          <c:if test="${productdata.ITEM_SCORE==0}">
					          <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
					          </c:if>
					          <c:if test="${productdata.ITEM_SCORE>0 && productdata.ITEM_SCORE<1}">
					          <i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
					          </c:if>
					          <c:if test="${productdata.ITEM_SCORE==1}">
							  <i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE>1 && productdata.ITEM_SCORE<2}">
							  <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE==2}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE>2 && productdata.ITEM_SCORE<3}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE==3}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE>3 && productdata.ITEM_SCORE<4}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE==4}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE>4 && productdata.ITEM_SCORE<5}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
							  </c:if>
							  <c:if test="${productdata.ITEM_SCORE==5}">
							  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
							  </c:if>
							  <span class='text-small'> <c:if test="${productdata.ITEM_SCORE==0}">0.0</c:if>
														  <c:if test="${productdata.ITEM_SCORE>0}">${productdata.ITEM_SCORE}</c:if>
							  </span> 
							  <span class='text-small pl-2'>후기 ${rlistcount}건</span>
                       </div>
		  
						<div class='text-left border-bottom pt-3 pb-3 w-100' style='float:left'>판매가 
                        	<b class='text-dark' style='padding-left:25px;font-size:1.3em'><fmt:formatNumber value="${productdata.ITEM_PRICE}" pattern="#,###" /></b>원
						</div>
                      
						<div class='text-left border-bottom pt-3 pb-3 w-100' style='float:left'>업체명 
	                        <span style='padding-left:25px;'>${productdata.seller_name}</span>
	                        <input type="hidden" name='member_id' value='${productdata.MEMBER_ID }'>
                        </div>
                      
                       <div class='text-left border-bottom pt-3 pb-3 w-100' style='float:left'>주소
                       		<span class='dadd' style='padding-left:38px;'>${productdata.ITEM_ADDRESS}</span>
                       </div>
				
					<div class='text-center pt-3 w-100' style='float:left'>
	                  <button type="button" class="btn btn-primary p-2 pl-3 pr-3 mr-3" id="wishButton">
	                  	<i class="fas fa-heart dheart pr-2" style='color:#404040!important'></i>관심상품 담기</button>
	                  <input id="hidden_itemID" type="hidden" value="${productdata.ITEM_ID }">
	                  <button type="button" class="btn btn-primary p-2 pl-3 pr-3 purchase">
	                  <i class="fas fa-calendar-check dwon pr-2" style='color:#404040!important'></i>바로 예약하기</button>
	                </div>
                
               </div>
            </div>
            <br>
         </div>
         <hr style="height: 2px; opacity: 1; background-color:#404040; margin: 0 auto">
         <br>

         <div class="tab">
            <input id="tab1" type="radio" name="tabs" checked>
            <label for="tab1">상품상세정보</label>    
                     
            <input id="tab2" type="radio" name="tabs">             
            <label for="tab2">상품 구매후기</label> 
            
            <input id="tab3" type="radio" name="tabs"> 
            <label for="tab3">상품 문의</label> 
            
            <input id="tab4" type="radio" name="tabs"> 
            <label for="tab4">취소/ 환불</label>         
         
            <section id="content1">
               <jsp:include page='detail.jsp' />
            </section>

            <section id="content2">
               <jsp:include page='review_view.jsp' />
            </section>
            
            <section id="content3">
               <jsp:include page='ask_view.jsp' />
            </section>

            <section id="content4">
               <jsp:include page='refund.jsp' />
            </section>

         </div>

      </div>
   </div>
   </div>
<jsp:include page="../member/footer.jsp" />
<!-- 
<script src="${pageContext.request.contextPath}/resources/js/Product/product_detail.js"></script>
-->
</body>

</html>