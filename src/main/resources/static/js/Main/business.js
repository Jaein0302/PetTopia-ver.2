var chkbno = false;
var isReg = false;
var checkbtype =false;

//사업자등록번호 중복확인
$("input[name=member_regnum]").on('keyup',
			function(){
		     $("#reg_message").empty();
		     var pattern=/^[0-9]{10}$/;
		     var reg_num = $(this).val();
		     if(!pattern.test(reg_num)){
		    	 $("#reg_message").css('color','tomato')
		    		          .html("하이픈(-)을 제거한 10자리의 숫자를 입력해주세요.");
		    	 $(".chk_bno").hide();
		    	 isReg=false;
		    	   return;
		     }
		    	 
		     $.ajax({
		    	url : "regnum_check",
		    	data : {"reg_num" : reg_num},
		    	success: function(resp) {
		    	 if (resp == -1) {//db에 해당 번호가 없는 경우
			        $("#reg_message").css('color', '#6dc99f').html("사용 가능한 사업자등록번호 입니다.");
			        isReg = true;
		    	 } else {//db에 해당 번호가 있는 경우(0)
		    	    $("#reg_message").css('color', 'tomato').html("이미 등록된 사업자등록번호 입니다.");
		    	    isReg = false; 
       	    	 }
		        }
		      });//ajax end
	 })//keyup end

// focusout 후 메세지 감추기
$("input[name=member_regnum]").blur(function(){
	$("#reg_message").hide();
});
$("input[name=member_regnum]").focus(function(){
	$("#reg_message").show();
});


	//국세청 사업자 등록정보 진위확인 api
	$('.regnum').click(function(){
		var regnum = $('#regnum').val(); //1208806529
		var bname = $('.bname').val(); //정윤수
		var bdate = $('.bdate').val(); //20131219
		
		if(bname == ""){
			alert("대표자성명을 입력해주세요");
			$('.bname').focus();
		}else if(bdate==""){
			alert("개업일자 8자리를 입력해주세요");
			$('.bdate').focus();
		}else if(regnum==""){
			alert("사업자 등록번호 10자리를 입력해주세요");
			$('#regnum').focus();
		}else if(!isReg){
			alert("사업자 등록번호를 확인해주세요");
			$('#regnum').focus();
		}else{	
		console.log("사업자등록번호= "+regnum+", 이름="+bname+", 개업일="+bdate);
		var data = {  
				"businesses": [   
				{   
					"b_no": regnum,      
					"start_dt": bdate,      
					"p_nm": bname,      
					"p_nm2": "",      
					"b_nm": "",      
					"corp_no": "",     
					"b_sector": "",      
					"b_type": ""    
				}  
			]
		}
			$.ajax({
			  url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=LS%2F0%2FFJ0nKGVtQDjRPMbttGggE36jKrWEY%2BSMu0hbj00o0%2FvOy8Z31RmO2J91Wsd%2FepNUPtcqeJ6Ei%2BfzD3cTw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
			  type: "POST",
			  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
			  dataType: "JSON",
			  contentType: "application/json",
			  accept: "application/json",
			  success: function(result) {
			      console.log("사업자인증 결과 = "+result);
			      var keys = Object.keys(result);
			      console.log("키값="+keys);
			       if (keys.indexOf('valid_cnt') > -1) {
			    	 Swal.fire(
						  '사업자 인증이 완료되었습니다!',
						  '다음단계로 이동해주세요.',
						  'success'
						)
			    	  $(".chk_bno").show();
			    	  chkbno = true;
			    	  return;
			      }else{
			    	  alert("국세청에 등록되지 않은 사업자등록번호입니다.");
			    	  $("input[name='member_regnum']").focus();
			    	  $("#reg_message").css('color', 'tomato').html("국세청에 등록되지 않은 사업자등록번호입니다.");
			    	  chkbno = false;
			    	  return;
			      } 
			  },
			  error: function(result) {
			      console.log(result.responseText); //responseText의 에러메세지 확인
			  }
			});//ajax
		}
	})

	
	//업종 selec하면 input에 자동 입력
	$(function(){	
		var input = $('.inputText');
		$('.selectType').on("change",function(){
			var value = $(this).find("option:selected").val();
			input.val(value);
			if(value=="기타"){
				$(input).attr('readOnly', false);
				$(input).focus();
				$(input).val('');
				$(".chk_btype").hide();
			}else if(value=="선택"){
				$(input).attr('readOnly', true);
				$(input).val('');
				$(".chk_btype").hide();
				checkbtype = false;
			}else if(value="동물병원"){
				$(".chk_btype").show();
				checkbtype = true;
			}
		});//change
		
	});
	
	//이름 공백 검사
	$("input[name=member_name]").on('keyup',
					function(){
				var nameval = $(this).val();
				if(nameval != "") {
					$(".chk_name").show();
				}else {
					$(".chk_name").hide();
				}
	})
	//대표자 성명 유효성 검사
	$(".bname").on('keyup',
					function(){
				var pattern = /^[가-힣]|[a-zA-Z]$/;
				var bnameval = $(this).val();
				if(!pattern.test(bnameval)) {
					$(".chk_bname").hide();
				}else{
					$(".chk_bname").show();
				}
	})
	//개업일자 유효성 검사
	$(".bdate").on('keyup',
					function(){
				var pattern =  /(^(19|20)\d{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
				var bdate = $(this).val();
				if(!pattern.test(bdate)) {
					$(".chk_bdate").hide();
				}else{
					$(".chk_bdate").show();
				}
	})
	
	//업종 공백 검사
	$("input[name=member_btype]").on('keyup',
			function(){
		var btype = $(this).val();
		if(btype != "") {
			$(".chk_btype").show();
			checkbtype=true;
			return;
		}else if(btype == "") {
			$(".chk_btype").hide();
			checkbtype=false;
			return;
		}
		
	})
	
	// submit 버튼 클릭
	$(".updateb").click(function(){
		if($("input[name='member_name']").val().trim()=="") {
    		alert("이름을 확인해주세요");
    		$("input[name='member_name']").val('').focus();
    		return false;
    	}
    	if(!checkbtype){
    		alert("업종을 선택해주세요");
    		$(".selectType").focus();
    		return false;
    	}
    	if(!chkbno){
    		alert("사업자 등록번호 인증을 확인해주세요");
    		$("input[name='member_regnum']").focus();
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
		});
	
	function noSpaceForm(obj) { // 공백사용못하게
	var str_space = /\s/;  // 공백체크
	if(str_space.exec(obj.value)) { //공백 체크
		 obj.value = obj.value.replace(' ',''); // 공백제거
		}
	}