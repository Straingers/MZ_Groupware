<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<c:set var="sysMonth"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
<title>소속 부서 월별 근태 현황</title>
<head>
<style>
	th, td {
		padding: 0px;
		margin: 0px;
	}
	.table-responsive::-webkit-scrollbar {
	   width: 5px; /*스크롤바의 너비*/
	   height: 15px;
	}
	
	.table-responsive::-webkit-scrollbar-thumb {
	   background-color: rgb(226, 226, 226);
	}
	
	.table-responsive::-webkit-scrollbar-track {
	   background-color: white;
	}
</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon2-calendar-1" style="padding: 0px 10px;"></i>
        		 근태관리 > 부서별 월별 출근 기록
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
		<div class="container col-12">
			<!--begin::Card-->
			<div class="card card-custom" style="height: 100%">
				<div class="card-body">
					<!--begin: Datatable-->
					<div class="mb-7">
						<div class="col-12 mr-0 pr-0">
							<div class="input-group row">
								<div class="col-6">
									<div class="row">
									<select class="form-control col-3" name="mz_year" id="mz_year" onchange="getDate();">
										<option value='<c:out value="${sysYear}" />' >년도</option>
										<option value='2015' ${year == '2015' ? 'selected':''}>2015년</option>
										<option value='2016' ${year == '2016' ? 'selected':''}>2016년</option>
										<option value='2017' ${year == '2017' ? 'selected':''}>2017년</option>
										<option value='2018' ${year == '2018' ? 'selected':''}>2018년</option>
										<option value='2019' ${year == '2019' ? 'selected':''}>2019년</option>
										<option value='2020' ${year == '2020' ? 'selected':''}>2020년</option>
										<option value='2021' ${year == '2021' ? 'selected':''}>2021년</option>
									</select>
							       	<select class="form-control col-3" name="mz_month" id="mz_month" onchange="getDate();">
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
									<div class="col-6"></div>
									</div>
								</div>
								<div class="col-6 mr-0 pr-0" align="right">
									<div class="card-toolbar">
										<button class="btn btn-light-primary font-weight-bolder" data-toggle="modal" data-target="#commChangeModal">
											<span class="navi-icon">
												<i class="flaticon-edit"></i>
											</span>
											<span class="navi-text">근태 수정 내역</span>
										</button>
										<button onclick="excel_go();" type="button" class="btn btn-light-primary font-weight-bolder">
											<span class="navi-icon">
												<i class="la la-file-excel-o"></i>
											</span>
											<span class="navi-text">Excel</span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<br>
						<form id="fm" action="" method="get">
							<input type="hidden" name="deptName" value="${loginUser.deptName }">
				    		<input type="hidden" name="yearMonth" value="${year }_${month }" />
						<div class="row">
							<div class="col-sm-12 table-responsive">
								<table class="table table-bordered" style="text-align: center; width:1800px;">
									<colgroup>
										<c:forEach begin="1" end="32">
											<col width="80px"></col>
										</c:forEach>
									</colgroup>	
								<thead class="thead-light">						
							    	<tr>
							    		<th scope="row"></th>
							    		<c:forEach begin="1" end="${lastDay }" var="day">
									    	<th>
									    		${day }
									    		<input type="hidden" name="day" value="${day }" />
									    	</th>
							    		</c:forEach>
							    	</tr>
							    	<tr id="dayOfWeek" scope="row"></tr>
							    </thead>
							    <tbody class="thead-light">
							    	<c:forEach items="${commuteList }" var="commute">
							    		<tr class="p-1">
							    			<th rowspan="3" width="120px" style="vertical-align: middle;">
							    				${commute.psName }<br>${commute.empName }
								    			<input type="hidden" name="empName" value="${commute.empName }" />
								    			<input type="hidden" name="psName" value="${commute.psName }" />
							    			</th>
								    		<c:forEach begin="1" end="${lastDay }" var="day">
								    			<c:choose>
									    			<c:when test="${fn:length(commute.inTime) ge 20}">
									    				<c:forEach items="${commute.inTime.split(',') }" var="time">
											    			<c:choose>
												    			<c:when test="${day < 10 ? fn:substring(time, 8, 10) eq day : fn:substring(time, 8, 10) eq day }">
														   			<c:set var="date" value="${time.split(' ')[0] }"></c:set>
														   			<c:set var="dateOut" value="${time.split(' ')[1] }"></c:set>
												    			</c:when>
											    			</c:choose>
											   			</c:forEach>
									    			</c:when>
									    			<c:otherwise>
											   			<c:set var="date" value="${commute.inTime.split(' ')[0] }"></c:set>
											   			<c:set var="dateOut" value="${commute.inTime.split(' ')[1] }"></c:set>
											   		</c:otherwise>
								    			</c:choose>
									    		<c:choose>
										    		<c:when test="${fn:substring(date, 5, 7) eq month && (day < 10 ? fn:substring(date, 8, 10) eq day : fn:substring(date, 8, 10) eq day) }" >
										    			<td style="padding: 4px; vertical-align: middle;">
										    				${fn:substring(dateOut, 0, 5) }
										    				<input type="hidden" name="inTime" value="${fn:substring(dateOut, 0, 5) }" />
										    			</td>
										    		</c:when>
										    		<c:otherwise>
										    			<td style="padding: 4px; vertical-align: middle;">
											    			-
										    				<input type="hidden" name="inTime" value="-" />
										    			</td>
										    		</c:otherwise>
									    		</c:choose>
								    		</c:forEach>
								    	</tr>
								    	<tr>
								    		<c:forEach begin="1" end="${lastDay }" var="day">
								    			<c:choose>
									    			<c:when test="${fn:length(commute.outTime) ge 21}">
									    				<c:forEach items="${commute.outTime.split(',') }" var="time">
											    			<c:choose>
												    			<c:when test="${day < 10 ? fn:substring(time, 8, 10) eq day : fn:substring(time, 8, 10) eq day }">
														   			<c:set var="date" value="${time.split(' ')[0] }"></c:set>
														   			<c:set var="dateOut" value="${time.split(' ')[1] }"></c:set>
												    			</c:when>
											    			</c:choose>
											   			</c:forEach>
									    			</c:when>
									    			<c:otherwise>
											   			<c:set var="date" value="${commute.outTime.split(' ')[0] }"></c:set>
											   			<c:set var="dateOut" value="${commute.outTime.split(' ')[1] }"></c:set>
											   		</c:otherwise>
								    			</c:choose>
									    		<c:choose>
										    		<c:when test="${fn:substring(date, 5, 7) eq month && (day < 10 ? fn:substring(date, 8, 10) eq day : fn:substring(date, 8, 10) eq day) }" >
										    			<td style="padding: 4px; vertical-align: middle;">
										    				${fn:substring(dateOut,0, 5) }
										    				<input type="hidden" name="outTime" value="${fn:substring(dateOut,0, 5) }" />
										    			</td>
										    		</c:when>
										    		<c:otherwise>
										    			<td style="padding: 4px; vertical-align: middle;">
										    				-
										    				<input type="hidden" name="outTime" value="-" />
										    			</td>
										    		</c:otherwise>
									    		</c:choose>
								    		</c:forEach>
								    	</tr>
								    	<tr>
								    		<c:forEach begin="1" end="${lastDay }" var="day">
												<c:choose>
									    			<c:when test="${fn:length(commute.outTime) ge 21}">
									    				<c:forEach items="${commute.inTime.split(',') }" var="time" varStatus="status">
											    			<c:choose>
												    			<c:when test="${day < 10 ? fn:substring(time, 8, 10) eq day : fn:substring(time, 8, 10) eq day }">
														   			<c:set var="date" value="${time.split(' ')[0] }"></c:set>
														   			<c:set var="type" value="${commute.inType.split(',')[status.index] }"></c:set>
														   			<c:set var="outtype" value="${commute.outType.split(',')[status.index] }"></c:set>
														   			<c:set var="commNo" value="${commute.commuteNo.split(',')[status.index] }"></c:set>
												    			</c:when>
											    			</c:choose>
											   			</c:forEach>
									    			</c:when>
									    			<c:otherwise>
											   			<c:set var="date" value="${commute.outTime.split(' ')[0] }"></c:set>
											   			<c:set var="type" value="${commute.inType }"></c:set>
											   			<c:set var="outtype" value="${commute.outType }"></c:set>
											   			<c:set var="commNo" value="${commute.commuteNo }"></c:set>
											   		</c:otherwise>
								    			</c:choose>
									    		<c:choose>
										    		<c:when test="${fn:substring(date, 5, 7) eq month && (day < 10 ? fn:substring(date, 8, 10) eq day : fn:substring(date, 8, 10) eq day) }" >
										    			<td style="padding: 4px; vertical-align: middle;" data-toggle="modal" data-target="#inType" 
										    				onclick="openModifyModal('${commNo }', '${commute.empName }', '${type }');">
										    				<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${type }</a>
										    				<input type="hidden" name="inType" value="${type }" />
										    			</td>
										    		</c:when>
										    		<c:otherwise>
										    			<td style="padding: 4px; vertical-align: middle;">
										    				-
										    				<input type="hidden" name="inType" value="-" />
										    			</td>
										    		</c:otherwise>
									    		</c:choose>
							    			</c:forEach>
								    	</tr>
							    	</c:forEach>
							    	</tbody>
							    </table>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="inType" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm" role="document">
	    <div class="modal-content">
	        <div class="modal-header">
	            <h5 class="modal-title" align="center" id="modalTitle"></h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <i aria-hidden="true" class="ki ki-close"></i>
	            </button>
		     </div>
		     <div class="modal-body">
		        <select class="form-control" width="100px" id="changeType">
					<option value='출근'>출근</option>
					<option value='지각'>지각</option>
					<option value='조퇴'>조퇴</option>
					<option value='결근'>결근</option>
				</select>
		    </div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		    	<button type="button" class="btn btn-primary" onclick="edit_inType();">수정</button>
		    </div>
       </div>
	</div>
