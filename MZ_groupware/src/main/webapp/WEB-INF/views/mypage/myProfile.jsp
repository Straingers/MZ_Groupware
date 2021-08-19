<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<head>
<title>마이페이지 - 내 정보</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
		<div class="col-md-12 pl-6">
			<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
				<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
					<i class="icon-xl flaticon2-user" style="padding: 0px 10px;"></i>
					마이페이지 &gt; 내 정보
				</h3>
			</div>
		</div>
	</div>
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Profile Personal Information-->
			<div class="d-flex flex-row">
				<div class="flex-row-auto offcanvas-mobile w-300px w-xl-350px" id="kt_profile_aside">
					<!--begin::Card-->
					<div class="card card-custom">
						<!--begin::Body-->
						<div class="card-body pt-10">
							<!--begin::User-->
							<div class="text-center mb-2">
								<div class="symbol symbol-120 symbol-xl-150">
									<div class="symbol-label" style="background-image:url('<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto=${employee.empPhoto}')"></div>
								</div>
								<h4 class="font-weight-bold my-2">${employee.empName }</h4>
								<div class="text-muted mb-2">${employee.psName }</div>
							</div>
							<a href="#" data-toggle="modal" data-target="#pwdModal" class="btn btn-light btn-hover-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">
								비밀번호 변경
							</a>
							<a href="#" data-toggle="modal" data-target="#appPwdModal" class="btn btn-light btn-hover-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">
								결재 비밀번호 변경
							</a>
							<!--end::User-->
						</div>
						<!--end::Body-->
					</div>
					<!--end::Card-->
				    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
					<table class="table text-center">
				    	<tr class="table-secondary">
				    		<th>입사일</th>
				    		<th>근속년수</th>
				    		<th>총연차일</th>
				    		<th>사용일</th>
				    	</tr>
				    	<tr>
				    		<td><fmt:formatDate value="${employee.empCreateDate }" pattern="yyyy-MM-dd" /></td>
				    		<td>${Integer.parseInt(sysYear) - Integer.parseInt(employee.empCreateDate.substring(0,4)) }</td>
				    		<td>${employee.empVac + userVaca }</td>
				    		<td>${userVaca }</td>
				    	</tr>
				    </table>
					<table class="table text-center">
				    	<tr class="table-secondary">
				    		<th colspan="4">
				    			<input class="form-control text-align" name="yearMonth" type="month" value="${yearMonth }" onchange="changeMonth();" />
				    		</th>
				    	</tr>
				    	<tr class="table-secondary">
				    		<th>정상출근</th>
				    		<th>지각</th>
				    		<th>조퇴</th>
				    		<th>결근</th>
				    	</tr>
				    	<tr>
				    		<td>${myCommute.get('normal') }</td>
				    		<td data-toggle="modal" data-target="#lazyDay">
				    			<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">
				    				${myCommute.get('lazy') }
				    			</a>
				    			<!-- Modal-->
								<div class="modal fade" id="lazyDay" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="exampleModalLabel">지각한 날짜</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <i aria-hidden="true" class="ki ki-close"></i>
								                </button>
								            </div>
								            <div class="modal-body">
								            	<c:choose>
									            	<c:when test="${myCommute.get('lazyDay').size() == 0 }">
									            		지각한 날이 없습니다.
									            	</c:when>
									            	<c:otherwise>
										                <c:forEach items='${myCommute.get("lazyDay") }' var='lazyDay'>
			        							  			<div class="h6">${lazyDay }</div>
			        							  		</c:forEach>
									            	</c:otherwise>
									            </c:choose>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
								            </div>
								        </div>
								    </div>
								</div>
				    		</td>
				    		<td data-toggle="modal" data-target="#earlygoDay">
				    			<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">
				    			${myCommute.get('earlygo') }
				    			</a>
				    			<!-- Modal-->
								<div class="modal fade" id="earlygoDay" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="exampleModalLabel">지각한 날짜</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <i aria-hidden="true" class="ki ki-close"></i>
								                </button>
								            </div>
								            <div class="modal-body">
								            	<c:choose>
									            	<c:when test="${myCommute.get('earlygoDay').size() == 0 }">
									            		조퇴한 날이 없습니다.
									            	</c:when>
									            	<c:otherwise>
										                <c:forEach items="${myCommute.get('earlygoDay') }" var='earlygoDay'>
			        							  			<div class="h6">${earlygoDay }</div>
			        							  		</c:forEach>
									            	</c:otherwise>
									            </c:choose>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
								            </div>
								        </div>
								    </div>
								</div>
				    		</td>
				    		<td data-toggle="modal" data-target="#notInDay">
				    			<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">
				    			${myCommute.get('notIn') }
				    			</a>
				    			<!-- Modal-->
								<div class="modal fade" id="notInDay" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								    <div class="modal-dialog" role="document">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h5 class="modal-title" id="exampleModalLabel">지각한 날짜</h5>
								                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								                    <i aria-hidden="true" class="ki ki-close"></i>
								                </button>
								            </div>
								            <div class="modal-body">
								            	<c:choose>
									            	<c:when test="${myCommute.get('notInDay').size() == 0 }">
									            		결근한 날이 없습니다.
									            	</c:when>
									            	<c:otherwise>
										                <c:forEach items="${myCommute.get('notInDay') }" var='notInDay'>
			        							  			<div class="h6">${notInDay }</div>
			        							  		</c:forEach>
									            	</c:otherwise>
									            </c:choose>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
								            </div>
								        </div>
								    </div>
								</div>
				    		</td>
				    	</tr>
				    </table>
				</div>
				<!-- Modal-->
				<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-scrollable" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <i aria-hidden="true" class="ki ki-close"></i>
				                </button>
				            </div>
				            <div class="modal-body" style="height: 100%;">
				                <form class="form" id="pwdFm" action="<%=request.getContextPath()%>/mypage/info/pwdChange.do" method="post">
				                	<input type="hidden" name="empNo" value="${employee.empNo }">
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">현재 비밀번호</label>
										<div class="col-9">
											<input type="password" id="nowPwd" class="form-control form-control-lg form-control-solid mb-2" value="" placeholder="현재 비밀번호를 입력하세요">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">변경할 비밀번호</label>
										<div class="col-9">
											<input type="password" id="changePwd" name="empPwd" class="form-control form-control-lg form-control-solid" value="" placeholder="알파벳 대소문자, 숫자로 이루어진 6~20자">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">비밀번호 확인</label>
										<div class="col-9">
											<input type="password" id="changePwd2" class="form-control form-control-lg form-control-solid" value="" placeholder="">
										</div>
									</div>
								</form>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
				                <button type="button" onclick="changePwd();" class="btn btn-primary font-weight-bold">변경</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				
				
				<div class="modal fade" id="appPwdModal" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-scrollable" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="exampleModalLabel">결재 비밀번호 변경</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <i aria-hidden="true" class="ki ki-close"></i>
				                </button>
				            </div>
				            <div class="modal-body" style="height: 100%;">
					            <p style="text-align: center; color: #0871b9; font-weight: bold;">
						            <span class="svg-icon svg-icon-primary svg-icon-2x"><!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo1/dist/../src/media/svg/icons/Code/Info-circle.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
									        <rect x="0" y="0" width="24" height="24"/>
									        <circle fill="#000000" opacity="0.3" cx="12" cy="12" r="10"/>
									        <rect fill="#000000" x="11" y="10" width="2" height="7" rx="1"/>
									        <rect fill="#000000" x="11" y="7" width="2" height="2" rx="1"/>
									    </g>
									</svg><!--end::Svg Icon--></span>
					            	결재 비밀번호는 변경하지 않았을 시 초기값 '1111' 으로 설정되어 있습니다.
					            </p>
				                <form class="form" id="pwdForm" action="<%=request.getContextPath()%>/mypage/info/appPwdChange.do" method="post">
				                	<input type="hidden" name="empNo" value="${employee.empNo }">
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">현재 비밀번호</label>
										<div class="col-9">
											<input type="password" id="nowAppPwd" class="form-control form-control-lg form-control-solid mb-2" value="" placeholder="현재 비밀번호를 입력하세요">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">변경할 비밀번호</label>
										<div class="col-9">
											<input type="password" id="changeAppPwd" name="appPwd" class="form-control form-control-lg form-control-solid" value="" placeholder="4자리 숫자로만 입력하세요">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label text-alert">비밀번호 확인</label>
										<div class="col-9">
											<input type="password" id="changeAppPwd2" class="form-control form-control-lg form-control-solid" value="" placeholder="">
										</div>
									</div>
								</form>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">닫기</button>
				                <button type="button" onclick="changeAppPwd();" class="btn btn-primary font-weight-bold">변경</button>
				            </div>
				        </div>
				    </div>
				</div>
				
				
				
				<!--begin::Content-->
				<div class="flex-row-fluid ml-lg-8">
					<!--begin::Card-->
					<div class="card card-custom card-stretch">
						<!--begin::Form-->
						<form class="form" id="fm" action="<%=request.getContextPath()%>/mypage/info/update.do" method="get">
							<input type="hidden" name="empNo" value="${employee.empNo }">
							<!--begin::Body-->
							<div class="card-body">
								<div class="form-group row">
									<label class="col-2 col-form-label">사번</label>
									<div class="col-4">
										<input class="form-control form-control-lg form-control-solid" disabled="disabled" type="text" value="${employee.empNo }">
									</div>
									<label class="col-2 col-form-label">부서</label>
									<div class="col-4">
										<input class="form-control form-control-lg form-control-solid" disabled="disabled" type="text" value="${employee.deptName }">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">성명</label>
									<div class="col-4">
										<input class="form-control form-control-lg form-control-solid" disabled="disabled" type="text" value="${employee.empName }">
									</div>
									<label class="col-2 col-form-label">직위</label>
									<div class="col-4">
										<input class="form-control form-control-lg form-control-solid" disabled="disabled" type="text" value="${employee.psName }">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">이메일</label>
									<div class="input-group col-4">
										<input class="form-control form-control-lg" name="empEmail1" type="text" value="${employee.empEmail.split('@')[0] }">
										<div class="input-group-prepend">
											<span class="input-group-text m-0">@</span>
										</div>
     									<input type="text" class="form-control form-control-lg" name="empEmail2" placeholder="Email.com" value="${employee.empEmail.split('@')[1] }" />
									</div>
									<label class="col-2 col-form-label">휴대폰번호</label>
									<div class="col-4">
										<input class="form-control form-control-lg" type="text" name="empHp" placeholder="010-1234-5678" value="${employee.empHp }">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-2 col-form-label">생년월일</label>
									<div class="input-group col-4">
										<input class="form-control form-control-lg" disabled="disabled" type="text" value="${birth }">
									</div>
									<label class="col-2 col-form-label">내선번호</label>
									<div class="col-4">
										<input class="form-control form-control-lg" disabled="disabled" type="text" placeholder="" value="${employee.empTel }">
									</div>
								</div>
								<div class="form-group input-group-solid row">
									<label class="col-2 col-form-label" style="vertical-align: middle;">주소</label>
									<div class="col-10">
										<div class="row">
											<div class="input-group col-6">
												<input class="form-control form-control-lg form-control-solid" type="text" id="sample6_postcode" name="empZipcode"
													   placeholder="우편번호를 검색하세요." readonly="readonly" value="${employee.empZipcode }">
												<div class="input-group-prepend">
													<button type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()"
															>우편번호 찾기</button>
												</div>
											</div>
											<div class="col-6">
												<input class="form-control form-control-lg form-control-solid" type="text" id="sample6_address" name="empAddr1"
													placeholder="도, 시 " readonly="readonly" value="${employee.empAddr1.substring(0, fn:indexOf(employee.empAddr1, '(')) }">
											</div>
										</div>
										<br>
										<input class="form-control form-control-lg form-control-solid" type="text" id="sample6_extraAddress" name="empAddrGu" placeholder="구, 군" 
												readonly="readonly" value="${employee.empAddr1.substring(fn:indexOf(employee.empAddr1, '(')) }">
										<br>
										<input class="form-control form-control-lg" type="text" id="sample6_detailAddress" name="empAddr2" placeholder="상세주소를 입력하세요." value="${employee.empAddr2 }">
									</div>
								</div>
								<div class="text-right">
									<button type="button" onclick="updateInfo();" class="btn btn-primary mr-2">정보 수정</button>
								</div>
							</div>
							<!--end::Body-->
						</form>
						<!--end::Form-->
					</div>
				</div>
				<!--end::Content-->
			</div>
			<!--end::Profile Personal Information-->
		</div>
		<!--end::Container-->
	</div>
	<script type="text/javascript">
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
		                document.getElementById("sample6_extraAddress").value = extraAddr;
		            
		            } else {
		                document.getElementById("sample6_extraAddress").value = '';
		            }
	
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('sample6_postcode').value = data.zonecode;
		            document.getElementById("sample6_address").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("sample6_detailAddress").focus();
		        }
		    }).open();
		}
		
		function updateInfo() {
			if(!confirm("정보를 수정하시겠습니까?")) {
				return;
			}
			var fm = $("#fm");
			fm.submit();
		}
		
		function changePwd() {
			if($('#nowPwd').val() == undefined || $("#changePwd").val() == undefined || $("#changePwd2").val() == undefined) {
				Swal.fire({
				  	icon: "error",
				  	title: "비밀번호를 입력하세요",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					$('#nowPwd').focus();
				});
				return;
			}
			if($('#nowPwd').val() != '${employee.empPwd}') {
				Swal.fire({
				  	icon: "error",
				  	title: "현재 비밀번호가 일치하지 않습니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					$('#nowPwd').focus();
				});
				return;
			}
			if($('#nowPwd').val() == $("#changePwd").val()) {
				Swal.fire({
				  	icon: "error",
				  	title: "현재 비밀번호로는 변경이 불가합니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					return;
				});
				return;
			}
			var pwdCheck = /^[A-Za-z0-9_]{6,20}$/;
			if(!$("#changePwd").val().match(pwdCheck)) {
				Swal.fire({
				  	icon: "error",
				  	title: "비밀번호는 알파벳 대소문자, 숫자로 이루어진 6~20자 입니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				});
				return;
			}
			if($("#changePwd").val() != $("#changePwd2").val()) {
				Swal.fire({
				  	icon: "error",
				  	title: "입력한 비밀번호가 일치하지 않습니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				});
				return;
			}
			var pwdFm = $("#pwdFm");
			pwdFm.submit();
		}
		
		
		function changeAppPwd() {
			if($('#nowAppPwd').val() == undefined || $("#changeAppPwd").val() == undefined || $("#changeAppPwd2").val() == undefined) {
				Swal.fire({
				  	icon: "error",
				  	title: "결재 비밀번호를 입력하세요",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					$('#nowAppPwd').focus();
				});
				return;
			}
			if($('#nowAppPwd').val() != '${employee.appPwd}') {
				Swal.fire({
				  	icon: "error",
				  	title: "현재 비밀번호가 일치하지 않습니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					$('#nowAppPwd').focus();
				});
				return;
			}
			if($('#nowAppPwd').val() == $("#changeAppPwd").val()) {
				Swal.fire({
				  	icon: "error",
				  	title: "현재 비밀번호로는 변경이 불가합니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					return;
				});
				return;
			}
			var pwdCheck = /^[0-9]{4}$/;
			if(!$("#changeAppPwd").val().match(pwdCheck)) {
				Swal.fire({
				  	icon: "error",
				  	title: "비밀번호는 4자리 숫자입니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				});
				return;
			}
			if($("#changeAppPwd").val() != $("#changeAppPwd2").val()) {
				Swal.fire({
				  	icon: "error",
				  	title: "입력한 비밀번호가 일치하지 않습니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				});
				return;
			}
			var pwdForm = $("#pwdForm");
			pwdForm.submit();
		}
		
		function changeMonth() {
			location.href = "<%=request.getContextPath() %>/mypage/info/list?yearMonth=" + $("[name='yearMonth']").val();
		}
	</script>
</body>
