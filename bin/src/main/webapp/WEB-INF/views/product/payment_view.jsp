<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
	
	<form action="product/purchase_view" method="GET">
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
			<button type="submit" class="btn btn-primary">결제하기</button> 
		</div>
	</form>
	</div>
</body>	