var draggedEventIsAllDay;
var activeInactiveWeekends = true;

var calendar = $('#calendar').fullCalendar({

 /** ******************
   *  OPTIONS
   * *******************/
  locale                    : 'ko',    
  timezone                  : "local", 
  nextDayThreshold          : "09:00:00",
  allDaySlot                : true,
  displayEventTime          : true,
  displayEventEnd           : true,
  firstDay                  : 0, //월요일이 먼저 오게 하려면 1
  weekNumbers               : false,
  selectable                : true,
  weekNumberCalculation     : "ISO",
  eventLimit                : true,
  views                     : { 
                                month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
                              },
  eventLimitClick           : 'week', //popover
  navLinks                  : true,
  defaultDate               : moment(), //실제 사용시 현재 날짜로 수정
  timeFormat                : 'HH:mm',
  defaultTimedEventDuration : '01:00:00',
  editable                  : true,
  minTime                   : '00:00:00',
  maxTime                   : '24:00:00',
  slotLabelFormat           : 'HH:mm',
  weekends                  : true,
  nowIndicator              : true,
  dayPopoverFormat          : 'MM/DD dddd',
  longPressDelay            : 0,
  eventLongPressDelay       : 0,
  selectLongPressDelay      : 0,  
  header                    : {
                                left   : 'today, prev, next, viewWeekends',
                                center : 'title',
                                right  : 'month, agendaWeek, agendaDay, listWeek'
                              },
  views                     : {
                                month : {
                                  columnFormat : 'dddd'
                                },
                                agendaWeek : {
                                  columnFormat : 'M/D ddd',
                                  titleFormat  : 'YYYY년 M월 D일',
                                  eventLimit   : false
                                },
                                agendaDay : {
                                  columnFormat : 'dddd',
                                  eventLimit   : false
                                },
                                listWeek : {
                                  columnFormat : ''
                                }
                              },
  customButtons             : { //주말 숨기기 & 보이기 버튼
                                viewWeekends : {
                                  text  : '주말',
                                  click : function () {
                                    activeInactiveWeekends ? activeInactiveWeekends = false : activeInactiveWeekends = true;
                                    $('#calendar').fullCalendar('option', { 
                                      weekends: activeInactiveWeekends
                                    });
                                  }
                                }
                               },


  eventRender: function (event, element, view) {
	  
	  // null처리
	  if (event.place == null) {
		  event.place = "-";
	  }
	  if (event.description == null) {
		  event.description = "-";
	  }
	  if (event.type  == null) {
		  event.type = "-";
	  }   


//일정에 hover시 요약
    element.popover({
    	
      title: $('<div />', {
        class: 'popoverTitleCalendar',
        text: event.title
      }).css({
        'background': event.backgroundColor,
        'color': event.textColor
      }),
      content: $('<div />', {
          class: 'popoverInfoCalendar'
        })//.append('<p><strong>등록자:</strong> ' + event.username + '</p>')
        .append('<p><strong>시간 : </strong> ' + getDisplayEventDate(event) + '</p>')
        .append('<p><strong>장소 : </strong> ' + event.place + '</p>')
        .append('<div class="popoverDescCalendar"><strong>설명:</strong> ' + event.description + '</div>'),
      delay: {
        show: "800",
        hide: "50"
      },
      trigger: 'hover',
      placement: 'top',
      html: true,
      container: 'body'
    });

    return filtering(event);

  },

  /* ****************
   *  일정 받아옴 
   * ************** */
  events: function (start, end, timezone, callback) {
  
    $.ajax({
      type: "POST",
      url:"/mz/cal/list",   
      success: function (response) {
        var fixedDate = response.map(function (array) {
        	
        	
//        	if (array.allDay && array.start !== array.end) {
//        		console.log(array.start ,array.end, "시작일 종료일 같지 않음");
//                array.end = moment(array.end).add(1, 'days'); // 이틀 이상 AllDay 일정인 경우 달력에 표기시 하루를 더해야 정상출력
//              }
          
        	//console.log(array.allDay)
        	
        	var start = array.start.split(" ")[0];
        	var end = array.end.split(" ")[0];
        	
        	if (array.allDay && start !== end) {
        		//array.end = moment(array.end).add(1, 'days');
        		array.end = moment(array.end).endOf('days').format('YYYY-MM-DD');
          }
          return array;
        });
        callback(fixedDate);
      }
    });
  },

  eventAfterAllRender: function (view) {
    if (view.name == "month") $(".fc-content").css('height', 'auto');
  },

  //일정 리사이즈
  eventResize: function (event, delta, revertFunc, jsEvent, ui, view) {
	  
	 var editDeptCode = $("#edit-deptCode").val();
	 var eventTypeCode = event.deptCode;
		
	editDeptCode = editDeptCode.substring(0,1) + "00";
	
	console.log("loginUser 부서코드 : "+editDeptCode);
	console.log("loginUser 일정 부서코드 : "+eventTypeCode);
	
	if (editDeptCode == eventTypeCode || eventTypeCode== 2){
	$('.popover.fade.top').remove();
    /** 리사이즈시 수정된 날짜반영
     * 하루를 빼야 정상적으로 반영됨. */
    var newDates = calDateWhenResize(event);
    
    //displayDate = moment(newDates.endDate).endOf('days').format('YYYY-MM-DD');
    displayDate = moment(newDates.endDate).add(1, 'days').format('YYYY-MM-DD');
    
    var eventData = {
            _id: event._id,
            allDay: event.allDay,
            start: newDates.startDate,
            end: displayDate
        };

    //리사이즈한 일정 업데이트
    $.ajax({
        type: "POST",
        url: "/mz/cal/updateDate",
        data: JSON.stringify(eventData),
        contentType:"application/json",
        success: function (response) {
          alert('일정을 수정하였습니다.');
        },error:function(error){
        	alert('일정 수정을 실패하였습니다.');		
        }
      });
    
	}else{
		alert("소속 부서원만 수정 가능합니다.");
		location.reload();
        return false;
	}

  },

  eventDragStart: function (event, jsEvent, ui, view) {
    draggedEventIsAllDay = event.allDay;
  },

  //일정 드래그앤드롭
  eventDrop: function (event, delta, revertFunc, jsEvent, ui, view) {
    $('.popover.fade.top').remove();

    

    	// 주,일 view일때 종일 <-> 시간 변경불가
    if (view.type === 'agendaWeek' || view.type === 'agendaDay') {
      if (draggedEventIsAllDay !== event.allDay) {
        alert('드래그앤드롭으로 종일<->시간 변경은 불가합니다.');
        location.reload();
        return false;
      }
    }
    
    var editDeptCode = $("#edit-deptCode").val();
    editDeptCode = editDeptCode.substring(0,1) + "00";
    
	var eventTypeCode = event.deptCode;
	
    	
	console.log(editDeptCode);
	console.log(eventTypeCode);
	
	if (editDeptCode == eventTypeCode || eventTypeCode== 2) {
    // 드랍시 수정된 날짜반영
		
	
   var newDates = calDateWhenDragnDrop(event);

    console.log(event);
    
    var eventData = {
            _id: event._id,
            allDay: event.allDay,
            start: newDates.startDate,
            end:  newDates.endDate
        };
    
    
    
    // 드롭한 일정 업데이트
    $.ajax({
      type: "POST",
      url: "/mz/cal/updateDate",
      data: JSON.stringify(eventData),
      contentType:"application/json",
      success: function (response) {
        alert('일정을 수정하였습니다.');
      },error:function(error){
      	alert('일정 수정을 실패하였습니다.');		
      }
    });
    
	  }else{
			alert("소속 부서원만 수정 가능합니다.");
			location.reload();
	        return false;
		};

  },

  select: function (startDate, endDate, jsEvent, view) {

    $(".fc-body").unbind('click');
    $(".fc-body").on('click', 'td', function (e) {

      $("#contextMenu")
        .addClass("contextOpened")
        .css({
          display: "block",
          left: e.pageX,
          top: e.pageY
        });
      return false;
    });

    var today = moment();

    if (view.name == "month") {
      startDate.set({
        hours: today.hours(),
        minute: today.minutes() 
      });
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).subtract(1, 'days');

      endDate.set({
        hours: today.hours() + 1,
        minute: today.minutes()
      });
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    } else {
      startDate = moment(startDate).format('YYYY-MM-DD HH:mm');
      endDate = moment(endDate).format('YYYY-MM-DD HH:mm');
    }

    //날짜 클릭시 카테고리 선택메뉴
    var $contextMenu = $("#contextMenu");
    $contextMenu.on("click", "a", function (e) {
      e.preventDefault();

      //닫기 버튼이 아닐때
      if ($(this).data().role !== 'close') {
        newEvent(startDate, endDate, $(this).html());
      }

      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

    $('body').on('click', function () {
      $contextMenu.removeClass("contextOpened");
      $contextMenu.hide();
    });

  },
  
  //이벤트 클릭시 수정이벤트
  eventClick: function (event, jsEvent, view) {
	    editEvent(event);
	  }

});

function getDisplayEventDate(event) {

  var displayEventDate;

  if (event.allDay == false) {
    var startTimeEventInfo = moment(event.start).format('HH:mm');
    var endTimeEventInfo = moment(event.end).format('HH:mm');
    displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
  } else {
    displayEventDate = "하루종일";
  }

  return displayEventDate;
}


$(document).ready(function(){
	$("#checkbox-all").click(function(){ 
		if($("#checkbox-all").prop("checked")) { 
			$("input[name='Check']").prop("checked", true); 
		}else {
			$("input[name='Check']").prop("checked", false); 
		}
	}); 
	
	$(".filter").click(function(){
		if ($("input[name='Check']:checked").length == 3 ){
			$('#checkbox-all').prop("checked", true);
		}else{
			$('#checkbox-all').prop("checked", false);
		}
	});
	
	
//	$("#allDayNewEvent").change (function () {
//	var  st = this.checked;
//		if (st) {
//			$("#edit-start").prop("disabled", true);
//			$("#edit-end").prop("disabled", true);
//		  } else {
//			$("#edit-start").prop("disabled", false);
//			$("#edit-end").prop("disabled", false);
//		}
//	});
	
	
	$(".allDayNewEvent").on('click',function(){
        var chk = $('.allDayNewEvent').is(":checked");
        if(chk==true){
        	$("#edit-start").prop("disabled", true);
			$("#edit-end").prop("disabled", true);
        }else{
        	$("#edit-start").prop("disabled", false);
			$("#edit-end").prop("disabled", false);
        }
	});
	
});


function filtering(event) {
  var show_deptCode = true;
  var show_type = true;

  var deptCode = $('input:checkbox.filter:checked').map(function () {
    
	 return $(this).val();
  }).get();
  var types = $('#type_filter').val();

  show_deptCode = deptCode.indexOf(event.deptCode) >= 0;

  if (types && types.length > 0) {
    if (types[0] == "all") {
      show_type = true;
    } else {
      show_type = types.indexOf(event.type) >= 0;
    }
  }
  
  return show_deptCode && show_type;
}

function calDateWhenResize(event) {

  var newDates = {
    startDate: '',
    endDate: ''
  };

  if (event.allDay) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
  } else {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}

function calDateWhenDragnDrop(event) {
  // 드랍시 수정된 날짜반영
  var newDates = {
    startDate: '',
    endDate: ''
  }

  // 날짜 & 시간이 모두 같은 경우
  if(!event.end) {
    event.end = event.start;
  }

  //하루짜리 all day
  if (event.allDay && event.end === event.start) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = newDates.startDate;
  }

  //2일이상 all day
  else if (event.allDay && event.end !== null) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD');
    newDates.endDate = moment(event.end._d).subtract(1, 'days').format('YYYY-MM-DD');
  }

  //all day가 아님
  else if (!event.allDay) {
    newDates.startDate = moment(event.start._d).format('YYYY-MM-DD HH:mm');
    newDates.endDate = moment(event.end._d).format('YYYY-MM-DD HH:mm');
  }

  return newDates;
}