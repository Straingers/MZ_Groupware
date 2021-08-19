<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${dataMap.cri}"/>   
     
<c:if test="${empty loginUser }">
<script>
	window.parent.location.href = "<%=request.getContextPath()%>/common/loginForm.do";
</script>
</c:if>

<style>
.card.card-custom {
  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05); !important
}

.datepicker.datepicker-inline {
	border: none;
}

.datepicker {
	width: 100%;
	padding-bottom: 10px;
	border-radius: 0.42rem;
}

#calendarList::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}

#calendarList::-webkit-scrollbar-thumb {
	background-color: #3699FF;
}

#calendarList::-webkit-scrollbar-track {
	background-color: white;
}

#res1::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}

#res1::-webkit-scrollbar-thumb {
	background-color: #3699FF;
}

#res1::-webkit-scrollbar-track {
	background-color: white;
}

#res2::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}

#res2::-webkit-scrollbar-thumb {
	background-color: #3699FF;
}

#res2::-webkit-scrollbar-track {
	background-color: white;
}
</style>                 
<!--begin::Content -->
<div class="content d-flex flex-column flex-column-fluid p-3" id="kt_content">
	<!--begin::Entry -->
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Example-->
			<!--begin::Row-->
			<div class="row">
				<div class="col-4">
					<div class="card card-custom">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>내정보
							</div>
							<div class="card-toolbar">
								<span class="text-hover-primary mr-2" data-toggle="tooltip" title="" data-original-title="내 정보 페이지"
									  onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=Q010000'">
									<i class="ki ki-plus"></i>
								</span>
							</div>
						</div>
						<div class="card-body mb-2 pb-2">
							<div class="text-center">
								<div class="symbol symbol-60 symbol-circle symbol-xl-90">
									<div class="symbol-label" style="background-image:url('<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto=${loginUser.empPhoto}')"></div>
								</div>
								<h5 class="font-weight-bold my-2">${loginUser.empName }&nbsp;${loginUser.psName }님 환영합니다.</h5>
								<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd(E)" /></c:set> 
								<br>
								<div align="center">
									<div style="border:1px solid #dedede; border-radius:20px; width:80%;">
										<div class="mt-2 font-weight-bolder">${today }</div>
										<div id="clock" style="width:80%; height:50px; color:#666; font-size:30px; text-align:center;">
										</div>
									</div>
								</div>
								<br><br>
								<table class="table table-bordered">
									<tr>
										<th class="table-active pr-0 pl-0 m-0" style="width: 50px">출근</th>
										<td style="width: 100px">${commute.inTime.split(' ')[1].substring(0, 5) }</td>
										<th class="table-active pr-0 pl-0 m-0" style="width: 50px">퇴근</th>
										<td style="width: 100px">${commute.outTime.split(' ')[1].substring(0, 5) }</td>
									</tr>
								</table>
								<br>
								<div align="left">
									<h6 class="card-title align-items-start flex-column mb-2 pt-1">
										<span class="card-label font-weight-bolder text-dark">소정 근로시간(${workingHour } / 40시간)</span><br>
										<span class="text-muted mt-3 font-weight-bold font-size-sm">${monday }&nbsp;~&nbsp;${friday }</span>
									</h6>
									<div class="progress" style="height: 17px">
									    <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: ${hour / 40 * 100 }%;" aria-valuenow="${hour / 40 * 100 }" aria-valuemin="0" aria-valuemax="100">
									    </div>
									</div>
								</div>
								<br>
							</div>
						</div>
					</div>
					<div class="card card-custom">
						<div class="card-header card-header-tabs-line card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>쪽지함
							</div>
							<div class="card-toolbar">
								<ul class="nav nav-tabs nav-bold nav-tabs-line">
								    <li class="nav-item">
									    <a class="nav-link active" data-toggle="tab" href="#recBox">
<!-- 										    <span class="nav-icon"><i class="flaticon2-chat-1"></i></span> -->
										    <span class="nav-text">수신함</span>
									    </a>
								    </li>
								    <li class="nav-item">
									    <a class="nav-link" data-toggle="tab" href="#sendBox">
