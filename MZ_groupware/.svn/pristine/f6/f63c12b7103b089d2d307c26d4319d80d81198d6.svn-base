<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>업무 양식</title>

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
                    <h3 class="card-title">업무 양식 등록</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소하기
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary font-weight-bolder" onclick="regist_go();">
                                <i class="ki ki-check icon-xs"></i>등록하기
                            </button>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <form method="post" action="<%=request.getContextPath()%>/admin/task/report/template/regist.do" name="registForm">
                        <div class="form-group row">
                            <label for="taskDocName" class="col-2 col-form-label">제 목</label>
                            <div class="col-10">
                                <input id="taskDocName" name="taskDocName" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                        	<label for="taskDocType" class="col-2 col-form-label">업무유형</label>
							<div class="col-10">
								<div class="radio-inline">
								    <label class="radio">
								        <input type="radio" name="taskDocType" value="일일보고" checked/>
								        <span></span>
								        일일보고
								    </label>
								    <label class="radio">
								        <input type="radio" name="taskDocType" value="주간보고"/>
								        <span></span>
								        주간보고
								    </label>
								    <label class="radio">
								        <input type="radio" name="taskDocType" value="월간보고"/>
								        <span></span>
								        월간보고
								    </label>
								</div>
							</div>
                        </div>
                        <div class="form-group row">
                        	<label for="taskDocType" class="col-2 col-form-label">사용여부</label>
							<div class="col-10">
								<div class="radio-inline">
								    <label class="radio">
								        <input type="radio" name="isUse" value="Y" checked/>
								        <span></span>
								        사용
								    </label>
								    <label class="radio">
								        <input type="radio" name="isUse" value="N"/>
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
                                <div class="summernote" id="kt_summernote_1"></div>
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

  function regist_go(){
        $("#taskContent").val($(".summernote").summernote("code"));
        
        if($("input[name='taskDocName']").val()==""){
   			alert("제목은 필수입니다.");
   			$("input[name='taskDocName']").focus();
   			return;
   		}
        
   		document.registForm.submit();
   	}

</script>
</body>
