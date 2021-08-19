<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style type="text/css">
input:focus {
	outline: none;
	border: none;
}
td > input {
	width: 100px;
}
#subTh th, #lineTh th{
 background : rgb(226, 226, 226);
 text-align: center;
}
#apList::-webkit-scrollbar {
	width: 5px; /*스크롤바의 너비*/
}

#apList::-webkit-scrollbar-thumb {
	background-color: rgb(226, 226, 226);
}

#apList::-webkit-scrollbar-track {
	background-color: white;
}
</style>
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">

<%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>	
</head>
<body>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>


<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content"></div>

<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container">
			<!--begin::Card-->
			<div class="card card-custom" id="kt_page_sticky_card">
				<div class="card-header">
					<div class="card-title">
						<h1 class="font-weight-bold" style="line-height: 30px;">
							<span class="svg-icon svg-icon-primary svg-icon-2x"><!--begin::Svg Icon | path:C:\wamp64\www\keenthemes\legacy\metronic\theme\html\demo1\dist/../src/media/svg/icons\Design\Edit.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
							    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
							        <rect x="0" y="0" width="24" height="24"/>
							        <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/>
							        <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/>
							    </g>
							</svg><!--end::Svg Icon--></span>
							임시저장 상세</h1>
					</div>
					<div class="card-toolbar">
						<button type="button" class="btn btn-light btn-shadow-hover font-weight-bold mr-2"  onclick="reload_go();">새로고침</button>
						<div class="btn-group">
							<button type="button" class="btn btn-primary btn-shadow-hover font-weight-bold mr-2" onclick="temp_go()">임시저장</button>
						</div>
					</div>
				</div>
				
				<div class="card-body p-5">
					<!--begin::Form-->
					<div>
						<h5 class="text-dark font-weight-bold mb-5">결재문서 양식</h5>
						<div class="radio-inline">
							<c:forEach items="${approvalDocList }" var="approvalDoc">
								<label class="radio radio-rounded">
								<c:choose>
								    <c:when test="${approvalDoc.docId eq doc.docId}">
										<input type="radio" name="docName" checked="checked" value="${approvalDoc.docId }" onclick="form_change();">
								    </c:when>
								     <c:when test="${approvalDoc.docId ne doc.docId}">
										<input type="radio" name="docName" value="${approvalDoc.docId }" onclick="form_change();">
								     </c:when>
								</c:choose>
								<span></span>${approvalDoc.docName }</label>
							</c:forEach>
						</div>
					</div>
					<div class="separator separator-dashed my-5"></div>
								<div>
									<h2 style="text-align: center;">
										${doc.docName }
			<!-- 						일반 결재 문서 -->
									</h2>
								</div>
							<form enctype="multipart/form-data" role="form" method="post" name="registForm">
							<input type="hidden" name="appNo" value="${approval.appNo }">
								<div class="col-5 float-right">
									
									<table id="lineTh" class="table table-bordered mb-3" style="border: 0px;">
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
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr style="height: 10px;">
												<td>
													<input type="text" name="empNo" class="form-control" value="${loginUser.empName }" style="border: none; height: 9.75px; text-align: center;">
												</td>
												<td id="firstTd">
													<input type="hidden" name="appLevel" class="form-control" value="1">
												</td>
												<td id="secondTd">
													<input type="hidden" name="appLevel" class="form-control" value="2">
												</td>
												<td id="thirdTd">
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
													<td></td>
												</tr>
												<tr style="height: 36px;">
													<td id="helpTd"></td>
												</tr>
											</tbody>
										</tbody>
									</table>

								</div>

								<div class="my-5">
								<br><br><br><br><br><br><br><br><br><br><br><br><br>
								
									<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-outline-primary btn-square btn-sm float-left">결재자 및 수신자 설정</button>
									<button type="button" data-toggle="modal" data-target="#lineModal" class="btn btn-outline-primary btn-square btn-sm float-left ml-2">개인결재선</button>
								<table id="subTh" class="table table-bordered mb-5">
										<tr>
											<th>수신참조</th>
											<td id="refTd">
											</td>
											<th>회람</th>
											<td id="readTd">
											</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3">
												<input type="text" id="appTitle" name='appTitle' class="form-control" placeholder="제목을 입력하세요" value="${approval.appTitle }" style="border: none; height: 9.75px;">
											</td>
										</tr>
										<tr>
											<th>결재상태</th>
											<td>
												<input type="text" value="상신" id="appStatus" name='appStatus' class="form-control" style="border: none; height: 9.75px;">																	
											</td>
											<th>결재양식코드</th>
											<td>
												<input type="text" value="${approval.docId }" id="docId" name='docId' class="form-control" style="border: none; height: 9.75px;" readonly="readonly">																	
											</td>
										</tr>
										<tr>
											<th>상신자</th>
											<td>
												<input type="text" value="${loginUser.empName } " class="form-control" style="border: none; height: 9.75px;" readonly="readonly">
												<input type="hidden" value="${loginUser.empNo }" id="empNo" class="form-control">
											</td>
											<th>소속부서</th>
											<td>
												<input type="text" value="${loginUser.deptName }" class="form-control" style="border: none; height: 9.75px;" readonly="readonly">
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
					    <div class="card-header">
					        <div class="card-title">
					            <h3 class="card-label">파일 첨부</h3>
					        </div>
					        
					        <div class="uppy" id="kt_uppy_1">
					            <div class="uppy-Root" dir="ltr">
					                <div class="uppy-Dashboard uppy-Dashboard--animateOpenClose uppy-size--height-md uppy-Dashboard--isInnerWrapVisible" data-uppy-theme="light" data-uppy-num-acquirers="4" data-uppy-drag-drop-supported="true" aria-hidden="false" aria-label="File Uploader">
					                    <div class="uppy-Dashboard-overlay" tabindex="-1"></div>
					                    <div class="uppy-Dashboard-inner" style="width: 100%; background-color: white; border: 0px;">
					                        <div class="uppy-Dashboard-innerWrap">
					                            <div class="uppy-Dashboard-AddFiles">
			                                        <div class="uppy-Dashboard-AddFiles-list float-left" role="tablist">
				                            				
			                                            <!-- 로컬 파일 -->
														<button class="btn btn-primary" onclick="addFile_go();" type="button" id="addFileBtn" style="width: 110px;">
														    <i class="fas fa-folder-open"></i>LOCAL
														</button>
		                                                <!-- 클라우드 파일 -->
														<button class="btn btn-primary" onclick="" type="button" id="addCloudBtn" style="width: 110px;">
														    <i class="fas fa-cloud"></i>CLOUD
														</button>
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
						    </div>
				        </div>
		               <br>
		               <a class="btn btn-light btn-shadow-hover font-weight-bold mr-2 float-right" onclick="CloseWindow();">닫    기</a>
		               <a class="btn btn-primary btn-shadow-hover font-weight-bold mr-2 float-right" id="registBtn" onclick="regist_go();">등    록</a>
					</form>
					<!--end::Form-->
				</div>
			</div>
			<!--end::Card-->
			<!--begin: Code-->
			<!--end: Code-->
		</div>
		<!--end::Container-->
	</div>
	<!--end::Entry-->
	
	
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" style="max-width: 100%; width: auto; display: table;">
		<div class="modal-content" style="width: 800px;">
			<div class="modal-header" style="justify-content: left">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title" id="myModalLabel">결재자 및 수신자 설정</h4>
			</div>
			<div class="modal-body">
		
			<div class="row">
					<div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
					</div>
					<div id="apList" class="col-8" style="border: 1px solid #EBEDF3; overflow:auto; height: 320px;">
						<table class="table table-hover" id="del_target" style="overflow:auto;">
							<thead>
								<tr style="left: 0px;">
								
									<th scope="col" id="th_checkBox">
										<span style="width: 20px;">
											<label class="checkbox checkbox-single checkbox-all">
												<input type="checkbox" id="all_select">&nbsp;<span></span>
											</label>
										</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">사번</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">이름</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">직위</span>
									</th>
									<th scope="col">
										<span style="width: 137px;">부서</span>
									</th>
								</tr>
							</thead>
							<tbody id="tableBody" style="min-height: 270px;">
								
							</tbody>
					</table>
				</div>
			</div>

			<div class="d-flex justify-content-center mt-5">
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2" onclick="appList_go('first');">1차 결재권자</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('second');">2차 결재권자</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('third');">최종 결재권자</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-1 ml-20" onclick="appList_go('ref');">참조</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-1 ml-3" onclick="appList_go('read');">회람</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-1 ml-3" onclick="appList_go('help');">협조</button>
			</div>
			<div class="mt-5">
