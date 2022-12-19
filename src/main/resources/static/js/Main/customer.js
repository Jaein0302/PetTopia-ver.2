var checkcode=false;
	var checkemail=false;
	//이메일 유효성 검사
	$("input[name=member_email]").on('keyup',
				  function() {
					 $("#email_message").empty();
					 var pattern = /^\w+@\w+[.]\w{3}$/;
					 var email = $(this).val();
					 if (!pattern.test(email)) {
						 $("#email_message").css('color', 'tomato').html("이메일형식이 맞지 않습니다.");
						 $(".chk_email").hide();
						 checkemail=false;
					 }else{
						 $("#email_message").css('color','#6dc99f').html("이메일형식에 맞습니다. 코드발송 버튼을 눌러주세요.");
						 checkemail=true;
					 }
	});//email keyup 이벤트 처리 끝
			$("input[name=member_email]").blur(function(){
				$("#email_message").hide();
			});
			$("input[name=member_email]").focus(function(){
				$("#email_message").show();
			});		
	
	
	$('.gomail').click(function(){
		if(!checkemail){
			alert('이메일 형식을 확인해주세요.');
			$("input[name=member_email]").focus();
		}else{
		var member_email = $("input[name=member_email]").val();
		var token = $("meta[name='_csrf']").attr("content"); 
		var header = $("meta[name='_csrf_header']").attr("content"); 
		$(document).ajaxSend(function(e, xhr, options) { xhr.setRequestHeader(header, token); });
		$.ajax({
			url : "mail_code",
			type : 'post',
			data : {
		    	member_email,
		    	token,
		    	header
			},
			dataType : "json",
			success : function(data) { // controllor에서 list를 return 받았음
				console.log(data['message']);
				if(data['message']=="success"){
				 Swal.fire(
						  member_email,
						  '위 이메일주소로 인증코드를 발송하였습니다!',
						  'success'
						)
					$('.mail_code').val(data['code']);
					$('.chk_email').show();
					$("input[name=mail_code]").focus();
				}else{
					alert(member_email+"는 이미 등록된 이메일 주소입니다.");
					$("#email_message").css('color','tomato').html("이미 등록된 이메일 주소입니다.");
					$("input[name=member_email]").focus();
				}
			},
			error : function() {
				alert("이메일 주소를 확인해주세요");
				$("input[name=member_email]").focus();
			}
		}); //ajax
		}
	}); //click
	
	// 인증하기 클릭
	$(".go_chk_code").click(function(){
		var inputcode = $("input[name=mail_code]").val();
		var code = $(".mail_code").val();
	    if(code!="" && inputcode!=code) {
	        alert('알맞은 인증코드를 입력해주세요');
	        $("input[name=mail_code]").focus();
	        checkcode=false;
	    }else if(code!="" && inputcode==code){
	    	Swal.fire(
			  '본인 인증이 완료되었습니다!',
			  '다음단계로 이동해주세요.',
			  'success'
			)
	    	$('.chk_code').show();
	    	checkcode=true;
	    }
	})
	
	// submit 버튼 클릭
	$(".updateb").click(function(){
    	if(!checkemail){
    		alert("이메일 주소 형식을 확인해주세요");
    		$("input[name='member_email']").focus();
    		return false;
    	}
		if(!checkcode){
			alert('인증코드를 다시 확인해주세요');
			 $("input[name=mail_code]").focus();
			return false;
		}
	})
//취소 버튼 누르면 뒤로가기
	 $(".signoutb").click(function(){
		 Swal.fire({
			  title: '가입을 취소하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $(location).attr('href','join');
			  }
			})
		}) 
		
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
		});;