</div>

<div class="modal fade" id="commChangeModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        	<div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${year}년 ${month }월 근태 수정 내역</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
				<table class="table">
				    <thead class="thead-light text-center">
					    <tr>
					    	<th>사번</th>
					    	<th>성명</th>
					    	<th>변경한일자</th>
					    	<th>수정 전</th>
					    	<th>수정 후</th>
					    	<th>수정한날짜</th>
					    </tr>
				    </thead>
				    <tbody class="text-center">
				    	<c:choose>
					    	<c:when test="${commChangeList.size() == 0 }">
						    	<tr>
						    		<td colspan="6" class="h5"><br>수정한 근태내역이 없습니다.</td>
						    	</tr>
					    	</c:when>
					    	<c:otherwise>
								<c:forEach items="${commChangeList }" var="commChange">
									<tr>
										<td>${commChange.changeEmpNo }</td>
										<td>${commChange.changeEmpName }</td>
										<td>${commChange.time }</td>
										<td>${commChange.formerInType }</td>
										<td>${commChange.changeInType }</td>
										<td>${commChange.changeTime.split(" ")[0] }</td>
									</tr>
								</c:forEach>
					    	</c:otherwise>
				    	</c:choose>
				    </tbody>
				</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</div>
<input type="hidden" id="modifyCommuteNo" value="" />
<input type="hidden" id="modifyempName" value="" /> 
<script type="text/javascript">
	function getDate() {
		var year = $("#mz_year").val();
		var month = $("#mz_month").val();
		location.href = 
			"<%=request.getContextPath() %>/comm/getDay.do?year=" + year + "&month=" + month +"&deptName=${loginUser.deptName }";
	}
	
	$(document).ready(function(){
	    var week = new Array('일', '월', '화', '수', '목', '금', '토');
	    var dayOfWeek = "<th></th>";
	    for(var i = 1; i <= ${lastDay}; i++){
		    var today = new Date($("#mz_year").val() + "-" + $("#mz_month").val() + "-" + i).getDay();
		    var todayLabel = week[today];
		    if(todayLabel == '토') {
			    dayOfWeek += "<th><span class='text-primary'>" + todayLabel + "</span></th>";
		    } else if(todayLabel == '일') {
			    dayOfWeek += "<th><span class='text-danger'>" + todayLabel + "</span></th>";
		    } else {
			    dayOfWeek += "<th>" + todayLabel + "</th>";
		    }
	    }
	    $("#dayOfWeek").html(dayOfWeek);
	})
	
	function openModifyModal(commuteNo, empName, type) {
		$("#modifyCommuteNo").val(commuteNo);
		$("#modifyempName").val(empName);
		$("#modalTitle").text("'" + empName + "'의 근태 수정");
		$("#changeType").val(type).attr("selected", true);
	}
	
	function edit_inType(idx) {
		var form = {
					commuteNo : $("#modifyCommuteNo").val()
					, inType : $("#changeType option:selected").val()
				};
		console.log($("#changeType option:selected").val());
		$.ajax({
			  url : "<%=request.getContextPath() %>/comm/editIntype.do"
    		, data : JSON.stringify(form)
    		, async : false
    		, type : "post"
    		, dataType : 'json'
    		, contentType: "application/json; charset=utf-8;"
    		, success : function(data) {
    			Swal.fire({
    				icon: "success",
			        title: "수정이 완료되었습니다.",
			        showConfirmButton: false,
			        timer: 1500
          		}).then((result) => {
        		   location.reload();
        	  	});
    		}
		});
	}
	
	function excel_go() {
		$("#fm").attr("action", '<%=request.getContextPath() %>/comm/excel/download');
		$("#fm").submit();
	}
</script>
</body>
