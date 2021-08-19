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

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">


			<div class="card card-custom" style="height:100%;">
				<div class="card-header">
				    <div class="card-title" >수신자 등록</div>
				</div>
				
				<div class="card-body">
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
				                <c:if test="${rec.size() gt 0}">
									<c:forEach items="${rec}" var="rec">
						                <tr onclick="fn_delEmp(${rec.tasklineEmpno})" id="emp_${rec.tasklineEmpno}">
						                	<td>${rec.empName}&nbsp;${rec.psName}</td>
						                	<td>${rec.deptName}</td>
						                	<input type="hidden" name="empRec" value="${rec.tasklineEmpno}"/>
						                </tr>
					                </c:forEach>
				                </c:if>
				            </table>
				        </div>
				        <div class="col-6">
				            <table class="table table-hover" id="ccTable" style="overflow:auto;">
				                <tr>
				                    <th scope="col">참조자 이름</th>
				                    <th scope="col">참조자 부서</th>
				                </tr>
				                <c:if test="${cc.size() gt 0}">
					                <c:forEach items="${cc}" var="cc">
					                	<c:if test="${cc.tasklineEmpno ne 'default'}">
						                <tr onclick="fn_delEmp(${cc.tasklineEmpno})" id="emp_${cc.tasklineEmpno}">
						                	<td>${cc.empName}&nbsp;${cc.psName}</td>
						                	<td>${cc.deptName}</td>
						                	<input type="hidden" name="empCc" value="${cc.tasklineEmpno}"/>
						                </tr>
						                </c:if>
					                </c:forEach>
					                </c:if>
				            </table>
				        </div>
				    </div>
				</div>
				
				<div class="card-footer">
					<div class="form-group">
						<form id="registForm">
							<input type="hidden" name="tasklineId" value="${line.tasklineId}"/>
							<input type="hidden" name="empNo" value="${loginUser.empNo}"/>
							<input type="hidden" id="empRecList" name="recEmp" />
							<input type="hidden" id="empCcList" name="ccEmp" />
							<label>수신선 이름</label>
							<div class="input-group">
								<input type="text" name="tasklineName" class="form-control  mr-2" placeholder="수신선 이름을 입력하세요." value="${line.tasklineName}"/>
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

    $('#recTable').append(
      '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '">' +
      '	<td>' + empName + ' ' + psName + '</td>' +
      '	<td>' + deptName + '</td>' +
      ' <input type="hidden" name="empRec" value="' + empNo + '"/>' +
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


    $('#ccTable').append(
      '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '">' +
      '	<td>' + empName + ' ' + psName + '</td>' +
      '	<td>' + deptName + '</td>' +
      ' <input type="hidden" name="empCc" value="' + empNo + '"/>' +
      '</tr>'
    );
  }
  
  function ref_go() {

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
	  
	  if(confirm('수신선을 수정하시겠습니까?')) {
	  	  $('#registForm').attr("action", "<%=request.getContextPath()%>/mypage/line/taskReceive/modify");
	      $('#registForm').attr("method", "post");
	      $('#registForm').submit();
	  }
  }
</script>


</body>