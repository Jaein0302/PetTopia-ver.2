<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<style>
.order { margin : 0 auto;
			width : 700px}
			
.item tbody tr td span  { 
							float : right;
							position : relative;
							right : 40px;
							}
.total h5 {display:inline; position:relative; left : 30px}
.total h4 {display:inline; float : right; position:relative; right : 40px}		
.total {background : lightgray;}		
.purchase { text-align : center; display:inline-block; width:100%}			
.purchase button { width : 200px; height : 40px;}

</style>

<script>
$(document).ready(function(){
    $(".purchase").click(function() {    	
    	var IMP = window.IMP;
        IMP.init('imp24704360');
        
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          order_uid: "${productdata.ITEM_ID}" + new Date().getTime(),
          name: "${productdata.ITEM_NAME}",
          item_id: "${productdata.ITEM_ID}",          
          amount: "${productdata.ITEM_PRICE * amount}",
          count : "${requestScope.amount}",
          buyer_id: "${memberlist.member_id}",
          buyer_addr: "${memberlist.member_address}"
      }, function (rsp) { // callback
          if (rsp.success) {    		
    		$.ajax({
    			url:'product/purchase', 
    			method:'POST',
    			dataType : 'json',
    			data: {
    				"order_id" : rsp.order_uid,
    				"item_id" : rsp.item_id,
    				"member_id" : rsp.buyer_id,
    				"order_amount" : rsp.count,
    				"order_price" : rsp.amount    				
    			},
    			success : function(result) {
    				console.log(result);
    				if(result == 1) {
    					alert("결제 성공");
    				} else {
    					alert("결제 실패");
    				}
    			},
   			    error:function(request,status,error){        
   					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
   			 	}
    		})
          } else {
      		alert("결제 실패");
          }
    	}
      );
    })
})
	
  </script>



<body>
	<jsp:include page="../member/header.jsp" />
	
	<!-- 주문페이지 -->
	<div class="order">
	<table class="table text-left m-2" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="commu pr-4">&ensp;주문결제</span>
			    </th>
			</tr>
		</thead>
	</table>	
	
		<table class="table text-left mt-3 item">
		   	<tbody class='border-bottom '>
		   	   	<tr>
			   		<td class='border-left' rowspan='5' style="width:200px">
	                 	<img class='img-fluid w-15' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}" style="width:150px;hegith:150px; ">
			   		</td>
		   		</tr>
		   		<tr>
					<td>상품명<span>${productdata.ITEM_NAME}</span></td>
		   		</tr>
		   		<tr>
					<td>예약날짜<span>2022.02.02</span></td>
		   		</tr>
		   		<tr>
					<td>개수<span> ${amount}개</span></td>
		   		</tr> 		
		   		<tr>
					<td>가격<span>${productdata.ITEM_PRICE}원</span></td>
		   		</tr> 		
		   	</tbody>
	   	</table>
		   
		<div class="mt-4 mb-4 total">	   		
			<h5>총 합계금액</h5><h4><c:out value = "${productdata.ITEM_PRICE * amount}"/>원</h4>
		</div>
		
		<table class="table text-left mt-5 item">
		 	<thead>
			 	<tr>
				 	<th colspan="2">구매자 정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				 	<td>이름</td>
				 	<td>${memberlist.member_name}</td>
				</tr>		
				<tr>
				 	<td>휴대폰 전화</td>
				 	<td>${memberlist.member_tell}</td>
				</tr>		
				<tr>
				 	<td>이메일 주소</td>
				 	<td>${memberlist.member_email}</td>
				</tr>		
			</tbody>	
		</table>	
		<div class="purchase">			
			<button class="btn btn-primary">결제하기</button> 
		</div>
	</div>
</body>	