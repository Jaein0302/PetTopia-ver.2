var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(function(){  
	  var result = "${result}";
	  if(result == "updateSuccess") {
		 alert("수정이 완료되었습니다.")
	  }

  //상세보기 (답변 없을때 VS 답변 있을때)
  $("body").on('click',"#detail_button",function(){
	
	$("#ask_detail").show();

  	var ITEM_ASK_NUM = $(this).parent().prev().text();
	var ITEM_ASK_USERNAME = $(this).parent().parent().prev().val();
	var ITEM_ASK_ITEMID = $(this).parent().parent().prev().prev().val();
	var ITEM_ASK_SUBJECT = $(this).text().trim();
	var ITEM_ASK_CONTENT = $(this).parent().parent().prev().prev().prev().val();
	var ITEM_ASK_DATE = $(this).parent().next().text();
	var ITEM_ANSWER_CONTENT = $(this).parent().parent().prev().prev().prev().prev().val();
	var ITEM_ANSWER_NUM = $(this).parent().parent().prev().prev().prev().prev().prev().val();
	var check = $(this).parent().next().next().next().children().val();

	
	console.log("ITEM_ASK_NUM=" + ITEM_ASK_NUM);
	console.log("ITEM_ASK_SUBJECT=" + ITEM_ASK_SUBJECT);
	console.log("ITEM_ASK_USERNAME=" + ITEM_ASK_USERNAME);
	console.log("ITEM_ASK_DATE=" + ITEM_ASK_DATE);
	console.log("ITEM_ASK_CONTENT=" + ITEM_ASK_CONTENT);
	console.log("ITEM_ASK_ITEMID=" + ITEM_ASK_ITEMID);	
	console.log("ITEM_ANSWER_NUM=" + ITEM_ANSWER_NUM);
	console.log("ITEM_ANSWER_CONTENT=" + ITEM_ANSWER_CONTENT);
	console.log("check=" + check);	

	
	$("#ASK_NUM").val(ITEM_ASK_NUM);
	$("#SUBJECT").val(ITEM_ASK_SUBJECT);
	$("#USERNAME").val(ITEM_ASK_USERNAME);
	$("#ASK_DATE").val(ITEM_ASK_DATE);
	$("#CONTENT").text(ITEM_ASK_CONTENT);
	$("#ASK_ITEMID").val(ITEM_ASK_ITEMID);
	$("#content").text(ITEM_ANSWER_CONTENT);
	$("#answer_num").val(ITEM_ANSWER_NUM);
	
	
	if(check == "0") {	
		$("#comment").hide();	
		$("#comment").children('h4').text('답변하기');
		$("#write").show();
		$("#u").hide();
		$(".a_write").show();
		$(".a_cancel").show();
		$("#content").attr("readOnly", false);			


		
	} else {
		$(".a_write").hide();
		$(".a_cancel").hide();
		$("#comment").show();	
		$("#comment").children('h4').text('수정하기');
		$("#write").hide();
		$("#content").attr("readOnly", true);			
		
		$("#u").html('<button id="a_update" class="btn btn-info float-left">수정</button>')
		$("#comment").append('<button type="button" class="btn btn-danger a_cancel">취소</button>')
	}			
})
	
	//취소
	$("#ask_detail").on('click', ".a_cancel", function(){
		$("#ask_detail").hide();
	})

	//답변버튼
	$("#update").on('click', ".a_write", function(){
		$(".a_write").hide();
		$(".a_cancel").hide();
		$("#comment").slideDown();	
		$("#comment").append('<button type="button" class="btn btn-danger a_cancel">취소</button>')
	})
	
	//답변하기 버튼
	$("#write").click(function() {
		var ITEM_ASK_ITEMID = $("#detail_button").parent().parent().prev().prev().val();
		var content = $("#content").val().trim();
		
		if(!content) {
			alert('내용을 입력하세요')
			return false;
		}
		
		if($("#check").val() == 1) {
			e.preventdefault();
			alert("답변을 이미 등록했습니다")
		}
		
		
		$.ajax({
			type : "post",
			url : "add_answer",
			data : {
					"ITEM_ANSWER_CONTENT" : content,
					"ITEM_ASK_NUM" : $("#ASK_NUM").val(),
					"ITEM_ANSWER_USERNAME" : $("#id_now").val()
					},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				if(result == 1) {
					alert("답변이 등록되었습니다");
					location.href = "answer_view?ITEM_ID=" + ITEM_ASK_ITEMID 
				}
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	})
	
	//수정 버튼
	$("#comment").on('click', "#a_update", function(){	
		$(this).text('수정완료');
		$("#content").attr("readOnly", false);	
		$("#a_update").remove();
		$("#u").html('<button type="submit" class="btn btn-info float-left">수정완료</button>')
	})

})

            
