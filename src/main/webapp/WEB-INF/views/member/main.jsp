<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>펫토피아</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<script>

//회원정보 수정 alert
var MU_message = "${MU_message}";
if(MU_message == "success"){
	alert('회원정보가 성공적으로 변경되었습니다.');
} else if (MU_message == "fail"){
	alert('회원정보 수정중 문제가 발생하였습니다. \n 관리자에게 문의해주세요.')
}

//회원 탈퇴 alert
var withdraw_message = "${withdraw_message}";
if (withdraw_message == "withdraw_success"){
	alert('그동안 펫토피아를 이용해주셔서 감사합니다.');
} else if (withdraw_message == "withdraw_fail") {
	alert('탈퇴처리 과정중 문제가 발생하였습니다. \n 관리자에게 문의해주세요.')
};

$(function(){

	$('body').on('click','.wishbutton', function(){

		var item_id = $(this).next();
		
		
		$.ajax({
			type : "POST",
			url: "../product/is_inmywish",
			data : {"ITEM_ID" : item_id.val() }, 
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success: function(resp){
				console.log(resp);
				if(resp != "null" ){ //사용자 아이디로 찜한 상품이 있을경우
					alert("해당 상품은 이미 찜한상품에 있습니다.");
				} else { //없으므로 다시 에이잭스에서 사용자 아이디로 상품을 찜한다.
					
					
					$.ajax({
						type: "POST",
						url:"../product/addWish",
						data: {"ITEM_ID" : item_id.val() },
						beforeSend : function(xhr)
			            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
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

	});//wishbutton click function

})
</script>

<body>

<!-- header -->
<div class="header">
<jsp:include page="header.jsp" />
</div>


    <div class="container mb-5 mainbody">
        <div class="row border-top px-xl-5">
			<div class="col-lg-12" style="margin:0 auto;">
                <!-- 슬라이드 시작 -->
                <div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-3.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">반려견에게 눈높이를 맞춘</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">애견 유치원</h3>
                                    <a href="${pageContext.request.contextPath}/main/search_item?item=유치원" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-1.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">반려견, 반려묘를 위한</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">중성화 수술</h3>
                                    <a href="${pageContext.request.contextPath}/main/search_item?item=중성화" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                         <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/carousel-2.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">지금도 귀엽지만 더 귀엽게!</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">애견 미용</h3>
                                    <a href="${pageContext.request.contextPath}/main/search_item?item=미용" class="btn btn-light py-2 px-3">보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </div>
                <!-- 슬라이드 끝 -->
            </div>
        </div>
    
    <!-- Navbar End -->


    <!-- Featured Start -->
     <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">서비스 예약</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-calendar-alt text-primary m-0 mr-2" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">&emsp;예약 관리</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-gift text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">&ensp;이벤트</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3" style="font-size:37px"></h1>
                    <h5 class="font-weight-semi-bold m-0">1:1 고객 상담</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-3">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <!-- <p class="text-right">15 Products</p> -->
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=treat" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog1.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">수술/치료</h5>
                </div>
            </div>
                  <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=education" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog4.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">교육</h5>
                </div>
            </div>
                  <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <a href="${pageContext.request.contextPath}/product/product_list?item_category=beauty" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/Main/dog5.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0" style="text-align:center">미용</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->


    <!--
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="${pageContext.request.contextPath}/resources/img/Main/offer-1.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">보러가기</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="${pageContext.request.contextPath}/resources/img/Main/offer-2.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    -->


    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">BEST</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        <c:forEach var="p" items="${list}" end="7">	        
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4" >
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                         <img class='img-fluid w-100' src="/pet_topia/upload${p.ITEM_IMAGE_FILE}" onclick="location.href='${pageContext.request.contextPath}/product/detail?ITEM_ID=${p.ITEM_ID}'">              	
                    </div>
                    <div class="card-body border-left border-right p-0 pt-2 text-center">
                    	<span class="text-body"> ${p.seller_name}</span>
						<h4 class="text-truncate m-0">${p.ITEM_NAME}</h4>
						<i class="fas fa-star"></i><span class="text-body">&nbsp;${p.ITEM_SCORE}&ensp;<span class="text-small">후기 (${p.cnt})</span></span>
                    </div>
                    <div class="card-footer d-flex justify-content-between bg-light border">
                    	 <span class="text-dark price" style="margin:0;font-color:black"><fmt:formatNumber value="${p.ITEM_PRICE}" pattern="#,###" />원</span>
                    	<a href="javascript:void(0)" class="btn border wishbutton">
                    		<i class="fas fa-heart text-primary"></i>
                    	</a>
                    	<input type="hidden" value="${p.ITEM_ID}">
                    </div>
                </div>
            </div>
         </c:forEach>
        </div>
    </div>
    <!-- Products End -->


    <!-- Subscribe Start -->
    <!--
    <div class="container-fluid bg-secondary my-5">
        <div class="row justify-content-md-center py-5 px-xl-5">
            <div class="col-md-6 col-12 py-5">
                <div class="text-center mb-2 pb-2">
                    <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                    <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo labore labore.</p>
                </div>
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Subscribe</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    -->
    <!-- Subscribe End -->

</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
var message = "${message}";
if(message == 'JoinSuccess'){
   Swal.fire(
  '회원가입을 축하드립니다!',
  '서비스는 로그인 후 이용가능합니다.',
  'success'
)};
let message1 = '${login_check}';
if(message1 == "로그인하세요"){
	Swal.fire(
	'로그인 해주세요',
	'고객센터 문의는 로그인 이후 사용가능합니다.',
	'error'
)};
</script>
</body>
</html>