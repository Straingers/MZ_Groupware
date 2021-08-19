<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<head>
	<style>
		.datepicker.datepicker-inline {
    		 border: none; 
		}
	
		.datepicker {
			width : 100%;
			padding: 0px;
			border-radius: 0.42rem;
		}
		
		.gutter-b {
			margin-bottom: 0px;
		}
		
		.card.card-custom {
		  -webkit-box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
		  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
		  border: 0;
		}
		
		.swal2-popup .btn {
 		   margin: 0px 5px 0;
		}
		
	</style>
	
</head>
<body>

<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 md-0">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
			오피스룸 > 시설예약</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->
	<div class="content d-flex flex-column flex-column-fluid"
		id="kt_content" style="padding: 0px; ">
		<div class="d-flex flex-column-fluid">
			<!--begin::Container-->
			<div class="container col-12">
				<div class="row">
					<div class="col-md-3"> 
						<div class="card card-custom gutter-b example example-compact" style="padding-bottom: 20px;">	
							<div class="card card-custom card-stretch gutter-b">
								<div class="card-header border-0">
									<h3 class="card-title font-weight-bolder text-dark">예약일</h3>
								</div>
								<div class="card-body pt-2">
									<div class="input-group" id="kt_datepicker_6">
										<input type="hidden" class="form-control" id="date" />
									</div>
								</div>
							</div>
						</div>
						<!--end::Card-->

						<!--begin::Card-->
						<div class="card card-custom gutter-b example example-compact">
						<div class="card card-custom card-stretch gutter-b">
											<!--begin::Header-->
											<div class="card-header border-0" >
												<h3 class="card-title font-weight-bolder text-dark">예약시설</h3>
											</div>
											<!--end::Header-->
											<!--begin::Body-->
											<div class="card-body pt-2">
											<input type="hidden" id="placeDate" name="placeDate" value="" />
												<!--begin::Item-->
												<div class="d-flex align-items-center">
													<!--begin::Bullet-->
													<span class="bullet bullet-bar bg-success align-self-stretch"></span>
													<!--end::Bullet-->
													<!--begin::Checkbox-->
													<label class="checkbox checkbox-lg checkbox-light-success checkbox-inline flex-shrink-0 m-0 mx-4">
														<input type="checkbox" value="100" id="talkingRoom" name="checkSelect"  onclick="oneCheckbox(this);" >
														<span></span>
													</label>
													<!--end::Checkbox-->
													<!--begin::Text-->
													<div class="d-flex flex-column flex-grow-1">
														<span class="text-dark-75 font-weight-bold font-size-lg mb-1">회의실</span>
														<span class="text-muted font-weight-bold">수용인원 50명</span>
													</div>
													<!--end::Text-->
													
												</div>
												<!--end:Item-->
												<!--begin::Item-->
												<div class="d-flex align-items-center mt-10">
													<!--begin::Bullet-->
													<span class="bullet bullet-bar bg-primary align-self-stretch"></span>
													<!--end::Bullet-->
													<!--begin::Checkbox-->
													<label class="checkbox checkbox-lg checkbox-light-primary checkbox-inline flex-shrink-0 m-0 mx-4">
														<input type="checkbox" value="200" id="partyRoom" name="checkSelect"  onclick="oneCheckbox(this);">
														<span></span>
													</label>
													<!--end::Checkbox-->
													<!--begin::Text-->
													<div class="d-flex flex-column flex-grow-1">
														<span class="text-dark-75 font-weight-bold font-size-lg mb-1">세미나실</span>
														<span class="text-muted font-weight-bold">수용인원 100명</span>
													</div>
													<!--end::Text-->
												</div>
												<!--end::Item-->
											</div>
											<!--end::Body-->
										</div>
						</div>
						<!--end::Card-->
					</div>

					<div class="col-md-9">
						<div class="card card-custom gutter-b example example-compact" style="width: 100%;" >
							<div id="res">
							
							
							
								<div class="card card-custom card-stretch gutter-b">
											<!--begin::Header-->
											<div class="card-header border-0 py-5" >
												<h3 class="card-title align-items-start flex-column">
													<span class="card-label font-weight-bolder text-dark">신청 현황</span>
												</h3>