<!-- 										    <span class="nav-icon"><i class="flaticon2-drop"></i></span> -->
										    <span class="nav-text">발신함</span>
									    </a>
								    </li>
							    </ul>
						    </div>
						</div>
						<div class="card-body m-3 p-0">
							<div class="tab-content">
								<div class="tab-pane fade active show m-0 p-0" id="recBox" role="tabpanel" aria-labelledby="recBox">
									<div class="table-responsive">
										<table class="table table-borderless" style="font-size: 12.5px;">
											<tbody>
												<c:choose>
													<c:when test="${!empty msgRecMap.msgList}">
														<c:forEach items="${msgRecMap.msgList }" var="msg" end="3">
															<tr class="cursor-pointer" onclick="OpenWindow('<%=request.getContextPath()%>/message/main/detail.do?mssNo=${msg.mssNo}','쪽지 상세',600,500);">
																<td class="align-middle d-inline-block text-truncate py-2" width="220px">${msg.mssContent}</td>
																<td class="text-center align-middle px-1" width="60px">${msg.sender}</td>
																<c:set var="senddate1" value="${msg.mssSenddate}"/>
																<c:set var="tmp" value="${fn:replace(senddate1, '.', '-')}"/>
																<c:set var="senddate2" value="${fn:substring(tmp,0, 6)}"/>
																<td class="text-center align-middle px-1" width="50px">${senddate2}</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr class="text-center" style="border-top: 0px" >
															<th scope="col">수신된 쪽지가 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="sendBox" role="tabpanel" aria-labelledby="sendBox">
									<div class="table-responsive">
										<table class="table table-borderless" style="font-size: 12.5px;">
											<tbody>
												<c:choose>
													<c:when test="${!empty msgSendMap.msgList}">
														<c:forEach items="${msgSendMap.msgList }" var="msg" end="3">
															<tr class="cursor-pointer" onclick="OpenWindow('<%=request.getContextPath()%>/message/main/detail.do?mssNo=${msg.mssNo}','쪽지 상세',500,450);">
																<td class="align-middle d-inline-block text-truncate py-2" width="220px">${msg.mssContent}</td>
																<td class="text-center align-middle px-1" width="60px">${msg.receiver}</td>
																<c:set var="senddate1" value="${msg.mssSenddate}"/>
																<c:set var="tmp" value="${fn:replace(senddate1, '.', '-')}"/>
																<c:set var="senddate2" value="${fn:substring(tmp,0, 6)}"/>
																<td class="text-center align-middle px-1" width="50px">${senddate2}</td>
															</tr>
														</c:forEach>
			
													</c:when>
													<c:otherwise>
														<tr class="text-center">
															<th scope="col">발신된 쪽지가 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="col-4">
					<div class="card card-custom card-stretch card-stretch-third">
						<div class="card-header card-header-tabs-line card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>전자결재/업무관리
							</div>
							<div class="card-toolbar">
								<ul class="nav nav-tabs nav-bold nav-tabs-line">
								    <li class="nav-item">
									    <a class="nav-link active" data-toggle="tab" href="#appList">
										    <span class="nav-icon"><i class="flaticon2-chat-1"></i></span>
										    <span class="nav-text">전자결재</span>
									    </a>
								    </li>
								    <li class="nav-item">
									    <a class="nav-link" data-toggle="tab" href="#taskList">
										    <span class="nav-icon"><i class="flaticon2-drop"></i></span>
										    <span class="nav-text">업무관리</span>
									    </a>
								    </li>
							    </ul>
						    </div>
					    </div>
				    	<div class="card-body p-0">
							<div class="tab-content">
								<div class="tab-pane fade show active" id="appList" role="tabpanel" aria-labelledby="appList">
									<table class="table">
										<c:forEach items="${appList}" var="app" end="3">
											<tr>
												<td class="align-middle d-inline-block text-truncate" width="251px">
													<c:if test="${app.appStatus eq '진행중'}">
														<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/approval/lib/ing/detail.do?appNo=${app.appNo}','전자결재 상세',1000,700);">
															<span class="label label-md font-weight-bolder label-rounded label-success" style="width:30px;">진행</span>
															${app.appTitle}
														</a>
													</c:if>
													<c:if test="${app.appStatus eq '결재완료'}">
														<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/approval/lib/comp/detail.do?appNo=${app.appNo}','전자결재 상세',1000,700);">
															<span class="label label-md font-weight-bolder label-rounded label-primary" style="width:30px;">완료</span>
															${app.appTitle}
														</a>
													</c:if>
													<c:if test="${app.appStatus eq '반려'}">
														<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/approval/lib/rej/detail.do?appNo=${app.appNo}','전자결재 상세',1000,700);">
															<span class="label label-md font-weight-bolder label-rounded label-danger" style="width:30px;">반려</span>
															${app.appTitle}
														</a>
													</c:if>
													<c:if test="${app.appStatus eq '참조'}">
														<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/approval/lib/ref/detail.do?appNo=${app.appNo}','전자결재 상세',1000,700);">
															<span class="label label-md font-weight-bolder label-rounded label-info" style="width:30px;">참조</span>
															${app.appTitle}
														</a>
													</c:if>
													<c:if test="${app.appStatus eq '회람'}">
														<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/approval/lib/cir/detail.do?appNo=${app.appNo}','전자결재 상세',1000,700);">
															<span class="label label-md font-weight-bolder label-rounded label-warning" style="width:30px;">회람</span>
															${app.appTitle}
														</a>
													</c:if>
												</td>
												<td class="text-center align-middle px-1" width="55px">${app.empName}</td>
												<td class="text-center align-middle px-1" width="55px">
													<fmt:formatDate value="${app.appUpDate}" pattern="MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div class="tab-pane fade" id="taskList" role="tabpanel" aria-labelledby="taskList">
									<table class="table">
										<c:forEach items="${taskList}" var="task" end="3">
											<tr>
												<td class="align-middle d-inline-block text-truncate" width="251px">
													<c:if test="${task.taskSubtype eq '업무공유'}">
													<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/task/share/detail.do?taskNo=${task.taskNo}','업무공유 상세',1000,700);">
														<span class="label label-md font-weight-bolder label-rounded label-info" style="width:30px;">공유</span>
														${task.taskTitle}
													</a>
													</c:if>
													<c:if test="${task.taskSubtype ne '업무공유'}">
													<a class="text-dark text-hover-primary" href="javascript:OpenWindow('<%=request.getContextPath()%>/task/daily/detail.do?taskNo=${task.taskNo}','업무보고 상세',1000,700);">
														<span class="label label-md font-weight-bolder label-rounded label-success" style="width:30px;">보고</span>
														${task.taskTitle}
													</a>
													</c:if>
												</td>
												<td class="text-center align-middle px-1" width="55px">${task.empName}</td>
												<td class="text-center align-middle px-1" width="55px">
													<fmt:formatDate value="${task.taskDate}" pattern="MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					
					




					
					<div class="card card-custom card-stretch card-stretch-third">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left" style="border-bottom: 0px;min-height:50px;">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>QUICK WORK
							</div>
						</div>
						<div class="card-body p-5">
							<ul class="navi navi-hover">
							    <li class="navi-item">
							        <a class="navi-link" href="#">
							            <span class="navi-icon" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M020200'"><i class="fas fa-file-alt text-danger"></i></span>
							            <span class="navi-text" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M020200'">미결재문서</span>
							            <span class="navi-label" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M020200'">
								            <span class="label label-lg label-light-danger label-inline font-weight-bolder label-inline">${appCnt}</span>
							            </span>
							            <span class="navi-label">
							            	<i class="fas fa-pen-square icon-2x text-danger" onclick="OpenWindow('<%=request.getContextPath()%>/approval/registForm','결재문서 등록',1200,800);"></i>
							            </span>
							        </a>
							    </li>
							    <li class="navi-item">
							        <a class="navi-link" href="#">
							            <span class="navi-icon" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030100'"><i class="fas fa-share-alt text-warning"></i></span>
							            <span class="navi-text" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030100'">미확인공유</span>
							            <span class="navi-label" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030100'">
							                <span class="label label-lg label-light-warning label-rounded font-weight-bolder label-inline">${shareCnt}</span>
							            </span>
							            <span class="navi-label">
							            	<i class="fas fa-pen-square icon-2x text-warning" onclick="OpenWindow('<%=request.getContextPath()%>/task/share/registForm.do','작성',1200,800);"></i>
							            </span>
							        </a>
							    </li>
							    <li class="navi-item">
							        <a class="navi-link" href="#">
							            <span class="navi-icon" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030200'"><i class="fas fa-archive text-success"></i></span>
							            <span class="navi-text" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030200'">미확인보고</span>
							            <span class="navi-label" onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M030200'">
							                <span class="label label-lg label-light-success label-rounded font-weight-bolder label-inline">${dailyCnt}</span>
							            </span>
							            <span class="navi-label">
							            	<i class="fas fa-pen-square icon-2x text-success" onclick="OpenWindow('<%=request.getContextPath()%>/task/daily/registForm.do','작성',1200,800);"></i>
							            </span>
							        </a>
							    </li>
							</ul>
						</div>
					</div>
					
					
					
					
					<div class="card card-custom">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>공지사항
							</div>
							<div class="card-toolbar">
								<span class="text-hover-primary" style="cursor:pointer;"
									  onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M050000'">
									<i class="ki ki-plus"></i>
								</span>
							</div>
						</div>
						<div class="card-body" style="padding: 0px;">
							<table class="table">
							    <tbody id="NoticeList">
							        
							    </tbody>
							</table>
						</div>
					</div>
				</div>
				
				
				
				
				<div class="col-4">
					<div class="card card-custom" style="height: 500px;">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>일정
							</div>
							<div class="card-toolbar">
								<span class="text-hover-primary"  style="cursor:pointer;"
									  onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=Q040000'">
									<i class="ki ki-plus"></i>
								</span>
							</div>
						</div>
						<div class="card-body" style="padding: 0px;">
							<div class="input-group" id="kt_datepicker_6">
								<input type="hidden" class="form-control" id="date" pattern="yy-mm-dd"/>
							</div>
							<div>
								<ul id="calendarList" style="padding-top: 10px; overflow:auto; overflow-y: auto; overflow-x: hidden; height: 130px; list-style:none; padding-left: 15px;">
								</ul>
								<ul id="noCalendarList" class="text-center" style="display: none; padding-top: 10px; list-style:none; padding-left: 15px;">
									<li scope="col" style="padding-bottom: 10px; cursor:default;">일정이 없습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				<div class="card card-custom"  style="height: 240px;">
						<div class="card-header card-header-tabs-line card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>예약현황
							</div>
							<div class="card-toolbar">
								<ul class="nav nav-tabs nav-bold nav-tabs-line">
								    <li class="nav-item">
									    <a class="nav-link active" data-toggle="tab" href="#res1">
										    <span class="nav-icon"><i class="flaticon2-group"></i></span>
										    <span class="nav-text">회의실</span>
									    </a>
								    </li>
								    <li class="nav-item">
									    <a class="nav-link" data-toggle="tab" href="#res2">
										    <span class="nav-icon"><i class="flaticon2-group"></i></span>
										    <span class="nav-text">세미나실</span>
									    </a>
								    </li>
							    </ul>
						    </div>
						</div>
						<div class="card-body m-3 p-0" >
							<div class="tab-content">
								<div class="tab-pane fade active show m-0 p-0" id="res1" role="tabpanel" aria-labelledby="recBox">
									<div class="table-responsive" id="res1" style="height:150px; overflow: auto;">
										<table class="table table-borderless" style="font-size: 12.5px;">
											<tbody >
												<c:choose>
													<c:when test="${!empty reservationList.reservationList1}">
														<c:forEach items="${reservationList.reservationList1 }" var="res">
															<tr style="cursor:default;">
																<td class="align-middle d-inline-block text-truncate py-2" width="200px">${res.resStartdate} ~ ${res.resEnddate}</td>
																<td class="text-center align-middle px-1" width="100px">${res.deptName}</td>
 																<td class="text-center align-middle px-1" width="50px">${res.empName}</td> 
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr class="text-center" style="border-top: 0px" >
															<th scope="col" style="cursor:default;">예약내역이 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="res2" role="tabpanel" aria-labelledby="sendBox">
									<div class="table-responsive" id="res2" style="height:150px; overflow: auto;">
										<table class="table table-borderless" style="font-size: 12.5px;">
											<tbody>
												<c:choose>
													<c:when test="${!empty reservationList.reservationList2}">
														<c:forEach items="${reservationList.reservationList2}" var="res" >
															<tr style="cursor:default;">
																<td class="align-middle d-inline-block text-truncate py-2" width="200px">${res.resStartdate} ~ ${res.resEnddate}</td>
																<td class="text-center align-middle px-1" width="100px">${res.deptName}</td>
 																<td class="text-center align-middle px-1" width="50px">${res.empName}</td> 
															</tr>
														</c:forEach>
			
													</c:when>
													<c:otherwise>
														<tr class="text-center">
															<th scope="col" style="cursor:default;">예약내역이 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
			
			</div>
			<!--end::Row-->
		</div>
		<!--end::Container-->
	</div>
	<!--end::Entry -->
