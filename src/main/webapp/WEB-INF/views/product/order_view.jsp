<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- fullcalender -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.order { margin : 0 auto;
			width : 700px}
			
.item tbody tr td span  { 
							float : right;
							position : relative;
							right : 40px;
							}
.total h5 {display:inline; position:relative; left : 30px}
.total h4 {display:inline; float : right; position:relative; right : 40px}		
.total {background : lightgray;}		
.purchase { text-align : center; display:inline-block; width:100%}			
.purchase button { width : 200px; height : 40px;}


</style>




<body>
<div class="container mb-5">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="hidden_token">   
	
	<jsp:include page="../member/header.jsp" />
	
	<!-- 주문페이지 -->
	<div class="order">
	<table class="table text-left m-2" style="width:100%">
	 	<thead>
		 	<tr style="border:none">
			 	<th>
			 	   <span class="commu pr-4">&ensp;주문결제</span>
			    </th>
			</tr>
		</thead>
	</table>	
	
		<table class="table text-left mt-3 item">
		   	<tbody class='border-bottom '>
		   	   	<tr>
			   		<td class='border-left' rowspan='5' style="width:200px">
	                 	<img class='img-fluid w-15' src="/pet_topia/upload${productdata.ITEM_IMAGE_FILE}" style="width:150px;hegith:150px; ">
			   		</td>
		   		</tr>
		   		<tr>
					<td>상품명<span>${productdata.ITEM_NAME}</span></td>
		   		</tr>
		   		
		   		
		   		<tr>
		   			<td>판매자<span id="seller_id">${productdata.MEMBER_ID}</span></td>
		   		</tr>
		   		
		   		<tr>
		   			<td>주소<span>${productdata.ITEM_ADDRESS }</span></td>
		   		</tr>
		   				
		   	</tbody>
	   	</table>
		   
		<div class="mt-4 mb-4 total">	   		
			<h5>금액</h5><h4><fmt:formatNumber value="${productdata.ITEM_PRICE}" pattern="#,###" />원</h4>
		</div>
		
		<table class="table text-left mt-5 item">
		 	<thead>
			 	<tr>
				 	<th colspan="2">구매자 정보</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
				 	<td>이름</td>
				 	<td>${memberlist.member_name}</td>
				</tr>		
				
				<tr>
				 	<td>휴대폰 전화</td>
				 	<td>${memberlist.member_tell}</td>
				</tr>		
				
				<tr>
				 	<td>이메일 주소</td>
				 	<td>${memberlist.member_email}</td>
				</tr>	
				
				<tr>
					<td>결제방식</td>
					<td>
						<select name="select_pay" id="select_pay">
							<option value="CASH">현장결제</option>
							<option value="KAKAO_PAY">카카오페이</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>예약 일자 정하기</td>
					<td>
						<!-- 예약 일자를 설정해주세요 -->
						<button type="button" class="btn btn-danger"
							data-toggle="modal" data-target="#open_sch"
							id="confirm" >예약 일자를 설정해주세요</button>
					</td>
				</tr>	
			</tbody>	
		</table>	
		
			<div class="purchase">		
				<button class="btn btn-primary">예약하기</button>
				<input type="hidden" id="hidden_time">
			</div>
	</div>
	
<!-- open_sch modal -->
<div class="modal" id="open_sch">
 <div class="modal-xl">
  <div class="modal-content">
		<!-- Modal body -->
		<div class="modal-body">
			<div id='wrap'>
				<div id='calendar'></div>
			</div>
			<br>

		</div>
  </div>
 </div>
