<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<c:set var="approvalList" value="${dataMap.approvalList }"/>

<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl far fa-file-alt" style="padding: 0px 10px;"></i>
			전자결재 > 진행중 결재함</h3>
		</div>
	</div>
</div>

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
<div class="d-flex flex-column-fluid">
	<!--begin::Container-->
	<div class="container col-12">
		<div class="card card-custom gutter-b example example-compact">
			<div class="card-body">
                    <div class="d-flex justify-content-between mt-3 mb-6">
	                    					<button class="btn btn-primary font-weight-bolder" onclick="OpenWindow('<%=request.getContextPath()%>/approval/registForm','결재문서 등록',1000,700);">
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
					</span>결재문서 작성</button>
	                    <div class="form-inline">
	                    	<div class="input-group row">
								<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
								        onchange="list_go(1);">
							  		<option value="10" ${pageMaker.cri.perPageNum==10 ? 'selected':'' }>10개 보기</option>
							  		<option value="20" ${pageMaker.cri.perPageNum==20 ? 'selected':'' }>20개 보기</option>
							  		<option value="30" ${pageMaker.cri.perPageNum==30 ? 'selected':'' }>30개 보기</option>
							  		<option value="50" ${pageMaker.cri.perPageNum==50 ? 'selected':'' }>50개 보기</option>
							  		
							  	</select>		
								<select class="form-control" name="searchType" id="searchType">
									<option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
									<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
									<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
									<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
									<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
									<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>																			
								</select>	
						<input  class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						</div>
					</div>
				</div>

				<!--begin: Datatable-->
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">NO</th>
									<th class="text-center" style="width: 300px;">제목</th>
									<th class="text-center" style="width: 200px;">문서분류</th>
									<th class="text-center" style="width: 150px;">상신자</th>
									<th class="text-center" style="width: 200px;">상신일</th>
									<th class="text-center" style="width: 200px;">결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(approvalList) eq 0}">
									<tr>
										<td class="text-center" colspan="12">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${approvalList}" var="approval">
								<tr onclick="OpenWindow('detail.do?appNo=${approval.appNo}','','1000','700');" style="cursor: pointer;">
									<td class="text-center align-middle">${approval.appNo }</td>
									<td class="text-left align-middle text-hover-primary">${approval.appTitle }&nbsp;&nbsp;&nbsp;
										<span style="width: 137px;">
											<c:if test="${!empty approval.attachList }">
												<i class="nav-icon fas fa-file"></i>
											</c:if>
										</span>
									</td>
									<td class="text-center align-middle">${approval.docName }</td>
									<td class="text-center align-middle">${approval.empName }</td>
									<td class="text-center align-middle"><fmt:formatDate value="${approval.appUpDate }" pattern="yyyy-MM-dd HH:mm" /></td>
									<c:if test="${approval.appLevel eq '1' && approval.appSign eq 'N'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-danger label-inline">미결재</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '2' && approval.appSign eq 'N'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-danger label-inline">미결재</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '3' && approval.appSign eq 'N'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-danger label-inline">미결재</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '1' && approval.appSign eq 'Y'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-primary label-inline">처리완료</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '2' && approval.appSign eq 'Y'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-primary label-inline">처리완료</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '3' && approval.appSign eq 'Y'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-bold label-light-primary label-inline">처리완료</span></td>
									</c:if>
									<c:if test="${approval.appLevel eq '1' && approval.appSign eq 'X'}">
										<td class="text-center align-middle"><span class="label label-lg font-weight-boldlabel-light-success label-inline">전결</span></td>
									</c:if>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				<div class="card-footer">
					<c:set var="list_url" value="list.do"></c:set>
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>						
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<input type="hidden" id="firstAppSign" value="${first.appSign}">	
<input type="hidden" id="secondAppSign" value="${second.appSign}">	
<input type="hidden" id="thirdAppSign" value="${third.appSign}">	
<input type="hidden" name="appNo" value="${approval.appNo }">
<input type="hidden" name="empNo" value="${loginUser.empNo}"/>
<input type="hidden" id="flag" value="">
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script>
$("#keyword").keydown(function(key) {
    if (key.keyCode == 13) {
    	list_go(1);
    }
});
</script>

</body>


