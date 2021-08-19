var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');
var editPlace = $('#edit-place');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
var closeBtn = $('.modalBtnContainer-close');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {
	
	
    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('일정 등록').attr("disabled", false);
    editType.val(eventType).prop('selected', true).attr("disabled", false);
    editTitle.val('').attr("disabled", false);
    editStart.val(start).attr("disabled", false);
    editEnd.val(end).attr("disabled", false);
    editDesc.val('').attr("disabled", false);
    editPlace.val('').attr("disabled", false);
    editDeptCode = $('#edit-deptCode')
    editEmpNo = $('#edit-empNo');
    
    var start = editStart.val().split(" ")[0];
    var end = editEnd.val().split(" ")[0];
    
    if(start !== end){
    	editAllDay.attr("checked", true)
    	editAllDay.attr("disabled", true)
    	editStart.attr("disabled", true)
    	editEnd.attr("disabled", true)
    }else if (start == end) {
    	editAllDay.attr("checked", false)
    	editAllDay.attr("disabled", false)
    	editStart.attr("disabled", false)
    	editEnd.attr("disabled", false)
	}
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    closeBtn.hide();
    eventModal.modal('show');
    
    
    
//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
//    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    
    $('#inputDate').unbind();
    $('#inputDate').on('click', function () {
    	editTitle.val("MZ SW 5.0 최종 배포버전 세미나");
    	editStart.val("2021-08-12 16:00");
    	editEnd.val("2021-08-12 17:00");
    	editPlace.val("3층 회의실");
    	editDesc.val("MZ SW 5.0 최종 배포버전 세미나");
    	
    	$('#inputDate').hide();
    });
    
    
    function inputDate(){}
    
    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {

    	var eventData = {
            title: editTitle.val(),
            start: editStart.val(),
            end: editEnd.val(),
            place: editPlace.val(),
            description: editDesc.val(),
            type: editType.val(),
            //username: '사나',
            //backgroundColor: editColor.val(),
            //textColor: '#ffffff',
            allDay: false,
            deptCode : editDeptCode.val(),
            empNo : editEmpNo.val()
        };

        if (eventData.start > eventData.end) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

//        if (editAllDay.is(':checked')) {
//            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
//            //render시 날짜표기수정
//            //eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
//            //DB에 넣을때(선택)
//            eventData.end = moment(eventData.end).format('YYYY-MM-DD');
//            
//            eventData.allDay = true;
//        }
        
        if (editAllDay.is(':checked')) {
        	
        	console.log(editAllDay.val());
        	console.log("checked됨으로 넘어옴");

        	eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //eventData.end = moment(eventData.end).format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            //eventData.end = moment(eventData.end).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        //$("#calendar").fullCalendar('renderEvent', eventData, true);
        
        Swal.fire({
		    title: "일정을 등록하시겠습니까?",
		    icon: "question",
		    showCancelButton: true,
		    confirmButtonText: "확인",
		    cancelButtonText: "취소",
		    customClass: {
		     confirmButton: "btn btn-primary"
		    },
		    reverseButtons: true
		}).then(function(result) {
			if (result.value) {
				eventModal.find('input, textarea').val('');
				editAllDay.prop('checked', false);
				eventModal.modal('hide');
				//새로운 일정 저장
		        $.ajax({
		            type: "POST",
		            url:"/mz/cal/regist",  
		            data: JSON.stringify(eventData),
		            contentType:"application/json",
		            success:function(result){
		                    Swal.fire({
		                     title: "일정이 등록되었습니다.",
		                     icon: "success",
		                     buttonsStyling: false,
		                     confirmButtonText: "확인",
		                     customClass: {
		                      confirmButton: "btn btn-primary font-weight-bolder",
		                     }
		                    }).then((result) => {
		                         window.close();
		                      })
		                   
		                    $('#calendar').fullCalendar('removeEvents');
		                    $('#calendar').fullCalendar('refetchEvents');
		    		},
		    		error:function(error){
		    			Swal.fire({
			                  title: "문제가 발생했습니다.",
			                  text: "관리자에게 문의하여 주세요",
			                  icon: "error",
			                  confirmButtonText: "확인",
			                  customClass: {
			                   confirmButton: "btn btn-primary"
			                  }
			              })		
		    		},
		    		complete:function(){
		    			$('#eventModal').modal('hide');
		    		}
		        });
			} else if (result.dismiss === "cancel") {
				return
		    };
	    });
	});
}