</div>
<!--end::Content -->
<form id="auto" class="form" action="<%=request.getContextPath() %>/common/login.do" method="post">
	<input type="hidden" name="empNo">
	<input type="hidden" name="empPwd">
</form>
<form role="msgForm">
	<input type="hidden" name="mssNo">
</form>

<script>
	var cssRule = "font-size:2em;"
	var cssLogo1 = "color:#3699FF;" + "font-size: 30px;" + "font-weight: bold;"
			+ "letter-space:-1px;" + "font-family:Tahoma,Arial,sans-serif";
	var cssLogo2 = "color:#231916;" + "font-size: 30px;" + "font-weight: bold;"
			+ "letter-space:-1px;" + "font-family:Tahoma,Arial,sans-serif";
	if (window.console != undefined) {
		setTimeout(
				console.log.bind(console, "%cMZ %cGROUPWARE", cssLogo1, cssLogo2), 0);
	}
</script>

<script>
function fn_login() {
	var id = $('#autoLogin').val();
	var pw = '';
	
	if(id == 'admin') {
		pw = 'java';
	} else {
		pw = '1234';
	}
	
	$('form > input[name="empNo"]').val(id);
	$('form > input[name="empPwd"]').val(pw);
	
	$('#auto').submit();
}



$(document).ready(function(){0
	printClock();
	
	openPopup();
	
////////////////////////공지사항, 일정/////////////////////////////
	//datepicker 실행
	KTBootstrapDatepicker();
	
	Handlebars.registerHelper("inc", function(value, options){
 		       return parseInt(value) + 1;
 		   });
	// 공지사항
	$.ajax({
	       type: "POST",
	       url:"<%=request.getContextPath()%>/board/notice/mainNoticeList",
	       contentType:"application/json",
	       success: function (data) {
	    	   
	    	   var source = $("#noticeListTemplate").html();
	           var template = Handlebars.compile(source);
	           var html = template(data);
	           
	           
	           $("#deleteNoticeList").remove;
	           $("#NoticeList").html(html);
	           
	       },error:function(error){
	       	alert("시스템 점검중입니다. 관리자에게 문의하세요");		
			}
	   });
	
	
	// 일정관리
	today = new Date();
	today = today.toISOString().slice(0, 10);
	 $('#date').val(today);
	 
	 calendarListSearch();
	 
	$("#date").on("propertychange change keyup paste input", function(){
		 calendarListSearch();
	});
////////////////////////공지사항, 예약내역, 일정/////////////////////////////

});

