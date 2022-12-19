$(function(){

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
var pathname = window.location.host;

$(document).on('click','.rdetail',function(){
	var $panel = $(".popup_panel1");
    var $panelContents = $panel.find(".popup_contents1");

        // 팝업 가운데 설정(가로)
        if ($panelContents.outerWidth() < $(document).width()) {
            $panelContents.css("margin-left", "-" + $panelContents.outerWidth() / 2 + "px");
        } else {
            $panelContents.css("left", "0px");
        }

        // 팝업 가운데 설정(세로)
        if ($panelContents.outerHeight() < $(document).height()) {
            $panelContents.css("margin-top", "-" + $panelContents.outerHeight() / 2 + "px");
        } else {
            $panelContents.css("top", "0px");
        }

        // 레이어 팝업 열기
        $panel.fadeIn();
        
		var review_num = $(this).prev().val();
		
		// 리뷰 디테일 가져오기
		$.ajax({
			url : "http://"+pathname +"/pet_topia/order/review_detail",
			type : 'post',
			data : {
				review_num,
			},
			dataType : "json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				$('.review_subject').text(data.review_subject);
				$('.review_name').text(data.review_id);
				$('.review_date').text(data.review_reg_date);
				$('.review_content').html(data.review_content);
				if(data.review_score==1) {
					$('.review_score').html('<i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><span class="text-small pl-1">1.0</span>');
				}else if(data.review_score==2) {
					$('.review_score').html('<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><span class="text-small pl-1">2.0</span>');
				}else if(data.review_score==3) {
					$('.review_score').html('<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><span class="text-small pl-1">3.0</span>');
				}else if(data.review_score==4) {
					$('.review_score').html('<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><span class="text-small pl-1">4.0</span>');
				}else if(data.review_score==5) {
					$('.review_score').html('<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><span class="text-small pl-1">5.0</span>');
				}
				
			},
			error : function() {
				alert("err");
			}
		}); //ajax
	
	
		// 팝업 배경 클릭 이벤트 정의
		$panel.find(".popup_bg1").on("click", popupClose);
		
		function popupClose(e) {
		
		    $panel.fadeOut();
		
		    // 이벤트 기본 동작 중단
		    e.preventDefault();
		}
	}); //click
	
	// 리뷰 삭제
	$(document).on('click','.deletechk',function (event) {
		event.stopPropagation();
		var review_num = $(this).children().val();
		var review_item_id = $(this).children().next().val();
	    Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
			}).then((result) => {
			  if (result.isConfirmed) {
				 
				  $.ajax({
						url : "http://"+pathname +"/pet_topia/order/review_delete",
						type : 'post',
						data : {
							review_num,
							review_item_id
						},
						dataType : "json",
						beforeSend : function(xhr){
							xhr.setRequestHeader(header, token);
						},
						success : function(data) {
								location.reload();
						}
					}); //ajax
			  
			  }
			})
	}); //리뷰 삭제 end

});

//레이어 팝업 오픈 이벤트
function toggleLayer( obj, s ) {

 var zidx = $("#lay_mask").css("z-index");

 if(s == "on") {
     //화면중앙에 위치시키기
     var left = ( $(window).scrollLeft() + ($(window).width() - obj.width()) / 2 );
     var top = ( $(window).scrollTop() + ($(window).height() - obj.height()) / 2 );

     // 높이가 0이하면 0으로 변경
     if(top<0) top = 0;
     if(left<0) left = 0;

     var layer_idx = Number(zidx) + 10;

     $("#lay_mask").css("z-index", layer_idx);

     obj.css({"left":left, "top":top, "z-index":layer_idx}).addClass("PopupLayer");
     $("body").append(obj);

     wrapWindowByMask();//배경 깔기
     obj.show();//레이어 띄우기
 }

 if(s == "off") {
     if($(".PopupLayer").length > 1) {
         var layer_idx = zidx - 10;
         $("#lay_mask").css("z-index", layer_idx);
     } else {
         $("#lay_mask").hide();
     }

     obj.removeClass("PopupLayer").hide();
 }

 if(s == "off2") { //레이어에서 다른 레이어를 띄울 경우 마스크는 안닫기 위한 처리
     obj.removeClass("PopupLayer").hide();
 }
}

