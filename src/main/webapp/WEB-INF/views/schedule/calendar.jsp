<!-- 이 페이지에서 날짜와 시간을 선택해서 상품 상세창으로 그 데이터를 보내야함 -->
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
	var calendar = null;
  $(document).ready(function (){
	   /* initialize the external events
    -----------------------------------------------------------------*/

    var containerEl = document.getElementById('external-events-list');
    new FullCalendar.Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText.trim()
        }
      }
    });

    //// the individual way to do it
    // var containerEl = document.getElementById('external-events-list');
    // var eventEls = Array.prototype.slice.call(
    //   containerEl.querySelectorAll('.fc-event')
    // );
    // eventEls.forEach(function(eventEl) {
    //   new FullCalendar.Draggable(eventEl, {
    //     eventData: {
    //       title: eventEl.innerText.trim(),
    //     }
    //   });
    // });

    /* initialize the calendar
    -----------------------------------------------------------------*/

    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko',
      timeZone: 'Asia/Seoul',
      initialView: "timeGridWeek",
      slotMinTime: '08:00',
      slotMaxTime: '23:00',
      eventDurationEditable: false,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'timeGridWeek,timeGridDay'
      },
      editable: false,
      droppable: true, // this allows things to be dropped onto the calendar
      drop: function(arg) {
          arg.draggedEl.parentNode.removeChild(arg.draggedEl);
      }
    });
    calendar.render();

	  
  })//document ready end

  //1. DB에서 판매자의 스케줄표를 받아와야 함 
  //2. 내가 선택한 날짜를 상세페이지로 돌려줘야 함
  function allSave(){
	  var allEvent = calendar.getEvents();
	  
	  var events = new Array();
	  for(var i=0; i< allEvent.length; i++){
		  
		  var obj = new Object();
		  
		  obj.start = allEvent[i]._instance.range.start;//시작 날짜 및 시간
		  obj.end = allEvent[i]._instance.range.end;//마침 날짜 및 시간
		  
		  events.push(obj);
	  }
	  var jsondata = JSON.stringify(events);
	  console.log(jsondata); //[{"start":"2022-10-04T12:00:00.000Z","end":"2022-10-04T13:00:00.000Z"}]
	  
	  return_to_parent(jsondata);
  }

	function return_to_parent(jsondata){
		
	};
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
    max-width: 1100px;
    margin: 0 auto;
  }
  
  #calendar > div.fc-view-harness.fc-view-harness-active > div > table > tbody > tr:nth-child(1) > td{
  	display: none
  }
  


</style>
</head>
<body>
  <div id='wrap'>

    <div id='external-events'>
      <h4>일정을 드래그해서 예약해주세요</h4>

      <div id='external-events-list'>
        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
          <div class='fc-event-main'>title1</div>
        </div>
        
      </div>

    </div>

    <div id='calendar-wrap'>
      <div id='calendar'></div>
    </div>
    <br>
	<div class="fc">
	<button class="fc-button-primary" style="height:50px" onClick="javascript:allSave();">예약하기</button>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</div>
  </div>
</body>
</html>