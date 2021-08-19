<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-11">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
				인사관리 > 인사 정보 수정
			</h3>
		</div><!-- d-flex justify-content-between align-items-md-center flex-column flex-md-row -->
	</div><!-- col-md-11 -->
</div><!-- row justify-content-center py-8 px-8 py-md-4 px-md-0 -->

<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-11">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0">
					<div class="card-title">
					</div><!-- card-title -->
					<div class="card-toolbar">
						<button type="button" class="btn btn-light-primary font-weight-bolder mr-2" onclick="history.go(-1)">취소</button>
						<button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="modify_go();">수정</button>
					</div><!-- card-toolbar -->
				</div><!-- card-header flex-wrap border-0 pt-6 pb-0 -->
				
				<div class="card-body">
					<div class="row">
						<div class="col-3" style="text-align: center;">
							<div class="image-input image-input-outline">
									
								<div class="row">
									<div class="image-input-wrapper" id="pictureView" data-id="${employee.empNo}" style="width:150px; height:200px;"></div>
									<label for="inputFile" class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="change" data-toggle="tooltip" data-original-title="Change avatar">
										<i class="fas fa-pen icon-sm text-muted"></i>
									</label>
								</div><!-- row -->
								
								
								<div class="row" style="margin-top: 10px;">
									<label for="inputFile" class="btn btn-light-primary btn-sm btn-append btn-block font-weight-bolder">사진변경</label>
									<input id="picture" class="form-control" type="hidden" name="uploadPicture" /><!-- 변경했을 때 이것을 할당 -->
								</div><!-- row -->
								<div class="row" id="qrRow" style="margin-top: 10px;">
									<button type="button" class="btn btn-light-primary btn-sm btn-append btn-block font-weight-bolder" onclick="createdQR_UUID();">QR 번호 발급</button> 
								</div>
							</div><!-- image-input image-input-outline -->
						</div><!-- end::col-3 -->
						
						<div class="col-9">
								<div class="form-group row">
									<label for="empNo" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
		              				<span style="color:red;font-weight:bold;">*</span>사번</label>   
		              				<div class="col-sm-9 input-group input-group-sm">
			                			<input name="empNo" id="empNo" 
			                         		type="text" class="form-control" 
			                         		maxlength=10 value="${employee.empNo}" disabled="disabled">
			                 			<span class="input-group-append-sm">   
			                  			</span>                        
		                			</div><!-- col-sm-9 input-group input-group-sm -->
	              				</div><!-- form-group row -->
	              
				              <div class="form-group row">
												<label for="empName" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>이름</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empName" id="empName" 
				                	       type="text" class="form-control" 
				                	       maxlength=15 value="${employee.empName}" disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
				              <div class="form-group row">
												<label for="empHp" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>핸드폰</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empHp" id="empHp" type="text" class="form-control" value="${employee.empHp}"
				                	       maxlength=15 disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
				              <div class="form-group row">
												<label for="empEmail" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>이메일</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empEmail" id="empEmail" type="text" class="form-control" value="${employee.empEmail}"
				                		   maxlength=30 disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
							              
				              <div class="form-group row">
												<label for="empRegno" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>주민번호</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empRegno" id="empRegno" type="text" class="form-control" value="${employee.empRegno}"
				                	       placeholder="주민번호를 입력해주세요" maxlength=20 disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				               
				              <!-- empZipcode -->
				              <div class="form-group row">
												<label for="empZipcode" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>우편번호</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empZipcode" id="empZipcode" type="text" class="form-control" value="${employee.empZipcode}"
				                	       maxlength=10 disabled="disabled">
				                  <span class="input-group-append-sm">  
				                  </span>
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
							              
				              <div class="form-group row">
												<label for="empAddr1" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>주소1</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empAddr1" id="empAddr1" type="text" class="form-control" value="${employee.empAddr1}"
				                	       maxlength=200 disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
							              
				              <div class="form-group row">
												<label for="empAddr2" class="col-sm-3" style="font-size:0.9em; text-align: right;" >주소2</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input name="empAddr2" id="empAddr2" type="text" class="form-control" 
				                	       maxlength=150 value="${employee.empAddr2}" disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
				               <hr>
							              
				              <div class="form-group row">
												<label for="selectDeptName" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>부서</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
			              		  <select class="form-control form-control-sm" name="deptCode" id="selectDeptName" disabled>
										<option value="0" selected>--선택하세요--</option>
										<c:forEach items="${departmentList}" var="department">
											<option value="${department.deptCode}" ${department.deptCode eq employee.deptCode ? 'selected':''}>${department.deptName}</option>
										</c:forEach>
									</select>
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
							              
				              
							              
				              <div class="form-group row">
												<label for="selectPsName" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>직위</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<select class="form-control form-control-sm" name="psCode" id="selectPsName" disabled>
										<option value="0">--선택하세요--</option>
										<c:forEach items="${positionList}" var="positionList">
											<option value="${positionList.psCode}" ${positionList.psCode eq employee.psCode ? 'selected':''}>${positionList.psName}</option>
										</c:forEach>
									</select>
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
				              <div class="form-group row">
												<label for="kt_datepicker_1" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>입사일</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                  	<input name="empCreateDate" id="empCreateDate" type="text" class="form-control" 
			               	         maxlength=10 value="${employee.strEmpCreateDate}" disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
				              <div class="form-group row">
												<label for="empTel" class="col-sm-3" style="font-size:0.9em; text-align: right;" >내선번호</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
				                	<input id="empTel" type="text" class="form-control" 
				                	       maxlength=15 value="${employee.empTel}" >
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
						</div><!-- end::col-9 -->
					</div> <!-- end::row -->			
				</div><!-- end::card-body -->
				
				<div class="card-footer">
				</div><!-- end::card-footer -->

			</div><!-- card card-custom gutter-b example example-compact -->
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->

