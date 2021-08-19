/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view, callback) {

	//삭제
	console.log(event);

	var editDeptCode = $("#edit-deptCode").val();
	var eventTypeCode = event.deptCode;
	
	editDeptCode = editDeptCode.substring(0,1) + "00";
	
	console.log(editDeptCode);
	console.log(eventTypeCode);
	
	
	$('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

//    if (event.allDay === true && event.end !== event.start) {
//        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'));
//        //editEnd.val(moment(event.end).hours('23').minutes('59').format('YYYY-MM-DD HH:mm'));
//    } else {
//        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
//    }
    
    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }
    
    

    if (editDeptCode == eventTypeCode || eventTypeCode== 2 ) {
	    
    	modalTitle.html('일정 상세보기');
    	editTitle.val(event.title).attr("disabled", false);
    	if (editAllDay.is(":disabled")){
    		editAllDay.attr("disabled", false);
    	}
    	if ( event.allDay === true) {
    		
    		var start = editStart.val().split(" ")[0];
    	    var end = editEnd.val().split(" ")[0];
    	    
//    	    if(start !== end){
//    	     	editAllDay.attr("disabled", true);
//    	    }
    	    
	    	editStart.val(event.start.format('YYYY-MM-DD HH:mm')).attr("disabled", true);
	    	editEnd.val(event.end.format('YYYY-MM-DD HH:mm')).attr("disabled", true);
    		
    	    
    	}else if (event.allDay === false) {
    		editStart.val(event.start.format('YYYY-MM-DD HH:mm')).attr("disabled", false);
        	editEnd.val(event.end.format('YYYY-MM-DD HH:mm')).attr("disabled", false);
		}
    	editType.val(event.type).attr("disabled", false);
    	editPlace.val(event.place).attr("disabled", false);
    	editDesc.val(event.description).attr("disabled", false);
    	editColor.val(event.backgroundColor).css('color', event.backgroundColor).attr("disabled", false);
    	
    	addBtnContainer.hide();
    	modifyBtnContainer.show();
    	closeBtn.hide();
    	eventModal.modal('show');
    } else if (editDeptCode != eventTypeCode) {
	
    	modalTitle.html('일정 상세보기');
    	editTitle.val(event.title).attr("disabled", true);
    	editStart.val(event.start.format('YYYY-MM-DD HH:mm')).attr("disabled", true);
    	editEnd.val(event.end.format('YYYY-MM-DD HH:mm')).attr("disabled", true);
    	editAllDay.attr("disabled", true);
    	editType.val(event.type).attr("disabled", true);
    	editPlace.val(event.place).attr("disabled", true);
    	editDesc.val(event.description).attr("disabled", true);
    	editColor.val(event.backgroundColor).css('color', event.backgroundColor).attr("disabled", true);
    	
    	addBtnContainer.hide();
    	modifyBtnContainer.hide();
    	closeBtn.show();
    	eventModal.modal('show');
    }
   
	

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

    	 //$("#calendar").fullCalendar('updateEvents', $(this).data('id'));
    	 
        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;
        
        var start = editStart.val().split(" ")[1];
    	var end = editStart.val().split(" ")[1];
    	
    	console.log(start);
    	console.log(end);

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            if (!end){
            	displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
            }else{
            	 displayDate = endDate;
            }
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');
       
        
        var eventData = {
                _id: event._id,
                title: editTitle.val(),
                start:  startDate,
                end: displayDate,
                place:  editPlace.val(),
                description: editDesc.val(),
                type: editType.val(),
                //username: '사나',
                //backgroundColor: event.backgroundColor,
                //textColor: '#ffffff',
                allDay: statusAllDay,
                deptCode : editDeptCode,
                empNo : $("#edit-empNo").val()
            };
        
        
        
        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        
        //$("#calendar").fullCalendar('updateEvent', event);

        Swal.fire({
		    title: "일정을 수정하시겠습니까?",
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
        //일정 업데이트
        $.ajax({
            type: "POST",
            url:"/mz/cal/update",
            data: JSON.stringify(eventData),
            contentType:"application/json",
            success: function (response) {
                Swal.fire({
                    title: "일정 수정이 완료되었습니다.",
                    icon: "success",
                    buttonsStyling: false,
                    confirmButtonText: "확인",
                    customClass: {
                     confirmButton: "btn btn-primary font-weight-bolder",
                    }
                   }).then((result) => {
                        window.close();
                        window.location.reload();
                     })
            },error:function(error){
            	Swal.fire({
	                  title: "문제가 발생했습니다.",
	                  text: "관리자에게 문의하여 주세요",
	                  icon: "error",
	                  confirmButtonText: "확인",
	                  customClass: {
	                   confirmButton: "btn btn-primary"
	                  }
	              })	
    		}
        });
        $("#calendar").fullCalendar('updateEvent', event);
    }else if (result.dismiss === "cancel") {
    	return;
    }
});
    });
        



// 삭제버튼
    $('#deleteEvent').unbind();
    $('#deleteEvent').on('click', function () {
    	
    	$('#deleteEvent').unbind();
    	//$("#calendar").fullCalendar('removeEvents', $(this).data('id'));
    	eventModal.modal('hide');
    	
    	var id = $(this).data('id');
    	
    	var eventData = {
    			_id: id
    	};
    	
    	Swal.fire({
		    title: "일정을 삭제하시겠습니까?",
		    icon: "warning",
		    showCancelButton: true,
		    confirmButtonText: "확인",
		    cancelButtonText: "취소",
		    customClass: {
		     confirmButton: "btn btn-primary"
		    },
		    reverseButtons: true
		}).then(function(result) {
			if (result.value) {
    	//삭제시
    	$.ajax({
    		type: "POST",
    		url: "/mz/cal/delete",
    		data: JSON.stringify(eventData),
    		contentType:"application/json",
    		success: function (response) {
    			 Swal.fire({
                     title: "일정을 삭제하였습니다.",
                     icon: "success",
                     buttonsStyling: false,
                     confirmButtonText: "확인",
                     customClass: {
                      confirmButton: "btn btn-primary font-weight-bolder",
                     }
                    }).then((result) => {
                         window.close();
                         window.location.reload();
                         //$("#calendar").fullCalendar('deleteEvent', event);
                      })
    		},error:function(error){
    			Swal.fire({
	                  title: "문제가 발생했습니다.",
	                  text: "관리자에게 문의하여 주세요",
	                  icon: "error",
	                  confirmButtonText: "확인",
	                  customClass: {
	                   confirmButton: "btn btn-primary"
	                  }
	              })	
    		}
    	});
			} else if (result.dismiss === "cancel") {
				return
		    };
		});
    });
}
