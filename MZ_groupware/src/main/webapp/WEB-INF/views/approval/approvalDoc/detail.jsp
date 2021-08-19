<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>결재 양식</title>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">결재 양식 상세보기</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소하기
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="submit_go('modifyForm.do','${resultBean.docId}');">
                                <i class="ki ki-check icon-xs"></i>수정하기
                            </button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary font-weight-bolder" onclick="fn_remove('${resultBean.docId}');">
                                <i class="ki ki-close icon-nm"></i>삭제하기
                            </button>
                        </div>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <div class="form-group row">
                        <label for="docName" class="col-2 col-form-label">제목</label>
                        <div class="col-10">
                            <input id="docName" name="docName" type="text" class="form-control border-0" value="<c:out value="${resultBean.docName}" />" readonly="readonly" />
                        </div>
                    </div>
					
                    <div class="form-group row">
                        <label for="docId" class="col-2 col-form-label">양식코드</label>
                        <div class="col-10">
                            <input id="docId" name="docId" type="text" class="form-control border-0" value="<c:out value="${resultBean.docId}" />" readonly="readonly" />
                        </div>
                    </div>
					
                    <div class="form-group row">
                        <label for="isUse" class="col-2 col-form-label">사용여부</label>
                        <div class="col-10">
                            <input id="isUse" name="isUse" type="text" class="form-control border-0" value="<c:out value="${resultBean.isUse}" />" readonly="readonly" />
                        </div>
                    </div>
					
                    <div class="form-group row">
                        <label for="docContent" class="col-2 col-form-label">내용</label>
                        <div class="col-10">
                            <c:out value="${resultBean.docContent}" escapeXml="false" />
                        </div>
                    </div>
                </div><!-- card-body -->
            </div><!-- card -->
        </div>
    </div>
</div>
<form id="form2">
	<input type="hidden" id="docId" name="docId" />
</form>
<%@ include file="/WEB-INF/views/common/summernote.jsp" %>
<script>
  $('body').removeClass(
    'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
  );// 카드 상단 공백 제거 용
  function submit_go(url, commNo) {
    location.href = url + "?commNo=" + commNo;
  }
  function fn_remove(docId) {
		if (confirm('해당 결재 양식을 삭제하시겠습니까?')) {
			$('#docId').val(docId);
			$('#form2').attr("action", '<%=request.getContextPath()%>/admin/approval/intestat/normal/remove2');
			$('#form2').attr("method", "POST");
			$('#form2').submit();
		}
	}
</script>
</body>