function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 13보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	if(currentHours >= 13){
	    	currentHours = addZeros(currentHours - 12, 2);
    	}
    }
    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
    
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}

// datepicker 설정
function KTBootstrapDatepicker() {
    var arrows;
    if (KTUtil.isRTL()) {
        arrows = {
            leftArrow: '<i class="la la-angle-right"></i>',
            rightArrow: '<i class="la la-angle-left"></i>'
        }
    } else {
        arrows = {
            leftArrow: '<i class="la la-angle-left"></i>',
            rightArrow: '<i class="la la-angle-right"></i>'
        }
    }
    // Private functions
    var demos = function () {
    	 
    	
    	// inline picker
        $('#kt_datepicker_6').datepicker({
            rtl: KTUtil.isRTL(),
            todayHighlight: true,
            templates: arrows,
            format: 'yy-mm-dd',
            language: 'ko'
        });
    }
    return demos(); 
}


// 일정 검색
function calendarListSearch(){
		 var eventData = {
				 mainCalStart: $("#date").val()
	           };
		
		$.ajax({
	       type: "POST",
	       url:"<%=request.getContextPath()%>/cal/main/list",
	       data: JSON.stringify(eventData),
	       contentType:"application/json",
	       success: function (data) {
	    	   
	    	   if(data.length == 0){
	    		   $("#calendarList").css("display","none");
	    		   $("#noCalendarList").css("display","");
	    	   }else {

	    		   var source = $("#calendarListTemplate").html();
	 	           var template = Handlebars.compile(source);
	 	           var html = template(data);
		           
	           $("#deleteCalendarList").remove;
	           $("#calendarList").html(html);
	    	
	    	   $("#noCalendarList").css("display","none");
	           $("#calendarList").css("display","");
	   		}  

	           
	           
	       },error:function(error){
	       	alert("시스템 점검중입니다. 관리자에게 문의하세요");		
			}
	   });
}

