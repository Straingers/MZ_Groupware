<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>업무 양식 수정</title>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container">
        	<div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">업무 양식 수정</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소하기
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="fn_modify();">
                                <i class="ki ki-check icon-xs"></i>수정하기
                            </button>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <form method="post" action="<%=request.getContextPath()%>/admin/task/report/template/modify.do" name="registForm">
                    	<input type="hidden" name="taskDocId" value="${resultBean.taskDocId}"/>
                        <div class="form-group row">
                            <label for="taskDocName" class="col-2 col-form-label">제 목</label>
                            <div class="col-10">
                                <input id="taskDocName" name="taskDocName" type="text" class="form-control" value="<c:out value="${resultBean.taskDocName}" />" />
                            </div>
                        </div>
                        <div class="form-group row">
                        	<label for="taskDocType" class="col-2 col-form-label">업무유형</label>
                        	<input type="hidden" id="taskDocType" value="${resultBean.taskDocType}">
							<div class="col-10">
								<div class="radio-inline">
								    <label class="radio">
								        <input type="radio" id="daily" name="taskDocType" value="일일보고"/>
								        <span></span>
								        일일보고
								    </label>
								    <label class="radio">
								        <input type="radio" id="weekly" name="taskDocType" value="주간보고"/>
								        <span></span>
								        주간보고
								    </label>
								    <label class="radio">
								        <input type="radio" id="monthly" name="taskDocType" value="월간보고"/>
								        <span></span>
								        월간보고
								    </label>
								</div>
							</div>
                        </div>
                        <div class="form-group row">
                        	<label for="taskDocType" class="col-2 col-form-label">사용여부</label>
                        	<input type="hidden" id="isUse" value="${resultBean.isUse}">
							<div class="col-10">
								<div class="radio-inline">
								    <label class="radio">
								        <input id="isUseY" type="radio" name="isUse" value="Y"/>
								        <span></span>
								        사용
								    </label>
								    <label class="radio">
								        <input id="isUseN" type="radio" name="isUse" value="N"/>
								        <span></span>
								        미사용
								    </label>
								</div>
							</div>
                        </div>
                        <div class="form-group row">
                            <label for="taskContent" class="col-2 col-form-label">내용</label>
                            <div class="col-10">
                                <textarea id="taskContent" name="taskContent" style="display: none;"></textarea>
                                <div class="summernote" id="kt_summernote_1">${resultBean.taskContent}</div>
                            </div>
                        </div>
                    </form>
                </div><!-- card-body -->
            </div><!-- card -->
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
  $('body').removeClass(
    'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
  );// 카드 상단 공백 제거 용
  
	if($('#isUse').val() == 'Y') {
	 $('#isUseY').prop('checked', true);
	} else {
	 $('#isUseN').prop('checked', true);
	}
  
  	if($('#taskDocType').val() == '일일보고') {
  	 $('#daily').prop('checked', true);
  	} else if($('#taskDocType').val() == '주간보고') {
  	 $('#weekly').prop('checked', true);
  	} else {
  	 $('#monthly').prop('checked', true);
  	}
	 
  function fn_modify(){
        $("#taskContent").val($(".summernote").summernote("code"));
   		document.registForm.submit();
   	}

</script>
</body>
