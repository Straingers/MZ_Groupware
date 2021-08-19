<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	var isInIFrame = (window.location != window.parent.location);
	if(isInIFrame == true){
		alert("세션이 만료되었습니다.");
		window.parent.location.reload();
	}
</script>
   <meta charset="utf-8" />
   <title>MZ Groupware</title>
   <meta name="description" content="Login page example" />
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   <link rel="canonical" href="https://keenthemes.com/metronic" />
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/pages/login/classic/login-4.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/style.bundle.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/brand/dark.css" rel="stylesheet" type="text/css" />
   <link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/aside/dark.css" rel="stylesheet" type="text/css" />
   <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.ico" />
   <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
<div class="d-flex flex-column flex-root">
	<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
		<div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<%=request.getContextPath() %>/resources/bootstrap/media/bg/loginbg.png');">
			<div class="login-form text-center p-7 position-fixed overflow-hidden" style="background-color: rgba(255,255,255,0.5);">
				<div class="d-flex flex-center mb-15">
					<img src="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.png" alt="" height="200px"/>
				</div>
				<div class="login-signin">
					<form class="form" action="<%=request.getContextPath() %>/common/login.do" method="post">
						<div class="form-group mb-3">
							<select class="form-control col-5 h-auto form-control-solid py-4 px-5 form-light" id="autoLogin" onchange="fn_login();">
								<option>계정선택</option>
								<option value="admin">관리자</option>
								<option value="210110">정영인 부장(개발팀)</option>
								<option value="210108">전재수 과장(개발팀)</option>
								<option value="210115">정대리 대리(개발팀)</option>
								<option value="210111">박상영 사원(개발팀)</option>
							</select>
						</div>
						<div class="form-group mb-3">
							<input class="form-control h-auto form-control-solid py-4 px-5 form-light" type="text" placeholder="Employee number" name="empNo" value="admin" autocomplete="off" />
						</div>
						<div class="form-group mb-3">
							<input class="form-control h-auto form-control-solid py-4 px-5" type="password" placeholder="Password" value="java" name="empPwd" />
						</div>
						<div class="form-group d-flex flex-wrap justify-content-between align-items-center">
							<div class="checkbox-inline">
								<label class="checkbox m-0 text-muted">
								<input type="checkbox" name="remember" />
								<span></span><p class="mt-4 text-dark">Remember me</p></label>
							</div>
							<a href="javascript:;" id="kt_login_forgot" class="text-dark text-hover-primary">Forget Password ?</a>
						</div>
						<button type="button" class="btn btn-light border-primary text-primary font-weight-bold px-9 py-4 my-3 mx-4 m-0" style="width: 130px;" onclick="qr_go();">QR 로그인</button>
						<button type="submit" class="btn btn-light border-primary text-primary font-weight-bold px-9 py-4 my-3 mx-4 m-0" style="width: 130px;">로그인</button>
						<a class="btn btn-light border-success btn-hover-light-success text-success font-weight-bold px-9 py-4 my-3 mx-4 m-0" style="width: 290px;" href="<%=request.getContextPath()%>/emp/qrRead">QR 출퇴근</a>
					</form>
				</div>
				<div class="login-forgot">
					<div class="mb-20">
						<h3>Forgotten Password ?</h3>
						<div class="text-muted font-weight-bold">Enter your email to reset your password</div>
					</div>
					<form class="form" id="kt_login_forgot_form">
						<div class="form-group mb-10">
							<input class="form-control form-control-solid h-auto py-4 px-8" type="text" placeholder="Email" name="email" autocomplete="off" />
						</div>
						<div class="form-group d-flex flex-wrap flex-center mt-10">
							<button id="kt_login_forgot_submit" class="btn btn-primary font-weight-bold px-9 py-4 my-3 mx-2">Request</button>
							<button id="kt_login_forgot_cancel" class="btn btn-light-primary font-weight-bold px-9 py-4 my-3 mx-2">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<form id="auto" class="form" action="<%=request.getContextPath() %>/common/login.do" method="post">
	<input type="hidden" name="empNo">
	<input type="hidden" name="empPwd">
</form>
<script>var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";</script>
<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1400 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#3699FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#E4E6EF", "dark": "#181C32" }, "light": { "white": "#ffffff", "primary": "#E1F0FF", "secondary": "#EBEDF3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#3F4254", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#EBEDF3", "gray-300": "#E4E6EF", "gray-400": "#D1D3E0", "gray-500": "#B5B5C3", "gray-600": "#7E8299", "gray-700": "#5E6278", "gray-800": "#3F4254", "gray-900": "#181C32" } }, "font-family": "Poppins" };</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/global/plugins.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/prismjs/prismjs.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/scripts.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/custom/login/login-general.js"></script>
<script type="text/javascript">
function fn_login() {
	var id = $('#autoLogin').val();
	var pw = '';
	
	if(id == 'admin') {
		pw = 'java';
	} else {
		pw = '1234';
	}
	
	$('form > input[name="empNo"]').val(id);
	$('form > input[name="empPwd"]').val(pw);
	$('#auto').submit();
}

function qr_go() {
	location.href = "<%=request.getContextPath()%>/common/qrLogin.do";
}
</script>
</body>
</html>