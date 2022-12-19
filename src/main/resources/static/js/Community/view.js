var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

$(function(){
	$('#comment table').hide(); //1
	var page=1; //더 보기에서 보여줄 페이지를 기억할 변수
	count = parseInt($("#count").text());
	if(count != 0){ //댓글 갯수가 0이 아니면
		getList(1); //첫 페이지의 댓글을 구해 옵니다. (한 페이지에 3개씩 가져옵니다)
	}else{ //댓글이 없는 경우
		$("#message").text("등록된 댓글이 없습니다")
	}
	
	function getList(currentPage){
		$.ajax({
			type:"post",
			url : "../comment/list",
			data:{
				"comment_commu_num" : $("#num").val(),
				"page" : page
			},
			dataType:"json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success:function(rdata){
				$("#count").text(rdata.listcount);
				if (rdata.listcount>0){
					$("#comment table").show();//문서가 로딩될때 hide()했던 부분을 보이게 합니다.
					$("#comment tbody").empty();
					$(rdata.list).each(function(){
						output = '';
						img = '';
						if($("#loginid").val() == this.comment_name || $("#loginid").val()=='admin') {
							img = "<img src='../resources/img/Main/pencil.png' width='17px' class='update' style='cursor:pointer'>&emsp;&ensp;"
								+ "<img src='../resources/img/Main/delete1.png' width='17px' class='remove' style='cursor:pointer'>&emsp;&ensp;"		
								+ "<input type='hidden' value='" + this.comment_num +"'>";
						}
						
						output += "<tr><td style='padding-top:20px' id='comm_content' colspan='2'>"+this.comment_content+"</td></tr>";
						output += "<tr class='text-small' style='border-bottom:2px solid #EDF1FF!important;color: #aeb2b5;'><td>"+this.comment_name 
						output += "<span class='pl-5 pr-5'>"+this.comment_date +"</span></td>";
						output += "<td class='text-right'>"+img+"</td></tr>"
						$("#comment tbody").append(output);
					});//each end
					if(rdata.listcount > rdata.list.length) { //전체 댓글 댓수 > 현재까지 보여준 댓글 갯수
						$("#message").text("더보기")
					}else {
						$("#message").text("")
					}
				}else {
					$("#message").text("등록된 댓글이 없습니다.")
					$("#comment tbody").empty();
					$("#comment table").hide()//1
				}
			}
		
		});//ajaxend
	}
	
	
	$('#content').on('keyup',function(){
		var content = $(this).val();
		var length = content.length;
		if(length > 50) {
			length = 50;
			content = content.substring(0,length);
		}
		$(".float-left").text(length + "/50")
	});// keyup end

	//더 보기를 클릭하면 page 내용이 추가로 보여집니다.
	$("#message").click(function(){
		getList(++page);
	});// click end
	
	$("#write").click(function() {
		
		var content = $(".comment-textarea").val().trim();
		
		if(!content) {
			alert('내용을 입력하세요')
			$(".comment-textarea").focus();
			return false;
		}
		var buttonText = $("#write").text(); 	//버튼의 라벨로 add할지 update 할지 결정 
		
		$(".float-left").text('총 50자까지 가능합니다.');
		
		if(buttonText == "댓글 등록") { //댓글을 추가하는 경우 
			url = "../comment/add";
			data =  {
					"comment_content" : content,
					"comment_name" : $("#loginid").val(),
					"comment_commu_num" : $("#num").val()
			};
		}else {	//댓글을 수정하는 경우 
			url = "../comment/update";
			data = {
					"comment_num" : num,
					"comment_content" : content
			};
			$("#write").text("댓글 등록");		//다시 등록으로 변경 
			$("#comment .cancel").remove();	//취소 버튼 삭제 
		}
		
		$.ajax({
			type:"post",
			url : url,
			data : data,
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(result) {
				$("#content").val('');
				if(result == 1) {
					//page = 1
					getList(page);	//등록, 수정완료 후 해당 페이지 보여줍니다.
				}
			}
		})//ajax end;
	})//#write end;

	
	   //수정
    $('#comment').on('click',".update",function(){
       var before = $(this).parent().parent().prev().children().text();
       $("#content").focus().val(before);
       
       num = $(this).next().next().val();
       $("#write").text('수정 완료');
       
       //이미 취소버튼이 만들어진 상태에서 또 수정을 클릭하면 취소가 계속 추가됩니다.
       if(!$('#write').next().is('.cancel'))
    	   $('#write').after("<button class='btn btn-danger float-right cancel' style='margin-right: 2.1%;width: 14.35%;'>취소</button>")
       
       $('#comment .update').parent().parent().not(this).css('background','white');
       $('.remove').prop('disabled',true);//수정중 삭제 클릭할 수 없게
    })
    
    //수정취소
    $('#comment').on('click',".cancel",function(){
       $('#comment tr').css('background','white');
       $('.cancel').remove();
       $("#write").text('댓글 등록');
       $("#content").val('');
       $('.remove').prop('disabled',false);//삭제할수있도록 합니다.
    })
    
    //삭제
    $('#comment').on('click',".remove",function(){
       num = $(this).next().val();
       
       Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
			       $.ajax({
			           type : 'post',
			           url : "../comment/delete",
			           data : {"comment_num" : num},
			           beforeSend : function(xhr){
			 				xhr.setRequestHeader(header, token);
			 			},
			           success : function(result){
			              if(result == 1){
			                 //page=1
			                 getList(page);
			              }
			           }
			        })//ajax
			  }else {
				  return
			  }
			})

    })//remove click
    
    
	
});