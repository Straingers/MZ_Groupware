<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/summernote/summernote.css" rel="stylesheet" type="text/css" />

<style>
	.swal2-popup .btn {
     margin: 0px 5px 0;
		}
</style>
</head>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content" style="padding: 0px;">
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
						<h3 class="card-label">공지사항 작성</h3>
					</div>
					<div class="card-toolbar">
						<button class="btn btn-sm btn-light font-weight-bolder mr-2" id="btnOp" onclick="fn_operate();">
                           AUTO
                        </button>
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="window.close();">
							<i class="ki ki-long-arrow-back icon-xs"></i>취소하기</button>
							<button type="button" class="btn btn-primary font-weight-bolder"onclick="regist_go();">
							<i class="ki ki-check icon-xs"></i>등록하기</button>
					
					</div>
				</div>
				<!--begin::Form-->
					<div class="card-body">
						<form enctype="multipart/form-data" role="form" method="post"
							action="<%=request.getContextPath()%>/notice/regist.do"
							name="registForm">
							<input type="hidden" id="empNo" name="empNo"
								value="${loginUser.empNo}" />

							<div class="form-group row">
								<label for="noticeTitle" class=" col-2 col-form-label">제목 : </label>
								<div class="col-10">
									<input class="form-control" type="text" id="noticeTitle"
										name="noticeTitle">
								</div>
							</div>

							<div class="form-group row">
								<label for="noticePopup" class=" col-2 col-form-label">팝업 : </label>
								<div class="col-1">
									<span class="switch switch-sm switch-icon" id="switch" onchange="popupCheck();">
										<label id="noticePopup"> 
											<input type="checkbox" name="noticePopup" value="Y" > <span></span>
										</label>
									</span>
								</div>
								<div class="col-6">
									<div class="input-daterange input-group" id="kt_datepicker_5">
										<input type="text" class="form-control" name="noticeStartdate" disabled="disabled">
										<div class="input-group-append">
											<span class="input-group-text"> ~ </span>
										</div>
										<input type="text" class="form-control" name="noticeEnddate" disabled="disabled">
									</div>

								</div>
							</div>

							<div class="form-group row">
								<label for="noticePopup" class=" col-2 col-form-label">상단공지 : </label>
								<div class="col-1" style="text-align: center;">
									<span class="switch switch-sm switch-icon"> <label>
											<input type="checkbox" name="noticeImportant" value="Y">
											<span></span>
									</label>
									</span>
								</div>
							</div>


							<div class="form-group mb-1">
								<textarea style="display: none;"></textarea>
								<div class="summernote" id="kt_summernote_1"
									style="display: none;"></div>
							</div>


							<div class="card card-custom" style="border: 1px solid #E4E6EF;">
					    <div class="card-header">
					        <div class="card-title">
					            <h3 class="card-label">파일 첨부</h3>
					        </div>
					        
					        <div class="uppy" id="kt_uppy_1">
					            <div class="uppy-Root" dir="ltr">
					                <div class="uppy-Dashboard uppy-Dashboard--animateOpenClose uppy-size--height-md uppy-Dashboard--isInnerWrapVisible" data-uppy-theme="light" data-uppy-num-acquirers="4" data-uppy-drag-drop-supported="true" aria-hidden="false" aria-label="File Uploader">
					                    <div class="uppy-Dashboard-overlay" tabindex="-1"></div>
					                    <div class="uppy-Dashboard-inner" style="width: 100%; background-color: white; border: 0px;">
					                        <div class="uppy-Dashboard-innerWrap">
					                            <div class="uppy-Dashboard-AddFiles">
			                                        <div class="uppy-Dashboard-AddFiles-list float-left" role="tablist">
			                                            <!-- 로컬 파일 -->
														<button class="btn btn-primary" onclick="addFile_go();" type="button" id="addFileBtn" style="width: 110px;">
														    <i class="fas fa-folder-open"></i>LOCAL
														</button>
		                                                <!-- 클라우드 파일 -->
														<button class="btn btn-primary" onclick="" type="button" id="addCloudBtn" style="width: 110px;" data-toggle="modal" data-target="#cloudModal">
														    <i class="fas fa-cloud"></i>CLOUD
														</button>
				                                    </div>
				                                    <div class="uppy-Dashboard-progressindicators">
			                                        	<div class="uppy-StatusBar is-waiting" aria-hidden="true">
			                                            	<div class="uppy-StatusBar-progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="width: 0%;"></div>
				                                            <div class="uppy-StatusBar-actions"></div>
				                                        </div>
				                                        <div class="uppy uppy-Informer" aria-hidden="true">
				                                            <p role="alert"></p>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
					    </div>
						<div class="card-footer fileInput">
                           <input type="hidden" name="cloudNoStr" id="cloudNoStr"/></div>
						</div>
					</form>
				</div>
					<!-- card-body -->
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<%@ include file="/WEB-INF/views/cloud/boardCloudList.jsp" %>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-datepicker.js"></script>
<script>
	function fn_operate(){
		$('#btnOp').hide();
		$("input[name='noticeTitle']").val('코로나19관련 방역수칙 준수사항 공지');
		$(".summernote").summernote("code", '<p><img src="/mz/getImg.do?fileName=7f4c883e8f3f4771bca4fc677a6ab0a3..jpg" style="width: 598px;"><br></p>');
	}

	$(document).ready(function(){
	});
		
	function popupCheck(){
			// 공지사항 팝업 개수 파악
			$.ajax({
		       type: "POST",
		       url:"<%=request.getContextPath()%>/board/notice/popupCount",
		       success: function (data) {
					if(data == "false"){
						alert("팝업 공지는 2개까지 등록할 수 있습니다.")
						$("input[name='noticePopup']").prop('checked', false);
						return;
					}
					
					if ($("input[name='noticePopup']").prop('checked')) {
						$("input[name='noticeStartdate']").prop('disabled', false); 
						$("input[name='noticeEnddate']").prop('disabled', false); 
					} else {
						$("input[name='noticeStartdate']").prop('disabled', true); 
						$("input[name='noticeEnddate']").prop('disabled', true); 
					}
		       },error:function(error){
		       	alert("시스템 점검중입니다. 관리자에게 문의하세요");		
				}
		   });
		};
	
	

	$('body').removeClass(
			'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
	);// 카드 상단 공백 제거 용
   	function addFile_go(){
   		console.log("test");
   		//alert("click addFile btn");
   		if($('input[name="uploadFile"]').length >=5){
   			alert("파일추가는 5개까지만 가능합니다.");
   			return;
   		}
   		
   		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
   		var div=$('<div>').addClass("inputRow");
   		div.append(input).append("<button style='border:0;outline:0;' class='label label-rounded label-danger' type='button'>X</button>");    		   		
   		$('.fileInput').append(div);
   	}
   	
   	function regist_go(){
   		var files = $('input[name="uploadFile"]');
   		for(var file of files){
   			console.log(file.name+" : "+file.value);
   			if(file.value==""){
   				alert("파일을 선택하세요.");
   				file.focus();
   				file.click();
   				return;
   			}
   		}	
   		
   		if($("#noticeTitle").val() == ""){
   			alert("제목은 필수입니다.");
   			$("input[name='noticeTitle']").focus();
   			return;
   		}
   		
   		if($("input[name='noticePopup']").is(":checked")){
	    	if($("input[name='noticeStartdate']").val()==""){
	    		alert("팝업알림 시작일 선택은 필수입니다.");
	 	      $("input[name='noticeStartdate']").focus();
	 	      return;
	    	}
	    	if($("input[name='noticeEnddate']").val()==""){
	    		alert("팝업알림 종료일 선택은 필수입니다.");
	 	      $("input[name='noticeEnddate']").focus();
	 	      return;
	    	}
    	}
   		
   		$('.note-codable').attr('name', 'noticeContent');
	   	// textarea에 입력 내용 삽입
		$("[name='noticeContent']").text($(".summernote").summernote("code"));

	   	if($("[name='noticeContent']").text() == "<p><br></p>"){
   			alert("내용은 필수입니다.");
   			$("[name='noticeContent']").focus();
   			return;
   		}
	   	
	   	Swal.fire({
		    title: "공지사항을 등록하시겠습니까?",
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
		   		document.registForm.submit();	
		    } else if (result.dismiss === "cancel") {
				return;
		    }
		});
   	}
   	
   
</script>
</body>