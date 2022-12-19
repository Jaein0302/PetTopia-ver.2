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
	    <c:forEach var="c" items="${cartlist}">	
		<table class="table text-left mt-3 item">
		   	<tbody class='border-bottom '>
		   	   	<tr>
			   		<td class='border-left' rowspan='5' style="width:200px">
	                 	<img class='img-fluid w-15' src="/pet_topia/upload${c.CART_ITEM_IMAGE}" style="width:150px;hegith:150px; ">
			   		</td>
		   		</tr>
		   		<tr>
					<td>상품명<span>${c.CART_ITEM_NAME}</span></td>
		   		</tr>
		   		<tr>
					<td>예약날짜<span>2022.02.02</span></td>
		   		</tr>
		   		<tr>
					<td>개수<span> ${c.CART_AMOUNT}개</span></td>
		   		</tr> 		
		   		<tr>
					<td>가격<span>${c.ITEM_PRICE * amount}원</span></td>
		   		</tr> 		
		   	</tbody>
	   	</table>
	   	</c:forEach>
		   
		<div class="mt-4 mb-4 total">	   		
			<h5>총 합계금액</h5><h4><c:out value = "${c.ITEM_PRICE * amount}"/>원</h4>
		</div>
		
		<div class="purchase">			
			<button class="btn btn-primary">결제하기</button> 
		</div>
	</div>
</body>	