<!--begin::Page Scripts(used by this page)-->
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/js/pages/widgets.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/bootstrap/js/pages/custom/profile/profile.js"></script> --%>

<form role="form" class="form-horizontal" action="<%=request.getContextPath()%>/admin/comp/member/modify.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="oldPicture" value="${employee.empPhoto}" />
	<input id="inputFile" name="picture" type="file" class="form-control" onchange="changePicture_go();" style="display:none;">
    <input name="empTel" type="text" class="form-control" maxlength=15 >
    <input name="empNo" id="empNo" type="text" class="form-control" maxlength=10 value="${employee.empNo}" style="display:none;">
	<input type="hidden" id="qrCode" name="qrCode" />
</form>


<script>
/** 정규식 검사*/
function checkRegExp(regExp, param){
	if(param.match(regExp)){
		return false;
	}else{
		return true;
	}
}

// 공백검사
function hasBlank(str) {
	return str.match(" ");
}

/**
 * 하이픈 제거하는 메서드
 * @param param 하이폰 제거할 내용
 * @returns 하이폰 제거한 내용
 */
function delHyphen(param){
	var temp = param.replace("-","");
	return temp;
}

</script>

<script>
// 이미지 미리보기.
$(document).ready(function(){
	employeePictureThumb(document.querySelector('[data-id="${employee.empNo}"]'),'${employee.empPhoto}');
	//사용자 사진 미리보기 (서버 호출)
	function employeePictureThumb(targetObj, fileName){ // (대상, 이미지파일명)
		$(targetObj).css({
			"background-image" : "url('getPicture.do?empPhoto="+ fileName +"')"
			, "background-position" : "center"
			, "background-repeat" : "no-repeat"
			, "background-size" : "cover"
		});
	}
});
</script>

<script>
// 이미지 변경 처리
function changePicture_go(){
	var picture = $('input#inputFile')[0];
	
	var fileFormat = 
		picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase(); // 확장자 추출
	
	console.log(fileFormat);
		
	// 이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	}
	
	// 이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	};
	
	if(picture.files && picture.files[0]){ 
		var reader = new FileReader(); 
		reader.onload = function (e) { 
			$('div#pictureView')
				.css({'background-image':'url('+e.target.result+')',
							'background-position':'center',
							'background-size':'cover',
							'background-repeat':'no-repeat'
						});
		}
		reader.readAsDataURL(picture.files[0]); 
	}
	// 이미지 적용
	$('input[name="uploadPicture"]').val(picture.files[0].name);
}

function modify_go(){
	$('input[name="empTel"]').val($("#empTel").val());
	var empTel = /(070)[-](\d{4})[-](\d{4})$/;
	
	/** 정규식 검사*/
	function checkRegExp(regExp, param){
		if(param.match(regExp)){
			return false;
		}else{
			return true;
		}
	}
	
	var val = $("#empTel").val();
	if(checkRegExp(empTel, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
		alert("올바른 내선번호를 입력해주세요. (예: 070-7805-0000)");
		$("#empTel").focus();
    return;
  }
	
	
	var form=$('form[role="form"]');
	form.submit();
}

//UUID 코드 발급 json
function createdQR_UUID(){
	$.ajax({
		url : "<%=request.getContextPath()%>/admin/comp/member/createQR_UUID.do"
		, type : "get"
		, contentType : "application/json; charset=utf-8;"
		, success : function(data){
			$('#qrRow').after( '<span class="text-success">발급되었습니다!</span>' );
			$("#qrCode").val(data);
		}
		, error : function(xhr){
		alert("시스템 문제가 발생하였습니다. 관리자에게 문의해주세요.");
		}
	});
}
</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-datepicker.js"></script>
</body>