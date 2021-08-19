<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>업무공유 작성</title>
    <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
</head>
<body>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">업무공유 작성</h3>
                    <div class="card-toolbar">
                    	<button class="btn btn-sm btn-light font-weight-bolder mr-2" id="btnOp" onclick="fn_operate();">
                           AUTO
                        </button>
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>닫기
                        </button>
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="temp_go()">
                            <i class="ki ki-check icon-xs"></i>임시저장
                        </button>
                        <button type="button" class="btn btn-primary font-weight-bolder" onclick="regist_go();">
                            <i class="ki ki-check icon-xs"></i>등록하기
                        </button>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <form enctype="multipart/form-data" method="post" name="registForm">
                        <div class="form-group row">
                            <label for="taskTitle" class="col-2 col-form-label text-center">업무요약</label>
                            <div class="col-10">
                                <input id="taskTitle" name="taskTitle" type="text" class="form-control"/>
                            </div>
                        </div>
<!--                         <div class="form-group row"> -->
<!--                             <label class="col-2 col-form-label text-center"></label> -->
<!--                             <div class="col-10"> -->
<!--                                 <a href="#" class="btn btn-secondary font-weight-bolder btn-sm" data-toggle="modal" data-target="#exampleModal"> -->
<!--                                     <i class="flaticon2-telegram-logo"></i> 수신자 등록 -->
<!--                                 </a> -->
<!--                                 <a href="#" class="btn btn-secondary font-weight-bolder btn-sm" data-toggle="modal" data-target="#tasklineModal"> -->
<!--                                     <i class="flaticon2-telegram-logo"></i> 개인 수신자 -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                         </div> -->
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center">수신</label>
                            <div class="col-6 col-form-label" id="empRec"></div>
                            <input type="hidden" id="empRecList" name="recEmp" />
                            <div class="col-4">
                                <a href="#" class="btn btn-secondary font-weight-bolder btn-sm" data-toggle="modal" data-target="#exampleModal">
                                    <i class="flaticon2-telegram-logo"></i> 수신자 등록
                                </a>
                                <a href="#" class="btn btn-secondary font-weight-bolder btn-sm ml-2" data-toggle="modal" data-target="#tasklineModal">
                                    <i class="flaticon2-telegram-logo"></i> 개인 수신자
                                </a>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center">참조</label>
                            <div class="col-10 col-form-label" id="empCc"></div>
                            <input type="hidden" id="empCcList" name="ccEmp" />
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <textarea id="taskContent" name="taskContent" style="display: none;"></textarea>
                                <div class="summernote" id="kt_summernote_1"></div>
                            </div>
                        </div>

                        <div class="card card-custom card-stretch" style="border: 1px solid #E4E6EF;">
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
                    </form>
                </div>
            </div><!-- card-body -->
        </div><!-- card -->
    </div>
    <div class="modal fade" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content" style="height: 700px; width: 800px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">수신자 등록</h5>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>--%>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
                        </div>
                        <div class="col-8" style="border: 1px solid #EBEDF3;height: 310px;overflow: scroll;">
                            <table class="table table-hover" id="del_target" style="overflow:auto;" style="height:500px;overflow:scroll;">
                                <thead>
                                <tr style="left: 0px;">
                                    <th scope="col" hidden>사번</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">직위</th>
                                    <th scope="col">부서</th>
                                    <th scope="col" width="25%"></th>
                                </tr>
                                </thead>
                                <tbody id="tableBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-6">
                            <table class="table table-hover" id="recTable" style="overflow:auto;">
                                <tr>
                                    <th scope="col">수신자 이름</th>
                                    <th scope="col">수신자 부서</th>
                                </tr>
                            </table>
                        </div>
                        <div class="col-6">
                            <table class="table table-hover" id="ccTable" style="overflow:auto;">
                                <tr>
                                    <th scope="col">참조자 이름</th>
                                    <th scope="col">참조자 부서</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="ref_go();">확인</button>
                    <%--<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>--%>
                </div>
            </div>
        </div>
    </div>
