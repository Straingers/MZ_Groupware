	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<style>
.scroll_body {
    max-height: 400px;
    overflow-y: auto;
}

.card.card-custom {
  -webkit-box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05);
  border: 0;
}
</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
				인사관리 > 인사이동
			</h3>
		</div>
	</div>
</div>



<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-12">
			<div class="card card-custom" style="height:100%">
				<div class="card-header card-header-tabs-line p-2">
					<div class="card-toolbar">
						<ul id="myTab" class="nav nav-tabs nav-bold nav-tabs-line">
							<li>
								<a class="nav-link" href="#promotion" data-toggle="tab" data-load="true" id="promotion">
									<span class="nav-icon"><i class="fas fa-user-graduate"></i></span>
									<span class="nav-text">승진</span>
								</a>
							</li>
							<li>
								<a class="nav-link" href="#change" data-toggle="tab" data-load="true" id="change">
									<span class="nav-icon"><i class="fas fa-user-cog"></i></span>
                                    <span class="nav-text">이동</span>
								</a>
							</li>
							<li>
								<a class="nav-link" href="#leave" data-toggle="tab" data-load="true" id="leave">
									<span class="nav-icon"><i class="fas fa-user-lock"></i></span>
                                    <span class="nav-text">휴직</span>
								</a>
							</li>
							<li>
								<a class="nav-link" href="#reinstate" data-toggle="tab" data-load="true" id="reinstate">
									<span class="nav-icon"><i class="fas fa-user-tie"></i></span>
                                    <span class="nav-text">복직</span>
								</a>
							</li>
							<li>
								<a class="nav-link" href="#resign" data-toggle="tab" data-load="true" id="resign">
									<span class="nav-icon"><i class="fas fa-user-slash"></i></span>
                                    <span class="nav-text">퇴사</span>
								</a>
							</li>	
						</ul>
					</div><!-- card-toolbar -->
				</div><!-- card-header card-header-tabs-line p-2 -->
				
				<div class="card-body p-3">
					<div class="tab-content">
						<div class="tab-pane fade" id="promotion">
							<div class="card card-custom example example-compact gutter-b">
		                    	<div class="card-header">
		                    		<div class="card-title">인사변경 - 승진처리</div>
		                    		<div class="card-toolbar">
		                    			<button type="button" class="change btn btn-light-primary" onclick="fn_promotion()">적용</button>
		                    		</div>
		                    	</div>
		                    	<div class="card-body">
		                    		<div class="table-responsive">
		                    			<table class="table">
		                    				<tbody>
		                    					<tr>
		                    						<td class="text-center" style="width: 100px;vertical-align: middle;">이름</td>
		                    						<td>${employee.empName}</td>
		                    					</tr>
		                    					<tr>
		                    						<td class="text-center" style="width: 100px;vertical-align: middle;">부서명</td>
		                    						<td>${employee.deptName}</td>
		                    					</tr>
		                    					<tr>
		                    						<td class="text-center" style="width: 100px;vertical-align: middle;">직위명</td>
		                    						<td>${employee.psName}</td>
		                    					</tr>
		                    					<tr>
		                    						<td class="text-center" style="width: 100px;vertical-align: middle;">직위변경</td>
		                    						<td>
		                    							<c:if test="${fn:length(positionList) eq 0}">
															<div>최고 직위입니다.</div>
														</c:if>
														<c:if test="${fn:length(positionList) ne 0}">
														<select class="form-control selectPosition" id="selectPosition1">
															<option value="0">--선택하세요--</option>
															<c:forEach items="${positionList}" var="position">
																<option value="${position.psCode}">${position.psName}</option>
															</c:forEach>
														</select>
														</c:if>
													</td>
		                    					</tr>
		                    				</tbody>
		                    			</table>
		                    		</div><!-- table-responsive -->
		                    	</div><!-- card body -->
		                    </div>
		                    <div class="card card-custom example example-compact gutter-b">
                    			<div class="card-header">
                    				<div class="card-title">${employee.empName}님 인사변경 현황</div>
		                    	</div>
		                    	<div class="card-body scroll_body">
		                    		<table class="table">
										<thead>
											<tr>
												<th class="text-center" style="width: 100px;">NO</th>
												<th class="text-center">처리 내용</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
												<c:choose>
													<c:when test="${transferHistory.transStatus eq '승진'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-success label-pill label-inline mr-2">승진</span>	
																처리 되었습니다.
															</td>
														</tr>	
													</c:when>
													<c:when test="${transferHistory.transStatus eq '이동'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-primary label-pill label-inline mr-2">이동</span>	
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '퇴사'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-danger label-pill label-inline mr-2">퇴사</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '휴직'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																부터 
																<fmt:formatDate value="${transferHistory.transEndDate}" pattern="yyyy-MM-dd" />
																까지 &nbsp;
																<span id="transStatus" class="label label-light-warning label-pill label-inline mr-2">휴직</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '복직'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-info label-pill label-inline mr-2">복직</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
		                    	</div>
		                    </div>
						</div><!-- tab-pane fade -->
						<div class="tab-pane fade" id="change">
							<div class="card card-custom example example-compact gutter-b">
                 				<div class="card-header">
			                 		<div class="card-title">인사변경 - 이동처리</div>
			                 		<div class="card-toolbar">
			                 			<button type="button" class="btn btn-light-primary" onclick="fn_change()">적용</button>
		                 			</div>
                 				</div><!-- card-header -->
		                 		<div class="card-body">
		                 			<div class="table-responsive">
		                 				<table class="table">
		                 					<tbody>
			                 					<tr>
			                 						<td class="text-center" style="width: 100px;vertical-align: middle;">이름</td>
			                 						<td>${employee.empName}</td>
			                 					</tr>
			                 					<tr>
			                 						<td class="text-center" style="width: 100px;vertical-align: middle;">부서명</td>
			                 						<td>${employee.deptName}</td>
			                 					</tr>
			                 					<tr>
			                 						<td class="text-center" style="width: 100px;vertical-align: middle;">직위명</td>
			                 						<td>${employee.psName}</td>
			                 					</tr>
			                 					<tr>
		                 							<td class="text-center" style="width: 100px;vertical-align: middle;">부서변경</td>
		                 							<td>
														<c:if test="${fn:length(departmentList) ne 0}">
														<select class="form-control selectDepartment">
															<option value="0">--선택하세요--</option>
															<c:forEach items="${departmentList}" var="department">
																<option value="${department.deptCode}">${department.deptName}</option>
															</c:forEach>
														</select>
														</c:if>
													</td>
		                 						</tr>
		                 						<tr>
			                 						<td class="text-center" style="width: 100px;">직위변경</td>
			                 						<td>
														<c:if test="${fn:length(positionListAll) ne 0}">
														<select class="form-control selectPosition">
															<option value="0">--선택하세요--</option>
															<c:forEach items="${positionListAll}" var="position">
																<option value="${position.psCode}">${position.psName}</option>
															</c:forEach>
														</select>
														</c:if>
													</td>
		                 						</tr>
		                 					</tbody>
		                 				</table>
		                 			</div><!-- table-responsive -->
		                 		</div><!-- card body -->
                 			</div>
                 			<div class="card card-custom example example-compact gutter-b">
		               			<div class="card-header">
		               				<div class="card-title">${employee.empName}님 인사변경 현황</div>
		                 		</div>
		                 		<div class="card-body scroll_body">
		                 			<table class="table">
										<thead>
											<tr>
												<th class="text-center" style="width: 100px;">NO</th>
												<th class="text-center">처리 내용</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
												<c:choose>
													<c:when test="${transferHistory.transStatus eq '승진'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-success label-pill label-inline mr-2">승진</span>	
																처리 되었습니다.
															</td>
														</tr>	
													</c:when>
													<c:when test="${transferHistory.transStatus eq '이동'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-primary label-pill label-inline mr-2">이동</span>	
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '퇴사'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-danger label-pill label-inline mr-2">퇴사</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '휴직'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																부터 
																<fmt:formatDate value="${transferHistory.transEndDate}" pattern="yyyy-MM-dd" />
																까지 &nbsp;
																<span id="transStatus" class="label label-light-warning label-pill label-inline mr-2">휴직</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
													<c:when test="${transferHistory.transStatus eq '복직'}">
														<tr>
															<td class="text-center">${status.count}</td>
															<td class="text-left">
																<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
																에 &nbsp;
																<span id="transStatus" class="label label-light-info label-pill label-inline mr-2">복직</span>
																처리 되었습니다.
															</td>
														</tr>
													</c:when>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
		              			</div><!-- card-body -->
              				</div>
						</div><!-- tab-pane fade -->
						<div class="tab-pane fade" id="leave">
							<div class="card card-custom example example-compact gutter-b">
			             		<div class="card-header">
			             			<div class="card-title">인사변경 - 휴직처리</div>
			             			<div class="card-toolbar">
		               				<button type="button" class="change btn btn-light-primary" onclick="fn_leave()">적용</button>
		               			</div><!-- card-header -->
			             	</div><!-- card card-custom example example-compact gutter-b -->
		               		<div class="card-body">
		                 		<div class="table-responsive">
		                 			<table class="table">
		                 				<tbody>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">이름</td>
		                 						<td>${employee.empName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">부서명</td>
		                 						<td>${employee.deptName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">직위명</td>
		                 						<td>${employee.psName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">휴직시작일</td>
		                 						<td>
													<input type="text" class="form-control" name="datepickerTransStartDate" id="kt_datepicker_1" readonly="readonly" placeholder="휴직 시작일">
												</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">휴직종료일</td>
		                 						<td>
													<input type="text" class="form-control" name="datepickerTransEndDate" id="kt_datepicker_1" readonly="readonly" placeholder="휴직 종료일">
												</td>
		                 					</tr>
		                 				</tbody>
		                 			</table>
		                 		</div><!-- table-responsive -->
		                 	</div><!-- card body -->
                 		</div><!-- tab-pane fade -->
                 		<div class="card card-custom example example-compact gutter-b">
		         		 	<div class="card-header">
		               	 		<div class="card-title">${employee.empName}님 인사변경 현황</div>
		                 	</div>
		                 	<div class="card-body scroll_body">
		                 		<table class="table">
									<thead>
										<tr>
											<th class="text-center" style="width: 100px;">NO</th>
											<th class="text-center">처리 내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
											<c:choose>
												<c:when test="${transferHistory.transStatus eq '승진'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-success label-pill label-inline mr-2">승진</span>	
															처리 되었습니다.
														</td>
													</tr>	
												</c:when>
												<c:when test="${transferHistory.transStatus eq '이동'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-primary label-pill label-inline mr-2">이동</span>	
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '퇴사'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-danger label-pill label-inline mr-2">퇴사</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '휴직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															부터 
															<fmt:formatDate value="${transferHistory.transEndDate}" pattern="yyyy-MM-dd" />
															까지 &nbsp;
															<span id="transStatus" class="label label-light-warning label-pill label-inline mr-2">휴직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '복직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-info label-pill label-inline mr-2">복직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>
			              	</div><!-- card body -->
	              		</div>
					</div><!-- tab-pane fade -->
					<div class="tab-pane fade" id="reinstate">
							<div class="card card-custom example example-compact gutter-b">
			             		<div class="card-header">
			             			<div class="card-title">인사변경 - 복직처리</div>
			             			<div class="card-toolbar">
		               				<button type="button" class="change btn btn-light-primary" onclick="fn_reinstate()">적용</button>
		               			</div><!-- card-header -->
	             			</div><!-- card card-custom example example-compact gutter-b -->
		               		<div class="card-body">
		                 		<div class="table-responsive">
		                 			<table class="table">
		                 				<tbody>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">이름</td>
		                 						<td>${employee.empName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">부서명</td>
		                 						<td>${employee.deptName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">직위명</td>
		                 						<td>${employee.psName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">복직처리일</td>
		                 						<td>
													<input type="text" class="form-control" name="datepickerTransStartDate" id="kt_datepicker_1" readonly="readonly" placeholder="복직 처리일">
												</td>
		                 					</tr>
		                 				</tbody>
		                 			</table>
		                 		</div><!-- table-responsive -->
		                 	</div><!-- card body -->
                 		</div><!-- tab-pane fade -->
                 		<div class="card card-custom example example-compact gutter-b">
		         		 	<div class="card-header">
		               	 		<div class="card-title">${employee.empName}님 인사변경 현황</div>
		                 	</div>
		                 	<div class="card-body scroll_body">
		                 		<table class="table">
									<thead>
										<tr>
											<th class="text-center" style="width: 100px;">NO</th>
											<th class="text-center">처리 내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
											<c:choose>
												<c:when test="${transferHistory.transStatus eq '승진'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-success label-pill label-inline mr-2">승진</span>	
															처리 되었습니다.
														</td>
													</tr>	
												</c:when>
												<c:when test="${transferHistory.transStatus eq '이동'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-primary label-pill label-inline mr-2">이동</span>	
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '퇴사'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-danger label-pill label-inline mr-2">퇴사</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '휴직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															부터 
															<fmt:formatDate value="${transferHistory.transEndDate}" pattern="yyyy-MM-dd" />
															까지 &nbsp;
															<span id="transStatus" class="label label-light-warning label-pill label-inline mr-2">휴직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '복직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-info label-pill label-inline mr-2">복직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>
			              	</div><!-- card-body -->
	              		</div>
						</div><!-- tab-pane fade -->
						<div class="tab-pane fade" id="resign">
							<div class="card card-custom example example-compact gutter-b">
			             		<div class="card-header">
			             			<div class="card-title">인사변경 - 퇴사처리</div>
			             			<div class="card-toolbar">
		               				<button type="button" class="change btn btn-light-primary" onclick="fn_resign()">적용</button>
		               			</div><!-- card-header -->
			             	</div><!-- card card-custom example example-compact gutter-b -->
		               		<div class="card-body">
		                 		<div class="table-responsive">
		                 			<table class="table">
		                 				<tbody>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">이름</td>
		                 						<td>${employee.empName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">부서명</td>
		                 						<td>${employee.deptName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">직위명</td>
		                 						<td>${employee.psName}</td>
		                 					</tr>
		                 					<tr>
		                 						<td class="text-center" style="width: 100px;vertical-align: middle;">퇴사처리일</td>
		                 						<td>
													<input type="text" class="form-control" name="datepickerTransStartDate" id="kt_datepicker_1" readonly="readonly" placeholder="퇴사처리일">
												</td>
		                 					</tr>
		                 				</tbody>
		                 			</table>
		                 		</div><!-- table-responsive -->
		                 	</div><!-- card body -->
                 		</div><!-- tab-pane fade -->
                 		<div class="card card-custom example example-compact gutter-b">
		         		 	<div class="card-header">
		               	 		<div class="card-title">${employee.empName}님 인사변경 현황</div>
		                 	</div>
		                 	<div class="card-body scroll_body">
		                 		<table class="table">
									<thead>
										<tr>
											<th class="text-center" style="width: 100px;">NO</th>
											<th class="text-center">처리 내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
											<c:choose>
												<c:when test="${transferHistory.transStatus eq '승진'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-success label-pill label-inline mr-2">승진</span>	
															처리 되었습니다.
														</td>
													</tr>	
												</c:when>
												<c:when test="${transferHistory.transStatus eq '이동'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-primary label-pill label-inline mr-2">이동</span>	
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '퇴사'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-danger label-pill label-inline mr-2">퇴사</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '휴직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															부터 
															<fmt:formatDate value="${transferHistory.transEndDate}" pattern="yyyy-MM-dd" />
															까지 &nbsp;
															<span id="transStatus" class="label label-light-warning label-pill label-inline mr-2">휴직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
												<c:when test="${transferHistory.transStatus eq '복직'}">
													<tr>
														<td class="text-center">${status.count}</td>
														<td class="text-left">
															<fmt:formatDate value="${transferHistory.transStartDate}" pattern="yyyy-MM-dd" />
															에 &nbsp;
															<span id="transStatus" class="label label-light-info label-pill label-inline mr-2">복직</span>
															처리 되었습니다.
														</td>
													</tr>
												</c:when>
											</c:choose>
										</c:forEach>
									</tbody>
								</table>
			              	</div><!-- card body -->
	              		</div>
						</div><!-- tab-pane fade -->
					</div>
				</div>
			</div><!-- card -->
		</div><!-- container col-12 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid p-0 -->

<form>
	<input type="hidden" name="empNo" value="${employee.empNo}"/>
	<input type="hidden" name="psCode" value="${employee.psCode}"/>
	<input type="hidden" name="empName" value="${employee.empName}"/>
	<input type="hidden" name="transStatus" />
	<input type="hidden" name="deptCode" />
	<input type="hidden" name="transStartDate" />
	<input type="hidden" name="transEndDate" />
</form>



<script>

//$('#myTab li').on('click')
$(document).on('click', '#myTab li > a', function() {
	// form 초기화
	$("input[name='psCode']").val("");
	$("input[name='transStatus']").val("");
	$("input[name='deptCode']").val("");
	$("input[name='transStartDate']").val("");
	$("input[name='transEndDate']").val("");
	
	// 선택값 초기화
	$(".selectDepartment").val("0").prop("selected", true);
	$(".selectPosition").val("0").prop("selected", true);
	$("input[name='datepickerTransStartDate']").val("");
	$("input[name='datepickerTransEndDate']").val("");
	
	$('#myTab li').removeClass('active show');	
	$('div.tab-content .tab-pane').removeClass('active show');

	var _id = $(this).attr('id');
	
	$(this).tab('show').parent().addClass('active');
	$('div.tab-content .tab-pane#'+_id).addClass('active show');
});

$(document).on('change','.selectPosition', function(){
	$("input[name='psCode']").val($(this).val());
});

$(document).on('change','.selectDepartment', function(){
	$("input[name='deptCode']").val($(this).val());
});



$(document).ready(function() {
	
	$('#myTab li:first-child').addClass('active show');
	$('div.tab-content div').eq(0).addClass('active show');
	
	// form 초기화
	$("input[name='psCode']").val("");
	$("input[name='transStatus']").val("");
	$("input[name='deptCode']").val("");
	$("input[name='transStartDate']").val("");
	$("input[name='transEndDate']").val("");
	
  // 선택값 초기화
	$(".selectDepartment").val("0").prop("selected", true);
	$(".selectPosition").val("0").prop("selected", true);
	$("input[name='datepickerTransStartDate']").val("");
	$("input[name='datepickerTransEndDate']").val("");
	
	
	if(${employee.psCode} == 1){
		$(".change").hide();
	}
	
	$(document).on('change','input[name="datepickerTransStartDate"]', function(){
	 	$("input[name='transStartDate']").val($(this).val());
	});

	$(document).on('change','input[name="datepickerTransEndDate"]', function(){
	 	$("input[name='transEndDate']").val($(this).val());
	});
	
	
	/*가비지 코드*/
// 	$('#myTab li:first-child').addClass('active').find('a').tab('show');
	
	/* var _id = $('#myTab li:first-child a').attr('id');
	$('a#'+_id).tab('show').parent().addClass('active');
	$('div.tab-content .tab-pane#'+_id).addClass('active show'); */
	
	
	//$('#myTab li:first-child').addClass('active').find('a').tab('show');
	
	
	//$('div.tab-content .tab-pane').removeClass('active show');
	
	
	
	/* $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
		// 선택되는 요소를 오브젝트화 한다.
		$this = $(e.target);
		// data-load가 false의 경우는 content에 data-load를 한다.
		if(!$this.data("load")) {
		// tab-content의 id를 취득한다.
		var id = $this.attr("href");
		// 페이지 로드를 한다.
		$(id).load($this.data("url"));
		// data-load를 true로 변환하여 중복 로딩이 없게 한다.
		$this.data("load", true);
		}
		
		alert("ajax 호출");
	}); */


// 	// 메뉴가 선택되어 active가 되기 전 이벤트
// 	$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
// 		alert(e);
// 	console.log(e.target); // 현재 설정된 tab
// 	console.log(e.relatedTarget); // 이전에 설정된 탭
// 	});
// 	// 메뉴가 선택되어 active가 된 후 이벤트
// 	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
// 		console.log(e.target); // 현재 설정된 tab
// 		console.log(e.relatedTarget); // 이전에 설정된 탭
// 	});
// 	// 다른 메뉴가 선택되어 active가 remove 되기 전 이벤트
// 	$('a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
// 		console.log(e.target); // 현재 설정된 tab
// 		console.log(e.relatedTarget); // 이전에 설정된 탭
// 	});
// 	// 다른 메뉴가 선택되어 active가 remove 된 후 이벤트
// 	$('a[data-toggle="tab"]').on('hidden.bs.tab', function (e) {
// 		console.log(e.target); // 현재 설정된 tab
// 		console.log(e.relatedTarget); // 이전에 설정된 탭
// 	});
});

function fn_promotion(){
	var _empNo = $("input[name='empNo']").val();
	var _psCode = $("input[name='psCode']").val();
	var _empName = $("input[name='empName']").val();
	
	if(_psCode==""){
		alert("직위를 선택해주세요.");
		$(".selectPosition").focus();
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/admin/comp/member/promotion/modify.do?empNo="+_empNo+"&psCode="+_psCode+"&empName="+_empName+"&transStatus=승진"
		,type : "get"
		,contentType : "application/json; charset=utf-8;"
		,success : function(data){
			Swal.fire({
			  	title: "승진처리가 완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			});
		}
		,error : function(xhr){
			console.log("문제");
		}
	});
}

function fn_change(){
	var _empNo 		= $("input[name='empNo']").val();
	var _psCode 	= $("input[name='psCode']").val();
	var _empName 	= $("input[name='empName']").val();
	var _deptCode 	= $("input[name='deptCode']").val();
	
	if(_deptCode==""){
		alert("부서를 선택해주세요.");
		$(".selectDepartment").focus();
		return;
	}
	
	if(_psCode==""){
		alert("직위를 선택해주세요.");
		$(".selectPosition").focus();
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/admin/comp/member/change/modify.do?empNo="+_empNo+"&psCode="+_psCode+"&empName="+_empName+"&transStatus=이동&deptCode="+_deptCode
		,type : "get"
		,contentType : "application/json; charset=utf-8;"
		,success : function(data){
			Swal.fire({
			  	title: "이동처리가 완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			});
		}
		,error : function(xhr){
			console.log("문제");
		}
	});
}

function fn_leave(){
	var _empNo 		= $("input[name='empNo']").val();
	var _empName 	= $("input[name='empName']").val();
	var _transStartDate = $("input[name='transStartDate']").val();
	var _transEndDate	= $("input[name='transEndDate']").val();
	if(_transStartDate==""){
		alert("휴직 시작 날짜를 선택해주세요.");
		$("input[name='transStartDate']").focus();
		return;
	}
	if(_transEndDate==""){
		alert("휴직 종료 날짜를 선택해주세요.");
		$("input[name='transEndDate']").focus();
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/comp/member/leave/modify.do?empNo="+_empNo+"&empName="+_empName+"&transStartDate="+_transStartDate+"&transEndDate="+_transEndDate+"&transStatus=휴직"
		,type : "get"
		,contentType : "application/json; charset=utf-8;"
		,success : function(data){
			Swal.fire({
			  	title: "휴직처리가 완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			});
		}
		,error : function(xhr){
			console.log("문제");
		}
	});
}
function fn_reinstate(){
	var _empNo 		= $("input[name='empNo']").val();
	var _empName 	= $("input[name='empName']").val();
	var _transStartDate = $("input[name='transStartDate']").val();
	if(_transStartDate==""){
		alert("복직 처리 날짜를 선택해주세요.");
		$("input[name='transStartDate']").focus();
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/comp/member/reinstate/modify.do?empNo="+_empNo+"&empName="+_empName+"&transStartDate="+_transStartDate+"&transStatus=복직"
		,type : "get"
		,contentType : "application/json; charset=utf-8;"
		,success : function(data){
			Swal.fire({
			  	title: "복직처리가 완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			});
		}
		,error : function(xhr){
			console.log("문제");
		}
	});
}

function fn_resign(){
	var _empNo 		= $("input[name='empNo']").val();
	var _empName 	= $("input[name='empName']").val();
	var _transStartDate = $("input[name='transStartDate']").val();
	if(_transStartDate==""){
		alert("퇴사 처리 날짜를 선택해주세요.");
		$("input[name='transStartDate']").focus();
		return;
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/comp/member/resign/modify.do?empNo="+_empNo+"&empName="+_empName+"&transStartDate="+_transStartDate+"&transStatus=퇴사"
		,type : "get"
		,contentType : "application/json; charset=utf-8;"
		,success : function(data){
			Swal.fire({
			  	title: "퇴사처리가 완료되었습니다.",
			  	icon: "success",
			  	buttonsStyling: false,
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				window.opener.parent.location.reload();
				window.close();
			});
		}
		,error : function(xhr){
			console.log("문제");
		}
	});
}
</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-datepicker.js"></script>
</body>
