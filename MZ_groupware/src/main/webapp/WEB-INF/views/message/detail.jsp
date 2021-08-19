<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div class="container col-12">
		<div class="card card-custom" data-card="true" id="kt_card_1">
			<div class="card-header">
				<div class="card-title">
					<h3 class="card-label">수신상세화면</h3>
				</div>
				<div class="card-toolbar">
					<button type="button" class="btn btn-light-primary float-right"
						data-toggle="modal" data-target="#registMsg">쪽지보내기</button>
<!-- 					&nbsp;&nbsp;&nbsp; -->
<!-- 					<button type="button" class="btn btn-light-primary float-right" -->
<!-- 						onclick="remove_go();">삭제</button> -->
				</div>
			</div>
			<div class="card-body" id="detailBody">
				<table class="table table-borderless">
			      <tr class="text-center">
			         <td style="font-weight:bold;" width="100px">보낸 사람</td>
			         <td>${msg.sender}</td>
			      </tr>
			      <tr class="text-center">
			         <td style="font-weight: bold;">발신 일자</td>
			         <td>${msg.mssSenddate}</td>
			      </tr>
			      <tr class="text-center">
			         <td><input type="hidden" id="tmpMssNo" value="${mssNo}"/>&nbsp;</td>
			      </tr>
			      <tr class="border" style="font-size: 11.5px; height: 220px;">
			         <td colspan="2" class="text-left">${msg.mssContent}</td>
			      </tr>
			   </table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="registMsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel">쪽지 전송</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <i aria-hidden="true" class="ki ki-close"></i>
		                </button>
		            </div>
		            <div class="modal-body">
		               <div class="form-group row" style="vertical-align: middle;">
							<a href="#" class="btn btn-secondary font-weight-bolder btn-sm col-3" data-toggle="modal" data-target="#exampleModal">
								<i class="flaticon2-telegram-logo"></i> 수신자 선택
							</a>
							<label class="col-2 col-form-label text-center">수신</label>
                            <div class="col-7"  id="empRec"></div>
                            <input type="hidden" id="empRecList" name="recEmp" />
			            </div>
			            <div class="form-group mb-1">
			               <label for="exampleTextarea">쪽지 내용</label>
			               <textarea class="form-control" id="msscontent" rows="3"></textarea>
			            </div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">취소</button>
		                <button type="button" class="btn btn-primary font-weight-bold" onclick="regist_go();">전송</button>
		            </div>
		        </div>
		    </div>
		</div>
		<div class="modal fade" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 520px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">수신자 선택</h5>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>--%>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div id="kt_tree_4" class="tree-demo col-4" style="border: 1px solid #EBEDF3; height: 360px;">
                        </div>
                        <div class="col-8" id="chacha" style="border: 1px solid #EBEDF3; height:360px; overflow:auto;">
                            <table class="table table-hover" id="del_target">
                                <thead>
                                <tr style="left: 0px;">
                                    <th scope="col">사번</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">직위</th>
                                    <th scope="col">부서</th>
                                    <th scope="col" width="25%"></th>
                                </tr>
                                </thead>
                                <tbody id="tableBody" >

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-12">
                            <table class="table table-hover" id="recTable" style="overflow:auto;">
                                <tr>
                                    <th scope="col">수신자 이름</th>
                                    <th scope="col">수신자 부서</th>
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
    
<%@ include file="/WEB-INF/views/message/jstree_js.jsp" %>
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
	  '<tr onclick="fn_delEmp(\'' + empNo + '\')" id="emp_' + empNo + '" name="REC">' +
	  '	<td>' + empName + ' ' + psName + '</td>' +
	  '	<td>' + deptName + '</td>' +
	  '</tr>'
	);
}
function ref_go() {
	$('#empRec').empty();
	
	$('#empRecList').val(null);
	
	var recList = [];
	
	for (var empObj of empList) {
	    $('#empRec').append('<span class="badge badge-pill badge-primary mr-2 align-middle mt-3">' + empObj.empName + '</span>');
	    recList.push(empObj.emp);
	}
	
	$('#empRecList').val(recList);
	
	$('#exampleModal').modal('hide');
}
	
function regist_go() {
	var rec = $('input[name="recEmp"]').val();
	if(rec == "") {
		alert("수신자 선택은 필수입니다.");
		return;
	}
	
	var recList = [];
	recList = $('#empRecList').val().split(",");
	$.ajax({
		url : "<%=request.getContextPath()%>/message/regist.do"
      , type : "post"
      , data : JSON.stringify({
         "mssReceiver" : recList,
         "mssContent" : $('#msscontent').val(),
      })
      , datatype : "json"
	  , contentType : "application/json"
      , success : function() {
	    	Swal.fire({
	  		  	icon: "success",
	  		  	title: "쪽지를 전송하였습니다.",
	  		  	showConfirmButton: false,
	  		  	timer: 1500
	  		}).then((result) => {
	  			var receiver = "";
	  			for(var i = 0; i < recList.length; i++) {
	  				receiver += recList[i] + "/";
	  			}
	           socket.send("쪽지," + receiver.substring(0, receiver.length - 1) + "," + $('#msscontent').val() + ",쪽지가 도착했습니다.,<%=request.getContextPath()%>/message/main/detail.do?mssNo=" + data.mssNo);	
			   $('#registMsg').modal("hide");
			   location.reload();
	  		});
      }
      , error : function(error) {
         alert("쪽지 보내기에 실패했습니다. 관리자에게 문의하세요.");
      }
   });
}
</script>
</body>

