<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
function dateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;

    return date.getFullYear() + '-' + month + '-' + day;
}

var KTCalendarBasic = function() {

	return {
        //main function to initiate the module
        init: function() {
            var todayDate = moment().startOf('day');
            var YM = todayDate.format('YYYY-MM');
            var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
            var TODAY = todayDate.format('YYYY-MM-DD');
            var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

            var calendarEl = document.getElementById('kt_calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                plugins: [ 'bootstrap', 'interaction', 'dayGrid' ],
                themeSystem: 'bootstrap',
                isRTL: KTUtil.isRTL(),

                header: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'today'
                },

                titleFormat : function(date) { // title 설정
              	  return date.date.year +"년 "+(date.date.month +1)+"월"; 
				} ,
				columnHeaderText : function(date) { 
				  var weekList = ['일','월','화','수','목','금','토']; 
				  return weekList[date.getDay()]; // 헤더 
				} ,
				
                height: 800,
                contentHeight: 780,
                aspectRatio: 3,  // see: https://fullcalendar.io/docs/aspectRatio

                nowIndicator: true,
                now: TODAY + 'T09:25:00', // just for demo

                views: {
                    dayGridMonth: { buttonText: 'month' },
                    timeGridWeek: { buttonText: 'week' },
                    timeGridDay: { buttonText: 'day' }
                },

                defaultView: 'dayGridMonth',
                defaultDate: TODAY,
                
                dateClick : function(event) {
                	var week = ['일', '월', '화', '수', '목', '금', '토'];
                	var date = dateFormat(event.date);
                	var dayOfWeek = week[new Date(date).getDay()];
	                // 주말 클릭시 return
                	if(dayOfWeek == "토" || dayOfWeek == "일"){
                		return;
                	}
                    var form = {holidayDate : date};
                    $.ajax({
                    	url : "registOrDelete.do"
	            		, data : JSON.stringify(form)
	            		, async : false
	            		, type : "post"
	            		, dataType : 'json'
	            		, contentType: "application/json; charset=utf-8;"
	            		, success : function(data) {
	            			if(data.flag == 1){
	            				Swal.fire({
	            				  	icon: "success",
	            			        title: "휴무일로 설정되었습니다.",
	            			        showConfirmButton: false,
	            			        timer: 1500
	            				}).then((result) => {
			            			location.href = "monlist.do";
	            				});
	            			} else {
	            				Swal.fire({
	            					icon: "success",
	            			        title: "근무일로 설정되었습니다.",
	            			        showConfirmButton: false,
	            			        timer: 1500
	            				}).then((result) => {
			            			location.href = "monlist.do";
	            				});
	            			}
	            		}
                    });
                },
                
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                navLinks: false,
//                businessHours: true,
                events: getHoliday(),

                        
                eventRender: function(info) {
                    var element = $(info.el);

                    if (info.event.extendedProps && info.event.extendedProps.description) {
                        if (element.hasClass('fc-day-grid-event')) {
                            element.data('content', info.event.extendedProps.description);
                            element.data('placement', 'top');
                            KTApp.initPopover(element);
                        } else if (element.hasClass('fc-time-grid-event')) {
                            element.find('.fc-title').append('<div class="fc-description">' + info.event.extendedProps.description + '</div>');
                        } else if (element.find('.fc-list-item-title').lenght !== 0) {
                            element.find('.fc-list-item-title').append('<div class="fc-description">' + info.event.extendedProps.description + '</div>');
                        }
                    }
                }
            });

            calendar.render();
        }
    };
}();
jQuery(document).ready(function() {
	KTCalendarBasic.init();
});
</script>