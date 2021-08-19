<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="departmentList" value="${dataMap.departmentList}" />
<c:set var="employeeList" value="${employeeList}" />
<c:set var="positionList" value="${positionList}" />
<style type="text/css">
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 50vh;
}
.modal-textAligh{
    text-align: center;
}

/* The max width is dependant on the container (more info below) */
.popover{
    max-width: 100%; /* Max Width of the popover (depending on the container!) */
}
#card_body::-webkit-scrollbar {
   width: 5px; /*스크롤바의 너비*/
}

#card_body::-webkit-scrollbar-thumb {
   background-color: #3699FF;
}

#card_body::-webkit-scrollbar-track {
   background-color: white;
}
</style>


<div class="modal fade" id="registModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="card-title">
							   	부서 등록
							  </h3>
							  <div class="card-toolbar">
									<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_deptRegist()">등록</button>
									<button type="button" class="btn btn-light-primary btn-sm mr-3" data-dismiss="modal">닫기</button>
								</div><!-- end::card-toolbar -->
            </div>
            <!--begin::Form-->
 						<form id="registForm" name="registForm" method="post" action="<%=request.getContextPath()%>/dept/regist.do">
            <div class="modal-body">
					    <div class="form-group mb-8">
					    
						    <div class="alert alert-custom alert-default" role="alert">
						     <div class="alert-icon"><i class="flaticon-questions-circular-button text-primary"></i></div>
						     <div class="alert-text">
						      	등록할 부서명을 입력하고, 상위부서를 선택해 주세요. <br>
						      	등록버튼을 클릭할 시 부서 등록이 완료됩니다.
						     </div>
						    </div>
						    
						   </div>
						   
						   <div class="form-group row">
									<label for="registDeptCode" class="col-3 col-form-label">상위부서
									<span class="text-danger">*</span></label>
									<div class="col-9">
										<input type="hidden" id="registDeptSuper" name="registDeptSuper" value=""/>
										<select class="form-control" id="registDeptCode" onchange="fn_setDeptCode(this,'regist')">
											<option value="0" selected>--선택하세요--</option>
											<c:forEach items="${departmentList}" var="department">
												<option value="${department.deptCode}">${department.deptName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<div class="form-group row">
							    <label for="registDeptName" class="col-3 col-form-label">부서명<span class="text-danger">*</span></label>
							    <div class="col-9">
							     <input id="registDeptName" name="registDeptName" class="form-control" type="text"/>
							    </div>
						   </div>
								
								<div class="form-group row">
									<label for="registPsCode" class="col-3 col-form-label">부서장
									<span class="text-danger">*</span></label>
									<div class="col-9">
										<input type="hidden" id="registDeptSuperNo" name="registDeptSuperNo" value=""/>
										<select class="form-control" id="registEmpNo" onchange="fn_setDeptSuperNo(this,'regist')">
											<option value="0" selected>--선택하세요--</option>
											<c:forEach items="${employeeList}" var="employee">
												<option value="${employee.empNo}">[${employee.psName}] ${employee.empName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
            </div>
            <div class="modal-footer">
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modifyModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="card-title">
			   	  부서 수정
				</h3>
				<div class="card-toolbar">
						<button type="button" class="btn btn-light-primary btn-sm mr-3" onclick="fn_deptModify()">등록</button>
						<button type="button" class="btn btn-light-primary btn-sm mr-3" data-dismiss="modal">닫기</button>
					</div><!-- end::card-toolbar -->
            </div>
            <!--begin::Form-->
 						<form id="modifyForm" name="modifyForm" method="post" action="<%=request.getContextPath()%>/dept/modify.do">
            <div class="modal-body">
					    <div class="form-group mb-8">
					    
						    <div class="alert alert-custom alert-default" role="alert">
						     <div class="alert-icon"><i class="flaticon-questions-circular-button text-primary"></i></div>
						     <div class="alert-text">
						      	수정할 부서명을 입력하고, 상위부서를 선택해 주세요. <br>
						      	부서장을 수정할 경우 부서장 변경을 해주세요. <br>
						      	등록버튼을 클릭할 시 부서 수정이 완료됩니다.
						     </div>
						    </div>
						    
						   </div>
						   
						   <div class="form-group row">
									<label for="modifyDeptCodeSelect" class="col-3 col-form-label">상위부서
									<span class="text-danger">*</span></label>
									<div class="col-9">
										<input type="hidden" id="modifyDeptSuper" name="modifyDeptSuper" value=""/>
										<input id="palosanto"class='form-control' type='text' value='Palosanto' disabled>
										<select class="form-control" id="modifyDeptCodeSelect" name="modifyDeptCodeSelect" onchange="fn_setDeptCode(this,'modify')">
											<option value="0" selected>--선택하세요--</option>
											<c:forEach items="${departmentList}" var="department">
												<option value="${department.deptCode}">${department.deptName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
							<div class="form-group row">
						    <label for="modifyDeptName" class="col-3 col-form-label">부서명
						    <span class="text-danger">*</span></label>
						    <div class="col-9">
						     <input id="modifyDeptCode" name="modifyDeptCode" class="form-control" type="hidden" />
						     <input id="modifyDeptName" name="modifyDeptName" class="form-control" type="text"/>
						    </div>
						   </div>
								
								<div class="form-group row">
									<label for="modifyPsCode" class="col-3 col-form-label">부서장
									<span class="text-danger">*</span></label>
									<div class="col-9">
										<input type="hidden" id="modifyDeptSuperNo" name="modifyDeptSuperNo" value=""/>
										<input type="hidden" id="beforeDeptSuperNo" name="beforeDeptSuperNo" value="" />
										<select class="form-control" id="modifyEmpNo" onchange="fn_setDeptSuperNo(this,'modify')">
											<option value="0" selected>--선택하세요--</option>
											<c:forEach items="${employeeList}" var="employee">
												<option value="${employee.empNo}">[${employee.psName}-${employee.empNo}] ${employee.empName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
            </div>
            <div class="modal-footer">
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="positionModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="card-title">
							   	직위 관리
							  </h3>
							  <div class="card-toolbar">
									<button type="button" class="btn btn-light-primary btn-sm mr-3" data-dismiss="modal">닫기</button>
								</div><!-- end::card-toolbar -->
            </div>
            <!--begin::Form-->
 						<form name="registForm" method="post" action="<%=request.getContextPath()%>/dept/regist.do">
            <div class="modal-body" id="card_body" style="padding-top: 10px; overflow:auto; overflow-y: auto; overflow-x: hidden; height: 75vh; list-style:none; padding-left: 15px;">
					    <div class="form-group mb-8">
					    
						    <div class="alert alert-custom alert-default" role="alert">
						     <div class="alert-icon"><i class="flaticon-questions-circular-button text-primary"></i></div>
						     <div class="alert-text">
						      	직위 목록을 확인하고, 직위 On/Off 해주세요.
						     </div>
						    </div>
						    
						   </div>
						   
							<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->
								<table class="table table-hover" style="overflow:auto;">
									<thead>
										<tr style="left: 0px;">
											<th scope="col">
												<span style="width: 137px;">NO</span>
											</th>
											<th scope="col">
												<span style="width: 137px;">직위명</span>
											</th>
											<th scope="col">
												<span style="width: 137px;">직원수</span>
											</th>
											<th scope="col">
												<span style="width: 137px;">상태</span>
											</th>
										</tr>
									</thead>
									
									<tbody id="tableBody">
										<c:forEach items="${positionList}" var="position" varStatus="status">
											<tr style="left: 0px;">
												<td scope="col" style="vertical-align: middle;">
													<span style="width: 137px;">${status.count}</span>
												</td>
												<td scope="col" style="vertical-align: middle;">
													<span style="width: 137px;">${position.psName}</span>
												</td>
												<td scope="col" style="vertical-align: middle;" data-toggle="popover" 
													title="직원목록" 
													data-html="true" 
													data-content="
														<c:forEach items='${position.employee}' var='employee' varStatus='test'>
															<div class='row' >
																<div class='col-12'>
																	<i class='fas fa-user'></i> ${employee.empName}
																</div>
															</div>
															<br>
														</c:forEach>
													<c:if test='${fn:length(position.employee) eq 0}'>직원 정보가 없습니다.</c:if>
													">
													 
													 
													<span style="width: 137px;" >
													 ${fn:length(position.employee)}명
													 </span>
												</td>
												<td scope="col" style="vertical-align: middle;">
													<span class="switch switch-sm switch-icon" style="display: inline-block; width: 95%; text-align: center;">
												    <label>
												     <input type="checkbox" id="select_${position.psCode}" name="select_position" checked/>
												     <span></span>
												    </label>
											   	</span>
												</td>
											</tr>
											<script>
												if("${position.isUse}" == "N"){
													$("#select_${position.psCode}").attr("checked",false);
												} else {
													$("#select_${position.psCode}").attr("checked",true);
												}
											</script>
										</c:forEach>
									</tbody>
								</table>
								<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->
								<!-- -------------------------------------------------------------------------------------- -->



            </div><!-- end::modal-body -->
            <div class="modal-footer">
            </div>
            </form>
        </div>
    </div>
</div>

<script>


function fn_deptRegist(){
	
	// 데이터 빈값 확인
	if($("#registDeptName").val()==""){
		alert("부서명은 필수입니다.");
		$("#registDeptName").focus();
		return;
	}
	
	if($("#registDeptSuper").val()==""){
		alert("상위 부서를 선택해주세요.");
		$("#registDeptCode").focus();
		return;
	}
	
	if($("#registDeptSuperNo").val()==""){
		alert("부서장을 선택해주세요.");
		$("#registEmpNo").focus();
		return;
	}
	
	$("#registForm").submit();
	
// 	document.registForm.submit();
}

function fn_deptModify(){
	// 데이터 빈값 확인
	if($("#modifyDeptName").val()==""){
		alert("부서명은 필수입니다.");
		$("#modifyDeptName").focus();
		return;
	}
	
	if($("#modifyDeptSuper").val()==""){
		alert("상위 부서를 선택해주세요.");
		$("#modifyDeptSuper").focus();
		return;
	}
	
	if($("#modifyDeptSuperNo").val()==""){
		alert("부서장을 선택해주세요.");
		$("#modifyEmpNo").focus();
		return;
	}
	
	document.modifyForm.submit();
}

// 상위 부서 코드 세팅
function fn_setDeptCode(obj,type){
	var selectValue = obj.value;
	if(type=="regist"){
		if(selectValue != 0){
			$("#registDeptSuper").attr("value",selectValue);
		}else{
			$("#registDeptSuper").attr("value","");
		}
	}
	if(type=="modify"){
		if(selectValue != 0){
			$("#modifyDeptSuper").attr("value",selectValue);
		}else{
			$("#modifyDeptSuper").attr("value","");
		}
	}
}


// 부서장 설정
function fn_setDeptSuperNo(obj,type){
	var selectValue = obj.value;

	if(type=="regist"){
		if(selectValue != 0){
			$("#registDeptSuperNo").attr("value",selectValue);
		}else{
			$("#registDeptSuperNo").attr("value","");
		}
	}
	if(type=="modify"){
		if(selectValue != 0){
			$("#modifyDeptSuperNo").attr("value",selectValue);
		}else{
			$("#modifyDeptSuperNo").attr("value","");
		}
	}
}
	
	
$(document).on('click','input[name="select_position"]',function(){
	var selectPsCode = $(this).attr("id").split("_")[1];
   	if($(this).prop("checked") == true){
   		$(this).attr("checked", true);
   		$.ajax({
   			url : "<%=request.getContextPath() %>/admin/comp/group/dept/modifyPositionY.do?psCode="+selectPsCode
   			,type : "get"
   			,contentType : "application/json; charset=utf-8;"
   			,success : function(data){
   				console.log("처리완료");
   			}
   			,error : function(xhr){
   				console.log("문제");
   			}
   		});
   	} else {
   		$(this).attr("checked", false);
   		$.ajax({
   			url : "<%=request.getContextPath() %>/admin/comp/group/dept/modifyPositionN.do?psCode="+selectPsCode
   			,type : "get"
   			,contentType : "application/json; charset=utf-8;"
   			,success : function(data){
   				console.log("처리완료");
   			}
   			,error : function(xhr){
   				console.log("문제");
   			}
   		});
   	}
});
	
</script>