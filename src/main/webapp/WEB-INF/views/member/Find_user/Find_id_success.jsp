<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 아이디 찾기 성공</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>
<form>
<div class="container mb-5 mainbody" style="height:400px;margin-top: 300px;">
  <div class="row px-xl-5">
   <div class="col-lg-12 text-center" style="margin:0 auto;">
   <div class="border align-items-center" style="width:500px;margin:0 auto;padding:20px">
 		<span style="font-size:25px;">요청하신 아이디 찾기 결과입니다.</span><br><br>
 		<span style="font-size:19px;">입력한 정보로 조회된 아이디는 
 		<b class="text-dark p-subTitle" style="font-size:25px;">${member_id}</b> 입니다.</span><br>
 		 <p class="countdown"></p>
 		 <button type="button" class="btn btn-primary p-2 m-3 findbtn gologin">로그인 하기</button>
		 <button type="button" class="btn btn-primary p-2 m-3 findbtn" 
		 	     onclick="location.href='${pageContext.request.contextPath}/main/Find_user'">다시 찾기</button>
 	</div>
   </div>
  </div>
 </div>
 </form>
<jsp:include page="../footer.jsp" />
<script>
//카운트 시작 숫자
var count = 10;
//카운트다운함수
var countdown = setInterval(function(){
//해당 태그에 아래 내용을 출력
$("p.countdown").html("<b><font class='text-dark' style='font-size:20px'>"
+ count + "</font><b>&ensp;초 후 메인화면으로 이동 합니다.");
    //0초면 초기화 후 이동되는 사이트
    if (count == 0) {
        clearInterval(countdown);
        location.href="${pageContext.request.contextPath}/main/main"
    }
    count--;//카운트 감소
}, 1000);

$(document).ready(function(){
	$('.gologin').click(function(){
		$('#btn_popup_open').trigger('click');
	})
})
</script>
</body>
</html>