// 팝업 열기
function openPopup() {
	<c:forEach items="${noticeBoardList }" var="notice" varStatus="i">
		var cookieCheck = getCookie("${notice.noticeNo}");
		if (cookieCheck != "N")
				window.open('<%=request.getContextPath()%>/board/notice/popup.do?noticeNo=${notice.noticeNo}', 'new${i.index + 1}', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=${i.index + 1 *3}00,top=100,width=685,height=500');
	</c:forEach>
	};

// 쿠키 확인
function getCookie(name) {
	var cookie = document.cookie;
	if (document.cookie != "") {
		var cookie_array = cookie.split("; ");
		for ( var index in cookie_array) {
			var cookie_name = cookie_array[index].split("=");
			if (cookie_name[0] == name) {
				return cookie_name[1];
			}
		}
	}
	return;
};


// function msg_detail(mssNo){
	
// 	$("[name=mssNo]").val(mssNo);
	
// 	$("[role=msgForm]").attr({
<%-- 		action:"<%=request.getContextPath()%>/message/main/detail.do" --%>
// 		, method:"post"
// 	});
// }
</script>

<!-- handlebars-template -->
<script type="text/x-handlebars-template"  id="noticeListTemplate" >
{{#each .}}
<div id="deleteNoticeList">
	<tr style="cursor:pointer;">
		<td style="width: 5px;">{{inc @index}}.</td>
		<td style="width: 250px; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;  display: inline-block; " onclick="javascript:OpenWindow('<%=request.getContextPath()%>/board/notice/detail.do?noticeNo={{noticeNo}}','상세보기',800,700);">{{noticeTitle}}</td>
		<td style="width: 70px;">{{stringNoticeRegdate}}</td>
    </tr>
</div> 
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="calendarListTemplate" >
{{#each .}}
<div id="deleteCalendarList">
	{{#if mainAllday}}
	<li style="padding-bottom: 10px; cursor:default;">
		<span class="label label-lg label-inline font-weight-bolder label-inline" style="background-color:{{mainTypeColor}}; width:80px; text-align: center; ">{{mainTypeName}}</span>&nbsp;{{title}}
	</li>
	{{else}}
	<li style="padding-bottom: 10px; cursor:default;">
		<span class="label label-lg label-inline font-weight-bolder label-inline" style="background-color:{{mainTypeColor}};  width:80px; text-align: center; ">{{mainTypeName}}</span>&nbsp;{{title}} [{{start}} ~ {{end}}] 
	</li>
	{{/if}}
</div> 
{{/each}}
</script>