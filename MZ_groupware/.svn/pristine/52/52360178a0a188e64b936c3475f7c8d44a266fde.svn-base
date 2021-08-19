<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
	<title>결재선 등록</title>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
    <%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
<style>
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
</head>
<body>

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">

			<div class="card-header" style="justify-content: left">
				<h4 class="modal-title" id="myModalLabel">결재선 등록</h4>
			</div>
			<div class="card-body">
		
			<div class="row">
					<div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3;">
					</div>
					<div id="apList" class="col-8" style="border: 1px solid #EBEDF3; overflow: auto; height: 320px;">
						<table class="table table-hover" id="del_target">
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

			<div class="d-flex justify-content-center mt-3">
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2" onclick="appList_go('first');">1차 결재권자</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('second');">2차 결재권자</button>
				<button class="btn btn-primary btn-shadow-hover btn-sm font-weight-bold col-2 ml-3" onclick="appList_go('final');">최종 결재권자</button>
			</div>
<!-- 				<input type="hidden" name="refEmp" class="form-control" value="1" style="border: none; height: 9.75px; text-align: center;"> -->
				<div class="modal-body" style="height: 150px;">
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
						<tr onclick="remove_go(this, 'first');">
							<td id="first1">${line.lineFirstEmp}</td>
							<td id="first2">${line.lineFirst}</td>
							<td id="first3">${line.lineFirstPs}</td>
							<td id="first4">${line.lineFirstDept}</td>
							<td id="first5">1차 결재권자</td>
						</tr>
						<tr onclick="remove_go(this, 'second');">
							<td id="second1">${line.lineSecondEmp}</td>
							<td id="second2">${line.lineSecond}</td>
							<td id="second3">${line.lineSecondPs}</td>
							<td id="second4">${line.lineSecondDept}</td>
							<td id="second5">2차 결재권자</td>
						</tr>
						<tr onclick="remove_go(this, 'final');">
							<td id="final1">${line.lineFinalEmp}</td>
							<td id="final2">${line.lineFinal}</td>
							<td id="final3">${line.lineFinalPs}</td>
							<td id="final4">${line.lineFinalDept}</td>
							<td id="final5">최종 결재권자</td>
						</tr>
					</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card-footer">
	<div class="form-group">
		<form id="registForm">
			<input type="hidden" name="lineId" value="${line.lineId}"/>
			<input type="hidden" name="empNo" id="empNo" value="${loginUser.empNo}"/>
			<input type="hidden" name="lineFirst" id="lineFirst"/>
			<input type="hidden" name="lineSecond" id="lineSecond"/>
			<input type="hidden" name="lineFinal" id="lineFinal"/>
			<label>결재선 이름</label>
			<div class="input-group">
				<input type="text" name="lineName" class="form-control  mr-2" placeholder="결재선 이름을 입력하세요." value="${line.lineName}"/>
			    <button type="button" class="btn btn-primary mr-2" onclick="reg_go();">확인</button>
			    <button type="button" class="btn btn-default" onclick="javascript:CloseWindow();">취소</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/approval/js/jstree_js.jsp" %>	

<script>
$(".checkbox-all").css("display", "none");

$(document).on('click', "input[name='chk']", function() {
	$("input[name='chk']").prop("checked", false);
	$(this).prop("checked", true);
});

function remove_go(ele, loc) {
	
	var emp = "";
	var empno = "";
	var dept = "";
	var ps = "";
	if(loc == 'first') {
		empno = '${line.lineFirstEmp}';
		emp = "${line.lineFirst}";
		dept = "${line.lineFirstDept}";
		ps = "${line.lineFirstPs}";
	}
	if(loc == 'second') {
		empno = '${line.lineSecondEmp}';
		emp = "${line.lineSecond}";
		dept = "${line.lineSecondDept}";
		ps = "${line.lineSecondPs}";
	}
	if(loc == "final") {
		empno = '${line.lineFinalEmp}';
		emp = "${line.lineFinal}";
		dept = "${line.lineFinalDept}";
		ps = "${line.lineFinalPs}";
	}
	
	$("#" + loc + "1").text(empno);
	$("#" + loc + "1").css('color', 'black').css('font-weight', 'normal');
	$("#" + loc + "2").text(emp);
	$("#" + loc + "2").css('color', 'black').css('font-weight', 'normal');
	$("#" + loc + "3").text(ps);
	$("#" + loc + "3").css('color', 'black').css('font-weight', 'normal');
	$("#" + loc + "4").text(dept);
	$("#" + loc + "4").css('color', 'black').css('font-weight', 'normal');
	$("#" + loc + "5").css('color', 'black').css('font-weight', 'normal');
	
}

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
	var str = $("input[name='chk']:checked").val().split(',');
	
	if($("#first1").text() == str[0] || $("#second1").text() == str[0] || $("#final1").text() == str[0]) {
		alert("이미 결재선에 추가된 임직원입니다.");
		return;
	}
	
	if (type == 'first') {
		var empNo = str[0];
		var empName = str[1];
		var psName = str[2];
		var deptName = str[3];
		
		$("#first1").text(empNo);
		$("#first1").css("color", "#187DE4").css("font-weight", "bold");
		$("#first2").text(empName);
		$("#first2").css("color", "#187DE4").css("font-weight", "bold");
		$("#first3").text(psName);
		$("#first3").css("color", "#187DE4").css("font-weight", "bold");
		$("#first4").text(deptName);
		$("#first4").css("color", "#187DE4").css("font-weight", "bold");
		$("#first5").css("color", "#187DE4").css("font-weight", "bold");
	}
	if (type == 'second') {
		var empNo = str[0];
		var empName = str[1];
		var psName = str[2];
		var deptName = str[3];
		
		$("#second1").text(empNo);
		$("#second1").css("color", "#187DE4").css("font-weight", "bold");
		$("#second2").text(empName);
		$("#second2").css("color", "#187DE4").css("font-weight", "bold");
		$("#second3").text(psName);
		$("#second3").css("color", "#187DE4").css("font-weight", "bold");
		$("#second4").text(deptName);
		$("#second4").css("color", "#187DE4").css("font-weight", "bold");
		$("#second5").css("color", "#187DE4").css("font-weight", "bold");
	}
	if (type == 'final') {
		var empNo = str[0];
		var empName = str[1];
		var psName = str[2];
		var deptName = str[3];
		
		$("#final1").text(empNo);
		$("#final1").css("color", "#187DE4").css("font-weight", "bold");
		$("#final2").text(empName);
		$("#final2").css("color", "#187DE4").css("font-weight", "bold");
		$("#final3").text(psName);
		$("#final3").css("color", "#187DE4").css("font-weight", "bold");
		$("#final4").text(deptName);
		$("#final4").css("color", "#187DE4").css("font-weight", "bold");
		$("#final5").css("color", "#187DE4").css("font-weight", "bold");
	}
}

function reg_go() {
    $('#lineFirst').empty();
    $('#lineSecond').empty();
    $('#lineFinal').empty();
    
    
    $('#lineFirst').val($("#first1").text());
    $('#lineSecond').val($("#second1").text());
    $('#lineFinal').val($("#final1").text());
	
    if(confirm('결재선을 수정하시겠습니까?')) {
    	$('#registForm').attr("action", "<%=request.getContextPath()%>/mypage/line/approval/modify.do");
    	$('#registForm').attr("method", "post");
    	$('#registForm').submit();
   }
}
</script>

</body>