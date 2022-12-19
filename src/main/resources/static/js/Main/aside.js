	// url 대조 후 메뉴에 navActive 주기
	var pageUrl = window.location.href; //창의 url을 가져온다.
	$(window).on('load', function(){ //load가 되었을때 실행
	    $('#myPageName').siblings('.nav-link').removeClass('navActive'); //다른 navActive가 있으면 지워준다.
	   
	    if (pageUrl.indexOf('update') > -1) {
	        $('.mn0 > a').addClass('navActive');
	    } else if (pageUrl.indexOf('order/list') > -1) { 
	        $('.mn1 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('myask') > -1) { 
	        $('.mn2 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('myreview') > -1) { 
	        $('.mn3 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('myPost') > -1) { 
	        $('.mn4 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('myComment') > -1) { 
	        $('.mn5 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('withdraw') > -1) { 
	        $('.mn6 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('mypage/SCH') > -1) { 
	        $('.mn7 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('my_product') > -1) { 
	        $('.mn8 > a').addClass('navActive');
	    }else if (pageUrl.indexOf('admin_list') > -1) { 
	        $('.mn9 > a').addClass('navActive');
	    }
	    
	});
