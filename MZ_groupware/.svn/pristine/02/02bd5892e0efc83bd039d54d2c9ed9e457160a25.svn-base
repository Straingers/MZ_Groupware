<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 

<head>
<title>부서별 출근 통계</title>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon2-calendar-1" style="padding: 0px 10px;"></i>
        		 근태관리 > 부서별 월별 출근 통계
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
<div class="container col-12">
	<div class="card card-custom" style="height: 100%">
		<div class="card-header">
			<div class="card-title">
				${loginUser.deptName }
			</div>
		</div>
		<div class="card-body">
			<div class="mb-7">
				<div class="row align-items-center">
					<div class="col-lg-9 col-xl-8">
						<div class="input-group row">
							&nbsp;&nbsp;&nbsp;&nbsp;
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
							<div class="col-md-8"></div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="content d-flex flex-column flex-column-fluid">
				<div class="d-flex flex-column-fluid">
			        <table class="table">
				         <tr class="thead-light" style="text-align: center;">
					        <th scope="col">성명</th>
					        <th scope="col">직책</th>
					        <th scope="col">부서</th>
					        <th scope="col">정상출근</th>
					        <th scope="col">지각</th>
					        <th scope="col">조퇴</th>
					        <th scope="col">결근</th>
				        </tr>
				        <c:forEach items="${commuteList }" var="commute" varStatus="idx">
							<tr class="sel1" style="text-align: center;">
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
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
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
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
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
									                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
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
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	function getDate() {
		var year = $("#mz_year").val();
		var month = $("#mz_month").val();
		location.href = 
			"<%=request.getContextPath() %>/comm/getDayStat.do?year=" + year + "&month=" + month +"&deptName=${loginUser.deptName }";
	}
</script>
</body>
