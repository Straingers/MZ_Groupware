<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<head>
    <title>신입사원 교육자료</title>
</head>
<body>

<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				오피스룸 > 신입사원 교육자료
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->

<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <div class="d-flex flex-column-fluid">
        <!--begin::Container-->
        <div class="container col-12">
            <!--begin::Card-->
            <div class="card card-custom" style="height:100%">
            	<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
					<c:if test="${loginUser.authority eq 'ROLE_ADMIN'}">
						<button class="btn btn-primary font-weight-bolder" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/office/ot/registForm.do','게시글 작성',1200,800);">
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
						</span>작성</button>
					</c:if>
							
					</div>
					<div class="card-toolbar">
						
						<div class="row align-items-center">
							<div class="my-2 my-md-0">
								<div class="input-group row">
									<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">
								  		<option value="10" selected="">10개 보기</option>
								  		<option value="20">20개 보기</option>
								  		<option value="30">30개 보기</option>
								  		<option value="50">50개 보기</option>
								  		
								  	</select>		
									<select class="form-control col-md-3" name="searchType" id="searchType">
										<option value="tcw" selected="">전 체</option>
										<option value="t">제 목</option>
										<option value="w">작성자</option>
										<option value="c">내 용</option>
										<option value="tc">제목+내용</option>
										<option value="cw">작성자+내용</option>																			
									</select>	
													
									<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="">
									<span class="input-group-append">
										<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
								</div>	
							</div>
						</div>
						
					</div>
				</div>
                <div class="card-body p-3">
                    <div class="table-responsive">
						<table class="table overflow-auto">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">NO</th>
									<th class="text-center" style="width: 400px;">제목</th>
									<th class="text-center" style="width: 70px;">작성자</th>
									<th class="text-center" style="width: 100px;">작성일자</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(dataMap.otList) eq 0}">
									<tr>
										<td class="text-center" colspan="5">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${dataMap.otList}" var="ot" varStatus="i">
									<tr class="text-dark text-hover-primary mb-1 font-size-lg" 
										onclick="javascript:OpenWindow('<%=request.getContextPath()%>/office/ot/detail.do?otNo=${ot.otNo}','회사내규 상세',800,700);" style="cursor: pointer;">
										<td class="text-center align-middle">${pageMaker.totalCount - (cri.perPageNum * (cri.page - 1)) - i.index }</td>
										<td class="align-middle">
                                 			${ot.otTitle } &nbsp;
                                 			<c:if test="${fn:length(ot.attachList) gt 0}">
												<i class="fas fa-file"></i>
											</c:if>
                             			</td>
										<td class="text-center align-middle">${ot.adminName}</td>
										<td class="text-center align-middle">${ot.otRegdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
                </div>
                <div class="card-footer">
                    <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
                </div>
                <!--end::Card-->
            </div>
            <!--end::Container-->
        </div>
    </div><!-- d-flex flex-column-fluid -->
</div>
<form id="form">
	<input id="otNo" name="otNo" type="hidden"/>
	<input id="taskImportant" name="taskImportant" type="hidden"/>
</form>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
</body>