<!-- 												<div class="card-toolbar"> -->
<!-- 													<button data-toggle="modal" data-target="#myModal" class="btn btn-primary font-weight-bolder font-size-sm" onclick="TimeListSetting();">예약신청</button> -->
<!-- 												</div> -->
											</div>
											<!--end::Header-->
											<!--begin::Body-->
											<div class="card-body pt-0 pb-3">
												<div class="tab-content">
													<!--begin::Table-->
													<div class="table-responsive">
														<table class="table table-head-custom table-head-bg table-borderless table-vertical-center">
															<thead>
																<tr class="text-left text-uppercase" style="border-bottom: 1px solid #CFCFCF;">
																	<th style="min-width: 120px; text-align: center;">
																		<span class="text-dark-75">사용시간</span>
																	</th>
																	<th style="min-width: 100px; text-align: center;">
																		<span class="text-dark-75">신청부서</span>
																	</th>
																	<th style="min-width: 100px; text-align: center;">
																		<span class="text-dark-75">신청직원</span>
																	</th>
																	<th style="min-width: 100px; text-align: center;">
																		<span class="text-dark-75">상태</span>
																	</th>
																</tr>
															</thead>
															<tbody id="resdate"></tbody>
														</table>
													</div>
													<!--end::Table-->
												</div>
											</div>
											<!--end::Body-->
										</div>
										
										
							</div>
						</div>
					</div>
				</div>
				<!--end::Container-->
			</div>
			<!--end::Entry-->
		</div>
	</div>

<input type="hidden" name="edit-empNo" id="edit-empNo"  value="${loginUser.empNo }" />

<script>

// checkbox 하나 선택
	function oneCheckbox(a) {
		var obj = document.getElementsByName("checkSelect");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != a) {
				obj[i].checked = false;
			}
		}
	}
	
	function KTBootstrapDatepicker() {

	    var arrows;
	    if (KTUtil.isRTL()) {
	        arrows = {
	            leftArrow: '<i class="la la-angle-right"></i>',
	            rightArrow: '<i class="la la-angle-left"></i>'
	        }
	    } else {
	        arrows = {
	            leftArrow: '<i class="la la-angle-left"></i>',
	            rightArrow: '<i class="la la-angle-right"></i>'
	        }
	    }
	    
	    // Private functions
	    var demos = function () {
	    	 
	    	
	    	// inline picker
	        $('#kt_datepicker_6').datepicker({
	            rtl: KTUtil.isRTL(),
	            todayHighlight: true,
	            templates: arrows,
	            format: 'yyyy-mm-dd',
	            language:'kr',
// 	            startDate: 'today'
	        });
	    }
	    return demos(); 
	}
	
	
$(document).ready(function(){
	
	//datepicker 실행
		KTBootstrapDatepicker();
	
	//오늘 날짜 설정
		today = new Date();
		today = today.toISOString().slice(0, 10);
		 $('#date').val(today);
		 
		 $("#talkingRoom").prop("checked", true);
	
		
	// 실행시 list 조회
	 $("input[name='checkSelect']").each(function() {
         if ($(this).is(":checked")) {
        	 var placedata = $(this).val();
			 $('#placeDate').val(placedata);
         }
     });

	listSearch();
		 
		 
	// 날짜 선택
	$("#date").on("propertychange change keyup paste input", function(){
		listSearch();
	});	
		
	// 장소 선택		
		$("input[type='checkbox']").on('click',function(){
			if($("input[type='checkbox']").is(":checked")){
				var data = $(this).val();
				$('#placeDate').val(data);
	 		}
			listSearch();
		});	
	});		
	
	
function removeRes(resStartdate,empNo,resDate,roomNo){
	Swal.fire({
	    title: "예약을 삭제하시겠습니까?",
	    icon: "warning",
	    showCancelButton: true,
	    confirmButtonText: "삭제",
	    cancelButtonText: "취소",
	    customClass: {
	     confirmButton: "btn btn-primary"
	    },
	    reverseButtons: true
	}).then(function(result) {
	    if (result.value) {
	    	var eventData = {
	    			resStartdate: resStartdate,
	    			empNo: empNo,
	    			resDate: resDate,
	    			roomNo: roomNo
	    	       };
	    	$.ajax({
	    		   type: "POST",
	    		   url:"<%=request.getContextPath()%>/office/reserv/remove",
				   data : JSON.stringify(eventData),
				   contentType : "application/json",
				   success : function(data) {
						listSearch();
	
						Swal.fire({
							title : "예약삭제가 완료되었습니다.",
							icon : "success",
							confirmButtonText : "확인",
							customClass : {
								confirmButton : "btn btn-primary"
							}
						})
					},
					error : function(xhr) {
						Swal.fire({
							title : "문제가 발생했습니다.",
							text : "관리자에게 문의하여 주세요!!",
							icon : "error",
							confirmButtonText : "확인",
							customClass : {
								confirmButton : "btn btn-primary"
							}
						})
						listSearch();
					}
				});
			} else if (result.dismiss === "cancel") {
				listSearch();
			}
		});
}

