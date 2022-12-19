$(function(){
	//로그인 후 글쓰기 가능
	$(".cowrite").click(function () {
	    Swal.fire({
					position: 'center',
					icon: 'warning',
					title: '로그인 후 이용가능합니다.',
					showConfirmButton: false,
					timer: 1000
				})
	});
	//취소 버튼 누르면 뒤로가기
	 $(".signoutb").click(function(){
		 Swal.fire({
			  title: '작성을 취소하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $(location).attr('href','list');
			  }
			})
		});
		
	//추천 게시글
	 var ticker = function()
    {
        setTimeout(function(){
            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
            {
                $(this).detach().appendTo('ul#ticker').removeAttr('style');
            });
            ticker();
        }, 2000);
    };
    ticker();

    	//썸머노트 설정
    	$('#summernote').summernote({
    		  height: 450,                 // 에디터 높이
    		  minHeight: null,             // 최소 높이
    		  maxHeight: null,             // 최대 높이
    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
    		  lang: "ko-KR",				// 한글 설정
    		  placeholder: '내용을 입력해주세요',	//placeholder 설정
    		  callbacks: {
		        	onImageUpload: function(files, editor, welEditable) {
		        		for(var i = files.length -1; i>=0; i--) {
		        			sendFile(files[i], this);
		        		}
		        	}
		        }

    	});
	
});


var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
//썸머노트 이미지 파일 업로드
function sendFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
			},
		success : function(data) {
			$(editor).summernote('insertImage', data.url);
			console.log(data.url);
		}
	});
}