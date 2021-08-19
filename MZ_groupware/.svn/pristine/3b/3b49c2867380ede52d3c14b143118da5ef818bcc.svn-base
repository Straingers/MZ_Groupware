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
				인사관리 > 인사정보 
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
						<button type="button" class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">닫기</button>
						<button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="location.href='modifyForm.do?empNo=${employee.empNo}';">수정</button>
						<button type="button" class="btn btn-primary font-weight-bolder" onclick="fn_deptDelete();">삭제</button>
					</div><!-- card-toolbar -->
				</div><!-- card-header flex-wrap border-0 pt-6 pb-0 -->
				
				<div class="card-body">
					<div class="row">
						<div class="col-3" style="text-align: center;">
							<div class="image-input image-input-outline">
									
								<div class="row">
									<div class="image-input-wrapper" id="pictureView" data-id="${employee.empNo}" style="width:150px; height:200px;"></div>
								</div><!-- row -->
								
								
								<div class="row" style="margin-top: 10px;">
									<c:choose>
										<c:when test="${employee.empStatus eq '재직'}">
											<button type="button" style="pointer-events: none;" 
											        class="btn btn-light-success btn-sm btn-append btn-block font-weight-bolder" 
											        >재직</button> 
										</c:when>
										<c:when test="${employee.empStatus eq '휴직'}">
											<button type="button" style="pointer-events: none;" 
											        class="btn btn-light-warning btn-sm btn-append btn-block font-weight-bolder" 
											        >휴직</button> 
										</c:when>
										<c:when test="${employee.empStatus eq '퇴사'}">
											<button type="button" style="pointer-events: none;" 
											        class="btn btn-light-danger btn-sm btn-append btn-block font-weight-bolder" 
											        >퇴사</button> 
										</c:when>
									</c:choose>
									
								</div><!-- row -->
							</div><!-- image-input image-input-outline -->
						</div><!-- end::col-3 -->
						
						<div class="col-9">
							<form role="form" class="form-horizontal" action="regist.do" method="post">  
							
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
			              		  <input name="deptName" id="deptName" type="text" class="form-control" 
			                	         maxlength=10 value="${employee.deptName}" disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
							              
				              
							              
				              <div class="form-group row">
												<label for="selectPsName" class="col-sm-3" style="font-size:0.9em; text-align: right;" >
				              	<span style="color:red;font-weight:bold;">*</span>직위</label>   
				              	<div class="col-sm-9 input-group input-group-sm">
			                	  <input name="psName" id="psName" type="text" class="form-control" 
			               	         maxlength=10 value="${employee.psName}" disabled="disabled">
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
				                	<input name="empTel" id="empTel" type="text" class="form-control" 
				                	       maxlength=15 value="${employee.empTel}" disabled="disabled">
				                  <span class="input-group-append-sm">   
				                  </span>                        
				                </div><!-- col-sm-9 input-group input-group-sm -->
				              </div><!-- form-group row -->
				              
							</form>
						</div><!-- end::col-9 -->
					</div> <!-- end::row -->			
				</div><!-- end::card-body -->
				
				<div class="card-footer">
				</div><!-- end::card-footer -->

			</div><!-- card card-custom gutter-b example example-compact -->
		</div><!-- container col-11 -->
	</div><!-- d-flex flex-column-fluid -->
</div><!-- content d-flex flex-column flex-column-fluid -->

<form role="imageForm" action="upload/picture.do" method="post" enctype="multipart/form-data"><!-- 화면이 새로고침되게이 submit은 불가능 -->
<!-- 템플릿으로 인해서 Jquery가 들어오는 시기는 Jquery include 위에 들어옴.   decorator:body  ==> function call 해야 함. 또는 윈도으ㅜ 업로드 펑션쓰던가. -->
   <input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();" style="display:none;">
   <input id="oldFile" type="hidden" name="oldPicture" value="" />
   <input type="hidden" name="checkUpload" value="0" />   
</form>

<script>
// UUID 코드 발급 json
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
	
	document.getElementById("empNo").onkeyup = function(e){
	  var v = this.value;
	  this.value = v.replace(/[^0-9]/gi, '');
	}
	
	document.getElementById("empName").onkeyup = function(e){
	  var v = this.value;
	  this.value = v.replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g, '');
	}
		
	
</script>

<script type="text/javascript">
//주소 API-----------------------------------------------------------------------
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
//                 document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
//                 document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('empZipcode').value = data.zonecode;
            document.getElementById("empAddr1").value = addr  + " " + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("empAddr2").focus();
        }
    }).open();
}

</script>

<script>
// 사진 업로드 --------------------------------------------------------------------
/**
 * picture_go : 사진 용량, 확장자 체크 
 * upload_go : 회원 등록 썸네일 업로드 체크
 */
