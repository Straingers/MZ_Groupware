<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<style>
#subTh th, #lineTh th{
 background : rgb(226, 226, 226);
 text-align: center;
}
</style>

</head>
<body>

<div class="content d-flex flex-column flex-column-fluid" id="kt_content"></div>
	
<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container">
			<!--begin::Card-->
			<div class="card card-custom" id="kt_page_sticky_card">
				<div class="card-header">
					<div class="card-title">
						<h2 class="font-weight-bold" style="line-height: 30px;">
							<span class="svg-icon svg-icon-primary svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\legacy\metronic\theme\html\demo1\dist/../src/media/svg/icons\Design\Edit.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
							    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
							        <rect x="0" y="0" width="24" height="24"/>
							        <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/>
							        <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/>
							    </g>
							</svg><!--end::Svg Icon--></span>
							결재문서 상세</h2>
					</div>
					<div class="card-toolbar" id="buttonArea">
						<div class="btn-group">
							 <button class="btn btn-light btn-shadow-hover font-weight-bold mr-2 float-right" onclick="CloseWindow();">닫    기</button>
						</div>
					</div>
				</div>
				
				<div class="card-body">
					<!--begin::Form-->
						<div class="card-header" style="border-bottom: 0px;">
							<h2 style="text-align: center; vertical-align: middle;">
								${approval.docName }
	<!-- 						일반 결재 문서 -->
							</h2>
						</div>
												
<%-- 							<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/approval/regist.do" name="registForm"> --%>
								<div class="col-5 float-right">
									<table id="lineTh" class="table table-bordered mb-3" style="border:0">
										<thead>
											<tr>
												<th style="width: 130px; text-align: center; vertical-align: middle;">기안자</th>
												<th style="width: 130px; text-align: center; vertical-align: middle;">1차 결재</th>
												<th style="width: 130px; text-align: center; vertical-align: middle;">2차 결재</th>
												<th style="width: 130px; text-align: center; vertical-align: middle;">최종 결재</th>
											</tr>
										</thead>
										<tbody>
											<tr style="height: 40px;">
												<td class="text-center" style="vertical-align: middle;">
													<span style="color: black;">상신</span>
												</td>
												<td class="text-center" id="${first.empNo}" style="vertical-align: middle;">
													<c:if test="${first.appSign eq 'Y' }">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
													</c:if>
													<c:if test="${first.appSign eq 'R' }">
														<span style="color: #FFA800;" class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
													</c:if>
													<c:if test="${third.appSign eq 'Y' && first.appSign eq 'X'}">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
													</c:if>
													<c:if test="${first.appSign eq 'X' && second.appSign eq 'Y'}">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
													</c:if>
												</td>
												<td class="text-center" id="${second.empNo}" style="vertical-align: middle;">
													<c:if test="${second.appSign eq 'Y' }">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
													</c:if>
													<c:if test="${second.appSign eq 'R' }">
														<span style="color: #FFA800;" class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
													</c:if>
													<c:if test="${third.appSign eq 'Y' && second.appSign eq 'X'}">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">전결</span>
													</c:if>
												</td>
												<td class="text-center" id="${third.empNo}" style="vertical-align: middle;">
													<c:if test="${third.appSign eq 'Y' }">
														<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
													</c:if>
													<c:if test="${third.appSign eq 'R' }">
														<span style="color: #FFA800;" class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
													</c:if>
												</td>
												
											</tr>
											<tr style="height: 10px;">
												<td>
													<input type="text" name="empName" class="form-control" value="${approval.empName }" style="border: none; height: 9.75px; text-align: center;">
												</td>
												<td id="firstTd">
													<input type="text" name="firstEmp" class="form-control px-0" value="${first.empName}" style="border: none; height: 9.75px; text-align: center;">
													<input type="hidden" name="firstEmpNo" value="${first.empNo }">
													<input type="hidden" name="appLevel" class="form-control" value="1">
												</td>
												<td id="secondTd">
													<input type="text" name="secondEmp" class="form-control px-0" value="${second.empName}" style="border: none; height: 9.75px; text-align: center;">
													<input type="hidden" name="secondEmpNo" value="${second.empNo }">
													<input type="hidden" name="appLevel" class="form-control" value="2">
												</td>
												<td id="thirdTd">
													<input type="text" name="thirdEmp" class="form-control px-0" value="${third.empName}" style="border: none; height: 9.75px; text-align: center;">
													<input type="hidden" name="thirdEmpNo" value="${third.empNo }">
													<input type="hidden" name="appLevel" class="form-control" value="3">
												</td>
							
											</tr>
											<thead>
												<tr class="text-center align-middle">
													<th>협조</th>
												</tr>
											</thead>
											<tbody>
											<tr style="height: 40px;">
												<c:if test="${fn:length(help) eq 0}">
													<td>
													</td>
												</c:if>
												<c:forEach items="${help}" var="help">
													<td class="text-center align-middle" id="${help.empNo}" style="vertical-align: middle;">
														<c:if test="${help.appSign eq 'Y' }">
															<span style="color: red;" class="label label-xl label-outline-danger font-weight-bolder label-pill label-inline">결재</span>
														</c:if>
														<c:if test="${help.appSign eq 'R' }">
															<span style="color: red;" class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>
														</c:if>
													</td>
												</c:forEach>
											</tr>
											<tr>
												<td id="helpTd" class="text-center align-middle" style="height: 37px;">
													<c:forEach items="${help}" var="help">
														<input type="text" name="helpEmp" class="form-control" value="${help.empName}" style="border: none; height: 9.75px; text-align: center;">
														<input type="hidden" name="appLevel" class="form-control" value="협조">
													</c:forEach>
												</td>
											</tr>
											</tbody>
										</tbody>
									</table>
								</div>

								<div class="my-5">
								<br><br><br><br><br><br><br>
								<table class="table table-bordered mb-5">
										<tr>
											<th>수신참조</th>
											<td>
												<c:forEach items="${ref}" var="ref">
													<span id="ref" class="text-dark float-left ml-3">${ref.empName}</span>
												</c:forEach>
											</td>
											<th>회람</th>
											<td>
												<c:forEach items="${read}" var="read">
													<span id="read" class="text-dark float-left ml-3">${read.empName}</span>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th >제목</th>
											<td colspan="3">
												<input type="text" id="appTitle" name='appTitle' class="form-control" value="${approval.appTitle }" style="border: none; height: 9.75px;">
											</td>
										</tr>
										<tr>
											<th>결재상태</th>
											<td>
												<input type="text" value="${approval.appStatus }" id="appStatus" name='appStatus' class="form-control"  style="border: none; height: 9.75px;">																	
											</td>
											<th>결재양식코드</th>
											<td>
												<input type="text" value="${approval.docId }" id="docId" name='docId' class="form-control" style="border: none; height: 9.75px;">																	
											</td>
										</tr>
										<tr>
											<th>상신자</th>
											<td>
												<input type="text" value="${approval.empName }" name="empName" class="form-control" style="border: none; height: 9.75px;">
