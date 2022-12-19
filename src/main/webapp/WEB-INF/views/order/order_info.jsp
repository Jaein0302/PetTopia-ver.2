<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 정보</title>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/Main/style.css" rel="stylesheet">
</head>
<body>

<%-- 프린트 아이콘 --%>
<div style='position:absolute;left:80%;top:9%;'>
<button class="print-button"><span class="print-icon"></span></button>
</div>

<h1 class="text-center mt-2">예약 상세 정보</h1><hr class='m-0 pt-3'>

<%-- 예약중 --%>
<c:if test='${!empty order}'>
<b class='p-2 text-success'><i class="far fa-check-circle"></i> 예약이 확정되었습니다.</b><br>
<span class='p-2 text-small'>예약 변경을 원하시면 예약 취소 후 재 예약신청을 부탁드립니다.</span> 
<table class='w-100 mt-3'>
<tr>
	<td><b>예약 정보</b> <span class='text-small'>( 예약 번호 : Y${order.order_id} )</span></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>상품</td>
	<td class='p-1 border text-dark'>${order.order_item_name}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>예약 일시</td>
	<c:set var = "order_length" value = "${fn:length(order.order_time)}"/>
	<td class='p-1 border text-dark'>${fn:substring(order.order_time, 0, order_length-3)}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>가격</td>
	<td class='p-1 border text-dark'><fmt:formatNumber value="${order.order_item_price}" pattern="#,###" />원</td>
</tr>
<tr>
	<td class='pt-3'><b>매장 정보</b></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장명</td>
	<td class='p-1 border text-dark'>${order.order_item_sellerName}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장 주소</td>
	<td class='p-1 border text-dark'>${order.order_location}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장 전화</td>
	<td class='p-1 border text-dark'>${order.order_item_tell}</td>
</tr>
<tr>
	<td class='pt-3'><b>고객 정보</b></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>고객 아이디</td>
	<td class='p-1 border text-dark'>${order.order_member_id}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>고객 연락처</td>
	<td class='p-1 border text-dark'>${order.order_member_tell}</td>
</tr>
</table>
<div class='text-center mt-4'>
<input type='button' class='btn btn-danger w-50' style='border-radius:6px' value='예약 취소'>
</div>
</c:if>

<%-- 지난 예약 --%>
<c:if test='${empty order}'>

	<%-- 리뷰 작성 전 --%>
	<c:if test='${last.cnt==0}'>
	<b class='p-2 text-comment'><i class="far fa-smile-wink"></i> 서비스는 어떠셨나요?</b><br>
	<span class='p-2 text-small'>서비스에 대한 소중한 별점과 리뷰를 남겨주세요.</span> 
	</c:if>
	
	<%-- 리뷰 작성 후 --%>
	<c:if test='${last.cnt!=0}'>
	<b class='p-2 text-comment text-heart'><i class="fas fa-heart"></i> 소중한 리뷰 감사합니다.</b><br>
	<span class='p-2 text-small'>앞으로 더욱 좋은 서비스로 고객님의 성원에 보답하겠습니다.</span> 
	</c:if>
	
<table class='w-100 mt-3'>
<tr>
	<td><b>예약 정보</b> <span class='text-small'>( 예약 번호 : Y${last.order_id} )</span></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>상품</td>
	<td class='p-1 border text-dark'>${last.order_item_name}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>예약 일시</td>
	<c:set var = "last_length" value = "${fn:length(last.order_time)}"/>
	<td class='p-1 border text-dark'>${fn:substring(last.order_time, 0, last_length-3)}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>가격</td>
	<td class='p-1 border text-dark'><fmt:formatNumber value="${last.order_item_price}" pattern="#,###" />원</td>
</tr>
<tr>
	<td class='pt-3'><b>매장 정보</b></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장명</td>
	<td class='p-1 border text-dark'>${last.order_item_sellerName}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장 주소</td>
	<td class='p-1 border text-dark'>${last.order_location}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>매장 전화</td>
	<td class='p-1 border text-dark'>${last.order_item_tell}</td>
</tr>
<tr>
	<td class='pt-3'><b>고객 정보</b></td>
</tr>
<tr>
	<td class='p-1 border text-dark'>고객 아이디</td>
	<td class='p-1 border text-dark'>${last.order_member_id}</td>
</tr>
<tr>
	<td class='p-1 border text-dark'>고객 연락처</td>
	<td class='p-1 border text-dark'>${last.order_member_tell}</td>
</tr>
</table>
<div class='text-center mt-4'>
</div>
</c:if>


 <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(document).ready(function() {
	//예약 취소
	$('.btn-danger').on("click",function(){
		var order = $(this).prev().val();
	 Swal.fire({
		  title: '예약을 취소하시겠습니까?',
		  icon: 'error',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $(location).attr('href','order_delete?member_id=<sec:authentication property="principal" var="pinfo"/>&order_id=${order.order_id}');
			  opener.document.location.reload();
			  self.close();
		  }
		})
	});//order-cancel end
	
	$('.print-button').on('click',function(){
		window.print();
	})
});
</script>
</body>
</html>