var formData = "";

function picture_go(){
	formData = new FormData($('form[role="imageForm"]')[0]); 
	var form = $('form[role="imageForm"]');
	var picture = form.find('[name=pictureFile]')[0];
	
	// 업로드 확인 변수 초기화
	form.find('[name="checkUpload"]').val(0);
	var fileFormat = 
		picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	
	// 파일이 빈 경우
	if(fileFormat==""){
		$('div#pictureView')
		.css({'background-image':'',
					'background-position':'',
					'background-size':'',
					'background-repeat':''
		});
		return;
	}
	
	// 이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
		picture.value="";
		return;
	}
	
	// 이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1){ 
		alert("사진 용량은 1MB 이하만 가능합니다.");
		picture.value="";
		return;
	}
	
	console.log(picture.files[0].name);
// 	document.getElementById('inputFileName').value=picture.files[0].name; // 파일명 표시
	
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
}

function upload_go(){
// 	alert("upload btn click");
	if($('input[name="pictureFile"]').val()==""){
		alert("사진을 선택하세요.");
		$('input[name="pictureFile"]').click();
		return;
	}
	
	// 사진이 등록된 것이 있다면 등록 불가하게 유효성 체크
	if($('input[name="checkUpload"]').val() == '1'){
		alert("이미 업로드된 사진입니다.");
		return;
	}
	
	$.ajax({
		url : "picture.do",
		data : formData,
		type : 'post',
		processData : false,
		contentType : false,
		success : function(data){
			// 업로드 확인 변수 세팅
			$('input[name="checkUpload"]').val(1);
			
			// 저장된 파일명 저장.
			$('input#oldFile').val(data); 
			$('form[role="form"] input[name="empPhoto"]').val(data);
			
			alert("사진이 업로드 되었습니다.");
		},
		error : function(error){
			alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
		}
	});
}

//아이디 중복 체크------------------------------------------------------
function getEmpNo(){
	
	// 사번 자동 발급 비동기 수행
	$.ajax({
		url:"getEmpNo.do"
		,method:"get"
		,success:function(result){
			alert("발급이 완료되었습니다.");
			$('input[name="empNo"]').val(result); 
		}
		,error:function(error){
			alert("시스템 장애로 사번 발급에 실패했습니다.");
		}
	});
}

