<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>임시저장 수정</title>
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
                    <h3 class="card-title">임시저장 수정</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소
                        </button>
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="temp_go()">
                            <i class="ki ki-check icon-xs"></i>임시저장
                        </button>
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="remove_go()">
                            <i class="fas fa-trash-alt"></i>삭제
                        </button>
                        <button type="button" class="btn btn-primary font-weight-bolder" onclick="regist_go();">
                            <i class="ki ki-check icon-xs"></i>등록
                        </button>
                    </div>
                </div>
                <!--begin::Form-->
                <div class="card-body">
                    <form enctype="multipart/form-data" method="post" name="registForm">
						<input type="hidden" name="taskNo" value="${task.taskNo }"/>                    
                        <div class="form-group row">
                            <label for="taskTitle" class="col-2 col-form-label text-center">업무요약</label>
                            <div class="col-10">
                                <input id="taskTitle" name="taskTitle" type="text" class="form-control" value="${task.taskTitle}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center"></label>
                            <div class="col-10">
                                <a href="#" class="btn btn-secondary font-weight-bolder btn-sm" data-toggle="modal" data-target="#exampleModal">
                                    <i class="flaticon2-telegram-logo"></i> 수신자 등록
                                </a>
                                <a href="#" class="btn btn-secondary font-weight-bolder btn-sm">
                                    <i class="flaticon2-telegram-logo"></i> 개인 수신자
                                </a>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center">수신</label>
                            <div class="col-10" id="empRec"></div>
                            <input type="hidden" id="empRecList" name="recEmp" />
                        </div>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-center">참조</label>
                            <div class="col-10" id="empCc"></div>
                            <input type="hidden" id="empCcList" name="ccEmp" />
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <textarea id="taskContent" name="taskContent" style="display: none;"></textarea>
                                <div class="summernote" id="kt_summernote_1">${task.taskContent}</div>
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
                            	<c:forEach items="${task.attachList}" var="attach">
                            		<div class="inputRow attach-item">
                            			<a class="text-dart text-hover-primary mb-1 font-size-lg" name="attachedFile" attach-fileName="${attach.attachFilename}" attach-no="${attach.attachNo}"
                            			href='<%=request.getContextPath()%>/task/getFiles.do?attachNo=${attach.attachNo}';">
                            				${attach.attachFilename}
                            				<button style='border:0;ouline:0;' class='label label-rounded label-danger ml-5' type='button'>X</button>
                            			</a>
                            		</div>
                            	</c:forEach>
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
                        <div class="col-8" style="border: 1px solid #EBEDF3;">
                            <table class="table table-hover" id="del_target" style="overflow:auto;">
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
</div>
<%@ include file="/WEB-INF/views/common/approval_summernote.jsp" %>
<%@ include file="/WEB-INF/views/task/js/jstree_js.jsp" %>

<script>
$('a[name="attachedFile"] > button').click(function(event){ // 동적으로 생긴 태그가 아니므로 바로 이벤트 적용 가능.
	var parent = $(this).parent('a[name="attachedFile"]'); // a tag
	
	var attachNo = parent.attr("attach-no");
	
	$(this).parents('div.attach-item').remove();
	
	var input = $('<input>').attr({"type":"hidden", "name":"deleteFile", "value":attachNo});
	$('form[name="registForm"]').prepend(input);
	return false; // 파일 다운로드를 막기위해 설정
});
	
  var empList = [];

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
      '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '">' +
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
      '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '">' +
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
        $('#empCc').append('<span class="badge badge-pill badge-primary mr-2">' + empObj.empName + '</span>');
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
	 $("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/task/share/modify");
	 document.registForm.submit();
  }
	
  function remove_go() {
	  if(confirm("삭제하시겠습니까?")) {
		  $("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/task/share/remove");
	  }
	  $("form[name='registForm']").submit();
  }

</script>
</body>
