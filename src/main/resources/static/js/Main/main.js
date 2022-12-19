(function ($) {
    "use strict";
    
    // Dropdown on mouse hover
    $(document).ready(function () {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500);
        return false;
    });



    // Product Quantity
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });
    
})(jQuery);


<!-- 레이어 팝업 오픈 이벤트 -->
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

  $(document).ready(function() {
 
                var $panel = $(".popup_panel");
 
                var $panelContents = $panel.find(".popup_contents");
 
                $("#btn_popup_open").on("click", function(e) {
 
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
                });
 
                // 팝업 닫기 이벤트 정의
                //$("#btn_popup_close").on("click", popupClose);
 
                // 팝업 배경 클릭 이벤트 정의
                $panel.find(".popup_bg").on("click", popupClose);
 
                function popupClose(e) {
 
                    $panel.fadeOut();
 
                    // 이벤트 기본 동작 중단
                    e.preventDefault();
                }
            });
            
            
   //추천 검색어
	var ticker = function()
	{
	   setTimeout(function(){
	       $('#ticker1 li:first').animate( {marginTop: '-27px'}, 400, function()
	       {
	           $(this).detach().appendTo('ul#ticker1').removeAttr('style');
	       });
	       ticker();
	   }, 2500);
	};
	ticker();