// 등록버튼 클릭 시 빈값 검사(데이터 유무 판단)--------------------------------------------------
function regist_go(){ 
	
	// 정규식 검사 : 이메일, 주민번호, 핸드폰
	var empName   = /^[가-힣]{2,5}$/;
	var empHp  = /^01[0-1]-?\d{3,4}-?\d{4}$/;
	var empTel = /^070-\d{4}-\d{4}/;
	var empEmail  = 
		/^(?=.*[a-z])[a-z0-9]{4,12}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
		
//	alert("regist_go");
	var uploadCheck = $('input[name="empPhoto"]').val();
	if(!uploadCheck){ // 사진 데이터 유무 체크 (uploadCheck 없으면)
		alert("사진 업로드는 필수입니다.");
		//$('input[name="pictureFile"]').click();
		return;
	}
	
	if($('input[name="empNo"]').val()==""){
		alert("사번을 발급받으셔야 합니다.");
		$('input[name="empNo"]').focus();
		return;
	}
	
	
	val = $("#empName").val();
	if($('input[name="empName"]').val()==""){
		alert("이름은 필수입력 입니다");
		$('input[name="empName"]').focus();
		return;
	}
	// 형식 체크
  if(checkRegExp(empName, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
	  alert("올바른 한글 2~5자를 입력해주세요.");
    return;
  }
	
  val = $("#empHp").val();
	if($('input[name="empHp"]').val()==""){
		alert("핸드폰은 필수입력 입니다");
		$('input[name="empHp"]').focus();
		return;
	}
	if(hasBlank(val)){
		alert("휴대폰 번호에 빈 칸은 입력하실 수 없습니다.");
		$('input[name="empHp"]').focus();
    return;
	}
	if(checkRegExp(empHp, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
		alert("010 또는 011로 시작하는 휴대폰 번호만 사용하세요. (예: 01012340000)");
		$('input[name="empHp"]').focus();
    return;
  }
	
	val = $("#empEmail").val();
	if($('input[name="empEmail"]').val()==""){
		alert("이메일은 필수입력 입니다");
		$('input[name="empEmail"]').focus();
		return;
	}
	if(checkRegExp(empEmail, val)){ // 정규식 체크(길이, 공백, 올바른 입력)
		alert("올바른 이메일 형식을 입력해주세요.");
		$('input[name="empEmail"]').focus();
	  return;
	}
	
	if($('input[name="empRegno"]').val()==""){
		alert("주민번호는 필수입력 입니다");
		$('input[name="empRegno"]').focus();
		return;
	}
// 	var empRegnoCheck = checkRRN();
	var empRegnoCheck = true;

	if(!empRegnoCheck){
		return;
	}
	
	if($('input[name="empZipcode"]').val()==""){
		alert("주소는 필수입력 입니다");
		$('input[name="empZipcode"]').focus();
		return;
	}
	
	if($('input[name="empAddr1"]').val()==""){
		alert("기본 주소는 필수입력 입니다");
		$('input[name="empAddr1"]').focus();
		return;
	}
	
	if($("select[name=deptName]").val()=="0"){
		alert("부서를 선택해주세요.");
		$('input[name="deptName"]').focus();
		return;
	}
	
	if($("select[name=psName]").val()=="0"){
		alert("직위를 선택해주세요.");
		$('input[name="psName"]').focus();
		return;
	}

	if($('input[name="empCreateDate"]').val()==""){
		alert("입사일은 필수선택 입니다");
		$('input[name="empCreateDate"]').focus();
		return;
	}
	
	
	
	var form = $('form[role="form"]');
	form.submit();
}

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

// 주민번호 유효성 검사 함수 ---------------------------------------------------
function checkRRN(){
	  var rrNumber = $("#empRegno").val();
	  var userNumber, ssn, temp;
	  var regExp = ["[^0-9]","\d{13}"]; //[숫자체크,길이체크]
	  
	  if(rrNumber.indexOf("-") != -1){
		 temp = delHyphen(rrNumber);
	  }else{
		 temp = rrNumber;
	  }
	  
	  if(!checkRegExp(regExp[0], temp)){
		 alert("주민등록번호는 숫자만 입력해야 합니다.");
		 return false;
	  }
	  
	  if(!checkRegExp(regExp[1],temp)){
		  alert("주민등록번호는 13자리입니다.");
		  return false;
	  }
	  
	  ssn = temp;
	    
	  var arr_ssn = [];
	  var compare = [2,3,4,5,6,7,8,9];
	  var sum = 0;
	  
	  // 공식: M = (11 - ((2×A + 3×B + 4×C + 5×D + 6×E + 7×F + 8×G + 9×H + 2×I + 3×J + 4×K + 5×L) % 11)) % 10
	  for(var i = 0; i < 13 ; i++){
	    arr_ssn[i] = ssn.substring(i,i+1);
	  }
	  
	  //1. 총 합을 구한다.
	  for(var i = 0; i < 12 ; i++){
	    
	    if(i < 8){
	      //compare index 0~7
	      sum = sum + (arr_ssn[i] * compare[i]);
	    } else{
	      //index 8~14
	      sum = sum + (arr_ssn[i] * compare[i-8]);
	    }
	  }
	  
	  //2. 총합에서 11로 나눈 나머지를 구한다.
	  //sum = sum % 11;
	    
	  //3. 11에서 2번의 결과값을 뺀다.
	  //sum = 11 - sum;
	    
	  //4. sum에서 10을 나눈 나머지를 구한다.
	  //sum = sum % 10;
	  
	  //5. 결과 확인
	  //11로 나눈 나머지와 주민번호의 맨 마지막 값이 같으면 맞는 번호이다
	  if((11-(sum % 11)) % 10 != arr_ssn[12]){
		  alert("올바른 주민등록 번호를 입력하여 주세요.");
		  return false;
	  }else{
		  return true;
	  }                                      
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
function fn_deptDelete(){
	Swal.fire({
        title: "정말 삭제하시겠습니까?",
        text: "삭제한 직원은 복구되지 않습니다.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        customClass: {
         confirmButton: "btn-primary"
        },
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
        	 	$.ajax({
        			  url : "<%=request.getContextPath() %>/admin/comp/member/remove.do?empNo=${employee.empNo}"
        			, type : "get"
        			, contentType: "application/json; charset=utf-8;"
        			, success : function(data) {
        				Swal.fire({
   	                title: "직원 삭제가 완료되었습니다.",
   	                icon: "success",
   	                confirmButtonText: "확인",
   	                customClass: {
   	                 confirmButton: "btn btn-primary"
   	                }
   	            }).then((result) => {
   	            	window.opener.parent.location.reload();
   	     					window.close();
					  		})
        			}
        			, error : function(xhr){
        				Swal.fire({
   	                title: "문제가 발생했습니다.",
   	                text: "관리자에게 문의하여 주세요!!",
   	                icon: "error",
   	                confirmButtonText: "확인",
   	                customClass: {
   	                 confirmButton: "btn btn-primary"
   	                }
   	            })
        			}
       		  });
        }
    });
	
}
</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/crud/forms/widgets/bootstrap-datepicker.js"></script>
</body>