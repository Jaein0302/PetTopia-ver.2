<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>로그인 실패</title>
<style>
.joinbtn{border:1px solid silver;margin:0 40px;border-radius:20px;cursor:pointer}
.joinbtn:hover, .joinbtn:active{background-color:#f7e1ab;border:1px solid #f7e1ab}
</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="header.jsp" />
</div>
<div class="container mb-5 mainbody" style="height:678px;margin-top:200px;margin-bottom:300px">
<div class="login_message text-center">
<i class="fas fa-exclamation-circle"></i>&emsp;<span>아이디와 비밀번호를 다시 확인해주세요</span>
</div>
<div class="center">
  <div class="ear ear--left"></div>
  <div class="ear ear--right"></div>
  <div class="face">
  <div class="sad">
  </div>
  <div class="sad1">
  </div>
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
  <form name="loginform" action="${pageContext.request.contextPath}/main/loginProcess" 
		  method="post">
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
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
var message = "${message}";
if(message == 'loginFailMsg'){
   Swal.fire({
	   icon: 'error',
	   title: '로그인에 실패하였습니다',
	   text: '아이디와 비밀번호를 확인해주세요',
	   footer: '<a href="${pageContext.request.contextPath}/main/Find_user">아이디/비밀번호가 기억안나시나요?</a>'
	 })
  }else if(message == 'loginSuccessMsg'){
	  function go_main(){
	    location.href="${pageContext.request.contextPath}/main/main"
      }
	  go_main()
  };
</script>
</body>
</html>