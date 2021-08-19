<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<title>결재/수신선 관리</title>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
    <style>
		.card.card-custom {
		  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05); !important
		}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	</style> 
</head>
<body>

<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-11">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				마이페이지 > 결재/수신선 관리
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		
		
		<!-- 결재선관리 -->
		<div class="container col-6 p-2">
			<!--begin::Card-->
			<div class="card card-custom gutter-b example example-compact" style="height:100%">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
						<h3 class="card-label">결재선 관리</h3>
					</div>
					<div class="card-toolbar">
						<button class="btn btn-primary font-weight-bolder" onclick="OpenWindow('<%=request.getContextPath()%>/mypage/line/approvalRegistForm','결재선 등록',1000,700);">
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
						</span>등록</button>
					</div>
				</div>
				<div class="card-body p-3">
					<!--begin: Search Form-->
					<!--begin::Search Form-->
					<div class="mb-7">
						<div class="row align-items-center">
							<div class="col-lg-9 col-xl-8">
								<span></span>
							</div>
						</div>
					</div>
					<!--end::Search Form-->
					<!--end: Search Form-->
					<!--begin: Datatable-->

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">결재라인명</th>
									<th class="text-center">1차</th>
									<th class="text-center">2차</th>
									<th class="text-center">3차</th>
									<th class="text-center">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="">
									<tr>
										<td class="text-center" colspan="6">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${approvalLine}" var="resultBean">
									<tr>
										<td class="text-center align-middle">${resultBean.lineName}</td>
										<td class="text-center align-middle">${resultBean.lineFirst}</td>
										<td class="text-center align-middle">${resultBean.lineSecond}</td>
										<td class="text-center align-middle">${resultBean.lineFinal}</td>
										<td class="text-center align-middle">
											<a href="javascript:OpenWindow('<%=request.getContextPath()%>/mypage/line/approval/detail.do?lineId=${resultBean.lineId }','수정하기',1200,900);" class="btn btn-icon btn-primary btn-sm mr-2">
												<i class="flaticon2-edit"></i>
											</a>
											<a href="javascript:fn_removeApp('${resultBean.lineId}');" class="btn btn-icon btn-danger btn-sm">
												<i class="flaticon2-trash"></i>
											</a>
										</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			<!--end::Card-->
			</div>
		<!--end::Container-->
		</div>
		
		<!-- 수신선관리 -->
		<div class="container col-6 p-2">
			<!--begin::Card-->
			<div class="card card-custom gutter-b example example-compact" style="height:100%">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
						<h3 class="card-label">수신선 관리</h3>
					</div>
					<div class="card-toolbar">
						<button class="btn btn-primary font-weight-bolder" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/mypage/line/receiveRegistForm','수신선 등록', 1000,700)">
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
						</span>등록</button>
					</div>
				</div>
				<div class="card-body p-3">
					<!--begin: Search Form-->
					<!--begin::Search Form-->
					<div class="mb-7">
						<div class="row align-items-center">
							<div class="col-lg-9 col-xl-8">
								<span></span>
							</div>
						</div>
					</div>
					<!--end::Search Form-->
					<!--end: Search Form-->
					<!--begin: Datatable-->

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 150px;">수신라인명</th>
									<th class="text-center">수신</th>
									<th class="text-center">참조</th>
									<th class="text-center" style="width: 100px;">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="">
									<tr>
										<td class="text-center" colspan="6">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${taskLine}" var="resultBean">
									<tr>
										<td class="text-center align-middle">${resultBean.tasklineName}</td>
										<td class="text-center align-middle">${resultBean.recEmpName}</td>
										<td class="text-center align-middle">
										<c:if test="${resultBean.ccEmpNo ne 'default'}">
											${resultBean.ccEmpName}
										</c:if>
										</td>
										
										<td class="text-center align-middle">
											<a href="javascript:OpenWindow('<%=request.getContextPath()%>/mypage/line/taskReceive/detail.do?tasklineId=${resultBean.tasklineId}','수정하기',1200,900);" class="btn btn-icon btn-primary btn-sm mr-2">
												<i class="flaticon2-edit"></i>
											</a>
											<a href="javascript:fn_remove('${resultBean.tasklineId}');" class="btn btn-icon btn-danger btn-sm">
												<i class="flaticon2-trash"></i>
											</a>
										</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div><!-- d-flex flex-column-fluid -->
</div>
<form id="taskReceiver">
	<input type="hidden" name="tasklineId">
</form>
<form id="approvalReceiver">
	<input type="hidden" name="lineId">
	<input type="hidden" name="empNo" value="${loginUser.empNo}">
</form>
<script>
function fn_remove(id) {
	if(confirm('수신선을 삭제하시겠습니까?')) {
		$('input[name="tasklineId"]').val(id);
		$('#taskReceiver').attr('action', '<%=request.getContextPath()%>/mypage/line/taskReceive/remove');
		$('#taskReceiver').attr('method', 'POST');
		$('#taskReceiver').submit();
	}
}
function fn_removeApp(id) {
	if(confirm('결재선을 삭제하시겠습니까?')) {
		$('input[name="lineId"]').val(id);
		$('#approvalReceiver').attr('action', '<%=request.getContextPath()%>/mypage/line/approval/remove');
		$('#approvalReceiver').attr('method', 'POST');
		$('#approvalReceiver').submit();
	}
}
	
</script>

</body>