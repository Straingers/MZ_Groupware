<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <title>신입사원 교육자료 상세보기</title>
	<script src="<%=request.getContextPath() %>/resources/js/pdfobject.js"></script>
</head>
<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">신입사원 교육자료 상세</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>닫기
                        </button>
                    <c:if test="${loginUser.empNo eq ot.adminId}">
                        <button class="btn btn-primary font-weight-bolder mr-2" onclick="modifyForm();">
                            <i class="flaticon-edit icon-xs"></i>수정
                        </button>
                        <button class="btn btn-primary font-weight-bolder mr-2" onclick="remove_go();">
                            <i class="flaticon-edit icon-xs"></i>삭제
                        </button>
                     </c:if>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <div class="form-group row">
                        <label for="taskTitle" class="col-2 col-form-label text-center">제목</label>
                        <div class="col-10" style="display: flex;align-items: center;font-weight: bold;">${ot.otTitle}</div>
                    </div>
                    <div class="form-group row">
                        <label for="taskTitle" class="col-2 col-form-label text-center">작성자</label>
                        <div class="col-10" style="display: flex;align-items: center;font-weight: bold;">${ot.adminName}</div>
                    </div>
                    <div class="form-group row">
                        <label for="taskTitle" class="col-2 col-form-label text-center">작성일</label>
                        <div class="col-10" style="display: flex;align-items: center;font-weight: bold;">${ot.otRegdate}</div>
                    </div>
                    <div class="card card-custom card-stretch mt-0 mb-5" style="border: 1px solid #E4E6EF;">
                    	<div class="card-body">
                    		${ot.otContent}
                   		</div>
                    </div>
                    
                    <div class="card card-custom gutter-b example example-compact">
						<div class="card-header">
							<h3 class="card-title">첨부파일</h3>
						</div>

						<c:if test="${fn:length(ot.attachList) eq 0}">
							 <div class="card-body px-2 py-8 text-center">
									첨부파일이 없습니다.
							</div>
						</c:if>
						<c:if test="${fn:length(ot.attachList) gt 0}">
						<div class="card-body px-2 py-4">
							<c:set var="attach" value="${ot.attachList[0]}"/>
							<div class="col-sm-12" onclick="location.href='<%=request.getContextPath()%>/office/ot/getFiles.do?attachNo=${attach.attachNo}';">
								<div class="d-flex align-items-center mb-10">
									<!--begin::Symbol-->
									<div class="symbol symbol-40 symbol-light-success mr-5">
										<span class="symbol-label">
											<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
													<rect x="0" y="0" width="24" height="24"></rect>
													<path d="M2,13 C2,12.5 2.5,12 3,12 C3.5,12 4,12.5 4,13 C4,13.3333333 4,15 4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 C2,15 2,13.3333333 2,13 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
													<rect fill="#000000" opacity="0.3" x="11" y="2" width="2" height="14" rx="1"></rect>
													<path d="M12.0362375,3.37797611 L7.70710678,7.70710678 C7.31658249,8.09763107 6.68341751,8.09763107 6.29289322,7.70710678 C5.90236893,7.31658249 5.90236893,6.68341751 6.29289322,6.29289322 L11.2928932,1.29289322 C11.6689749,0.916811528 12.2736364,0.900910387 12.6689647,1.25670585 L17.6689647,5.75670585 C18.0794748,6.12616487 18.1127532,6.75845471 17.7432941,7.16896473 C17.3738351,7.57947475 16.7415453,7.61275317 16.3310353,7.24329415 L12.0362375,3.37797611 Z" fill="#000000" fill-rule="nonzero"></path>
												</g>
											</svg>
										</span>
									</div>
									<!--end::Symbol-->
									<!--begin::Text-->
									<div class="d-flex flex-column flex-grow-1 font-weight-bold">
										<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${attach.attachFilename}</a>
									</div>
								<!--end::Text-->
								</div>
							</div>
						<%-- 							</c:forEach> --%>
						</div>
						</c:if>
                    </div>
                    <!-- reply area -->
                </div>
            </div><!-- card-body -->
        </div><!-- card -->
    </div>
</div>

<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="taskReplytext" class="form-control" value="${taskReplytext}"></p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary font-weight-bolder mr-2" id="replyModBtn" onclick="replyModify_go();">
							<i class="ki ki-check icon-xs"></i>수정하기</button>
		<button type="button" class="btn btn-primary font-weight-bolder" id="replyDelBtn" onclick="replyRemove_go();">
							<i class="ki ki-close icon-nm"></i>삭제하기</button>	
		<button class="btn btn-light-primary font-weight-bolder mr-2" data-dismiss="modal">
							<i class="ki ki-long-arrow-back icon-xs"></i>취소하기</button>				
      </div>
    </div>
  </div>
</div>
<form role="form">
	<input type="hidden" id="otNo" name="otNo" value="${ot.otNo}"/>
	<input type="hidden" id="otReplyer" name="otReplyer" value=""/>
</form>
<script>
PDFObject.embed("${attach.attachUploadpath}/${attach.uuidName}", "#myPdf");
function modifyForm() {
	var formObj = $("form[role='form']");
	formObj.attr({
		'action':'modifyForm.do',
		'method':'post'
	});
	formObj.submit();
}
function remove_go() {
	$.ajax({
		url:"<%=request.getContextPath()%>/office/ot/remove.do"
		, type:"get"
		, data:{otNo:${ot.otNo}}
		, success:function(){
			Swal.fire({
			  	title: "회사내규 삭제가  완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	confirmButtonText: "확인",
//			  showCancelButton: true,
//			  cancelButtonText: "<i class='la la-thumbs-down'></i> No, thanks",
			  	customClass: {
			   	confirmButton: "btn btn-primary font-weight-bolder",
//			   cancelButton: "btn btn-default"
				}
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			})
		},error:function(){
			Swal.fire({
			  	title: "회사내규 삭제에 실패했습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	confirmButtonText: "확인",
//			  showCancelButton: true,
//			  cancelButtonText: "<i class='la la-thumbs-down'></i> No, thanks",
			  	customClass: {
			   	confirmButton: "btn btn-primary font-weight-bolder",
//			   cancelButton: "btn btn-default"
				}
			}).then((result) => {
				window.opener.location.reload();
			})
		}
	});
}
</script>
</body>
