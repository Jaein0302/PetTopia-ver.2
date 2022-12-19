<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	p > span, p> select { 
							float : right;
							position : relative;
							right : 60px;
							}
	#tab1, #tab2, #tab3, #tab4 {position : relative;
								left : 20px;
								}
	span img { width : 30px}
</style>
<script>

var result = "${result}";

$(function() {	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})
	
	if(result == 'addSuccess'){
		alert("상품 문의 성공입니다.");
	}
	
	   $(".purchase").on('click', function(){
		      location.href = "${pageContext.request.contextPath}/product/order_view?ITEM_ID=${productdata.ITEM_ID}&amount=" 
		      + $(".amount").val() + "&member_id=" + $("input[name='member_id']").val();
		   })
		   
		   $(".cart").on('click', function(){
		      location.href = "${pageContext.request.contextPath}/product/cart?ITEM_ID=${productdata.ITEM_ID}&amount=" 
		      + $(".amount").val() + "&member_id=" + $("input[name='member_id']").val();
	
	$("button").on('click', function(){
		if($(".amount").val() == '') {
			return false;
		}
	})
	
	$(".amount").on('change', function(){
		var p_price = $(".product_price").text().slice(0, -1);
		console.log("p_price=" + p_price)
		var t_price = $(".amount").val() * p_price;		
		$(".total_price").html(t_price);
	})
	
	new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
		stepping: 30,
		restrictions: {
	          minDate: undefined,
	          maxDate: undefined,
	          disabledDates: [],
	          enabledDates: [],
	          daysOfWeekDisabled: [],
	          disabledTimeIntervals: [],
	          disabledHours: [0,1,2,3,4,5,6,7,22,23,24],
	          enabledHours: []
	      },
		display: { 
	        components: {
	        	minutes: true,
	            seconds: false,
	            useTwentyfourHour: true,
	        },
	        icons: {
	            type: 'icons',
	            time: 'fa fa-solid fa-clock',
	            date: 'fa fa-solid fa-calendar',
	            up: 'fa fa-solid fa-arrow-up',
	            down: 'fa fa-solid fa-arrow-down',
	            previous: 'fa fa-solid fa-chevron-left',
	            next: 'fa fa-solid fa-chevron-right',
	            today: 'fa fa-solid fa-calendar-check',
	            clear: 'fa fa-solid fa-trash',
	            close: 'fas fa-solid fa-xmark'
	        },
	    },
	});
	
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
				<b>상품 상세보기</b>
			</div>
			<hr	style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
			<br>
			
			
			<div class="container">
				<div class="row px-xl-5 text-center detailbox">
					<div class="uploadResult col-md-5">
                 		<img class='img-fluid w-30' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}">
					</div>
						<div class="col-md-7">
							<form>
							
							<p>
								상품명 <span>${productdata.ITEM_NAME}</span>
							</p>
							<hr>
							<p>
								판매가 <span class="product_price">${productdata.ITEM_PRICE}원</span>
							</p>
							<hr>
							<p>
								상품개수 <select class="amount" name="amount" id="size-select">
									<option value="0">--[상품개수를 선택하세요]--</option>
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
								</select>
								<c:set var="amount1" value="amount" />
							</p>
							<hr>

							<p>
								예약 날짜/시간 정하기

							<div class='input-group' id='datetimepicker1'
								data-td-target-input='nearest' data-td-target-toggle='nearest'>
  									 <input id='datetimepicker1Input' type='text' class='form-control'
										data-td-target='#datetimepicker1' />
   									<span class='input-group-text' data-td-target='#datetimepicker1'
										data-td-toggle='datetimepicker'>
    								 <span class='fa fa-solid fa-calendar'></span>
  									 </span>
 							</div>
							
							</p>
							</form>
						<hr>


						<p>총 상품 금액 <span class="total_price"> </span>
							</p> 
						<hr style="opacity: 1; background-color: black; margin: 0 auto">
						<br>
						<button type="button" class="btn btn-primary">관심상품 담기</button>
						<button type="button" class="btn btn-primary">장바구니 담기</button>
						<button type="button" class="btn btn-primary purchase">바로 구매하기</button>
						
					</div>
				</div>
				<br>
			</div>
			<hr
				style="height: 2px; opacity: 1; background-color: black; margin: 0 auto">
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
					<p>상세정보</p>
				</section>

				<section id="content2">
					<jsp:include page='review_view.jsp' />
				</section>
				
				<section id="content3">
					<jsp:include page='ask_view.jsp' />
				</section>

				<section id="content4">
					<p>취소/ 환불</p>
				</section>

			</div>

		</div>
	</div>
	</div>
<jsp:include page="../member/footer.jsp" />
</body>

</html>