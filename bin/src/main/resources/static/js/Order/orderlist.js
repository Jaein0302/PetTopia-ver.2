$(function(){

	$(document).on("click", "#showmap", function(){
	var thismap = $(this).prev().val();
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
        
        
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  


				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch($(this).prev().val(), function(result, status) {
			
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div class="text-dark" style="width:200px;text-align:center;padding:6px 0;">'+thismap+'</div>'
	        });
	        infowindow.open(map, marker);

	        setTimeout( function() {
	    		window.dispatchEvent(new Event('resize'));
	    	}, 600);
	        
	        
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  //search
        
        
        

    // 팝업 닫기 이벤트 정의
    //$("#btn_popup_close1").on("click", popupClose);

    // 팝업 배경 클릭 이벤트 정의
    $panel.find(".popup_bg1").on("click", popupClose);

    function popupClose(e) {

        $panel.fadeOut();

        // 이벤트 기본 동작 중단
        e.preventDefault();
    }
	
	
  }); //click
});

// 레이어 팝업 오픈 이벤트
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

