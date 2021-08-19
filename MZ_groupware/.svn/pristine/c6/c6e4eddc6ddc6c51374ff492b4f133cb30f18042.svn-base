<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:formatDate var="noticeStartdate" value="${noticeBoard.noticeStartdate}" pattern="yyyy/MM/dd"/>
<fmt:formatDate var="noticeEnddate" value="${noticeBoard.noticeEnddate}" pattern="yyyy/MM/dd"/>

<title>공지사항 게시글</title>

<head>
	<style>
		.swal2-popup .btn {
 		   margin: 0px 5px 0;
		}
	</style>
</head>
<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content" style="padding: 0px;">
	<!-- Main content -->
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">공지사항 수정</h3>
					<div class="card-toolbar">
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="history.go(-1)">
							<i class="ki ki-long-arrow-back icon-xs"></i>취소하기</button>
						<div class="btn-group">
							<button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="modify_submit();">
							<i class="ki ki-check icon-xs"></i>수정하기</button>
						</div>
						
					</div>
				</div>
				<!--begin::Form-->
				<div class="card-body">
					<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/board/notice/modify.do" name="modifyForm">
						<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeBoard.noticeNo}" />
						<input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" />
						<div class="form-group row">
							<label for="noticeTitle" class=" col-2 col-form-label">제목</label>
							<div class="col-10">
								<input class="form-control" type="text" id="noticeTitle" name="noticeTitle" value="${noticeBoard.noticeTitle}" />
							</div>
						</div>
						
<!-- 						<div class="form-group row"> -->
<!-- 							<label for="noticePopup" class=" col-2 col-form-label">팝업</label> -->
<!-- 							<div class="col-1" style="text-align: center;"> -->
<!-- 								<span class="switch switch-sm switch-icon">  -->
<!-- 									<label> -->
<!-- 										<input type="checkbox" id="noticePopup" name="noticePopup" value="Y" > -->
<!-- 										<span></span> -->
<!-- 									</label> -->
<!-- 								</span>  -->
<!-- 							</div> -->
<!-- 							<div class="col-2"> -->
<%-- 								<input type="text" name = "noticeStartdate" value="${noticeBoard.noticeStartdate}"> --%>
<%-- 								<input type="text" name = "noticeEnddate" value="${noticeBoard.noticeEnddate}"> --%>
<!-- 							</div> -->
<!-- 							<div class="col-1"></div> -->

<!-- 							<label for="noticeImportant" class=" col-2 col-form-label">상단공지</label> -->
<!-- 							<div class="col-2"> -->
<!-- 								<span class="switch switch-sm switch-icon">  -->
<!-- 									<label> -->
<!-- 										<input type="checkbox" id="noticeImportant" name="noticeImportant" value="Y" > -->
<!-- 										<span></span> -->
<!-- 									</label> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</div>		 -->
						
						
						<div class="form-group row">
							<label for="noticePopup" class=" col-2 col-form-label">팝업</label>
							<div class="col-1" style="text-align: center;">
								<span class="switch switch-sm switch-icon" id="switch" onchange="popupCheck();"> 
									<label>
										<input type="checkbox"  id="noticePopup" name="noticePopup" value="Y">
										<span></span>
									</label>
								</span> 
							</div>
							<div class="col-9">
<!-- 								<input type="text" name = "noticeStartdate" value="2021/07/17">
								<input type="text" name = "noticeEnddate" value="2021/07/18"> -->
<!-- 									<div class="col-lg-4 col-md-9 col-sm-12"> -->
<!-- 										<div class="input-daterange input-group" id="kt_datepicker_5"> -->
<%-- 											<input type="text" class="" name="noticeStartdate" value="${noticeBoard.noticeStartdate}"> --%>
<!-- 											<div class="input-group-append"> -->
<!-- 												<span class="input-group-text"> <i -->
<!-- 													class="la la-ellipsis-h"></i> -->
<!-- 												</span> -->
<!-- 											</div> -->
<%-- 											<input type="text" class="form-control" name="noticeEnddate" value="${noticeBoard.noticeEnddate}"> --%>
<!-- 										</div> -->
<!-- 									</div> -->
										<div class="col-lg-4 col-md-9 col-sm-12">
													<div class="input-daterange input-group" id="kt_datepicker_5">
														<input type="text" class="form-control" name="noticeStartdate" value="${noticeStartdate}">
														<div class="input-group-append">
															<span class="input-group-text">
																~
															</span>
														</div>
														<input type="text" class="form-control" name="noticeEnddate" value="${noticeEnddate}">
													</div>
												</div>
									
									
							</div>
						</div>
						
							<div class="form-group row">
								<label for="noticePopup" class=" col-2 col-form-label">상단공지</label>
								<div class="col-1" style="text-align: center;">
									<span class="switch switch-sm switch-icon"> <label>
											<input type="checkbox" id="noticeImportant" name="noticeImportant" value="Y"> <span></span>
									</label>
									</span>
								</div>
							</div>
						
						
						
						
						
						<div class="form-group mb-1">
							<textarea id="noticeContent" name="noticeContent" value="test" style="display: none;"></textarea>
							<div class="summernote" id="kt_summernote_1" style="display: none;">${noticeBoard.noticeContent}</div>
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
														<button class="btn btn-primary" onclick="" type="button" id="addCloudBtn" style="width: 110px;">
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
								<c:forEach items="${noticeBoard.attachList}" var="attach">
									<div class="inputRow attach-item" style="margin-bottom: 5px;">
										<a class="text-dark text-hover-primary mb-1 font-size-lg"
											 name="attachedFile" 
                       attach-fileName="${attach.attachFilename}" 
                       attach-no="${attach.attachNo}" 
                       href="<%=request.getContextPath()%>/board/anony/getFiles.do?attachNo=${attach.attachNo}" >
                       ${attach.attachFilename}&nbsp;
											<button style="border:0;outline:0;" class="label label-rounded label-danger" type="button">X</button>
										</a>
									</div>
								</c:forEach>
							
							
							</div>
						</div>
						
						
						
					</form>
				</div><!-- card-body -->
			</div><!-- card -->
	</div>	
