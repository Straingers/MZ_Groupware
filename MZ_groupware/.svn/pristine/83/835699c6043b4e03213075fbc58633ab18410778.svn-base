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
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <!-- Main content -->
    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom gutter-b example example-compact">
                <div class="card-header">
                    <h3 class="card-title">업무공유 작성</h3>
                    <div class="card-toolbar">
                        <button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">
                            <i class="ki ki-long-arrow-back icon-xs"></i>취소하기
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
                                                            <button class="btn btn-outline-primary" onclick="addFile_go();" type="button" id="addFileBtn" style="width: 110px;">
                                                                <svg class="float-left" aria-hidden="true" focusable="false" width="32" height="32" viewBox="0 0 32 32">
                                                                    <g fill="none" fillRule="evenodd">
                                                                        <rect class="uppy-ProviderIconBg" width="32" height="32" rx="16" fill="#2275D7"></rect>
                                                                        <path d="M21.973 21.152H9.863l-1.108-5.087h14.464l-1.246 5.087zM9.935 11.37h3.958l.886 1.444a.673.673 0 0 0 .585.316h6.506v1.37H9.935v-3.13zm14.898 3.44a.793.793 0 0 0-.616-.31h-.978v-2.126c0-.379-.275-.613-.653-.613H15.75l-.886-1.445a.673.673 0 0 0-.585-.316H9.232c-.378 0-.667.209-.667.587V14.5h-.782a.793.793 0 0 0-.61.303.795.795 0 0 0-.155.663l1.45 6.633c.078.36.396.618.764.618h13.354c.36 0 .674-.246.76-.595l1.631-6.636a.795.795 0 0 0-.144-.675z" fill="#FFF"></path>
                                                                    </g>
                                                                </svg>
                                                                <div class="uppy-DashboardTab-name" style="line-height: 32px;">LOCAL</div>
                                                            </button>
                                                            <!-- 클라우드 파일 -->
                                                            <button class="btn btn-outline-primary" onclick="" type="button" id="addCloudBtn" style="width: 110px;">
                                                                <svg class="float-left" aria-hidden="true" focusable="false" width="32" height="32" viewBox="0 0 32 32">
                                                                    <g fill="none" fillRule="evenodd">
                                                                        <rect class="uppy-ProviderIconBg" fill="#4285F4" width="32" height="32" rx="16"></rect>
                                                                        <path d="M10.324 23.3l3-5.1H25l-3 5.1H10.324zM13 18.2l-3 5.1-3-5.1 5.839-9.924 2.999 5.1L13 18.2zm11.838-.276h-6L13 8h6l5.84 9.924h-.002z" fill="#FFF"></path>
                                                                    </g>
                                                                </svg>
                                                                <div class="uppy-DashboardTab-name" style="line-height: 32px;">CLOUD</div>
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
	 $("form[name='registForm']").attr("action", "<%=request.getContextPath()%>/task/share/tempRegist");
	 document.registForm.submit();
  }


</script>
</body>
