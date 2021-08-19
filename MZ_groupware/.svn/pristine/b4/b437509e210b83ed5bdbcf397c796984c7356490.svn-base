<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/summernote/summernote.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
						<h3 class="card-label">경조사게시글 작성</h3>
					</div>
					<div class="card-toolbar">
					
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">닫기</button>
							<button type="button" class="btn btn-primary font-weight-bolder"onclick="regist_go();">등록</button>
					
					</div>
				</div>
				<!--begin::Form-->
				<div class="card-body">
					<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/board/regist.do" name="registForm">
						<input type="hidden" id="communityCode" name="communityCode" value="M050500" />
						<input type="hidden" id="empNo" name="empNo" value="${loginUser.empNo}" />
						<div class="form-group row">
							<label for="commTitle" class=" col-2 col-form-label">제목</label>
							<div class="col-10">
								<input class="form-control" type="text" id="commTitle" name="commTitle">
							</div>
						</div>
						
						<div class="form-group mb-1">
							<textarea id="commContent" name="commContent" style="display: none;"></textarea>
							<div class="summernote" id="kt_summernote_1" style="display: none;"></div>
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
							</div>
						</div>
						
						
					</form>
				</div><!-- card-body -->
				
			</div>
		</div>
	</div>
</div>



<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
	
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
   		
   		if($("input[name='commTitle']").val()==""){
   			alert("제목은 필수입니다.");
   			$("input[name='commTitle']").focus();
   			return;
   		}
	   	// textarea에 입력 내용 삽입
			$("#commContent").val($(".summernote").summernote("code"));
   		document.registForm.submit();	
   	}
   
</script>
</body>