</div> 
</div>

<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-datepicker.js"></script>    
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-daterangepicker.js"></script>    
<script>
	$(document).ready(function(){
			var noticePopup = '${noticeBoard.noticePopup}';
			var noticeImportant = '${noticeBoard.noticeImportant}';
			
			if (noticePopup == 'Y') {
				$('#noticePopup').prop('checked', true); 
			} else {
				$('#noticePopup').prop('checked', false);
				$("input[name='noticeStartdate']").prop('disabled', true); 
				$("input[name='noticeEnddate']").prop('disabled', true); 
			}
			
			if (noticeImportant == 'Y') {
				$('#noticeImportant').prop('checked', true); 
			} else {
				$('#noticeImportant').prop('checked', false);
			}
		
		$("#switch").on('click',function(){
			if ($("input[name='noticePopup']").prop('checked')) {
				$("input[name='noticeStartdate']").prop('disabled', false); 
				$("input[name='noticeEnddate']").prop('disabled', false); 
			} else {
				$("input[name='noticeStartdate']").prop('disabled', true); 
				$("input[name='noticeEnddate']").prop('disabled', true); 
			}
		});
	});
		
		
	function popupCheck(){
		if ($("input[name='noticePopup']").is(":checked")) {
		// 공지사항 팝업 개수 파악
		$.ajax({
	       type: "POST",
	       url:"<%=request.getContextPath()%>/board/notice/popupCount",
	       success: function (data) {
				if(data == "false"){
					alert("팝업 공지는 2개까지 등록할 수 있습니다.")
					$("input[name='noticePopup']").prop('checked', false);
					$("input[name='noticeStartdate']").prop('disabled', true); 
					$("input[name='noticeEnddate']").prop('disabled', true); 
					return;
				
					if ($("input[name='noticePopup']").prop('checked')) {
						$("input[name='noticeStartdate']").prop('disabled', false); 
						$("input[name='noticeEnddate']").prop('disabled', false); 
					} 
				}
	       },error:function(error){
	       	alert("시스템 점검중입니다. 관리자에게 문의하세요");		
			}
	   });
	}
	};
		


 	$('body').removeClass(
 			'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
 	);// 카드 상단 공백 제거 용
	    	
  	$('a[name="attachedFile"] > button').click(function(event){ // 동적으로 생긴 태그가 아니므로 바로 이벤트 적용 가능.
  		var parent = $(this).parent('a[name="attachedFile"]'); // a tag
			alert(parent.attr("attach-fileName")+"파일을 삭제합니다.");
			
			var attachNo = parent.attr("attach-no");
			
			$(this).parents('div.attach-item').remove();
			
			var input = $('<input>').attr({"type":"hidden",
																		 "name":"deleteFile",
																		 "value":attachNo});
			$('form[role="form"]').prepend(input);
			return false; // 파일 다운로드를 막기위해 설정
		});
	  		
		$('#addFileBtn').on('click',function(event){

			var attachedFile=$('a[name="attachedFile"]').length;
			var inputFile=$('input[name="uploadFile"]').length;
			var attachCount=attachedFile+inputFile;
				
			if(attachCount >= 5){
				alert("파일 추가는 5개까지만 가능합니다.");
				return;
			}	
			
			var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
   		var div=$('<div>').addClass("inputRow");
   		div.append(input).append("<button style='border:0;outline:0;' class='label label-rounded label-danger' type='button'>X</button>");
   		div.appendTo('.fileInput');
		});
	  		
	 	$('div.fileInput').on('click','div.inputRow > button',function(event){
	 		$(this).parent('div.inputRow').remove();
	 	});
			 	
 		$('.fileInput').on('change','input[type="file"]',function(event){
 		if(this.files[0].size>1024*1024*40){
 			alert("파일 용량이 40MB를 초과하였습니다.");
 			this.value="";
 			$(this).click();		 			
 			return false;
 		} 
   	});
 		
    function modify_submit(){
    	var form=document.modifyForm;
    	console.log(form);
    	
    	if($("input[name='noticeTitle']").val()==""){
    		alert(input.name+"은 필수입니다.");
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
   	   
	  	// textarea에 입력 내용 삽입
			$("#noticeContent").val($(".summernote").summernote("code"));
	  	
			if($("[name='noticeContent']").val() == "<p><br></p>"){
	   			alert("내용은 필수입니다.");
	   			$("[name='noticeContent']").focus();
	   			return;
	   		}
	  	
		Swal.fire({
		    title: "공지사항을 수정하시겠습니까?",
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
		    	form.submit();
		    } else if (result.dismiss === "cancel") {
				return;
		    }
		});
    }
</script>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
</body>