<!-- 				<input type="hidden" name="refEmp" class="form-control" value="1" style="border: none; height: 9.75px; text-align: center;"> -->
				<div>
				</div>
				<div id="apList" class="modal-body overflow-auto" style="height: 150px;">
					<table class="table table-hover" id="tableBody">
					<thead>
						<tr>
							<th scope="col" class="col-2">
								<span>사번</span>
							</th>
							<th scope="col" class="col-2">
								<span>이름</span>
							</th>
							<th scope="col" class="col-2">
								<span>직위</span>
							</th>
							<th scope="col" class="col-2">
								<span>부서</span>
							</th>
							<th scope="col" class="col-4">
								<span>결재유형</span>
							</th>
						</tr>
					</thead>
					<tbody id="listDiv">

					</tbody>
					</table>
					
				</div>
			
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="ref_go();">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="lineModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
            <div class="modal-header">
            	<h5>개인 결재선 목록</h5>
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
            	<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th class="text-center" style="width: 150px;">결재라인명</th>
								<th class="text-center">1차 결재권자</th>
								<th class="text-center">2차 결재권자</th>
								<th class="text-center">3차 결재권자</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="">
								<tr>
									<td class="text-center" colspan="3">데이터가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${lineList}" var="resultBean">
								<tr onclick="fn_getLine('${resultBean.lineId}')">
									<td class="text-center align-middle">${resultBean.lineName}</td>
									<td class="text-center align-middle">${resultBean.lineFirst}</td>
									<td class="text-center align-middle">${resultBean.lineSecond}</td>
									<td class="text-center align-middle">${resultBean.lineFinal}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
            </div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/approval_summernote.jsp"%>					
