<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<title>수신선 등록</title>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
</head>

<body>

<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container-fluid">


			<div class="card card-custom" style="height:100%;">
				<div class="card-header" style="min-height:50px;">
				    <div class="card-title" >수신자 등록</div>
				</div>
				
				<div class="card-body">
				    <div class="row">
				        <div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
				        </div>
				        <div class="col-8" style="border: 1px solid #EBEDF3;height: 313.88px;overflow: auto;">
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
				
				<div class="card-footer">
					<div class="form-group">
						<form id="registForm">
							<input type="hidden" name="empNo" value="${loginUser.empNo}"/>
							<input type="hidden" id="empRecList" name="recEmp" />
							<input type="hidden" id="empCcList" name="ccEmp" />
							<label>수신선 이름</label>
							<div class="input-group">
								<input type="text" name="tasklineName" class="form-control  mr-2" placeholder="수신선 이름을 입력하세요."/>
							    <button type="button" class="btn btn-primary mr-2" onclick="ref_go();">확인</button>
							    <button type="button" class="btn btn-default" onclick="javascript:CloseWindow();">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

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
	    
	    if(confirm('수신선을 등록하시겠습니까?')) {
	    	$('#registForm').attr("action", "<%=request.getContextPath()%>/mypage/line/receiveRegist");
	    	$('#registForm').attr("method", "post");
	    	$('#registForm').submit();
	    }
	  }
</script>












</body>