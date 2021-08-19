<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				업무관리 > 업무 양식 관리
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <div class="d-flex flex-column-fluid">
        <!--begin::Container-->
        <div class="container col-12">
			<div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom" style="height:100%">
				<div class="card-body p-3">
				 	<div class="d-flex justify-content-between mt-3 mb-6">
						<button class="btn btn-primary font-weight-bolder" onclick="OpenWindow('<%=request.getContextPath()%>/admin/task/report/template/registForm.do','등록',1200,800);">
							<span class="svg-icon svg-icon-md">
								<!--begin::Svg Icon | path:assets/media/svg/icons/Design/Flatten.svg-->
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24"></rect>
										<circle fill="#000000" cx="9" cy="15" r="6"></circle>
										<path d="M8.8012943,7.00241953 C9.83837775,5.20768121 11.7781543,4 14,4 C17.3137085,4 20,6.6862915 20,10 C20,12.2218457 18.7923188,14.1616223 16.9975805,15.1987057 C16.9991904,15.1326658 17,15.0664274 17,15 C17,10.581722 13.418278,7 9,7 C8.93357256,7 8.86733422,7.00080962 8.8012943,7.00241953 Z" fill="#000000" opacity="0.3"></path>
									</g>
								</svg>
								<!--end::Svg Icon-->
							</span>등록
						</button>
						<div class="form-inline">
							<div class="input-group row">
								<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
								        onchange="list_go(1);">
							  		<option value="10" ${pageMaker.cri.perPageNum==10 ? 'selected':'' } >10개 보기</option>
							  		<option value="20" ${pageMaker.cri.perPageNum==20 ? 'selected':'' }>20개 보기</option>
							  		<option value="30" ${pageMaker.cri.perPageNum==30 ? 'selected':'' }>30개 보기</option>
							  		<option value="50" ${pageMaker.cri.perPageNum==50 ? 'selected':'' }>50개 보기</option>
							  		
							  	</select>		
								<select class="form-control col-md-3" name="searchType" id="searchType">
									<option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
									<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
									<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
									<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
								</select>	
												
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
								<span class="input-group-append">
									<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">NO</th>
									<th class="text-center" style="width: 100px;">양식유형</th>
									<th class="text-center">제목</th>
									<th class="text-center" style="width: 200px;">사용여부</th>
									<th class="text-center" style="width: 250px;">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(resultList) eq 0}">
									<tr>
										<td class="text-center" colspan="4">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${resultList}" var="resultBean" varStatus="i">
									<tr>
										<td class="text-center align-middle">
<%-- 											<c:out value="${resultBean.taskDocId}" /> --%>
											${i.index + 1}
										</td>
										<td class="text-center align-middle"><c:out value="${resultBean.taskDocType}" /></td>
										<td class="text-center align-middle"><c:out value="${resultBean.taskDocName}" /></td>
										<td class="text-center align-middle"><c:out value="${resultBean.isUse eq 'Y' ? '사용' : '미사용'}" /></td>
										<td class="text-center align-middle">
											<c:if test="${resultBean.isUse eq 'Y'}">
												<a href="javascript:fn_update('${resultBean.taskDocId}', 'N');" class="btn btn-light-dark font-weight-bold btn-sm">사용해제</a>
											</c:if>
											<c:if test="${resultBean.isUse eq 'N'}">
												<a href="javascript:fn_update('${resultBean.taskDocId}', 'Y');" class="btn btn-light-primary font-weight-bold btn-sm">사용하기</a>
											</c:if>
											<a href="javascript:OpenWindow('<%=request.getContextPath()%>/admin/task/report/template/modifyForm.do?taskDocId=${resultBean.taskDocId}','수정하기',1200,900);" class="btn btn-icon btn-primary btn-sm mr-2">
												<i class="flaticon2-edit"></i>
											</a>
											<a href="javascript:fn_remove('${resultBean.taskDocId}');" class="btn btn-icon btn-danger btn-sm">
												<i class="flaticon2-trash"></i>
											</a>
										</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer p-0">
					<c:set var="list_url" value="list.do" />
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
			<!--end::Card-->
			</div>
		<!--end::Container-->
		</div>
	</div><!-- d-flex flex-column-fluid -->
</div>
<form id="form2">
	<input id="taskDocId" name="taskDocId" type="hidden"/>
	<input id="isUse" name="isUse" type="hidden"/>
</form>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>
<script>
function fn_update(taskDocId, use) {
	$('#taskDocId').val(taskDocId);
	$('#isUse').val(use);
	$('#form2').attr("action", '<%=request.getContextPath()%>/admin/task/report/template/update');
	$('#form2').attr("method", "POST");
	$('#form2').submit();	
}
function fn_remove(taskDocId) {
	if (confirm('해당 업무보고 양식을 삭제하시겠습니까?')) {
		$('#taskDocId').val(taskDocId);
		$('#form2').attr("action", '<%=request.getContextPath()%>/admin/task/report/template/remove');
		$('#form2').attr("method", "POST");
		$('#form2').submit();
	}
}

</script>
</body>