<%@ include file="/WEB-INF/views/approval/js/jstree_js.jsp" %>	


<script>
function fn_getLine(lineId) {
	
	var approval = { lineId : lineId };
	
	$('[name="appLevel"]').remove();
	$('[name="empFirst"]').remove();
	$('[name="empSecond"]').remove();
	$('[name="empThird"]').remove();
	$('#empFirst').empty();
	$('#empSecond').empty();
	$('#empThird').empty();
	$('#empFirstList').val(null);
	$('#empSecondList').val(null);
	$('#empThirdList').val(null);
	
	$.ajax({
		url: '<%=request.getContextPath()%>/approval/line/detail?lineId='+lineId,
		type: 'post',
		data: JSON.stringify(approval),
		contentType: 'application/json;charset=utf-8',
		success: function(data) {
			console.log(data);

			var first = '';
		
			first += '<span class="text-primary">' + data.line.lineFirst + '</span>'
			+ '<input type="hidden" name="firstEmp" value="' + data.line.lineFirstEmp + '"/>'
			+ '<input type="hidden" name="inEmpNo" value="' + data.line.lineFirstEmp + '">';
			$('#firstTd > span').remove();
			$('#firstTd > input').remove();
			$('#firstTd').append(first);

			
			var second = '';

			second += '<span class="text-primary">' + data.line.lineSecond + '</span>'
			+ '<input type="hidden" name="secondEmp" value="' + data.line.lineSecondEmp + '"/>'
			+ '<input type="hidden" name="inEmpNo" value="' + data.line.lineSecondEmp + '">';

			$('#secondTd > span').remove();
			$('#secondTd > input').remove();
			$('#secondTd').append(second);
			
			var third = '';

			third += '<span class="text-primary">' + data.line.lineFinal + '</span>'
			+ '<input type="hidden" name="thirdEmp" value="' + data.line.lineFinalEmp + '"/>'
			+ '<input type="hidden" name="inEmpNo" value="' + data.line.lineFinalEmp + '">';

			$('#thirdTd > span').remove();
			$('#thirdTd > input').remove();
			$('#thirdTd').append(third);
			
			$('#lineModal').modal("hide");
			
			var empFirstL = $("input[name='firstEmp']").length;
			var empFirstArr = new Array(empFirstL);
			for(var i=0; i<empFirstL; i++) {
			  empFirstArr[i] = $("input[name='firstEmp']").eq(i).val();
			}
			
			var empSecondL = $("input[name='secondEmp']").length;
			var empSecondArr = new Array(empSecondL);
			for(var i=0; i<empSecondL; i++) {
			  empSecondArr[i] = $("input[name='secondEmp']").eq(i).val();
			}
			
			var empThirdL = $("input[name='thirdEmp']").length;
			var empThirdArr = new Array(empThirdL);
			for(var i=0; i<empThirdL; i++) {
			  empThirdArr[i] = $("input[name='thirdEmp']").eq(i).val();
			}
			
			var empFirstList = empFirstArr.join();
			var empSecondList = empSecondArr.join();
			var empThirdList = empThirdArr.join();
			$('[name="firstEmp"]').val(empFirstList);
			$('[name="secondEmp"]').val(empSecondList);
			$('[name="thirdEmp"]').val(empThirdList);
		},
		error:function(err) {
			console.log('에러발생 : ' + err);
		}
	});
}
function addFile_go() {
	if($('input[name="uploadFile"]').length >= 5){
		alert("파일 추가는 5개까지만 가능합니다.");
		return;
	}
	
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	var div=$('<div>').addClass("inputRow");
	div.append(input).append("<button style='border:0;ouline:0;' class='badge bg-red' type='button'>X</button>");
	$('.fileInput').append(div);
}

