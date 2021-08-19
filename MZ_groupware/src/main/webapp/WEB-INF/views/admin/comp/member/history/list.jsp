<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker}" />
<c:set var="cri" value="${dataMap.pageMaker.cri}" />
<c:set var="transferHistoryList" value="${dataMap.transferHistoryList}" />
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
	<div class="col-md-11">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
				인사관리 > 인사변경 현황
			</h3>
		</div><!-- d-flex justify-content-between align-items-md-center flex-column flex-md-row -->
	</div><!-- col-md-11 -->
</div><!-- row justify-content-center py-8 px-8 py-md-4 px-md-0 -->

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
					</div><!-- card-title -->
					<div class="card-toolbar">
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">닫기</button>
					</div><!-- card-toolbar -->
				</div><!-- card-header flex-wrap border-0 pt-6 pb-0 -->
				
				<div class="card-body">
					<div class="mb-7">
						<div class="row align-items-center">
							<div class="col-lg-9 col-xl-8">
								<div class="btn-group" role="group" aria-label="Basic example">
								</div>
							</div><!-- col-lg-9 col-xl-8 -->
							<div class="col-lg-3 col-xl-4">
								<div class="row align-items-center">
									<div class="my-2 my-md-0">
										<div class="input-group row">
											<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);" style="width:135px">
												<option value="10" ${pageMaker.cri.perPageNum==10 ? 'selected':'' } >정렬개수</option>
												<option value="20" ${pageMaker.cri.perPageNum==20 ? 'selected':'' }>20개씩</option>
										  		<option value="30" ${pageMaker.cri.perPageNum==30 ? 'selected':'' }>30개씩</option>
										  		<option value="50" ${pageMaker.cri.perPageNum==50 ? 'selected':'' }>50개씩</option>
											</select>
											<select class="form-control col-md-3" name="searchType" id="searchType"><!-- 이름/사번/부서/직위. -->
												<option value="all" ${pageMaker.cri.searchType eq 'all' ? 'selected':'' }>전 체</option>
												<option value="empName" ${pageMaker.cri.searchType eq 'empName' ? 'selected':'' }>이 름</option>
												<option value="transStatus" ${pageMaker.cri.searchType eq 'transStatus' ? 'selected':'' }>상 태</option>
											</select>
											
											<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
											<span class="input-group-append">
												<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div><!-- input-group row -->
									</div><!-- my-2 my-md-0 -->
					
								</div><!-- row align-items-center -->
							</div><!-- col-lg-3 col-xl-4 -->
						</div><!-- row align-items-center -->
					</div><!-- mb-7 -->
					
					<div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable" style="">
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
										<span style="width: 137px;">인사처리시작일</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">인사처리종료일</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">상태</span>
									</th>
								</tr>
							</thead>
							
							<tbody id="tableBody">
								<c:forEach items="${transferHistoryList}" var="transferHistory" varStatus="status">
								<tr>
									<td>	
										<span>${status.count}</span>
									</td>
									<td>
										<span id="empNo">${transferHistory.empNo}</span>
									</td>
									<td>
										<span id="empName">${transferHistory.empName}</span>
									</td>
									<td>
										<span id="deptName">${transferHistory.deptName}</span>
									</td>
									<td>
										<span id="psName">${transferHistory.psName}</span>
									</td>
									<td>
										<span id="transStartDate">${transferHistory.strTransStartDate ne ''? transferHistory.strTransDate: transferHistory.strTransStartDate}</span>
									</td>
									<td>
										<span id="transEndDate">${transferHistory.strTransEndDate}</span>
									</td>
									<td>
										<c:choose>
											<c:when test="${transferHistory.transStatus eq '퇴사'}">
												<span id="transStatus" class="label label-inline label-danger mr-2">퇴사</span>		
											</c:when>
											<c:when test="${transferHistory.transStatus eq '휴직'}">
												<span id="transStatus" class="label label-inline label-warning mr-2">휴직</span>		
											</c:when>
											<c:when test="${transferHistory.transStatus eq '복직'}">
												<span id="transStatus" class="label label-inline label-info mr-2">복직</span>	
											</c:when>
											<c:when test="${transferHistory.transStatus eq '이동'}">
												<span id="transStatus" class="label label-inline label-primary mr-2">이동</span>	
											</c:when>
											<c:when test="${transferHistory.transStatus eq '승진'}">
												<span id="transStatus" class="label label-inline label-success mr-2">승진</span>	
											</c:when>
										</c:choose>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div> <!-- end::data table div -->			
				</div><!-- end::card-body -->
				
				<div class="card-footer">
					<c:set var="list_url" value="list.do"></c:set>
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>	
				</div><!-- end::card-footer -->

			</div><!-- card card-custom gutter-b example example-compact -->
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->


</body>
