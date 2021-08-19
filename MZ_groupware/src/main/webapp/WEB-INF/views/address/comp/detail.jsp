<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
.form-group{
	margin-bottom : 1.05rem;
}
</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon2-user" style="padding: 0px 10px;"></i>
				${employee.empName} 님 &gt; 상세 정보
			</h3>
		</div>
	</div>
</div>
	
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
					</div><!-- card-title -->
					<div class="card-toolbar">
						<button type="button" class="btn btn-primary font-weight-bolder"
										data-toggle="modal" data-target="#registMsg">쪽지보내기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-primary font-weight-bolder" onclick="CloseWindow();">닫기</button>
					</div><!-- card-toolbar -->
				</div><!-- card-header flex-wrap border-0 pt-6 pb-0 -->
				
				<div class="card-body">
					<div class="row">
						<div class="col-3" style="text-align: center;">
							<div class="image-input image-input-outline">
									
								<div class="row">
									<div class="text-center mb-10"  style="float: none; margin:0 auto;">
										<div class="symbol symbol-120 symbol-xl-150">
											<div class="symbol-label" style="background-image:url('<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto=${employee.empPhoto}')"></div>
										</div>
										<h4 class="font-weight-bold my-2">${employee.empName}</h4>
										<div class="text-muted mb-2">${employee.psName}</div>
									</div>
								</div><!-- row -->
								
								
								<div class="row" style="margin-top: 10px;">
									<a type="button" class="btn-sm btn btn-light-primary float-right font-weight-bolder mr-2"
								    href="tel:${employee.empHp}">
                	<span class="svg-icon svg-icon-md"><i class="icon-xl fas fa-mobile-alt fa-lg"></i>&nbsp;&nbsp;전화하기</span>
                 </a>
                 <button type="button" class="btn-sm btn btn-light-primary float-right font-weight-bolder mr-2"
                         onclick="copyToClipboard();" >
                  <span class="svg-icon svg-icon-md"><i class="icon-xl fas fa-sticky-note fa-lg"></i>&nbsp;&nbsp;메일복사</span>
                 </button>	
                 <div id="text3" style="color: white;">${employee.empEmail}</div>
								</div><!-- row -->
							</div><!-- image-input image-input-outline -->
						</div><!-- end::col-3 -->
						
						<div class="col-9">
							<div class="form-group row">
								<label class="col-2 col-form-label">사번</label>
								<div class="col-4">
									<input class="form-control form-control-sm form-control-solid" disabled="disabled" type="text" value="${employee.empNo }">
								</div>
								<label class="col-2 col-form-label">부서</label>
								<div class="col-4">
									<input class="form-control form-control-sm form-control-solid" disabled="disabled" type="text" value="${employee.deptName }">
								</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">성명</label>
									<div class="col-4">
									<input class="form-control form-control-sm form-control-solid" disabled="disabled" type="text" value="${employee.empName }">
								</div>
								<label class="col-2 col-form-label">직위</label>
								<div class="col-4">
									<input class="form-control form-control-sm form-control-solid" disabled="disabled" type="text" value="${employee.psName }">
								</div>
								</div>
								<div class="form-group row">
								<label class="col-2 col-form-label">이메일</label>
								<div class="input-group col-4">
									<input class="form-control form-control-sm" disabled="disabled" type="text" value="${employee.empEmail}">
								</div>
								<label class="col-2 col-form-label">휴대폰번호</label>
								<div class="col-4">
									<input class="form-control form-control-sm" type="text" disabled="disabled" placeholder="010-1234-5678" value="${employee.empHp }">
								</div>
								</div>
								<div class="form-group row">
								<label class="col-2 col-form-label">내선번호</label>
								<div class="col-4">
									<input class="form-control form-control-sm" disabled="disabled" type="text" placeholder="" value="${employee.empTel }">
								</div>
							</div>
						</div><!-- end::col-9 -->
					</div> <!-- end::row -->			
				</div><!-- end::card-body -->
				
				<div class="card-footer">
				</div><!-- end::card-footer -->

			</div><!-- card card-custom gutter-b example example-compact -->
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->	
	
	<!-- 쪽지보내기 모달 -->
	<div class="modal fade" id="registMsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="exampleModalLabel"><span class="badge badge-pill badge-primary mr-2">${employee.empName}</span> 님에게 쪽지 전송</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <i aria-hidden="true" class="ki ki-close"></i>
		                </button>
		            </div>
		            <div class="modal-body">
	                <div class="form-group row">
                  	<input type="hidden" id="empRecList" name="recEmp" value="${employee.empNo}"/>
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


<script>
function regist_go() {
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
	  		  	title: "쪽지롤 전송하였습니다.",
	  		  	showConfirmButton: false,
	  		  	timer: 1500
	  		}).then((result) => {
	  			var receiver = "";
	  			for(var i = 0; i < recList.length; i++) {
	  				receiver += recList[i] + "/";
	  			}
	           socket.send("쪽지," + receiver.substring(0, receiver.length - 1) + "," + $('#msscontent').val() + ",쪽지가 도착했습니다.,<%=request.getContextPath()%>/message/send/list.do");	
			   $('#registMsg').modal("hide");
			   location.reload();
	  		});
      }
      , error : function(error) {
         alert("쪽지 보내기에 실패했습니다. 관리자에게 문의하세요.");
      }
   });
}

function copyToClipboard() {
	alert("메일이 복사되었습니다.");
	var obj = document.getElementById("text3");
	var range = document.createRange();
	range.selectNode(obj.childNodes[0]);
	var sel = window.getSelection();
	sel.removeAllRanges(); 
	sel.addRange(range); 
	document.execCommand("copy"); 
	sel.removeRange(range); 
}

</script>
</body>