function temp_go() {
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name + " : " + file.value);
		if(file.value == ""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}
	
	if($("input[name='appTitle']").val() == "") {	//form.title.value
		alert("제목은 필수입니다.");
		$("input[name='appTitle']").focus();
		return;
	}
	
	// textarea에 입력 내용 삽입
	$("#textBox").val($(".summernote").summernote("code"));
	$("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/approval/tempRegist");
	document.registForm.submit();
}


function regist_go() {
	
	var first = $('input[name="firstEmp"]');
	if (first.length == 0) {
		alert("1차 결재자 선택은 필수입니다.");
		return;
	}
	var second = $('input[name="secondEmp"]');
	if (second.length == 0) {
		alert("2차 결재자 선택은 필수입니다.");
		return;
	}
	var third = $('input[name="thirdEmp"]');
	if (third.length == 0) {
		alert("3차 결재자 선택은 필수입니다.");
		return;
	}
	
	var files = $('input[name="uploadFile"]');
	for(var file of files){
		console.log(file.name + " : " + file.value);
		if(file.value == ""){
			alert("파일을 선택하세요.");
			file.focus();
			file.click();
			return;
		}
	}
	
	if($("input[name='appTitle']").val() == "") {	//form.title.value
		alert("제목은 필수입니다.");
		$("input[name='appTitle']").focus();
		return;
	}
	
	// textarea에 입력 내용 삽입
	$("#textBox").val($(".summernote").summernote("code"));
	$("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/approval/regist.do");
	document.registForm.submit();
}

function reload_go() {
	location.reload();	
}

function form_change() {
	var docName = $("input[name=docName]:checked").val();
	location.href = "<%=request.getContextPath() %>/approval/getDoc?docId=" + docName;
	
}

$('#openModalBtn').on('click', function(){
	$('#modalBox').modal('show');
});
	// 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){
	$('#modalBox').modal('hide');
});

function jsTree_go() {
	var test = $("#empNoTree").html();
}

$('#all_select').click(function () {
      if ($("input:checkbox[id='all_select']").prop("checked")) {
          $("input[type=checkbox]").prop("checked", true);
      } else {
          $("input[type=checkbox]").prop("checked", false);
      }
  });

  $('#del_target').click(function () { 
      var tbodyTr = $('#tableBody tr');
      const tdArr = [];	// 배열 선언
      const td = tbodyTr.children();
      
      td.each(function (i) {
          if (td.eq(i).children().children().prop("checked")) {
              tdArr.push(td.eq(i - 1).text());
          }
      });
      console.log(tdArr);
  });