<div class="modal fade" id="tasklineModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
            <div class="modal-header">
            	<h5>개인 수신자 목록</h5>
            	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
            	<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="table-primary">
								<th class="text-center" style="width: 100px;">수신라인명</th>
								<th class="text-center">수신</th>
								<th class="text-center">참조</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="">
								<tr>
									<td class="text-center" colspan="3">데이터가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${lineList}" var="resultBean">
								<tr onclick="fn_getLine('${resultBean.tasklineId}')">
									<td class="text-center align-middle">${resultBean.tasklineName}</td>
									<td class="text-center align-middle">${resultBean.recEmpName}</td>
									<td class="text-center align-middle">
									<c:if test="${resultBean.ccEmpNo ne 'default'}">
										${resultBean.ccEmpName}
									</c:if>
									</td>
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
</div>
<%@ include file="/WEB-INF/views/common/approval_summernote.jsp" %>
<%@ include file="/WEB-INF/views/task/js/jstree_js.jsp" %>

<script>
function fn_operate(){
	$('#btnOp').hide();
	$("input[name='taskTitle']").val('[210812] MZ 그룹웨어 사용자 교육 결과 공유의 건');
	$(".summernote").summernote("code", '<div>2021년 08월 12일 자에 시행된 MZ 그룹웨어 교육 결과 및 개선사항 공유드립니다.</div><div><br></div><div>참여 직원은 총 10명으로 참여자 모두 교육 수료를 완료하셨습니다.</div><div><span style="font-family: Poppins, Helvetica, sans-serif;">금번 교육을 통해 나온 건의사항은 모두 3건이며, 이를 바탕으로 교육 개선 진행하도록 하겠습니다.</span></div><div><span style="font-family: Poppins, Helvetica, sans-serif;">자세한 사항은 아래의 첨부 자료를 참고해주시기 바랍니다.</span></div>');
}

var empList = [];

function fn_getLine(lineId) {
	
	var task = { tasklineId : lineId };
	
	$('[name="REC"]').remove();
	$('[name="empRec"]').remove();
	$('#empRec').empty();
	$('#empCc').empty();
	$('#empRecList').val(null);
	$('#empCcList').val(null);
	
	$.ajax({
		url: '<%=request.getContextPath()%>/task/line/detail?tasklineId='+lineId,
		type: 'post',
		data: JSON.stringify(task),
		contentType: 'application/json;charset=utf-8',
		success: function(data) {
			var rec = '';
			if(data.rec.length > 0) {
				for(var i = 0; i < data.rec.length; i++) {
					rec += '<span class="badge badge-pill badge-primary mr-2">' + data.rec[i].empName + '</span>'
					+ '<input type="hidden" name="empRec" value="' + data.rec[i].tasklineEmpno + '"/>';
				} 
			}
			$('#empRec > span').remove();
			$('#empRec > input').remove();
			$('#empRec').append(rec);

			
			var cc = '';
			if(data.cc.length > 0) {
				for(var i = 0; i < data.cc.length; i++) {
					cc += '<span class="badge badge-pill badge-success mr-2">' + data.cc[i].empName + '</span>'
					+ '<input type="hidden" name="empCc" value="' + data.cc[i].tasklineEmpno + '"/>';
				}
			}
			$('#empCc > span').remove();
			$('#empCc > input').remove();
			$('#empCc').append(cc);
			
			$('#tasklineModal').modal("hide");
			
			var empRecL = $("input[name='empRec']").length;
			var empRecArr = new Array(empRecL);
			for(var i=0; i<empRecL; i++) {
			  empRecArr[i] = $("input[name='empRec']").eq(i).val();
			}
			
			var empCcL = $("input[name='empCc']").length;
			var empCcArr = new Array(empCcL);
			for(var i=0; i<empCcL; i++) {
			  empCcArr[i] = $("input[name='empCc']").eq(i).val();
			}
			var empRecList = empRecArr.join();
			var empCcList = empCcArr.join();
			$('[name="recEmp"]').val(empRecList);
			$('[name="ccEmp"]').val(empCcList);
		},
		error:function(err) {
			console.log('에러발생 : ' + err);
		}
	});
}

function fn_delEmp(empNo) {
  $('#emp_' + empNo).remove();
  var index = empList.findIndex(function (element) {
    return element.emp === empNo;
  })
  empList.splice(index, 1);
}

