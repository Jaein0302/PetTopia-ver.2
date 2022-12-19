<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/img/Main/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/7612218f6b.js" crossorigin="anonymous"></script>
	
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/Main/style.css" rel="stylesheet">
	
	<!-- login css -->
	<link href="${pageContext.request.contextPath}/resources/css/Main/login.css" type="text/css" rel="stylesheet">
	
</head>
<style> 
.wrapcon {
    position: relative;
}

</style>
<body>
<div class="toptop">
        <div class="container wrapcon"> 
        <div class="row align-items-center py-2 px-xl-5">

		<!-- 사이트 로고 -->            
            <div class="col-lg-3 d-none d-lg-block" style="padding: 26px 10px 10px 10px;">
                <a href="${pageContext.request.contextPath}/main/main" class="text-decoration-none effect-shine">
                     <img src="${pageContext.request.contextPath}/resources/img/Main/hand.gif" style="width: 62px;height:75px;padding: 1px 3px 23px 2px;">
                    <span class="m-0 display-5" style="font-family:'JUA';font-size:40px">펫토피아</span>
                </a>
            </div>
		
		<!-- 검색바 -->            
            <div class="col-lg-6 col-6 text-left">
                <form action="${pageContext.request.contextPath}/main/search_item" name="search" method="get" >
                    <div class="input-group">
                        <input type="text" name="item" class="form-control" placeholder="검색어를 입력해주세요"
                               onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);" required>
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary isearch" style="cursor:pointer">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </div>
         <!-- 검색바 끝 -->

            <div class="col-lg-3 col-6 text-right pl-0" style='position:relative'>
             <!-- 추천 검색어 -->
            <span class='best_search'>추천 검색어</span>
            <div class='block1'>
             	<ul id="ticker1">
             	<li><a href='${pageContext.request.contextPath}/main/search_item?item=중성화'>중성화</a></li>
             	<li><a href='${pageContext.request.contextPath}/main/search_item?item=스케일링'>스케일링</a></li>
             	<li><a href='${pageContext.request.contextPath}/main/search_item?item=애견 유치원'>애견유치원</a></li>
             	</ul>
                </div>
             
             <!-- 찜 -->
              <sec:authorize access="hasRole('ROLE_MEMBER')">
             <a href="${pageContext.request.contextPath }/product/goToMyWishList?member_id=<sec:authentication property="principal.Username"/>" class="border" style='padding: 9px 10px;'>
              <i class="fas fa-heart text-primary" style='font-size: 19px; line-height: 1.684;'></i>
             </a>
             </sec:authorize>
            </div>
        </div>
	</div>
    <!-- Topbar End -->


 
	<!-- 팝업 레이어 (로그인 폼) -->
	<div class="popup_panel">
            <div class="popup_bg"></div>
            <div class="popup_contents">
                <a href="javascript:void(0)" id="btn_popup_close"></a>
            <!-- partial:index.partial.html -->
