<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>동호회 게시글</title>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<!-- Main content -->
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">동호회 게시글 수정</h3>
					<div class="card-toolbar">
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="history.go(-1)">
							취소</button>
						<div class="btn-group">
							<button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="modify_submit();">
							수정</button>
						</div>
						
					</div>
				</div>
				<!--begin::Form-->
				<div class="card-body">
					<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/board/modify.do" name="modifyForm">
						<input type="hidden" id="commNo" name="commNo" value="${communityBoard.commNo}" />
						<input type="hidden" id="communityCode" name="communityCode" value="${communityBoard.communityCode}" />
						<input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" />
						<div class="form-group row">
							<label for="commTitle" class=" col-2 col-form-label">제목</label>
							<div class="col-10">
								<input class="form-control" type="text" id="commTitle" name="commTitle" value="${communityBoard.commTitle}" />
							</div>
						</div>
						
						<div class="form-group mb-1">
							<textarea id="commContent" name="commContent" value="test" style="display: none;"></textarea>
							<div class="summernote" id="kt_summernote_1" style="display: none;">${communityBoard.commContent}</div>
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
								<c:forEach items="${communityBoard.attachList}" var="attach">
									<div class="inputRow attach-item" style="margin-bottom: 5px;">
										<a class="text-dark text-hover-primary mb-1 font-size-lg"
											 name="attachedFile" 
                       attach-fileName="${attach.attachFilename}" 
                       attach-no="${attach.attachNo}" 
                       href="<%=request.getContextPath()%>/board/club/getFiles.do?attachNo=${attach.attachNo}" >
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
    
<script>
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
    	
    	if($("input[name='commTitle']").val()==""){
    		alert(input.name+"은 필수입니다.");
 	      $("input[name='commTitle']").focus();
 	      return;
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
			$("#commContent").val($(".summernote").summernote("code"));
   		form.submit();
    }
</script>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
</body>