function fn_addRec(empNo) {
  var exist = $(empList).filter(function () {
    return this.emp === empNo;
  }).length > 0;

  if (exist) {
    alert('이미 추가된 직원입니다.');
    return false;
  }

  var emp = $('#' + empNo);
  var empName = emp.data('emp-name');
  var deptName = emp.data('dept-name');
  var psName = emp.data('ps-name');

  var empObj = {
    emp: empNo,
    empName: empName,
    type: 'rec'
  };

  empList.push(empObj);

  $('#recTable').append(
    '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '" name="REC">' +
    '	<td>' + empName + ' ' + psName + '</td>' +
    '	<td>' + deptName + '</td>' +
    '</tr>'
  );
}

function fn_addCc(empNo) {
  var exist = $(empList).filter(function () {
    return this.emp === empNo;
  }).length > 0;

  if (exist) {
    alert('이미 추가된 직원입니다.');
    return false;
  }

  var emp = $('#' + empNo);
  var empName = emp.data('emp-name');
  var deptName = emp.data('dept-name');
  var psName = emp.data('ps-name');

  var empObj = {
    emp: empNo,
    empName: empName,
    type: 'cc'
  };

  empList.push(empObj);

  $('#ccTable').append(
    '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '" name="CC">' +
    '	<td>' + empName + ' ' + psName + '</td>' +
    '	<td>' + deptName + '</td>' +
    '</tr>'
  );
}

function ref_go() {
  $('#empRec').empty();
  $('#empCc').empty();

  $('#empRecList').val(null);
  $('#empCcList').val(null);

  var recList = [];
  var ccList = [];

  for (var empObj of empList) {
    if (empObj.type === 'rec') {
      $('#empRec').append('<span class="badge badge-pill badge-primary mr-2">' + empObj.empName + '</span>');
      recList.push(empObj.emp);
    } else {
      $('#empCc').append('<span class="badge badge-pill badge-success mr-2">' + empObj.empName + '</span>');
      ccList.push(empObj.emp);
    }
  }

  $('#empRecList').val(recList);
  $('#empCcList').val(ccList);

  $('#exampleModal').modal('hide');
}


function addFile_go() {
  if ($('input[name="uploadFile"]').length >= 5) {
    alert("파일 추가는 5개까지만 가능합니다.");
    return;
  }


  var input = $('<input>').attr({"type": "file", "name": "uploadFile"}).css("display", "inline");
  var div = $('<div>').addClass("inputRow");
  div.append(input).append("<button style='border:0;ouline:0;' class='label label-rounded label-danger' type='button'>X</button>");
  $('.fileInput').append(div);
}

function regist_go() {
var rec = $('input[name="recEmp"]').val();
if(rec == "") {
	alert("수신자 선택은 필수입니다.");
	return;
}
  
  var files = $('input[name="uploadFile"]');
  for (var file of files) {
    if (file.value == "") {
      alert("파일을 선택하세요.");
      file.focus();
      file.click();
      return;
    }
  }

  if ($("input[name='taskTitle']").val() == "") {
    alert("제목은 필수입니다.");
    $("input[name='taskTitle']").focus();
    return;
  }
 
  $("#taskContent").val($(".summernote").summernote("code"));
  $("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/task/share/regist");
  document.registForm.submit();
 
}

$('#all_select').click(function () {
  if ($("input:checkbox[id='all_select']").prop("checked")) {
    $("input[type=checkbox]").prop("checked", true);
  } else {
    $("input[type=checkbox]").prop("checked", false);
  }
});

function temp_go() {
 var files = $('input[name="uploadFile"]');
 for (var file of files) {
   if (file.value == "") {
     alert("파일을 선택하세요.");
     file.focus();
     file.click();
     return;
   }
 }
 
 if ($("input[name='taskTitle']").val() == "") {
   alert("제목은 필수입니다.");
   $("input[name='taskTitle']").focus();
   return;
 }
 $("#taskContent").val($(".summernote").summernote("code"));
 $("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/task/share/tempRegist");
 document.registForm.submit();
}


</script>
</body>
