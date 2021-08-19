<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />
<c:set var="employeeList" value="${dataMap.employeeList}" />
<head>
<style>
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
				인사관리 > 직원 관리
			</h3>
		</div><!-- d-flex justify-content-between align-items-md-center flex-column flex-md-row -->
	</div><!-- col-md-11 -->
</div><!-- row justify-content-center py-8 px-8 py-md-4 px-md-0 -->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content"><!-- p-0 -->
	<div class="d-flex flex-column-fluid">
		<div class="container col-12">
			<div class="card card-custom gutter-b example example-compact" style="height:100%">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
						<div class="btn-group" role="group" aria-label="Basic example">
						    <button type="button" class="btn btn-light-primary" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/registForm','인사등록',680,820);">
						    	<i class="fas fa-user-edit fa-xs"></i>입사처리</button> <!--  i 태그 이미지 색상 변경 text-primary  -->
						    <button type="button" class="btn btn-light-primary" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/org/list','인사변경현황',1500,700);">
						    	<i class="fas fa-user-edit fa-xs"></i>조직도</button>
						    <button type="button" class="btn btn-light-primary" onclick="excel_go()"><i class="fas fa-user-edit fa-xs"></i>엑셀출력</button>
						    <button type="button" class="btn btn-light-primary"
						    				onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/history/list','인사변경현황',1500,700);">
						    	<i class="fas fa-user-edit fa-xs"></i>인사변경현황</button>
						</div>
					</div><!-- card-title -->
					<div class="card-toolbar">
						<div class="input-group row">
							<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);" style="width:135px">
								<option value="10" ${pageMaker.cri.perPageNum==10 ? 'selected':'' } >10명 보기</option>
								<option value="20" ${pageMaker.cri.perPageNum==20 ? 'selected':'' }>20명 보기</option>
						  		<option value="30" ${pageMaker.cri.perPageNum==30 ? 'selected':'' }>30명 보기</option>
						  		<option value="50" ${pageMaker.cri.perPageNum==50 ? 'selected':'' }>50명 보기</option>
							</select>
							<select class="form-control col-md-3" name="searchType" id="searchType"><!-- 이름/사번/부서/직위. -->
								<option value="all" ${pageMaker.cri.searchType eq 'all' ? 'selected':'' }>전 체</option>
								<option value="empNo" ${pageMaker.cri.searchType eq 'empNo' ? 'selected':'' }>사 번</option>
								<option value="empName" ${pageMaker.cri.searchType eq 'empName' ? 'selected':'' }>이 름</option>
								<option value="deptName" ${pageMaker.cri.searchType eq 'deptName' ? 'selected':'' }>부 서</option>
								<option value="psName" ${pageMaker.cri.searchType eq 'psName' ? 'selected':'' }>직 위</option>
								<option value="empStatus" ${pageMaker.cri.searchType eq 'empStatus' ? 'selected':'' }>상 태</option>
							</select>
							
							<input  class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
							<span class="input-group-append">
								<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
									<i class="fa fa-fw fa-search"></i>
								</button>
							</span>
						</div><!-- input-group row -->
					</div><!-- card-toolbar -->
				</div><!-- card-header flex-wrap border-0 pt-6 pb-0 -->
				
				<div class="card-body">
						<div class="row align-items-center">
							<div class="col-lg-10">
							</div><!-- col-lg-9 col-xl-8 -->
							<div class="col-lg-2">
								<div class="row align-items-right">
									<div class="">
<!-- 										<label class="checkbox"> -->
<!-- 						            <input type="checkbox" checked="checked" name="Checkboxes3"/> -->
<!-- 						            <span></span> -->
<!-- 						            	&nbsp;퇴사자 보기 -->
<!-- 						        </label> -->
									</div><!-- my-2 my-md-0 -->
								</div><!-- row align-items-center -->
							</div><!-- col-lg-3 col-xl-4 -->
						</div><!-- row align-items-center -->
					
					<div class="table-responsive">
						<table class="table table-hover" style="overflow:auto; text-align: center;">
							<thead>
								<tr style="left: 0px;">
								
								
									<th scope="col">
										<span style="width: 137px;">NO</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">사번</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">이름</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">부서</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">직위</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">내선번호</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">입사일</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">상태</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">관리</span>
									</th>
								</tr>
							</thead>
							
							<tbody id="tableBody">
								<c:forEach items="${employeeList}" var="employee" varStatus="status">
								<tr>
									<td>
										<span>${status.count}</span>
									</td>
									<td>
										<span id="empNo">${employee.empNo}</span>
									</td>
									<td>
										<span id="empName" class="text-dark text-hover-primary mb-1 font-size-sm" style="cursor:pointer; color: #007bff;" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/detail.do?empNo=${employee.empNo}','상세보기',800,700);">${employee.empName}</span>
									</td>
									<td>
										<span id="deptName">${employee.deptName}</span>
									</td>
									<td>
										<span id="psName">${employee.psName}</span>
									</td>
									<td>
										<span id="empTel">${employee.empTel}</span>
									</td>
									<td>
										<span id="empCreateDate">${employee.strEmpCreateDate}</span>
									</td>
									<td>
										<c:choose>
											<c:when test="${employee.empStatus eq '재직'}">
												<span class="label label-inline label-success mr-2">재직</span>		
											</c:when>
											<c:when test="${employee.empStatus eq '휴직'}">
												<span class="label label-inline label-warning mr-2">휴직</span>		
											</c:when>
											<c:when test="${employee.empStatus eq '퇴직'}">
												<span class="label label-inline label-danger mr-2">퇴직</span>	
											</c:when>
										</c:choose>
									</td>
									<td>
										<span style="cursor:pointer;" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/admin/comp/member/status/modify.do?empNo=${employee.empNo}','인사이동',600,700);" class="label label-light-info label-pill label-inline mr-2">인사이동</span>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div> <!-- end::data table div -->			
				</div><!-- end::card-body -->
				
				<div class="card-footer p-0">
					<c:set var="list_url" value="list.do"></c:set>
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>	
				</div><!-- end::card-footer -->

			</div><!-- card card-custom gutter-b example example-compact -->
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->

<form id="fm" action="<%=request.getContextPath() %>/admin/comp/member/excelDownload" method="get">
	<c:forEach items="${employeeList}" var="employee" varStatus="status">
	    <input type="hidden" name="index" value="${status.index}" />
	    <input type="hidden" name="empNo" value="${employee.empNo}" />
	    <input type="hidden" name="empName" value="${employee.empName}" />
	    <input type="hidden" name="deptName" value="${employee.deptName}" />
	    <input type="hidden" name="psName" value="${employee.psName}" />
	    <input type="hidden" name="empTel" value="${employee.empTel}" />
	    <input type="hidden" name="strEmpCreateDate" value="${employee.strEmpCreateDate}" />
	    <input type="hidden" name="empStatus" value="${employee.empStatus}" />
	</c:forEach>
</form>

<script>
function excel_go(){
	$("#fm").submit();
}

$("#keyword").keydown(function(key) {
    if (key.keyCode == 13) {
    	list_go(1);
    }
});
</script>
</body>