function regist(resStartdate, resEnddate) {
    Swal.fire({
        title: "예약하시겠습니까?",
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "확인",
        cancelButtonText: "취소",
        customClass: {
            confirmButton: "btn btn-primary"
        },
        reverseButtons: true
    }).then(function (result) {
        if (result.value) {
            var eventData = {
                resDate: $("#date").val(),
                roomNo: $("#placeDate").val(),
                resStartdate: resStartdate,
                resEnddate: resEnddate
            };
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/office/reserv/regist",
                data: JSON.stringify(eventData),
                contentType: "application/json",
                success: function (data) {
                    listSearch();
                    Swal.fire({
                        title: "신청이 완료되었습니다.",
                        icon: "success",
                        buttonsStyling: false,
                        confirmButtonText: "확인",
                        customClass: {
                            confirmButton: "btn btn-primary font-weight-bolder"
                        }
                    })
                },
                error: function (xhr) {
                    Swal.fire({
                        title: "문제가 발생했습니다.",
                        text: "관리자에게 문의하여 주세요",
                        icon: "error",
                        confirmButtonText: "확인",
                        customClass: {
                            confirmButton: "btn btn-primary"
                        }
                    })
                    listSearch();
                }
            });
        } else if (result.dismiss === "cancel") {
            listSearch();
            ㅣ
        }
    });
}

function listSearch(){
	
	if($("#date").val() != "" && $("#placeDate").val() != ""){
		 var eventData = {
				 resDate: $("#date").val(),
				 roomNo: $("#placeDate").val()
	           };
		
		$.ajax({
	       type: "POST",
	       url:"<%=request.getContextPath()%>/office/reserv/list",
	       data: JSON.stringify(eventData),
	       contentType:"application/json",
	       success: function (data) {

	       	var source = $("#reservationListTemplate").html();
	           var template = Handlebars.compile(source);
	           var html = template(data.resTable);
	           
	           
	           $("#deleteDate").remove;
	           $("#resdate").html(html);
	           
	           var loginUser = $('#edit-empNo').val();
	           
	       	   $("button[name='complete" + loginUser + "']").css("display", "none");
	       	   $("button[name='modify" + loginUser + "']").css("display", "inline");
	         		
	       	 
	       },error:function(error){
	       	alert("시스템 점검중입니다. 관리자에게 문의하세요");		
			}
	   });
		
		
	}

	}
	
</script>

<script>
	
</script>

<script type="text/x-handlebars-template"  id="reservationListTemplate" >
{{#each .}}
{{#if timeOut}}
<tr id="deleteDate" style="cursor: default; left: 0px; border-bottom: 1px solid #CFCFCF; background-color: #F6F6F6;" >
	<td class="pl-7">
		<span class="font-weight-bolder d-block font-size-lg" style="color:#B4B4B4;">{{resStartdate}}~{{resEnddate}}</span>
	</td>
	<td>
		<span class="font-weight-bolder d-block font-size-lg" style="text-align: center; color:#B4B4B4;" name="deptName" value="{{deptName}}">{{deptName}}</span>
	</td>
	<td>
		<span class="font-weight-bolder d-block font-size-lg" style="text-align: center; color:#B4B4B4;">{{empName}}</span>
	</td> 
	<td class="font-weight-bolder d-block font-size-lg" style="text-align: center;">
		<button class="btn btn-light-danger font-weight-bolder font-size-sm" style="background-color: #FFCC97; color:#F29661; cursor: default;" disabled='disabled'>예약마감</button>
	</td>
</tr>
{{else}}
<tr id="deleteDate" name="{{resStartdate}}" style="left: 0px; border-bottom: 1px solid #CFCFCF;" >
	<td class="pl-7" >
			<span class="text-dark-75 font-weight-bolder d-block font-size-lg">{{resStartdate}}~{{resEnddate}}</span>
	</td>
	<td>
		<span class="text-dark-75 font-weight-bolder d-block font-size-lg" style="text-align: center;" name="deptName" value="{{deptName}}">{{deptName}}</span>
	</td>
	<td>
		<span class="text-dark-75 font-weight-bolder d-block font-size-lg" style="text-align: center;">{{empName}}</span>
	</td> 
	<td class="text-dark-75 font-weight-bolder d-block font-size-lg" style="text-align: center;">
		<button class="btn btn-light-danger font-weight-bolder font-size-sm" style="display: none;" value="{{empNo}}" name="modify{{empNo}}" onclick="removeRes('{{resStartdate}}' ,'{{empNo}}', '{{resDate}}', '{{roomNo}}');">예약취소</button>
		{{#if empNo}}
		<button class="btn btn-light-success font-weight-bolder font-size-sm" style="display: inline; pointer-events: none;" value="{{empNo}}" name="complete{{empNo}}">예약완료</button>
		{{else}}
		<button class="btn btn-light-primary font-weight-bolder font-size-sm" style="display: inline;" value="{{empNo}}" name="regist{{empNo}}" onclick="regist('{{resStartdate}}', '{{resEnddate}}');">예약신청</button>
		{{/if}}
	</td>
</tr>
{{/if}}
{{/each}}

</script>

</body>



