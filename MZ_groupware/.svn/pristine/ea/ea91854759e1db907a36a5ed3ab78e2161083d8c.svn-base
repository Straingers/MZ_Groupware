<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<style type="text/css">
		table.table-bordered > thead > tr > th{
		    border:1px solid #d4d4d4;
		}
		table.table-bordered > thead > tr > td{
		    border:1px solid #d4d4d4;
		}
		table.table-bordered > tbody > tr > th{
		    border:1px solid #d4d4d4;
		}
		table.table-bordered > tbody > tr > td{
		    border:1px solid #d4d4d4;
		}
	</style>
</head>
<body>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid m-0">
        	<div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom gutter-b example example-compact mb-0">
                <div class="card-header">
                    <h2 class="card-title">결재문서 상세</h2>
                    <div class="card-toolbar" id="buttonArea">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>닫기
                        </button>
                    </div>
				</div>
			</div>
			
			<div class="card-body py-0">
				<div class="col-12">
					<table class="table table-bordered float-right col-4" style="border: 0px;">
						<thead>
							<tr class="table-active">
								<th class="text-center align-middle" width="25%">기안</th>
								<th class="text-center align-middle" width="25%">1차결재</th>
								<th class="text-center align-middle" width="25%">2차결재</th>
								<th class="text-center align-middle" width="25%">최종결재</th>
							</tr>
						</thead>
						<tbody>
							<tr style="height: 55px;">
								<td class="text-center align-middle">
									<span class="label label-xl label-outline-success font-weight-bolder label-pill label-inline">상신</span>
								</td>
								<td class="text-center align-middle">
									<c:choose>
										<c:when test="${first.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
										</c:when>									
										<c:when test="${first.appSign eq 'R'}">
											<span class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
										</c:when>									
										<c:when test="${first.appSign eq 'X' and third.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
										</c:when>									
										<c:when test="${first.appSign eq 'N' and third.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
										</c:when>									
									</c:choose>
								</td>
								<td class="text-center align-middle">
									<c:choose>
										<c:when test="${second.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
										</c:when>									
										<c:when test="${second.appSign eq 'R'}">
											<span class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
										</c:when>									
										<c:when test="${second.appSign eq 'X' and third.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
										</c:when>									
										<c:when test="${second.appSign eq 'N' and third.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
										</c:when>									
									</c:choose>
								</td>
								<td class="text-center align-middle">
									<c:choose>
										<c:when test="${third.appSign eq 'Y'}">
											<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
										</c:when>									
										<c:when test="${third.appSign eq 'R'}">
											<span class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
										</c:when>									
									</c:choose>
								</td>
							</tr>
							<tr>
								<td class="text-center align-middle">${approval.empName }</td>
								<td class="text-center align-middle">${first.empName}</td>
								<td class="text-center align-middle">${second.empName}</td>
								<td class="text-center align-middle">${third.empName}</td>
							</tr>
							<thead>
								<tr class="table-active">
									<th class="text-center align-middle"  style="width: 110px;">협조</th>
								</tr>
							</thead>
							<tbody>
									<tr style="height: 55px;">
										<td class="text-center align-middle">
											<c:forEach items="${help}" var="help">
												<c:choose>
													<c:when test="${help.appSign eq 'Y'}">
														<span class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
													</c:when>									
													<c:when test="${help.appSign eq 'R'}">
														<span class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
													</c:when>									
												</c:choose>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<c:if test="${fn:length(help) eq 0}">
											<td style="height: 37px;"></td>
										</c:if>
										<c:forEach items="${help}" var="help">
											<td class="text-center align-middle">${help.empName}</td>
										</c:forEach>
									</tr>
							</tbody>
						</tbody>
					</table>
				</div>
				<div class="my-5">
					<table class="table table-bordered mb-5" style="border-color: black !important">
						<tr>
							<th class="table-active text-center align-middle" width="15%">제목</th>
							<td colspan="3">${approval.appTitle}</td>
						</tr>
						<tr class="text-center align-middle">
							<th class="table-active" width="15%">상신자</th>
							<td width="35%">${approval.deptName}&nbsp;${approval.empName}&nbsp;${approval.psName}</td>
							<th class="table-active" width="15%">상신일</th>
							<td width="35%">
								<fmt:formatDate value="${approval.appUpDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
						</tr>
						<tr class="text-center align-middle">
							<th class="table-active">문서상태</th>
							<td>${approval.appStatus}</td>
							<th class="table-active">결재유형</th>
							<td>${approval.docName}</td>
						</tr>
						<tr class="text-center align-middle">
							<th class="table-active">수신참조</th>
							<td>
								<c:forEach items="${ref}" var="ref">
	                        		<span class="label label-lg font-weight-bolder label-rounded label-outline-secondary px-2 mr-2" style="width:auto;">
		                        			${ref.empName}&nbsp;${ref.psName}(${ref.deptName})
	                       			</span>
                        		</c:forEach>
							</td>
							<th class="table-active">회람</th>
							<td>
								<c:forEach items="${read}" var="read">
	                        		<span class="label label-lg font-weight-bolder label-rounded label-outline-secondary px-2 mr-2" style="width:auto;">
		                        			${read.empName}&nbsp;${read.psName}(${read.deptName})
	                       			</span>
                        		</c:forEach>
                       		</td>
						</tr>
					</table>
				</div>
				<div class="card card-custom card-stretch mt-0 mb-5" style="border: 1px solid #E4E6EF;">
                	<div class="card-body">
                		${approval.appContent}
               		</div>
                </div>
				<div class="card card-custom gutter-b example-compact">
					<div class="card-header">
						<h3 class="card-title">첨부파일</h3>
					</div>
					<c:if test="${fn:length(approval.attachList) eq 0}">
						<div class="card-footer px-2 py-8 text-center">
							첨부파일이 없습니다.
						</div>
					</c:if>
					<c:if test="${fn:length(approval.attachList) ne 0}">
						<div class="card-footer px-2 py-4">
							<c:forEach items="${task.attachList}" var="attach">
								<div class="col-sm-12" onclick="location.href='<%=request.getContextPath()%>/task/getFiles.do?attachNo=${attach.attachNo}';">
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
										<div class="d-flex flex-column flex-grow-1 font-weight-bold">
											<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${attach.attachFilename}</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
                </div>
				
				<div class="card card-custom gutter-b example example-compact">
					<div class="card-header">
						<h3 class="card-title">의견 목록</h3>
					</div>
					<div class="card-body pt-2">
						<div class="time-label" id="repliesDiv">
						</div>
						<div class='text-center'>
							<span id="pagination" class="pagination justify-content-center m-0">
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<%@include file="./reply_js.jsp" %>
</body>