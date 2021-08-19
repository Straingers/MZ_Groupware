<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<head>
    <title>일일보고</title>
</head>
<body>

<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				업무관리 > 일일보고
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
                            <li class="nav-item" onclick="parent.goPage('task/daily/uncheck/list.do','M030200');">
                                <a class="nav-link <c:if test="${pageType eq 'uncheck'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-tasks"></i></span>
                                    <span class="nav-text">미확인내역</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('task/daily/receive/list.do','M030200');">
                                <a class="nav-link <c:if test="${pageType eq 'receive'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-file-import"></i></i></span>
                                    <span class="nav-text">수신내역</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('task/daily/send/list.do','M030200');">
                                <a class="nav-link <c:if test="${pageType eq 'send'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-file-export"></i></span>
                                    <span class="nav-text">발신내역</span>
                                </a>
                            </li>
                            <li class="nav-item" onclick="parent.goPage('task/daily/temp/list.do','M030200');">
                                <a class="nav-link <c:if test="${pageType eq 'temp'}">active</c:if>" data-toggle="tab" href="#">
                                    <span class="nav-icon"><i class="fas fa-save icon-lg"></i></span>
                                    <span class="nav-text">임시저장</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="card-body p-3">
                    <div class="d-flex justify-content-between mt-3 mb-6">
	                    <button class="btn btn-primary font-weight-bolder btn-sm" onclick="OpenWindow('<%=request.getContextPath()%>/task/daily/registForm.do','작성',1000,700);">
	                        <span class="svg-icon svg-icon-md">
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24"></rect>
										<circle fill="#000000" cx="9" cy="15" r="6"></circle>
										<path d="M8.8012943,7.00241953 C9.83837775,5.20768121 11.7781543,4 14,4 C17.3137085,4 20,6.6862915 20,10 C20,12.2218457 18.7923188,14.1616223 16.9975805,15.1987057 C16.9991904,15.1326658 17,15.0664274 17,15 C17,10.581722 13.418278,7 9,7 C8.93357256,7 8.86733422,7.00080962 8.8012943,7.00241953 Z" fill="#000000" opacity="0.3"></path>
									</g>
								</svg>
							</span>작성
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
												
								<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." id="searchInput" value="${pageMaker.cri.keyword }"/>
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
									<th class="text-center" style="width: 70px;"><i class="fas fa-star text-warning"></i></th>
									<th class="text-center" style="width: 100px;"></th>
									<th class="text-center" style="width: 50px;"></th>
									<th class="text-center">제목</th>
									<th class="text-center" style="width: 200px;">발신인</th>
									<th class="text-center" style="width: 250px;">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(dataMap.taskList) eq 0}">
									<tr>
										<td class="text-center" colspan="5">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${dataMap.taskList}" var="resultBean" varStatus="i">
									<tr>
										<td class="text-center align-middle">
											${pageMaker.totalCount - (cri.perPageNum * (cri.page - 1)) - i.index }
										</td>
										<td class="text-center align-middle" id="important${resultBean.taskNo}">
											<c:if test="${resultBean.taskReceiveImportant eq 'Y'}">
												<a name="starIcon${resultBean.taskNo}" href="javascript:fn_update('${resultBean.taskNo}', 'N');">
													<i class="fas fa-star text-warning"></i>
												</a>
											</c:if>
											<c:if test="${resultBean.taskReceiveImportant eq 'N'}">
												<a name="starIcon${resultBean.taskNo}" href="javascript:fn_update('${resultBean.taskNo}', 'Y');">
													<i class="far fa-star text-warning"></i>
												</a>
											</c:if>
										</td>
										<td class="text-center align-middle">
											<c:set var="sub" value="${resultBean.taskSubtype}"/>
											<c:choose>
												<c:when test="${sub eq '일일보고'}">
													<span class="label label-lg font-weight-bolder label-rounded label-success" style=" width: 70px;">일일보고</span>
												</c:when>
												<c:when test="${sub eq '주간보고'}">
													<span class="label label-lg font-weight-bolder label-rounded label-warning" style=" width: 70px;">주간보고</span>
												</c:when>
												<c:when test="${sub eq '월간보고'}">
													<span class="label label-lg font-weight-bolder label-rounded label-info" style=" width: 70px;">월간보고</span>
												</c:when>
											</c:choose>
										</td>
										<td class="p-0 align-middle text-center">
											<c:if test="${resultBean.taskReceiverType eq 'cc'}">
												<span class="label font-weight-bolder label-rounded label-primary" style="width: 35px;">참조</span>
											</c:if>
											<c:if test="${resultBean.taskReceiverType eq 'rec'}">
												<span class="label font-weight-bolder label-rounded label-success" style="width: 35px;">수신</span>
											</c:if>
										</td>
										<td class="align-middle">
											<a class="text-dark text-hover-primary mb-1 font-size-lg" href="javascript:OpenWindow('<%=request.getContextPath()%>/task/daily/detail.do?taskNo=${resultBean.taskNo}','업무공유 상세',1000,700);">
	                                 			${resultBean.taskTitle }
	                             			</a>
                             			</td>
										<td class="text-center align-middle">${resultBean.empName}&nbsp;${resultBean.psName}</td>
										<td class="text-center align-middle"><fmt:formatDate value="${resultBean.taskDate}" pattern="yyyy-MM-dd HH:mm"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
                </div>
                <div class="card-footer p-0">
                    <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
                </div>
                <!--end::Card-->
            </div>
            <!--end::Container-->
        </div>
    </div><!-- d-flex flex-column-fluid -->
</div>
<form id="form">
	<input id="taskNo" name="taskNo" type="hidden"/>
	<input id="taskImportant" name="taskImportant" type="hidden"/>
</form>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
<script>

// function fn_update(taskNo, important) {
// 	$('#taskNo').val(taskNo);
// 	$('#taskImportant').val(important);
<%-- 	$('#form').attr("action", '<%=request.getContextPath()%>/task/important/update'); --%>
// 	$('#form').attr("method", "POST");
// 	$('#form').submit();	
// }

function fn_update(taskNo, important) {
	$('#taskNo').val(taskNo);
	$('#taskImportant').val(important);
	
	var form = {
				 taskNo : taskNo
				,important : important
			   }
	
	$.ajax({
	    url:'<%=request.getContextPath()%>/task/important/receiveUpdate', 
	    type:'post', // 메소드(get, post, put 등)
	    data: JSON.stringify(form),
	    contentType: 'application/json; charset=utf-8',
	    success: function(data) {
	    	if(data.important == 'Y') {
		        $("#important" +taskNo+" > [name='starIcon"+taskNo+"']").remove();
	    	    var str = '<a name="starIcon'+taskNo+'" href="javascript:fn_update(' +taskNo + ', ' + "'N')" + ';">'
	    	    		+ '<i class="fas fa-star text-warning"></i></a>';
		        $("#important" +taskNo).append(str);
	    	} else {
	    		$("#important" +taskNo+ " > [name='starIcon"+taskNo+"']").remove();
	    		var str = '<a name="starIcon'+taskNo+'" href="javascript:fn_update(' +taskNo + ', ' + "'Y')" + ';">'
	    	    		+ '<i class="far fa-star text-warning"></i></a>';
		        $("#important" +taskNo).append(str);
	    	}
	    },
	    error: function(err) {
	    	console.log('에러발생쓰..');
	    }
	});
}

$("#searchInput").keydown(function(key) {
    if (key.keyCode == 13) {
    	list_go(1);
    }
});



</script>
</body>
