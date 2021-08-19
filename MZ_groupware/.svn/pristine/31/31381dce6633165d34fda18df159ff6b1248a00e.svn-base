<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<head>
    <title>첨부파일로그 조회</title>
</head>
<body>

<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				로그관리 > 첨부파일로그 조회
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
                <div class="card-header card-header-tabs-line p-2">
                    <div class="card-toolbar">
                        <ul class="nav nav-tabs nav-bold nav-tabs-line">
                            <li class="nav-item" onclick="parent.goPage('admin/log/attach/attach/list.do','A070703');">
                                <a class="nav-link <c:if test="${pageType eq 'attach'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="flaticon2-sheet"></i></span>
                                    <span class="nav-text">게시판 첨부</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('admin/log/attach/app/list.do','A070703');">
                                <a class="nav-link <c:if test="${pageType eq 'app'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="flaticon-interface-3"></i></span>
                                    <span class="nav-text">전자결재 첨부</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('admin/log/attach/task/list.do','A070703');">
                                <a class="nav-link <c:if test="${pageType eq 'task'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-tasks"></i></span>
                                    <span class="nav-text">업무보고 첨부</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('admin/log/attach/cloud/list.do','A070703');">
                                <a class="nav-link <c:if test="${pageType eq 'cloud'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-cloud-upload-alt"></i></span>
                                    <span class="nav-text">클라우드 첨부</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
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
									<th class="text-center align-middle" style="width: 100px;">NO</th>
									<th class="text-center" style="width: 300px;">보고명</th>
									<th class="text-center">파일명</th>
									<th class="text-center" style="width: 100px;">첨부자</th>
									<th class="text-center" style="width: 150px;">게시일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dataMap.taskList}" var="task">
									<tr>
										<td class="text-center align-middle">${task.attachNo}</td>
										<td class="align-middle">${task.taskTitle }</td>
										<td class="align-middle">${task.fileName}</td>
										<td class="text-center align-middle" data-toggle="tooltip" data-placement="bottom" title="${task.deptName}&nbsp;${task.empName}&nbsp;${task.psName}(${task.attachAttacher})">
											${task.empName}
										</td>
										<td class="text-center align-middle">
											<fmt:formatDate value="${task.attachRegdate}" pattern="yyyy-MM-dd HH:mm"/>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
                </div>
                <div class="card-footer p-0">
                    <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
