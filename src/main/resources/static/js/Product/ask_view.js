$(function(){
  //로그인 안하고 문의하기 누르면 alert창
  $(".ask_denied").click(function(){
     alert("로그인 후 이용가능합니다.")            
  });  
  
	
  //상세보기
  $("#detail").on('click',"#detail_button",function(){
	$("#ask_detail").show();

  	var ITEM_ASK_NUM = $(this).parent().prev().text();
	var ITEM_ASK_USERNAME = $(this).parent().parent().prev().val();
	var ITEM_ASK_ITEMID = $(this).parent().parent().prev().prev().val();
	var ITEM_ASK_SUBJECT = $(this).text().trim();
	var ITEM_ASK_CONTENT = $(this).parent().parent().prev().prev().prev().val();
	var ITEM_ASK_DATE = $(this).parent().next().text();
	var ITEM_ANSWER_CONTENT = $(this).parent().parent().prev().prev().prev().prev().val();
	var check = $(this).parent().parent().prev().prev().prev().prev().val();
	
	$("#ASK_NUM").val(ITEM_ASK_NUM);
	$("#SUBJECT").val(ITEM_ASK_SUBJECT);
	$("#USERNAME").val(ITEM_ASK_USERNAME);
	$("#ASK_DATE").val(ITEM_ASK_DATE);
	$("#CONTENT").text(ITEM_ASK_CONTENT);
	$("#ASK_ITEMID").val(ITEM_ASK_ITEMID);
	$("#content").text(ITEM_ANSWER_CONTENT);
		
	console.log("ITEM_ASK_NUM=" + ITEM_ASK_NUM);
	console.log("ITEM_ASK_SUBJECT=" + ITEM_ASK_SUBJECT);
	console.log("ITEM_ASK_USERNAME=" + ITEM_ASK_USERNAME);
	console.log("ITEM_ASK_DATE=" + ITEM_ASK_DATE);
	console.log("ITEM_ASK_CONTENT=" + ITEM_ASK_CONTENT);
	console.log("ITEM_ASK_ITEMID=" + ITEM_ASK_ITEMID);	
	console.log("check=" + check);	
	
	var id_now = $("#id_now").val();
	console.log("id_now=" + id_now);	
	
	//작성자일 경우
	if( $("#id_now").val() == $("#USERNAME").val() ) {
		if( check == 1 ) { 
			$("#comment").show();
			$(".a_update").hide();
		} else {  // 답변완료 한경우
			$("#comment").hide();
			$(".a_update").show();
		}
	} else {  // 작성자 아닌경우
		if( check == 1 ) { 
			$("#comment").show();
			$(".a_update").hide();
		} else {  // 답변완료 한경우
			$("#comment").hide();
			$(".a_update").hide();
		}	
	}
	
	$(".c_update").hide();		
})
	
	//문의 수정 버튼
  	$("#update").on('click',".a_update",function(){
		$(".a_update").hide();
		$(".c_update").show();
		$("#SUBJECT").attr("readOnly", false);
		$("#CONTENT").attr("readOnly", false);
	});	

	//취소 누르면 모달 숨기기
	$("#ask_detail").on('click', ".a_cancel", function(){
		$("#ask_detail").hide();
	})
	
	//삭제버튼
	$(".a_delete").click(function(){
		confirm("정말 삭제하시겠습니까")
		var ITEM_ASK_NUM = $("#detail_button").parent().prev().text();

		location.href = "../ask/delete?ITEM_ASK_NUM=" + ITEM_ASK_NUM;
	})
	
	//로그인 필요
	$(".login_required").click(function(){
		alert("로그인이 필요합니다.")
	})
	
	//더보기
	
            
})