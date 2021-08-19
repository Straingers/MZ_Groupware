<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${dataMap.cri}"/>        

<style>
.card.card-custom {
  box-shadow: 0px 0px 30px 0px rgba(82, 63, 105, 0.05); !important
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
</style>                 
<!--begin::Content -->
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<!--begin::Entry -->
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Example-->
			<!--begin::Row-->
			<div class="row">
				<div class="col-4">
					<div class="card card-custom card-stretch gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>내정보
							</div>
							<div class="card-toolbar">
								<span class="text-hover-primary" data-toggle="tooltip" title="" data-original-title="내 정보 페이지"
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
										<td>${commute.inTime.split(' ')[1].substring(0, 5) }</td>
										<th class="table-active pr-0 pl-0 m-0" style="width: 50px">퇴근</th>
										<td>${commute.outTime.split(' ')[1].substring(0, 5) }</td>
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
				</div>
				
				<div class="col-4">
					<div class="card card-custom card-stretch-half gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>업무공유/전자결재
							</div>
						</div>
						<div class="card-body">업무공유/전자결재 준비중</div>
					</div>
					<div class="card card-custom card-stretch-half gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>QUICK WORK
							</div>
						</div>
						<div class="card-body">
							QUICK WORK 준비중
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="card card-custom card-stretch gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>일정
							</div>
						</div>
						<div class="card-body">일정 준비중</div>
					</div>
				</div>
				<div class="col-4">
					<div class="card card-custom card-stretch gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>쪽지함
							</div>
							<ul class="nav nav-tabs nav-bold nav-tabs-line pt-5">
								<li class="nav-item">
									<a class="nav-link active" data-toggle="tab" href="#recBox">
										<span class="nav-icon"><i class="flaticon2-chat-1"></i></span>
										<span class="nav-text">수신함</span>
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" data-toggle="tab" href="#sendBox">
										<span class="nav-icon"><i class="flaticon2-chat-1"></i></span>
										<span class="nav-text">발신함</span>
									</a>
								</li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane fade active show m-0 p-0" id="recBox" role="tabpanel" aria-labelledby="recBox">
									<div class="table-responsive">
										<table class="table table-borderless" style="font-size: 12.5px;">
											<tbody>
												<c:choose>
													<c:when test="${!empty dataMap.msgList}">
														<c:forEach items="${dataMap.msgList }" var="msg">
															<tr class="text-center">
																<th scope="row"><a
																	href="javascript:detail_go(${msg.mssNo});"
																	class="text-dark"> ${msg.mssNo } </a></th>
																<td>
																	<div class="ellipsis">
																		<a href="javascript:detail_go(${msg.mssNo});" class="text-dark"> ${msg.mssContent} </a>
																	</div>
																</td>
																<td>${msg.sender}</td>
																<td>${msg.mssSenddate }</td>
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
													<c:when test="${!empty dataMap.msgList}">
														<c:forEach items="${dataMap.msgList }" var="msg">
															<tr class="text-center">
																<th scope="row"><a
																	href="javascript:detail_go(${msg.mssNo});"
																	class="text-dark"> ${msg.mssNo } </a></th>
																<td>
																	<div class="ellipsis">
																		<a href="javascript:detail_go(${msg.mssNo});" class="text-dark"> ${msg.mssContent} </a>
																	</div>
																</td>
																<td>${msg.receiver}</td>
																<td>${msg.mssSenddate }</td>
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
					<div class="card card-custom card-stretch gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target">
								<span class="ribbon-inner bg-primary"></span>공지사항
							</div>
							<div class="card-toolbar">
								<span class="text-hover-primary" data-toggle="tooltip" title="" data-original-title="공지사항 페이지"
									  onclick="window.parent.location.href='<%=request.getContextPath()%>/index.do?menuCode=M050000'">
									<i class="ki ki-plus"></i>
								</span>
							</div>
						</div>
						<div class="card-body" style="padding: 0px;">
							<table class="table table-borderless"  style="table-layout: fixed">
							    <tbody id="NoticeList">
							        
							    </tbody>
							</table>
						</div>
					</div>
				</div>
				

				<div class="col-4">
					<div class="card card-custom card-stretch gutter-b">
						<div class="card-header card-header-right ribbon ribbon-clip ribbon-left">
							<div class="ribbon-target" style="top: 12px;">
								<span class="ribbon-inner bg-primary"></span>예약내역
							</div>
						</div>
						<div class="card-body">예약내역 준비중</div>
					</div>
				</div>
				<div class="col-4">
					
				</div>
			</div>
			<!--end::Row-->
		</div>
		<!--end::Container-->
	</div>
	<!--end::Entry -->
</div>
<!--end::Content -->

<script src="/WEB-INF/views/message/receiveList.jsp"></script>
<script src="/WEB-INF/views/message/sendList.jsp"></script>
<script>
$(document).ready(function(){
	printClock();
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
</script>
<script type="text/x-handlebars-template"  id="noticeListTemplate" >
{{#each .}}
<div id="deleteNoticeList">
	<tr>
		<th style="width: 4px;">{{noticeNo}}</th>
		<td style="width: 10px;" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/board/notice/detail.do?noticeNo={{noticeNo}}','상세보기',800,700);">{{noticeTitle}}</td>
		<td style="width: 5px;">{{stringNoticeRegdate}}</td>
    </tr>
</div> 
{{/each}}
</script>