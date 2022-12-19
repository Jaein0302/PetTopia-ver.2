<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>펫토피아 - 회원가입</title>
<style>
.joinbtn{border:1px solid silver;margin:0 30px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>
<div class="container mb-5" style="margin-top:20px;">
   <div class="container-fluid offer pt-5">
    <div class="text-center">
 	<jsp:include page="join_step.jsp" />
	</div>
    
        <div class="row px-xl-5" style="margin: 3.5rem 0 13rem 0!important;">
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn"
                 onclick="location.href='${pageContext.request.contextPath}/main/join_customer_step1'">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">개인회원가입</h1>
                        <span style="color:gray;font-size:14px">( 이메일 인증 필수 )</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative text-center text-white mb-2 py-5 px-5 joinbtn"
                 onclick="location.href='${pageContext.request.contextPath}/main/join_business_step1'">
                    <div class="position-relative" style="z-index: 1;">
                        <h1 class="font-weight-semi-bold">기업회원가입</h1>
                        <span style="color:gray;font-size:14px">( 사업자등록번호 인증 필수 )</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
<jsp:include page="../footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
//로그인 막기
$('.me4').click(function(){
	$(".popup_panel").remove();
	Swal.fire({
		position: 'center',
		icon: 'warning',
		title: '회원가입 완료 후 로그인 해주세요.',
		showConfirmButton: false,
		timer: 1000
	})
});
</script>
</body>
</html>