<%-- 												<input type="hidden" value="${loginUser.empNo }" id="empNo" name='empNo' class="form-control"> --%>
											</td>
											<th>소속부서</th>
											<td>
												<input type="text" value="${approval.deptName }" class="form-control" style="border: none; height: 9.75px;">
											</td>
										</tr>
								</table>
							</div>
							<div class="form-group">
			                  <textarea id="textBox" name="appContent" style="display: none;"></textarea>
			                  <div class="summernote" id="kt_summernote_1">
			                  		${approval.appContent }
			                  </div>
		               </div>
		               
		               <div class="card card-custom" style="border: 1px solid #E4E6EF;">
					    <div class="card-header" style="min-height: 45px;">
					        <div class="card-title">
					            <h3 class="card-label">파일 첨부 목록</h3>
					        </div>
					        
					        <div class="uppy" id="kt_uppy_1">
					            <div class="uppy-Root" dir="ltr">
					                <div class="uppy-Dashboard uppy-Dashboard--animateOpenClose uppy-size--height-md uppy-Dashboard--isInnerWrapVisible" data-uppy-theme="light" data-uppy-num-acquirers="4" data-uppy-drag-drop-supported="true" aria-hidden="false" aria-label="File Uploader">
					                    <div class="uppy-Dashboard-overlay" tabindex="-1"></div>
					                    <div class="uppy-Dashboard-inner" style="width: 100%; background-color: white; border: 0px;">
					                        <div class="uppy-Dashboard-innerWrap">
					                            <div class="uppy-Dashboard-AddFiles">
			                                        <div class="uppy-Dashboard-AddFiles-list float-left" role="tablist">
				                                    </div>
				                                    <div class="uppy-Dashboard-progressindicators">
			                                        	<div class="uppy-StatusBar is-waiting" aria-hidden="true">
			                                            	<div class="uppy-StatusBar-progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="width: 0%;"></div>
				                                            <div class="uppy-StatusBar-actions"></div>
				                                        </div>
				                                        <div class="uppy uppy-Informer" aria-hidden="true">
				                                            <p role="alert"></p>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
					    </div>
						    <div class="card-body fileInput">
		    					<c:forEach items="${approval.attachList}" var="attach">
									<div class="col-sm-12" onclick="location.href='<%=request.getContextPath()%>/approval/lib/req/getFile.do?attachNo=${attach.attachNo}';">
										<div class="d-flex align-items-center mb-5">
											<!--begin::Symbol-->
											<div class="symbol symbol-40 symbol-light-success mr-5">
												<span class="symbol-label">
													
													<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
														<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
															<rect x="0" y="0" width="24" height="24"></rect>
															<path d="M2,13 C2,12.5 2.5,12 3,12 C3.5,12 4,12.5 4,13 C4,13.3333333 4,15 4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 C2,15 2,13.3333333 2,13 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
															<rect fill="#000000" opacity="0.3" x="11" y="2" width="2" height="14" rx="1"></rect>
															<path d="M12.0362375,3.37797611 L7.70710678,7.70710678 C7.31658249,8.09763107 6.68341751,8.09763107 6.29289322,7.70710678 C5.90236893,7.31658249 5.90236893,6.68341751 6.29289322,6.29289322 L11.2928932,1.29289322 C11.6689749,0.916811528 12.2736364,0.900910387 12.6689647,1.25670585 L17.6689647,5.75670585 C18.0794748,6.12616487 18.1127532,6.75845471 17.7432941,7.16896473 C17.3738351,7.57947475 16.7415453,7.61275317 16.3310353,7.24329415 L12.0362375,3.37797611 Z" fill="#000000" fill-rule="nonzero"></path>
														</g>
													</svg>
													
												</span>
											</div>
											<!--end::Symbol-->
											<!--begin::Text-->
											<div class="d-flex flex-column flex-grow-1 font-weight-bold">
												<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${attach.attachFilename}</a>
												<span class="text-muted"><fmt:formatDate value="${attach.attachRegdate}" pattern="yyyy-MM-dd" /></span>
											</div>
											<!--end::Text-->
										</div>
									</div>
								</c:forEach>
						    </div>
				        </div>
						<br>
	                    <div class="card card-custom" style="border: 1px solid #E4E6EF;">
							<div class="card-header" style="min-height: 45px;">
								<h3 class="card-title">의견 목록</h3>
							</div>
							<div class="card-body pt-2 pb-0">
								
								<div class="time-label" id="repliesDiv">
								</div>
								<div class='text-center'>
									<span id="pagination" class="pagination justify-content-center m-0">
									</span>
								</div><!-- ./text-center -->
							</div><!-- card-footer -->
					</div><!-- card -->
					<br>
						<div>
							<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" name="replyer" readonly value="${loginUser.empNo}"> 
							<input class="form-control col-11 float-left" type="text"	placeholder="댓글을 입력하세요." id="newApprovalReplytext">
							<button type="button" class="btn btn-primary float-right" id="replyAddBtn" onclick="replyRegist_go();">댓글작성</button>
						</div>	
					</div>
				</div>
			</div>
		</div>

