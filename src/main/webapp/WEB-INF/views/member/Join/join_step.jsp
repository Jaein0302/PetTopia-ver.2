<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/join_step.css" type="text/css" rel="stylesheet">
</head>
<body>
  <!-- Join step -->
    <div class="container" style="margin-top:180px;">
      <ul class="progressbar">
        <li class="step1">약관동의</li>
        <li class="step2">인증절차</li>
        <li class="step3">정보입력</li>
        <li class="step4">가입완료</li>
      </ul>
    </div>
<script>
var pageUrl = window.location.href; //창의 url을 가져온다.
$(window).on('load', function(){ //load가 되었을때 실행
    $('.progressbar').siblings('.progressbar').removeClass('active'); //다른 active가 있으면 지워준다.
    if (pageUrl.indexOf('step2') > -1) {
    	$('.step1').addClass('active'); 
        $('.step2').addClass('active');
    } else if (pageUrl.indexOf('step3') > -1) { 
    	$('.step1').addClass('active'); 
        $('.step2').addClass('active');
        $('.step3').addClass('active');
    }else if (pageUrl.indexOf('step1') > -1) { 
        $('.step1').addClass('active'); 
    }
});
</script>
</body>
</html>