function appList_go(type) {
	
	var first = '1차결재권자';
	var second = '2차결재권자';
	var third = '3차결재권자';
	
	var ref = '참조';
	var help = '협조';
	var read = '회람';
	
	var firStr = '';
	var secStr = '';
	var thiStr = '';
	
	var refStr = '';
	var readStr = '';
	var helpStr = '';
	
	$("input[name='chk']:checked").each(function() {
		var test = $(this).val();
		var empl = $('[name="inEmpNo"]').length;
		var emplName = $('[name="inEmpName"]').length;
		var empArr = new Array(empl);
		var empArrName = new Array(emplName);
		
		for(var i = 0; i < empl; i++) {
			empArr[i] = $('[name="inEmpNo"]').eq(i).val();
		}
		for(var i = 0; i < emplName; i++) {
			empArrName[i] = $('[name="inEmpName"]').eq(i).val();
		}
	  		
		if(empArr.indexOf(test.split(",")[0]) != -1) {
			alert(test.split(",")[1] +" 님은 이미 추가된 임직원입니다.");
			return;
		}
		
		
		if (type == 'first' || type == 'second' || type == 'third') {
			if ($("input[name='chk']:checked").length > 1) {
				alert("결재권자는 각 1명만 등록 가능합니다.");
				return;
			}
		}
	
	if(type == 'first') {
		firStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="firstEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="firstEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+   '<input type="text" name="firType" value="'+ first +'" style="border: none; text-align: center;">'
			+ 	'</td>'
			+ 	'</tr>'
	} else if(type == 'second') {
		secStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="secondEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="secondEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+   '<input type="text" name="secType" value="'+ second +'" style="border: none; text-align: center;">'
			+ 	'</td>'
			+ 	'</tr>'
	}else if(type == 'third') {
		thiStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="thirdEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" name="thirdEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
			+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
			+	'</td>'
			+ 	'<td scope="col">'
			+   '<input type="text" name="thiType" value="'+ third +'" style="border: none; text-align: center;">'
			+ 	'</td>'
			+ 	'</tr>'
	}else if(type == 'ref') {
		refStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
 				+ 	'<td scope="col">'
				+ 		'<input type="text" name="refEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
				+	'</td>'
  				+ 	'<td scope="col">'
  				+ 		'<input type="text" name="refEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
				+	'</td>'
  				+ 	'<td scope="col">'
  				+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
				+	'</td>'
  				+ 	'<td scope="col">'
  				+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
				+	'</td>'
  				+ 	'<td scope="col">'
				+   '<input type="text" value="'+ ref +'" style="border: none; text-align: center;">'
				+ 	'</td>'
				+ 	'</tr>'
	} else if (type == 'help') {
		helpStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
				+ 	'<td scope="col">'
				+ 		'<input type="text" name="helpEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" name="helpEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
				+	'</td>'
				+ 	'<td scope="col">'
				+   	'<input type="text" value="'+ help +'" style="border: none; text-align: center;">'
				+ 	'</td>'
				+ 	'</tr>'
	} else if (type == 'read') {
		readStr += '<tr style="left: 0px;" id="listTr" onclick="remove_go();">'
				+ 	'<td scope="col">'
				+ 		'<input type="text" name="readEmpNo" value="' + test.split(",")[0] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpNo" value="' + test.split(",")[0] + '">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" name="readEmpName" value="' + test.split(",")[1] + '" style="border: none; text-align: center;">'
				+ 		'<input type="hidden" name="inEmpName" value="' + test.split(",")[1] + '">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" value="' + test.split(",")[2] + '" style="border: none; text-align: center;">'
				+	'</td>'
				+ 	'<td scope="col">'
				+ 		'<input type="text" value="' + test.split(",")[3] + '" style="border: none; text-align: center;">'
				+	'</td>'
				+ 	'<td scope="col">'
				+   '<input type="text" value="'+ read +'" style="border: none; text-align: center;">'
				+ 	'</td>'
				+ 	'</tr>'
	}
	
});	

if ($("#listDiv input[name='firType']").length < 1) {
	$("#listDiv").append(firStr);
	$("input[name='chk']").prop("checked",false);
}else if ($("#listDiv input[name='secType']").length < 1) {
	$("#listDiv").append(secStr);
	$("input[name='chk']").prop("checked",false);
}else if ($("#listDiv input[name='thiType']").length < 1) {
	$("#listDiv").append(thiStr);
	$("input[name='chk']").prop("checked",false);
}
	$("#listDiv").append(refStr);
	$("#listDiv").append(readStr);
	$("#listDiv").append(helpStr);
}
    