<div id="modifyModal" class="modal modal-default fade" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="display:none;"></h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>        
			</div>
			<div class="modal-body" data-replyNo>
				<p><input type="text" id="replyText" class="form-control" value="${replyText}"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary font-weight-bolder mr-2" id="replyModBtn" onclick="replyModify_go();">
					<i class="ki ki-check icon-xs"></i>수정
				</button>
				<button type="button" class="btn btn-primary font-weight-bolder" id="replyDelBtn" onclick="replyRemove_go();">
					<i class="ki ki-close icon-nm"></i>삭제
				</button>	
				<button class="btn btn-light-primary font-weight-bolder mr-2" data-dismiss="modal">
					<i class="ki ki-long-arrow-back icon-xs"></i>취소
				</button>				
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="firstAppSign" value="${first.empNo}">	
<input type="hidden" id="secondAppSign" value="${second.appSign}">	
<input type="hidden" id="thirdAppSign" value="${third.appSign}">
<form>	
	<input type="hidden" name="replyer" id="replyer" value="" >
	<input type="hidden" name="appNo" value="${approval.appNo }">
</form>
<form id="sign">
	<input type="hidden" name="appNo" value="${approval.appNo }">
	<input type="hidden" name="empNo" value="${loginUser.empNo}"/>
	<input type="hidden" id="flag" value="">