<div class="center">
  <div class="ear ear--left"></div>
  <div class="ear ear--right"></div>
  <div class="face">
    <div class="eyes">
      <div class="eye eye--left">
        <div class="glow"></div>
      </div>
      <div class="eye eye--right">
        <div class="glow"></div>
      </div>
    </div>
    <div class="nose">
      <svg width="38.161" height="22.03">
        <path d="M2.017 10.987Q-.563 7.513.157 4.754C.877 1.994 2.976.135 6.164.093 16.4-.04 22.293-.022 32.048.093c3.501.042 5.48 2.081 6.02 4.661q.54 2.579-2.051 6.233-8.612 10.979-16.664 11.043-8.053.063-17.336-11.043z" fill="#243946"></path>
      </svg>
      <div class="glow"></div>
    </div>
    <div class="mouth">
      <svg class="smile" viewBox="-2 -2 84 23" width="84" height="23">
        <path d="M0 0c3.76 9.279 9.69 18.98 26.712 19.238 17.022.258 10.72.258 28 0S75.959 9.182 79.987.161" fill="none" stroke-width="3" stroke-linecap="square" stroke-miterlimit="3"></path>
      </svg>
      <div class="mouth-hole"></div>
      <div class="tongue breath">
        <div class="tongue-top"></div>
        <div class="line"></div>
        <div class="median"></div>
      </div>
    </div>
  </div>
  <div class="hands">
    <div class="hand hand--left">
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
    </div>
    <div class="hand hand--right">
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
      <div class="finger">
        <div class="bone"></div>
        <div class="nail"></div>
      </div>
    </div>
  </div>
  <form name="loginform" action="${pageContext.request.contextPath}/main/loginProcess" method="post">
  <div class="login">
    <label>
   <div class="fa fa-user"></div>
      <input class="username" name="id" type="text" autocomplete="on" placeholder="Enter id"
      <c:if test="${!empty saveid}">
				value="${saveid}"
			</c:if>
		>
    </label>
    <label>
      <div class="fa fa-lock"></div>
      <input class="password" name="password" type="password" autocomplete="off" placeholder="password"/>
    </label>
    <div style="text-align:center">
        <input type="checkbox" id="remember-me" name="remember-me" style="width:20px;vertical-align: middle;accent-color:#243946;"
			<c:if test="${!empty saveid}">
			 checked
			</c:if>
		>
		<span style="vertical-align: middle">로그인 유지</span>
	</div>
	<div style="text-align:center">
    <button type="submit" class="login-button">로그인</button>
 	</div>
 	<div style="text-align:right; padding:18px 13px;">
 	<a href="${pageContext.request.contextPath}/main/Find_user"><span style="color:#6F6F6F;">아이디/비밀번호 찾기</span></a>
 	</div>
  </div>
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
  </form>
    </div>
     </div>
     </div>
	<!-- 팝업 레이어 -->

    <!-- Navbar Start -->
     <div class="container wrapcon"> 
        <div class="row border-top border-bottom px-xl-5">
        <div class="col-lg-3">
          <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
              <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse" style="background:#e7cc87">
               <div class="navbar-nav mr-auto py-0" style="margin:0 auto!important">
                 <div class="nav-item dropdown" style="position:static!important">
                  <a href="#" class="nav-link dropdown-toggle catename" data-toggle="dropdown">카테고리&nbsp;&nbsp;<i class="fa fa-bars"></i></a>
               		<div class="dropdown-menu rounded-0 m-0">
                  	 <a href="${pageContext.request.contextPath}/product/product_list?item_category=treat" class="dropdown-item"><i class="fas fa-clinic-medical"></i><span class="smenu">수술/치료</span></a>
                     <a href="${pageContext.request.contextPath}/product/product_list?item_category=education" class="dropdown-item"><i class="fas fa-glasses"></i><span class="smenu">교육</span></a>
                  	 <a href="${pageContext.request.contextPath}/product/product_list?item_category=beauty" class="dropdown-item"><i class="fas fa-cut"></i><span class="smenu" style="padding-left:37px">미용</span></a>
               		</div>
               	</div>
               </div>
              </div>
           </nav>
		</div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    
                    <!-- 반응형 로고위치 -->
                   <div>
                    <a href="${pageContext.request.contextPath}/main/main" class="text-decoration-none d-block d-lg-none">
                   <img src="${pageContext.request.contextPath}/resources/img/Main/hand.gif" style="width: 62px;height:75px;padding: 1px 3px 23px 2px;">
                    <span class="m-0 display-5" style="font-family:'JUA';font-size:40px">펫토피아</span>
               		 </a>
                    </div>
                    
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0 nav">
                            <a href="${pageContext.request.contextPath}/main/main" class="nav-item nav-link me0 active">Home</a>
                            <a href="${pageContext.request.contextPath}/admin/admin_notice" class="nav-item nav-link me1">공지사항</a>
                            <a href="${pageContext.request.contextPath}/community/list" class="nav-item nav-link me2">커뮤니티</a>
                            <a href="${pageContext.request.contextPath}/admin/admin_ask_list" class="nav-item nav-link me3">고객센터</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                         
                        <!-- 로그인 / 회원가입 -->
                   		  <sec:authorize access="isAnonymous()">
                        	<a href="javascript:void(0)" id="btn_popup_open" class="nav-item nav-link me4">로그인</a>
                            <a href="${pageContext.request.contextPath}/main/join" class="nav-item nav-link jjoin">회원가입</a>
                    	  </sec:authorize>
                        
                        <!-- 일반 회원 로그인 -->
                  		  <sec:authorize access="hasRole('ROLE_MEMBER')">
                  		  <sec:authentication property="principal" var="pinfo"/>
	  						<input type="hidden" name="member_id" value="${pinfo.username}">
                        	<a class="nav-item nav-link m-0" href="javascript:void(window.open('${pageContext.request.contextPath}/main/chating?member_id=${pinfo.username}','실시간 채팅','width=555,height=665,top=200,left=650'))" style='padding: 10px 0px;'>
    							<i class="far fa-comment-dots fa-flip-horizontal" style='opacity:0.6;font-size:1.2em'></i>
    						</a>
                        	
                        	<div class="nav-item dropdown" >
                        	  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                        	   <img src="${pageContext.request.contextPath}/resources/img/Main/dogicon.png" style="width:23px">
                        	  &nbsp;
                        	  마이페이지
                        	  &ensp;<i class="fas fa-caret-down"></i></a>
                        	 
                        	 <form class="logout" action="${pageContext.request.contextPath}/main/logout" method="POST" name="logout" >
                        	 <div class="dropdown-menu rounded-0 m-0" style="min-width: 8.5rem !important;left: 12%;text-align:center">
                        	 	<c:if test="${pinfo.username=='admin'}">
                        	 	<a href="#" class="dropdown-item mydrop">회원관리</a>
                        	 	</c:if>
                        	 	<a href="${pageContext.request.contextPath}/mypage/update" class="dropdown-item mydrop">회원정보 수정</a>
                        	 	<a href="${pageContext.request.contextPath}/order/list?member_id=${pinfo.username}" class="dropdown-item mydrop">예약내역</a>
                        	 	<a href="${pageContext.request.contextPath}/ask/myask?member_id=${pinfo.username}" class="dropdown-item mydrop">내가 남긴 문의</a>
                        	 	<a href="${pageContext.request.contextPath}/order/myreview?member_id=${pinfo.username}" class="dropdown-item mydrop">내가 남긴 리뷰</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}" class="dropdown-item mydrop">내 글</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}" class="dropdown-item mydrop">내 댓글</a>
                        	 	<a href="#" class="dropdown-item">                     
                        	 	<span id="logout"><i class="fas fa-sign-out-alt"></i>&ensp;로그아웃</span></a>
                        	 </div>
                        	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        	 </form>
                        	 </div>
                        </sec:authorize>
                        	
                        <!-- 판매자일때 드롭다운 메뉴 -->	
                        <sec:authorize access="hasRole('ROLE_SELLER')">
                  		  <sec:authentication property="principal" var="pinfo"/>
	  						<input type="hidden" name="member_id" value="${pinfo.username}">
                        	<a class="nav-item nav-link m-0" href="javascript:void(window.open('${pageContext.request.contextPath}/main/chating?member_id=${pinfo.username}','실시간 채팅','width=555,height=665,top=200,left=650'))" style='padding: 10px 0px;'>
    						<i class="far fa-comment-dots  fa-flip-horizontal" style='opacity:0.6;font-size:1.2em'></i>
    						</a>
                        	
                        	<div class="nav-item dropdown" >
                        	  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                        	   <img src="${pageContext.request.contextPath}/resources/img/Main/cat_icon.png" style="width:23px">
                        	  &nbsp;
                        	  판매자 메뉴
                        	  &ensp;<i class="fas fa-caret-down"></i></a>
                        	 
                        	 
                        	 <form class="logout" action="${pageContext.request.contextPath}/main/logout" method="POST" name="logout" >
                        	 <div class="dropdown-menu rounded-0 m-0" style="min-width: 8.5rem !important;left: 12%;text-align:center">
                        	 	<a href="${pageContext.request.contextPath}/mypage/update" class="dropdown-item mydrop">회원정보 수정</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}" class="dropdown-item mydrop">내 글</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}" class="dropdown-item mydrop">내 댓글</a>
                        	 	<a href="${pageContext.request.contextPath}/mypage/SCH?member_id=${pinfo.username}" class="dropdown-item mydrop">나의 일정확인</a>
                        	 	<a href="${pageContext.request.contextPath}/product/my_product?member_id=${pinfo.username}" class="dropdown-item mydrop">내 상품 관리</a>                     	 		
                        	 	<a href="#" class="dropdown-item">                     
                        	 	<span id="logout"><i class="fas fa-sign-out-alt"></i>&ensp;로그아웃</span></a>
                        	 </div>
                        	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        	 </form>
                        	 </div>
                        </sec:authorize>
                        	
                        
                        <!-- admin 드롭다운 메뉴 -->
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                  		  <sec:authentication property="principal" var="pinfo"/>
	  						<input type="hidden" name="member_id" value="${pinfo.username}">
                        	<div class="nav-item dropdown" >
                        	  <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                        	   <img src="${pageContext.request.contextPath}/resources/img/Main/wrench_icon.png" style="width:23px">
                        	  &nbsp;
                        	  관리자 메뉴
                        	  &ensp;<i class="fas fa-caret-down"></i></a>
                        	 
                        	 
                        	 <form class="logout" action="${pageContext.request.contextPath}/main/logout" method="POST" name="logout" >
                        	 <div class="dropdown-menu rounded-0 m-0" style="min-width: 8.5rem !important;left: 12%;text-align:center">
                        	 	<a href="${pageContext.request.contextPath}/mypage/update" class="dropdown-item mydrop">회원정보 수정</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myPost?member_id=${pinfo.username}" class="dropdown-item mydrop">내 글</a>
                        	 	<a href="${pageContext.request.contextPath}/comment/myComment?member_id=${pinfo.username}" class="dropdown-item mydrop">내 댓글</a>
                        	 	<a href="${pageContext.request.contextPath}/admin/admin_list" class="dropdown-item mydrop">회원 목록</a>
                        	 	<a href="#" class="dropdown-item">              
                        	 	<span id="logout"><i class="fas fa-sign-out-alt"></i>&ensp;로그아웃</span></a>
                        	 </div>
                        	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        	 </form>
                        	 </div>
                        </sec:authorize>
                        	
                        	
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    </div>
    <!-- Navbar End -->
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath}/resources/js/Main/main.js"></script>

	<!-- login js -->
	<script src="${pageContext.request.contextPath}/resources/js/Main/login.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
	$(function(){
		$("#logout").click(function(event){
			event.preventDefault();
			$("form[name=logout]").submit();
		})
		$('.isearch').on('click', function() {
			var input = $('input[name=item]').val();
    		if(input.length==0){
    			Swal.fire({
    				position: 'center',
    				icon: 'question',
    				title: '검색어를 입력해주세요',
    				showConfirmButton: false,
    				timer: 1000
    			})
    			event.preventDefault();
    		}else{
    			$("form[name=search]").submit();
    		}
    	});
	})
/* $(".nav .nav-link").on("click", function(){
   $(".nav").find(".active").removeClass("active");
   $(this).addClass("active");
}); 
*/
// url 대조 후 메뉴에 active 주기
var pageUrl = window.location.href; //창의 url을 가져온다.
$(window).on('load', function(){ //load가 되었을때 실행
    $('.nav-link').siblings('.nav-link').removeClass('active'); //다른 active가 있으면 지워준다.
   
    if (pageUrl.indexOf('join') > -1) {
        $('.jjoin').addClass('active');
    } else if (pageUrl.indexOf('login') > -1) { 
        $('.me4').addClass('active');
    }else if (pageUrl.indexOf('community') > -1) { 
        $('.me2').addClass('active');
    }else if (pageUrl.indexOf('admin_notice') > -1) { 
        $('.me1').addClass('active');
    }else if (pageUrl.indexOf('admin_ask_list') > -1) { 
        $('.me3').addClass('active');
    }else {
        $('.me0').addClass('active'); 
    }
});
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /^ /gi;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}
</script>
</body>
</html>