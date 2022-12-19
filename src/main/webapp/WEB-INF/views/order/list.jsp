<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫토피아 - 커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/Order/orderlist.css" type="text/css" rel="stylesheet">
</head>
<body>
<sec:authorize access="hasRole('ROLE_MEMBER')">
<sec:authentication property="principal" var="pinfo"/>

	<!-- 지도 띄우기 -->	
 	<div class="popup_panel1">
       <div class="popup_bg1"></div>
            <div class="popup_contents1">
                <a href="javascript:void(0)" id="btn_popup_close1"></a>
  			 <div id="map" style="width:100%;height:500px;"></div>
   		</div>
    </div>


<!-- header -->
<div class="header">
<jsp:include page="../member/header.jsp" />
</div>
 <div class="container mb-5 mainbody" style="height:1500px;margin-top:220px;">
  <div class="row px-xl-5">
  
   <!-- 사이드바 -->	  
   <div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
   </div>
   
   <div class="col-md-9 pb-3">
    
    <!-- 예약중 -->
    <table class="table text-left m-0" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="onair"></span>
			 	   <span class="commu pr-4">&ensp;예약중</span>
			 	   <span class="text-small1">( 총 <span class="text-comment">${listcount}</span>건의 예약이 있습니다 )</span>
			    </th>
			</tr>
		</thead>
	</table>
	
   <!-- 예약중 리스트 -->
   <c:if test="${!empty boardlist}">
     <c:forEach var="b" items="${boardlist}">
   <table class="table text-left mt-3 order">
	<colgroup>
	<col width="20%" />
	<col width="55%" />
	<col width="25%" />
	</colgroup>
   		<tr>
	   		<th class='pb-0' colspan='2'>
		   		<a class="order_info text-body"  href="javascript:void(window.open('order_info?order_id=${b.order_id}','주문 상세보기','width=500,height=600,top=200,left=650'))">
		   			<input type="hidden" id="order_num" value="${b.order_id}">
		   			<i class="far fa-calendar-check"></i>&ensp;
		   				예약번호&ensp;:&ensp;Y${b.order_id} 
		   			<span class='text-small2 pl-2'>
		   			<i class="fas fa-angle-double-left"></i>&nbsp;상세보기</span>
		   		</a>
	   		</th>
	   		<th class='text-right pb-0'>
	   			<input type="hidden" value="${b.order_id}">
	   			<span class='order-cancel pl-2 order-cancel cpointer'>
	   			<i class="fas fa-ban"></i> 예약 취소</span>
	   		</th>
   		</tr>
   	<tbody class='border-bottom'>
   	   	<tr>
	   		<td class='border-left' rowspan='4'>
	   			<img src="/pet_topia/upload${b.order_image}" 
	   				 style="width:130px;hegith:130px;">
	   		</td>
   		</tr>
   		<tr>
   			<td><a class="text-dark" href="${pageContext.request.contextPath}/product/detail?ITEM_ID=${b.order_item_id}">${b.order_item_name}</a></td>
   			<td class='border-left border-right text-center order-price' rowspan='4'><fmt:formatNumber value="${b.order_item_price}" pattern="#,###" />원</td>
   		</tr>
   		<tr>
   			<td>${b.order_item_sellerName}
   			<input type="hidden" id="address" value='${b.order_location}'>
   				<span id="showmap" style="cursor:pointer">
   					<i class="fas fa-map-marker-alt pl-1"></i>
   				</span>
   			</td>
   		</tr>
   		<tr>
   			<td>
    			<c:set var = "b_length" value = "${fn:length(b.order_time)}"/>
   				<span class="p-subTitle1">${fn:substring(b.order_time, 0, b_length-3)}</span>
   			</td>
   		</tr>
   	</tbody>
   </table>
   </c:forEach>
   </c:if>
   
   <%--리뷰가 없는 경우--%>
	<c:if test="${empty boardlist}">
	<div class="text-center" style="margin:70px auto">
	<h2 style='color:#b1b1b1'>예약중인 상품이 없습니다.</h2>
	</div>
	</c:if>
   
   <!-- 지난 예약 -->
  <c:if test="${!empty last}">
    <table class="table text-left mt-5" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="bounce arrow-bounce pr-2"><i class="fa fa-2x fa-chevron-down"></i></span>
			 	   <span class="commu"> 지난 예약</span>
			    </th>
			</tr>
		</thead>
	</table>
   
   
    <!-- 지난 예약 리스트 -->
  <c:forEach var="l" items="${last}">
   <table class="table text-left mt-4 order">
	<colgroup>
	<col width="20%" />
	<col width="55%" />
	<col width="25%" />
	</colgroup>
   		<tr>
	   		<th class='pb-0' colspan='2'>
	   		<a class="order_info text-body"  href="javascript:void(window.open('order_info?order_id=${l.order_id}','주문 상세보기','width=500,height=550,top=200,left=650'))">
	   			<input type="hidden" id="order_num" value="${l.order_id}">
	   			<i class="far fa-calendar-check"></i>&ensp;
	   				예약번호&ensp;:&ensp;Y${l.order_id}
	   				<span class='text-small2 pl-2'>
	   			<i class="fas fa-angle-double-left"></i>&nbsp;상세보기</span>
	   		</a>
	   		</th>
	   		<th class='text-right pb-0'>
	   		 <c:if test='${l.cnt == 0}'> 
	   			<a href="${pageContext.request.contextPath}/order/review?review_item_id=${l.order_item_id}&date=${l.order_time}&name=${l.order_item_name}&order=${l.order_id}" class="text-decoration-none">
		   			<span class='text-comment'><i class="fas fa-pencil-alt"></i>
		   				리뷰 쓰기
		   			</span>
	   			</a>
	   		 </c:if>
	   		</th>
   		</tr>
   	<tbody class='border-bottom'>
   	   	<tr>
	   		<td class='border-left' rowspan='4'>
	   			<img src="/pet_topia/upload${l.order_image}" 
	   				 style="width:130px;hegith:130px;">
	   		</td>
   		</tr>
   		<tr>
   			<td><a class="text-dark" href="${pageContext.request.contextPath}/product/detail?ITEM_ID=${l.order_item_id}">${l.order_item_name}</a></td>
   			<td class='border-left border-right text-center order-price' rowspan='4'><fmt:formatNumber value="${l.order_item_price}" pattern="#,###" />원</td>
   		</tr>
   		<tr>
   			<td>${l.order_item_sellerName}
   			<input type="hidden" id="address" value='${l.order_location}'>
   				<span id="showmap" style="cursor:pointer">
   				<i class="fas fa-map-marker-alt pl-1"></i>
   				</span>
   			</td>
   		</tr>
   		<tr>
   			<td>
   				<c:set var = "l_length" value = "${fn:length(l.order_time)}"/>
   				<span class="order-price">${fn:substring(l.order_time, 0, l_length-3)}</span>
   			</td>
   		</tr>
   	</tbody>
   </table>
   </c:forEach>
   
   
   
     <!-- 페이징 처리 -->
	<div class="pagination-div">
	<ul class="pagination modal-2 text-center" style='position: absolute;left: 40%;'>
	  
	 <c:if test="${page <= 1 && lastcount != 0}">
	  <li><a href="#" class="prev"><i class="fas fa-angle-double-left"></i></a></li>
	 </c:if> 
	 <c:if test="${page > 1 }">
	  <li>
		<a class="next" href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}&page=${page-1}"><i class="fas fa-angle-double-left"></i></a>
	  </li>
	 </c:if> 
	 
	 <c:forEach var="a" begin="${startpage}" end="${endpage}">
	 	<c:if test="${a == page}">
		 <li>
			<a class="pnum active">${a}</a>
		 </li>
	   </c:if>
	   <c:if test="${a != page }"> 
	 	 <li>
			<a class="pnum" href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}&page=${a}">${a}</a>
		 </li>
	   </c:if>
	 </c:forEach>
	  
	<c:if test="${page >= maxpage  && lastcount != 0}}">
		<li class="page-item">
		  <li><a href="#" class="next"><i class="fas fa-angle-double-right"></i></a></li>
	</c:if>
	<c:if test="${page < maxpage }"> 
	     <li>
			<a class="next" href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}&page=${page+1}"><i class="fas fa-angle-double-right"></i></a>
		 </li>
	</c:if>
	</ul>
	</div>
   
   </c:if>
   
   </div>
  </div>
  </div>
    <script src="${pageContext.request.contextPath}/resources/js/Order/orderlist.js"></script>
	<!-- 카카오 맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a0aac50d998d4e38614102e447c876b&libraries=services"></script>
<script>
$(document).ready(function() {
	//예약 취소
	$(document).on("click",".order-cancel",function(){
		var order = $(this).prev().val();
	 Swal.fire({
		  title: '예약을 취소하시겠습니까?',
		  icon: 'error',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $(location).attr('href','order_delete?member_id=${pinfo.username}&order_id='+order);
		  }
		})
	});//order-cancel end
});
</script>
</sec:authorize>
</body>
<jsp:include page="../member/footer.jsp" />
</html>