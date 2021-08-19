<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<c:set var="commuteList" value="${dataMap.commuteList }"/>

<head>
<title>사내 직원 출근 통계</title>
</head>
<body>
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon-calendar-with-a-clock-time-tools" style="padding: 0px 10px;"></i>
       		 근태관리 > 전직원 출근 통계
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<div class="container col-12">
	<div class="card card-custom gutter-b">
		<div class="card-header">
			<div class="card-title">
				<h3 class="card-label">직원 출근 통계</h3>
			</div>
			<div class="card-toolbar">
				<button onclick="excel_go();" type="button" class="btn btn-light-primary font-weight-bolder">
					<span class="navi-icon">
						<i class="la la-file-excel-o"></i>
					</span>
					<span class="navi-text">Excel</span>
				</button>
			</div>
		</div>
		<div class="card-body">
			<div class="mb-7">
				<div class="row align-items-center">
					<div class="col-8">
						<div class="input-group row">
							<select class="form-control col-md-2" name="mz_year" id="mz_year" onchange="getDate();">
								<option value='<c:out value="${sysYear}" />' >년도</option>
								<option value='2015' ${year == '2015' ? 'selected':''}>2015년</option>
								<option value='2016' ${year == '2016' ? 'selected':''}>2016년</option>
								<option value='2017' ${year == '2017' ? 'selected':''}>2017년</option>
								<option value='2018' ${year == '2018' ? 'selected':''}>2018년</option>
								<option value='2019' ${year == '2019' ? 'selected':''}>2019년</option>
								<option value='2020' ${year == '2020' ? 'selected':''}>2020년</option>
								<option value='2021' ${year == '2021' ? 'selected':''}>2021년</option>
							</select>
					       	<select class="form-control col-md-2" name="mz_month" id="mz_month" onchange="getDate();">
								<option value='<c:out value="${sysMonth}" />'>월</option>
								<option value='01' ${month == '01' ? 'selected':''}>01월</option>
								<option value='02' ${month == '02' ? 'selected':''}>02월</option>
								<option value='03' ${month == '03' ? 'selected':''}>03월</option>
								<option value='04' ${month == '04' ? 'selected':''}>04월</option>
								<option value='05' ${month == '05' ? 'selected':''}>05월</option>
								<option value='06' ${month == '06' ? 'selected':''}>06월</option>
								<option value='07' ${month == '07' ? 'selected':''}>07월</option>
								<option value='08' ${month == '08' ? 'selected':''}>08월</option>
								<option value='09' ${month == '09' ? 'selected':''}>09월</option>
								<option value='10' ${month == '10' ? 'selected':''}>10월</option>
								<option value='11' ${month == '11' ? 'selected':''}>11월</option>
								<option value='12' ${month == '12' ? 'selected':''}>12월</option>
							</select>
					       	<select class="form-control col-md-4" name="dept" id="dept" onchange="getDate();">
								<option value='' ${department eq '' ? 'selected' : '' }>전체 부서</option>
					       		<c:forEach begin="1" end="${deptList.size() - 1 }" items="${deptList }" var="dept">
									<option value='${dept.deptName }' ${dept.deptName eq department ? 'selected' : '' }>${dept.deptName }</option>
					       		</c:forEach>
							</select>
							<div class="col-md-6"></div>
						</div>
					</div>
					<div class="col-4">
						<div class="my-2 my-md-0">
							<div class="input-group row">
								<select class="form-control col-md-4" name="perPageNum" id="perPageNum"
								        onchange="list_go(1, 'list.do');">
							  		<option value="10" ${pageMaker.cri.perPageNum == 10 ? 'selected' : '' } >10명 보기</option>
							  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected' : '' }>20명 보기</option>
							  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected' : '' }>50명 보기</option>
							  		<option value="100" ${pageMaker.cri.perPageNum == 100 ? 'selected' : '' }>100명 보기</option>
							  	</select>	
								<input  class="form-control" type="text" name="keyword" onkeyup="enterkey();" placeholder="이름으로 검색하기" value="${pageMaker.cri.keyword }"/>
								<span class="input-group-append">
									<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="getDate();">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>	
						</div>
					</div>
				</div>
			</div>
			<div class="content d-flex flex-column flex-column-fluid">
				<div class="d-flex flex-column-fluid">
			        <table class="table">
				         <tr class="label1 text-center">
					        <th scope="col" width="10%">성명</th>
					        <th scope="col" width="9%">직책</th>
					        <th scope="col" width="9%">부서</th>
					        <th scope="col" width="10%">정상출근</th>
					        <th scope="col" width="10%">지각</th>
					        <th scope="col" width="10%">조퇴</th>
					        <th scope="col" width="10%">결근</th>
				        </tr>
				        <c:forEach items="${commuteList }" var="commute" varStatus="idx">
							<tr class="sel1 text-center">
								<td>${commute.empName }</td>
								<td>${commute.psName }</td>
								<td>${commute.deptName }</td>
					        	<td>${list[idx.index].normal }</td>
					        	<td data-toggle="modal" data-target="#lazyDay${idx.index }">
					        		<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${list[idx.index].lazy }</a>
					        		<!-- Modal-->
									<div class="modal fade" id="lazyDay${idx.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									    <div class="modal-dialog" role="document">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h5 class="modal-title" id="exampleModalLabel">지각한 날짜</h5>
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                    <i aria-hidden="true" class="ki ki-close"></i>
									                </button>
									            </div>
									            <div class="modal-body">
									            	<c:choose>
										            	<c:when test="${list[idx.index].lazyDay.size() == 0 }">
										            		지각한 날이 없습니다.
										            	</c:when>
										            	<c:otherwise>
											                <c:forEach items='${list[idx.index].lazyDay }' var='lazyDay'>
				        							  			<div class="h6">${lazyDay }</div>
				        							  		</c:forEach>
										            	</c:otherwise>
										            </c:choose>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
									            </div>
									        </div>
									    </div>
									</div>
					        	</td>
					        	<td data-toggle="modal" data-target="#earlygoDay${idx.index }">
					        		<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${list[idx.index].earlygo }</a>
					        		<!-- Modal-->
					        		<div class="modal fade" id="earlygoDay${idx.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									    <div class="modal-dialog" role="document">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h5 class="modal-title" id="exampleModalLabel">조퇴한 날짜</h5>
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                    <i aria-hidden="true" class="ki ki-close"></i>
									                </button>
									            </div>
									            <div class="modal-body">
									            <c:choose>
									            	<c:when test="${list[idx.index].earlygoDay.size() == 0 }">
									            		조퇴한 날이 없습니다.
									            	</c:when>
									            	<c:otherwise>
										                <c:forEach items='${list[idx.index].earlygoDay }' var='earlygoDay'>
			        							  			<div class="h6">${earlygoDay }</div>
			        							  		</c:forEach>
									            	</c:otherwise>
									            </c:choose>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
									            </div>
									        </div>
									    </div>
									</div>
					        	<td data-toggle="modal" data-target="#notInDay${idx.index }">
					        		<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${list[idx.index].notIn }</a>
					        		<!-- Modal-->
					        		<div class="modal fade" id="notInDay${idx.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									    <div class="modal-dialog" role="document">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h5 class="modal-title" id="exampleModalLabel">결근한 날짜</h5>
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                    <i aria-hidden="true" class="ki ki-close"></i>
									                </button>
									            </div>
									            <div class="modal-body">
									            	<c:choose>
										            	<c:when test="${list[idx.index].notInDay.size() == 0 }">
										            		결근한 날이 없습니다.
										            	</c:when>
										            	<c:otherwise>
											                <c:forEach items='${list[idx.index].notInDay }' var='notInDay'>
				        							  			<div class="h6">${notInDay }</div>
				        							  		</c:forEach>
										            	</c:otherwise>
										            </c:choose>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
									            </div>
									        </div>
									    </div>
									</div>
					        	</td>
					        </tr>
				        </c:forEach>
					</table>
				</div>
			</div>
			<div class="card-footer">
				<c:set var="list_url" value="getDate.do"></c:set>
				<%@ include file="/WEB-INF/views/admin/commute/commute_pagination.jsp" %>				
			</div>
		</div>
	</div>
