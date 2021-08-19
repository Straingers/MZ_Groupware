<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>회사내규 작성</title>
    <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
</head>
<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">회사내규 작성</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소하기
                        </button>
                        <button type="button" class="btn btn-primary font-weight-bolder" onclick="regist_go();">
                            <i class="ki ki-check icon-xs"></i>등록하기
                        </button>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <form enctype="multipart/form-data" method="post" name="registForm">
                        <div class="form-group row">
                            <label for="officeTitle" class="col-2 col-form-label text-center">제목</label>
                            <div class="col-10">
                                <input id="officeTitle" name="officeTitle" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center">작성자</label>
                            <div class="col-10">
		                        <div class="form-control" style="display: flex;align-items: center;font-weight: bold;" disabled>${emp.empName}</div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <textarea id="officeContent" name="officeContent" style="display: none;"></textarea>
                                <div class="summernote" id="kt_summernote_1"></div>
                            </div>
                        </div>
						<div class="card card-custom card-stretch" style="border: 1px solid #E4E6EF;">
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
                            <div class="card-body fileInput">
                            <input type="hidden" name="cloudNoStr" id="cloudNoStr"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- card-body -->
        </div><!-- card -->
    </div>
</div>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<%@ include file="/WEB-INF/views/cloud/boardCloudList.jsp" %>



<script>

function regist_go() {
	var formObj = $("form[name=registForm]");
	$("#officeNo").val(${office.officeNo});
	if($("input[name='noticeTitle']").val()==""){
		alert(input.name+"은 필수입니다.");
	      $("input[name='noticeTitle']").focus();
	      return;
	}
	
	// textarea에 입력 내용 삽입
	$("#officeContent").val($(".summernote").summernote("code"));
	
	if($("[name='officeContent']").val() == "<p><br></p>"){
			alert("내용은 필수입니다.");
			$("[name='officeContent']").focus();
			return;
		}
	formObj.attr({
		"action":"regist.do"
		, "method":"post"
	});
	formObj.submit();
}

$('#addFileBtn').on('click',function(event){

	var inputFile=$('input[name="uploadFile"]').length;
	var attachCount=inputFile;
		
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
  		var div=$('<div>').addClass("inputRow");
  		div.append(input).append("<button style='border:0;ouline:0;' class='label label-rounded label-danger' type='button'>X</button>");
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


</script>
</body>