</div>
</div>
<script>
$(document).ready(function(){
	
	var member_id = $('#seller_id').html()
	var add_event_count = 0;

	
    //예약 확인 버튼
    $("#confirm").click(function(){
		
        //스케줄 리스트를 가져오는 요청
    	var request = $.ajax({
            url: "../mypage/getSchListByID",
            data : {"seller_id" : member_id},
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            method: "GET",
            dataType: "json"
        });

		//일정표를 성공적으로 가져왔다면
        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.
			
            //캘린더를 렌더링한다
            var calendarEl = document.getElementById('calendar');
            calendar = new FullCalendar.Calendar(calendarEl, {
            	allDaySlot: false,
            	locale: 'ko',
            	timeZone: 'Asia/Seoul',
                initialView: 'timeGridWeek',
                slotMinTime: '08:00',
                slotMaxTime: '23:00',
                eventDurationEditable: false,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                editable: false,
                selectable: true,
                droppable: true, // this allows things to be dropped onto the calendar
				events: data,
                eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                    console.log()
                },

                // eventChange: function (obj) { // 이벤트가 수정되면 발생하는 이벤트
                //     allEvent = calendar.getEvents();
                //     console.log(allEvent);
                // },
                // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                //     console.log(obj);
                // },

                select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
					var really = confirm("정말 이 시간에 예약하시겠습니까?")
                    var title = "${productdata.ITEM_NAME}";
                    
                    var today = new Date();
                    
                    if(arg.start < today) {
                    	alert("지난 날짜는 선택할수 없습니다.")
                    	return false;
                    }
                    if (really && add_event_count == 0) {
	
                    	//console.log(add_event_count)
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            color: 'green'
                        })
                        add_event_count++
                        //console.log(add_event_count)
                        
                        //여기서 hidden_time의 밸류를 yyyy-MM-dd hh24:mm 형식으로 치환해야 합니다
                        $('#hidden_time').val(arg.start.toLocaleString('ko-kR', {timeZone: 'UTC'}))
                        
                        $('#confirm').removeClass('btn-danger')
                        $('#confirm').addClass('btn-success')
                        $('#confirm').html("예약이 설정되었습니다")
                        $('#confirm').prop("disabled", true)
                    } else {
                    	alert("일정은 한번만 추가 할 수 있습니다.\n잘못입력하셨다면 새로고침 후 이용해주세요.");
                    	return false;
                    }
                },

                // drop: function (arg) {
                //     // is the "remove after drop" checkbox checked?
                //     if (document.getElementById('drop-remove').checked) {
                //         // if so, remove the element from the "Draggable Events" list
                //         arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                //     }
                // }
            });
            calendar.render();
        });
        
        //일정표를 못가져왔다면
        request.fail(function( jqXHR, textStatus ) {
            alert( "일정표를 불러오는중 에러가 발생했습니다.: " + textStatus);
        });
		
        
	})//confirm button click function
	
	//구매버튼 클릭
	$(".purchase").click(function (){
		
		var IMP = window.IMP;
        IMP.init('imp24704360');
        
        if($("#confirm").html() =='예약 일자를 설정해주세요'){//예약설정 안했을때 
    		alert("예약 일자를 설정해주세요");
        	return false;
    	} else { //예약설정했을때
    		
    		if( $('#select_pay').val() == 'KAKAO_PAY'){//결제방식이 카카오페이 일때
    			
    			 // IMP.request_pay(param, callback) 결제창 호출
    			 IMP.request_pay({//param
    				 pg: "kakaopay",
    				 pay_method: "card",
    				 order_id: "Y" + new Date().getTime(),
    				 name: "${productdata.ITEM_NAME}",
    				 item_id: "${productdata.ITEM_ID}",
    				 amount: "${productdata.ITEM_PRICE}",
    				 count: 1,
    				 buyer_id: "${memberlist.member_id}",
    				 buyer_addr: "${memberlist.member_address}"
    			 }, function (rsp){//callback 함수
    				 
    				 if(rsp.success){

    					 $.ajax({
    			   				
    		    			 url:'purchase', 
    		   				 method:'POST',
    		   				 dataType : 'json',
    		   				 data: {
    		   					 "order_id" : 1 , //예약 ID
    		  	    			 "order_member_id" : "${memberlist.member_id}", //예약하는사람의 아이디
    		  	    			 "order_item_id" : "${productdata.ITEM_ID}",//예약하는 상품의 아이디
    		  	    			 "order_item_sellerName" : "${productdata.seller_name}", //판매자의 업체명
    		  	    			 "order_item_name" :"${productdata.ITEM_NAME}", //예약하는 상품의 이름
    		  	    			 "order_item_price" :"${productdata.ITEM_PRICE}", //예약하는 상품의 가격
    		  	    			 "order_time" : $('#hidden_time').val(), //예약하는 시간
    		  	    			 "order_location" : "${productdata.ITEM_ADDRESS}", //예약하는 장소
    		  	    			 "order_image" : "${productdata.ITEM_IMAGE_FILE}", //예약하는 상품의 이미지
    		  	    			 "order_seller" : "${productdata.MEMBER_ID}", //판매하는 사람의 아이디
                       "order_item_tell" : "${productdata.seller_tell}", // 판매자 연락처
                       "order_member_tell" : "${memberlist.member_tell}"   // 구매자 연락처
    		   				 },
    		   				 beforeSend : function(xhr){
    		   						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		   					},
    		   				 success : function(result) {
    		   					 console.log(result);
    		   					 if(result == 1) {
    		   						 var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
    		   						 var events = new Array(); // Json 데이터를 받기 위한 배열 선언
    		   						 for (var i = 0; i < allEvent.length; i++) {
    		   							 var obj = new Object();     // Json 을 담기 위해 Object 선언
    		   							 // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
    		   							 obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
    		   							 obj.start = allEvent[i]._instance.range.start; // 시작
    		   							 //obj.order_id = order_id;
    		   							 obj.seller = "${productdata.MEMBER_ID}";
    		   							 events.push(obj);
    		   						 }
    		   						 var jsondata = JSON.stringify(events);
    		   						 console.log(jsondata);
    		   						 // saveData(jsondata);
    		   						 $(function saveData(jsondata) {
    		   							 $.ajax({
    		   								 url: "../mypage/calendar-update",
    		   								 method: "POST",
    		   								 dataType: "json",
    		   								 data: JSON.stringify(events),
    		   								 contentType: 'application/json',
    		   								 beforeSend : function(xhr){
    		   									 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		   								 },
    		   							 })
    		   							 .done(function (result) {
    		   								 alert("예약과 구매가 성공적으로 완료되었습니다.\n나의 예약페이지로 이동합니다.");
    		   								location.href="${pageContext.request.contextPath}/order/list?member_id=${memberlist.member_id}"
    		   							 })
    		   							 .fail(function (request, status, error) {
    		   								 alert("일정표를 데이터베이스에 입력하는중 오류가 발생했습니다. : " + error);
    		   							 });
    		   						 }); 
    		   					 } else {
    		   						 alert("결제프로세스 진행중 오류가 발생했습니다.");
    		   					 }
    		   				 }, //success end
    		   					 error:function(request, status, error){
    		   						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		   					 } // error end
    		   				 }) //ajax end 
    					 
    				 } else {
    					 alert("카카오톡 결제 실패");
    				 }
    			 })
    		} else { //결제 방식이 현장 결제일때 바로 예약 테이블로 넣어버리기
    			
    			$.ajax({
   				
    			 url:'purchase', 
   				 method:'POST',
   				 dataType : 'json',
   				 data: {
   					 "order_id" : 1 , //예약 ID
  	    			         "order_member_id" : "${memberlist.member_id}", //예약하는사람의 아이디
    		  	    			 "order_item_id" : "${productdata.ITEM_ID}",//예약하는 상품의 아이디
    		  	    			 "order_item_sellerName" : "${productdata.seller_name}", //판매자의 업체명
    		  	    			 "order_item_name" :"${productdata.ITEM_NAME}", //예약하는 상품의 이름
    		  	    			 "order_item_price" :"${productdata.ITEM_PRICE}", //예약하는 상품의 가격
    		  	    			 "order_time" : $('#hidden_time').val(), //예약하는 시간
    		  	    			 "order_location" : "${productdata.ITEM_ADDRESS}", //예약하는 장소
    		  	    			 "order_image" : "${productdata.ITEM_IMAGE_FILE}", //예약하는 상품의 이미지
    		  	    			 "order_seller" : "${productdata.MEMBER_ID}", //판매하는 사람의 아이디
                       "order_item_tell" : "${productdata.seller_tell}", // 판매자 연락처
                       "order_member_tell" : "${memberlist.member_tell}"   // 구매자 연락처
   				 },
   				 beforeSend : function(xhr){
   						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
   					},
   				 success : function(result) {
   					 console.log(result);
   					 if(result == 1) {
   						 var allEvent = calendar.getEvents(); // .getEvents() 함수로 모든 이벤트를 Array 형식으로 가져온다. (FullCalendar 기능 참조)
   						 var events = new Array(); // Json 데이터를 받기 위한 배열 선언
   						 for (var i = 0; i < allEvent.length; i++) {
   							 var obj = new Object();     // Json 을 담기 위해 Object 선언
   							 // alert(allEvent[i]._def.title); // 이벤트 명칭 알람
   							 obj.title = allEvent[i]._def.title; // 이벤트 명칭  ConsoleLog 로 확인 가능.
   							 obj.start = allEvent[i]._instance.range.start; // 시작
   							 //obj.order_id = order_id;
   							 obj.seller = "${productdata.MEMBER_ID}";
   							 events.push(obj);
   						 }
   						 var jsondata = JSON.stringify(events);
   						 console.log(jsondata);
   						 // saveData(jsondata);
   						 $(function saveData(jsondata) {
   							 $.ajax({
   								 url: "../mypage/calendar-update",
   								 method: "POST",
   								 dataType: "json",
   								 data: JSON.stringify(events),
   								 contentType: 'application/json',
   								 beforeSend : function(xhr){
   									 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
   								 },
   							 })
   							 .done(function (result) {
   								 alert("예약과 구매가 성공적으로 완료되었습니다.\n나의 예약페이지로 이동합니다.");
   								location.href="${pageContext.request.contextPath}/order/list?member_id=${memberlist.member_id}"
   							 })
   							 .fail(function (request, status, error) {
   								 alert("일정표를 데이터베이스에 입력하는중 오류가 발생했습니다. : " + error);
   							 });
   						 }); 
   					 } else {
   						 alert("결제프로세스 진행중 오류가 발생했습니다.");
   					 }
   				 }, //success end
   					 error:function(request, status, error){
   						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   					 } // error end
   				 }) //ajax end   
    			}
    		}//예약설정 했을때 end
    	})//purchase button click function
	
})
</script>
<jsp:include page="../member/footer.jsp" />
</body>	