</form>
<%-- <%@ include file="/WEB-INF/views/common/summernote.jsp"%>					 --%>
<%@ include file="/WEB-INF/views/approval/js/reply_js.jsp" %>
<script>

$("#modifyReplyBtn").css("display", "none");

function app_go() {
var empNo = $("input[name='empNo']").val();
var appNo = $("input[name='appNo']").val();

if($("[name='thirdEmpNo']").val() == $("[name='empNo']").val()) {
	$("#flag").val("Y");
}else{
	$("#flag").val("N");
}


$('#sign').attr("action", '<%=request.getContextPath()%>/approval/sign');
$('#sign').attr("method", 'POST');

var form = {
		  appNo : appNo	
		, empNo : empNo
		, flag : $("#flag").val()
}

$.ajax({
	url : '<%=request.getContextPath()%>/approval/sign',
	type : 'post',
	data : JSON.stringify(form),
	contentType : 'application/json;charset=utf-8',
	success : function(data) {
			console.log(data);
			$('#confirmButton').remove();
			var str = '<button class="btn btn-secondary" disabled><i class="fas fa-check-circle"></i>확인 완료</button>'
			var alert = '<script>Swal.fire({'
			  		  + 'icon: "success",'
			  		  + 'title: "확인 처리되었습니다.",'
			  		  + 'showConfirmButton: false,'
			  		  + 'timer: 1500});'
			  		  + '</' + 'script>'
			var status = '<span style="color:red;">결재</span>'
			
			var empNo = $('input[name="empNo"]').val();
			$('#'+empNo+' > span').remove();
			$('#'+ empNo+'').append(status);
			

			$('#buttonArea').append(str);
			$('#buttonArea').append(alert);	
		},
		error : function(err) {
			console.log('에러 발생');
		}
	});
}

function reject_go() {
var empNo = $("input[name='empNo']").val();
var appNo = $("input[name='appNo']").val();

alert($("[name='firstEmpNo']").val());

if(($("[name='firstEmpNo']").val() == $("[name='empNo']").val())
		|| ($("[name='secondEmpNo']").val() == $("[name='empNo']").val()) 
		|| ($("[name='thirdEmpNo']").val() == $("[name='empNo']").val())) {
	$("#flag").val("R");
}else{
	$("#flag").val("N");
}

$('#sign').attr("action", '<%=request.getContextPath()%>/approval/rejSign');
$('#sign').attr("method", 'POST');

var form = {
		  appNo : appNo	
		, empNo : empNo
		, flag : $("#flag").val()
}

$.ajax({
	url : '<%=request.getContextPath()%>/approval/rejSign',
	type : 'post',
	data : JSON.stringify(form),
	contentType : 'application/json;charset=utf-8',
	success : function(data) {
			console.log(data);
			$('#rejectButton').remove();
			var str = '<button class="btn btn-secondary" disabled><i class="fas fa-check-circle"></i>확인 완료</button>'
			var alert = '<script>Swal.fire({'
			  		  + 'icon: "success",'
			  		  + 'title: "확인 처리되었습니다.",'
			  		  + 'showConfirmButton: false,'
			  		  + 'timer: 1500});'
			  		  + '</' + 'script>'
			var status = '<span style="color: #FFA800;" class="label label-xl label-outline-warning font-weight-bolder label-pill label-inline">반려</span>'
			
			var empNo = $('input[name="empNo"]').val();
			$('#'+empNo+' > span').remove();
			$('#'+ empNo+'').append(status);
			

			$('#buttonArea').append(str);
			$('#buttonArea').append(alert);	
		},
		error : function(err) {
			console.log('에러 발생');
		}
	});

}

</script>

</body>