</div>

<form id="fm" action="<%=request.getContextPath() %>/admin/excel/download" method="get">
	<input type="hidden" name="month" value="${month }" />
	<c:forEach items="${commuteList }" var="commute" varStatus="idx">
	    <input type="hidden" name="empName" value="${commute.empName }" />
	    <input type="hidden" name="psName" value="${commute.psName }" />
	    <input type="hidden" name="deptName" value="${commute.deptName }" />
	    <input type="hidden" name="normal" value="${list[idx.index].normal }" />
	    <input type="hidden" name="lazy" value="${list[idx.index].lazy }" />
	    <input type="hidden" name="earlygo" value="${list[idx.index].earlygo }" />
	    <input type="hidden" name="notIn" value="${list[idx.index].notIn }" />
	</c:forEach>
</form>
<script type="text/javascript">
	function enterkey() {
	    if (window.event.keyCode == 13) {
	    	getDate();
	    }
	}
	
	function getDate() {
		var jobForm = $('#jobForm');
		var theForm = document.forms['jobForm'];
		var input = document.createElement('input');
		var input2 = document.createElement('input');
		var input3 = document.createElement('input');
		
		input.type   = 'hidden';
		input.name  = 'year';
		input.value  = $("#mz_year").val();
		theForm.appendChild(input);
		
		input2.type   = 'hidden';
		input2.name  = 'month';
		input2.value  = $("#mz_month").val();
		theForm.appendChild(input2);
		
		input3.type   = 'hidden';
		input3.name  = 'tempStr';
		input3.value  = $("#dept").val();
		theForm.appendChild(input3);
		
		jobForm.find('[name="page"]').val(1);
		jobForm.find('[name="perPageNum"]').val($('select[name="perPageNum"]').val());
		jobForm.find('[name="searchType"]').val($('select[name="searchType"]').val());
		jobForm.find('[name="keyword"]').val($('input[name="keyword"]').val());
		
		jobForm.attr({
			action : '<%=request.getContextPath() %>/admin/commstat/getDate.do'
			, method : 'get'
		}).submit();
	}
	
	function excel_go() {
		$("#fm").submit();
	}
</script>
</body>
