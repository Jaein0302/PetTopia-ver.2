<!-- 
판매자- 스케줄 확인

1. 자신의 스케줄이 나온다.
2. 일정을 수정해야 한다. --나중에 추가로하자
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 날짜/시간 선택하기</title>
<!-- fullcalender -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    $(function () {
    	
    	var member_id = $('#hidden_id').val()
    	
        var request = $.ajax({
            url: "getSchListByID",
            data : {"seller_id" : member_id},
            beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            method: "GET",
            dataType: "json"
        });

        request.done(function (data) {
            console.log(data); // log 로 데이터 찍어주기.

            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
            	locale: 'ko',
            	timeZone : 'Asia/Seoul',
                initialView: 'timeGridWeek',
                slotMinTime: '08:00',
                slotMaxTime: '23:00',
                eventDurationEditable : false,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                selectable: true,
                editable: false,
                droppable: true, // this allows things to be dropped onto the calendar
                drop: function (arg) {
                    // is the "remove after drop" checkbox checked?
                    if (document.getElementById('drop-remove').checked) {
                        // if so, remove the element from the "Draggable Events" list
                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                    }
                },
                /**
                 * data 로 값이 넘어온다. log 값 전달.
                 */
                events: data,
                select: function (arg) {

                	var title = prompt('사유를 입력해주세요.');
                	if (title && title != null) {
                		calendar.addEvent({
                			title: title,
                			start: arg.start,
                			color: 'red',
                		})
                	} else {
						return false;
                	}
                	
                	var allEvent = calendar.getEvents();
                	
                	var events = new Array();
                	
                	
                	for (var i=0; i< allEvent.length; i++){
                		var obj = new Object();
                		obj.title = allEvent[i]._def.title;
                		obj.start = allEvent[i]._instance.range.start;
                		obj.seller = "${member_id}";
                		
                		events.push(obj);
                	}
                	
                	
                	var jsondata = JSON.stringify(events);
                	console.log(jsondata)
                	
                	$(function saveData(jsondata) {

                	
                		$.ajax({
                			url:'add_red_event',
                			method: 'POST',
                			dataType: 'json',
                			beforeSend : function(xhr){
									 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
                			data: JSON.stringify(events),
                			contentType: 'application/json',
                		})
                		
                			.done(function(result){
                				alert("일정이 생성되었습니다.")
                			})
                			
                			.fail(function(request, status, error){
                				alert("일정 생성중 오류가 발생했습니다 : " + error)
                			})
                	
                	})
                }
            });

            calendar.render();
        });

        request.fail(function( jqXHR, textStatus ) {
            alert( "일정을 가져오는도중 오류가 발생했습니다. :  " + textStatus);
        });
    });

});
</script>
<style>

  body {
    margin-top: 40px;
    font-size: 14px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  }

  #external-events {
    position: fixed;
    left: 20px;
    top: 20px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
    text-align: left;
  }

  #external-events h4 {
    font-size: 16px;
    margin-top: 0;
    padding-top: 1em;
  }

  #external-events .fc-event {
    margin: 3px 0;
    cursor: move;
  }

  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }

  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

  #calendar-wrap {
    margin-left: 200px;
  }

  #calendar {
    width: 1100px;
  }
  
 
  


</style>
</head>
<body>
<!-- header -->
<div class="header">
	<jsp:include page="../member/header.jsp" />
</div>

<div class="container mb-5 mainbody" style="margin-top:220px;">
 <div class="row px-xl-5">

<!-- side menu -->
<div class="col-md-3 pb-3 m-0">
	  <jsp:include page="../mypage/aside.jsp" />
</div>

<!-- calendar -->
<input type="hidden" value="${member_id }" id="hidden_id">
<input type="hidden" id="hidden_time">
  <div id='wrap' style="width: 600px!important; height: 600px!important">


      <div id='calendar'></div>
    <br>
	<div class="fc">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</div>
  </div>
 </div>
</div>
</body>
</html>