function ref_go() {
	$('span[name="empLabel"]').remove();

	var empl = $('[name="inEmpNo"]').length;
	var emplName = $('[name="inEmpName"]').length;
	var empArr = new Array(empl);
	var empArrName = new Array(emplName);
	
	for(var i = 0; i < empl; i++) {
		empArr[i] = $('[name="inEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < emplName; i++) {
		empArrName[i] = $('[name="inEmpName"]').eq(i).val();
	}
	
	var firstEmpNoL = $('input[name="firstEmpNo"]').length;
	var secondEmpNoL = $('input[name="secondEmpNo"]').length;
	var thirdEmpNoL = $('input[name="thirdEmpNo"]').length;
	var refEmpNoL = $('input[name="refEmpNo"]').length;
	var helpEmpNoL = $('input[name="helpEmpNo"]').length;
	var readEmpNoL = $('input[name="readEmpNo"]').length;

	var firstEmpNoarr = new Array(firstEmpNoL);
	var secondEmpNoarr = new Array(secondEmpNoL);
	var thirdEmpNoarr = new Array(thirdEmpNoL);
	var refEmpNoarr = new Array(refEmpNoL);
	var helpEmpNoarr = new Array(helpEmpNoL);
	var readEmpNoarr = new Array(readEmpNoL);
	
	for(var i = 0; i < firstEmpNoL; i++) {
		firstEmpNoarr[i] = $('input[name="firstEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < secondEmpNoL; i++) {
		secondEmpNoarr[i] = $('input[name="secondEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < thirdEmpNoL; i++) {
		thirdEmpNoarr[i] = $('input[name="thirdEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < refEmpNoL; i++) {
		refEmpNoarr[i] = $('input[name="refEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < helpEmpNoL; i++) {
		helpEmpNoarr[i] = $('input[name="helpEmpNo"]').eq(i).val();
	}
	for(var i = 0; i < readEmpNoL; i++) {
		readEmpNoarr[i] = $('input[name="readEmpNo"]').eq(i).val();
	}
	
	var firstEmpNameL = $('input[name="firstEmpName"]').length;
	var secondEmpNameL = $('input[name="secondEmpName"]').length;
	var thirdEmpNameL = $('input[name="thirdEmpName"]').length;
	var refEmpNameL = $('input[name="refEmpName"]').length;
	var helpEmpNameL = $('input[name="helpEmpName"]').length;
	var readEmpNameL = $('input[name="readEmpName"]').length;

	var firstEmpNamearr = new Array(firstEmpNameL);
	var secondEmpNamearr = new Array(secondEmpNameL);
	var thirdEmpNamearr = new Array(thirdEmpNameL);
	var refEmpNamearr = new Array(refEmpNameL);
	var helpEmpNamearr = new Array(helpEmpNameL);
	var readEmpNamearr = new Array(readEmpNameL);

	for(var i = 0; i < firstEmpNameL; i++) {
		firstEmpNamearr[i] = $('input[name="firstEmpName"]').eq(i).val();
	}
	for(var i = 0; i < secondEmpNameL; i++) {
		secondEmpNamearr[i] = $('input[name="secondEmpName"]').eq(i).val();
	}
	for(var i = 0; i < thirdEmpNameL; i++) {
		thirdEmpNamearr[i] = $('input[name="thirdEmpName"]').eq(i).val();
	}
	for(var i = 0; i < refEmpNameL; i++) {
		refEmpNamearr[i] = $('input[name="refEmpName"]').eq(i).val();
	}
	for(var i = 0; i < helpEmpNameL; i++) {
		helpEmpNamearr[i] = $('input[name="helpEmpName"]').eq(i).val();
	}
	for(var i = 0; i < readEmpNoL; i++) {
		readEmpNamearr[i] = $('input[name="readEmpName"]').eq(i).val();
	}
	
	
	
	var firstEmpNoStr = '';
	var secondEmpNoStr = '';
	var thirdEmpNoStr = '';
	var refEmpNoStr = '';
	var helpEmpNoStr = '';
	var readEmpNoStr = '';

	var firstEmpNameStr = '';
	var secondEmpNameStr = '';
	var thirdEmpNameStr = '';
	var refEmpNameStr = '';
	var helpEmpNameStr = '';
	var readEmpNameStr = '';
	
	for(var i = 0; i < firstEmpNoL; i++) {
		if(empArr.indexOf(firstEmpNoarr[i]) != -1) {
			firstEmpNoStr += '<input type="hidden" name="firstEmp" value="' + firstEmpNoarr[i] + '">';
		}
	}
	for(var i = 0; i < secondEmpNoL; i++) {
		if(empArr.indexOf(secondEmpNoarr[i]) != -1) {
			secondEmpNoStr += '<input type="hidden" name="secondEmp" value="' + secondEmpNoarr[i] + '">';
		}
	}
	for(var i = 0; i < thirdEmpNoL; i++) {
		if(empArr.indexOf(thirdEmpNoarr[i]) != -1) {
			thirdEmpNoStr += '<input type="hidden" name="thirdEmp" value="' + thirdEmpNoarr[i] + '">';
		}
	}
	for(var i = 0; i < refEmpNoL; i++) {
		if(empArr.indexOf(refEmpNoarr[i]) != -1) {
			refEmpNoStr += '<input type="hidden" name="refEmp" value="' + refEmpNoarr[i] + '">';
		}
	}
	for(var i = 0; i < helpEmpNoL; i++) {
		if(empArr.indexOf(helpEmpNoarr[i]) != -1) {
			helpEmpNoStr += '<input type="hidden" name="helpEmp" value="' + helpEmpNoarr[i] + '">';
		}
	}
	for(var i = 0; i < readEmpNoL; i++) {
		if(empArr.indexOf(readEmpNoarr[i]) != -1) {
			readEmpNoStr += '<input type="hidden" name="readEmp" value="' + readEmpNoarr[i] + '">';
		}
	}
	
	for(var i = 0; i < firstEmpNameL; i++) {
		if(empArrName.indexOf(firstEmpNamearr[i]) != -1) {
			firstEmpNameStr += '<span type="text" id="firRemove" name="empLabel" class="text-primary">' + firstEmpNamearr[i] 
						    +	 '<x type="button" id="1" onclick="regRemove_go(this);">X</x>'
						    +  '</span>'
		}
	}
	for(var i = 0; i < secondEmpNameL; i++) {
		if(empArrName.indexOf(secondEmpNamearr[i]) != -1) {
			secondEmpNameStr += '<span type="text" id="secRemove" name="empLabel" class="text-primary">' + secondEmpNamearr[i] 
			 				 +	 '<x type="button" onclick="regRemove_go(this);">X</x>'
			 				 + '</span>'
		}
	}
	for(var i = 0; i < thirdEmpNameL; i++) {
		if(empArrName.indexOf(thirdEmpNamearr[i]) != -1) {
			thirdEmpNameStr += '<span type="text" id="thiRemove" name="empLabel" class="text-primary">' + thirdEmpNamearr[i] 
						    +	 '<x type="button" onclick="regRemove_go(this);">X</x>'
			                + '</span>'
		}
	}
	for(var i = 0; i < refEmpNameL; i++) {
		if(empArrName.indexOf(refEmpNamearr[i]) != -1) {
			refEmpNameStr += '<span type="text" id="refRemove" name="empLabel" class="text-primary float-left ml-3">' + refEmpNamearr[i] 
						  +	 '<x type="button" onclick="regRemove_go(this);">X</x>'
						  + '</span>'
		}
	}
	for(var i = 0; i < helpEmpNameL; i++) {
		if(empArrName.indexOf(helpEmpNamearr[i]) != -1) {
			helpEmpNameStr += '<span type="text" id="helpRemove" name="empLabel" class="text-primary">' + helpEmpNamearr[i] 
			 			   +	 '<x type="button" onclick="regRemove_go(this);">X</x>'
			               + '</span>'
		}
	}
	for(var i = 0; i < readEmpNameL; i++) {
		if(empArrName.indexOf(readEmpNamearr[i]) != -1) {
			readEmpNameStr += '<span type="text" id="readRemove" name="empLabel" class="text-primary float-left ml-3">' + readEmpNamearr[i] 
			 			   +	 '<x type="button" onclick="regRemove_go(this);">X</x>'
			  			   + '</span>'
		}
	}
	
	$("#firstTd").append(firstEmpNoStr);
	$("#firstTd").append(firstEmpNameStr);
	$("#secondTd").append(secondEmpNoStr);
	$("#secondTd").append(secondEmpNameStr);
	$("#thirdTd").append(thirdEmpNoStr);
	$("#thirdTd").append(thirdEmpNameStr);
	$("#refTd").append(refEmpNoStr);
	$("#refTd").append(refEmpNameStr);
 	$("#readTd").append(readEmpNoStr);
 	$("#readTd").append(readEmpNameStr);
 	$("#helpTd").append(helpEmpNoStr);
 	$("#helpTd").append(helpEmpNameStr);
	
	$('#myModal').modal("hide"); 
}

function remove_go() {
	$("#listTr").remove();
}


function regRemove_go(ele) {
   $(ele).parent().remove();
}
</script>


</body>