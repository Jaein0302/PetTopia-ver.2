<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/Main/style.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
		*{
			margin:0!important;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #e7cc87;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 100%;
			height: 33px!important;
		}
		#yourMsg{
			display: none;
		}
		.btn-primary{
			width:100%!important
		}
		th:nth-child(2){
			padding:0 10px;
		}
		.msg-bubble {
		  max-width: 500px;
		  padding: 2px 15px!important;
		  border-radius: 15px;
		  background: var(--left-msg-bg);
		  overflow:hiddlen; 
		  word-break:break-all;
		}
		.msg-text{
		color:#cdcdcd;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/pet_topia/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				$("#chating").append("<div class='msg-bubble'><div class='msg-text'>"+msg+"</div></div>");
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		var uN = $("#userName").val();
		var msg = $("#chatting").val();
		ws.send(uN+" : "+msg);
		$('#chatting').val("");
	}
</script>
<body>
	<div id="container" class="container">
		<h1>실시간 채팅 <i class="fas fa-comment-dots"></i></h1>
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable" style='width:500px;'>
				<tr>
					<th><span class='text-body pr-2'>사용자명</span></th>
					<th><input type="text" name="userName" id="userName" value='${member_id}'></th>
					<th><button class='btn btn-primary' onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable" style='width:500px;'>
				<tr>
					<th><span class='text-body pr-2'>메시지</span></th>
					<th><input type="text" id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button class='btn btn-primary' onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>