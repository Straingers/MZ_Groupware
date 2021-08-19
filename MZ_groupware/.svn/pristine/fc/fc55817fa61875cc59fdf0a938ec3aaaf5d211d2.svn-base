<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<head>
    <title>결재로그</title>
</head>
<body>
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				로그관리 > 결재로그 조회
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->

<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <div class="d-flex flex-column-fluid">
        <div class="container col-12">
        	<div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom" style="height:100%">
				<div class="card-body p-3">
				 	<div class="d-flex justify-content-end mt-3 mb-6">
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
									<th class="text-center" style="width: 100px;">문서번호</th>
									<th class="text-center" style="width: 150px;">문서분류</th>
									<th class="text-center">서류제목</th>
									<th class="text-center" style="width: 100px;">성&nbsp;&nbsp;&nbsp;명</th>
									<th class="text-center" style="width: 100px;">결재유형</th>
									<th class="text-center" style="width: 100px;">결재상태</th>
									<th class="text-center" style="width: 150px;">결재일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(dataMap.logList) eq 0}">
									<tr>
										<td class="text-center" colspan="7">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${dataMap.logList}" var="log">
								<tr>
									<td class="text-center align-middle">${log.appNo}</td>
									<td class="text-center align-middle">${log.docName}</td>
									<td class="align-middle">
										<a class="text-dark text-hover-primary mb-1 font-size-lg" href="javascript:OpenWindow('<%=request.getContextPath()%>/admin/log/approval/detail.do?appNo=${log.appNo}','결재문서 상세',1200,800);">
											${log.appTitle}
										</a>
									</td>
									<td class="text-center align-middle" data-toggle="tooltip" data-placement="bottom" title="${log.deptName}&nbsp;${log.empName}&nbsp;${log.psName}(${log.empNo})">${log.empName}</td>
									<td class="text-center align-middle">
										<c:choose>
											<c:when test="${log.appSign eq 'N'}">미결재</c:when>
											<c:when test="${log.appSign eq 'X'}">전결</c:when>
											<c:when test="${log.appSign eq 'U'}">제출</c:when>
											<c:when test="${log.appSign eq 'Y'}">결재</c:when>
											<c:when test="${log.appSign eq 'R'}">반려</c:when>
										</c:choose>
									</td>
									<td class="text-center align-middle">
										<c:choose>
											<c:when test="${log.appType eq '상신자'}">상신</c:when>
											<c:when test="${log.appType eq '1차결재권자'}">1차결재</c:when>
											<c:when test="${log.appType eq '2차결재권자'}">2차결재</c:when>
											<c:when test="${log.appType eq '최종결재권자'}">최종결재</c:when>
											<c:when test="${log.appType eq '협조'}">협조</c:when>
										</c:choose>
									</td>
									<td class="text-center align-middle">
										<fmt:formatDate value="${log.appDate}" pattern="yy-MM-dd HH:mm"/>
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
			</div>
		</div>
	</div>
</div>





</body>