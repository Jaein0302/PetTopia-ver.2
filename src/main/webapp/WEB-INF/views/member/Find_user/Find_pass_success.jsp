<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>펫토피아 - 비밀번호 메일 발송</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
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
</script>
<body onLoad="Timer();">
<div id="choonDiv"></div>
<!-- header -->
<div class="header">
	<jsp:include page="../header.jsp" />
</div>

<div class="container mb-5 mainbody" style="height:400px;margin-top: 300px;">
  <div class="row px-xl-5">
   <div class="col-lg-12 text-center" style="margin:0 auto;">
   <div class="border align-items-center" style="width:500px;margin:0 auto;padding:20px">
 		<span class="p-subTitle text-dark" style="font-size:33px;font-weight:bolder">
 		${member_email}</span><br>
 		<span style="font-size:25px;">로 임시비밀번호가 발송되었습니다.</span><br><br>
 		 <p class="countdown"></p>
 	</div>
   </div>
  </div>
 </div>
    
<jsp:include page="../footer.jsp" />
</body>
</html>