<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${loginUser != null }">
	<script type="text/javascript">
		location.href = "<%=request.getContextPath() %>";
	</script>
</c:if>
<meta charset="utf-8">
<title>MZ GroupWare Login</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jsQR.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Page Custom Styles(used by this page)-->
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/pages/login/classic/login-4.css" rel="stylesheet" type="text/css" />
<!--end::Page Custom Styles-->
<!--begin::Global Theme Styles(used by all pages)-->
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/style.bundle.css" rel="stylesheet" type="text/css" />
<!--end::Global Theme Styles-->
<!--begin::Layout Themes(used by all pages)-->
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/base/light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/header/menu/light.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/brand/dark.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/themes/layout/aside/dark.css" rel="stylesheet" type="text/css" />
<!--end::Layout Themes-->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.ico" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jsQR.js"></script>
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
 <!--begin::Main-->
<div class="d-flex flex-column flex-root">
	<!--begin::Login-->
	<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
		<div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<%=request.getContextPath() %>/resources/bootstrap/media/bg/loginbg.png');">
			<div class="col-6 text-center p-7 position-fixed overflow-hidden" style="height:100%;background-color: rgba(255,255,255,0.7);">
				<!--begin::Login Header-->
				<div class="d-flex flex-center mb-15">
					<a href="#">
						<img src="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.png" alt="" height="200px"/>
					</a>
				</div>
				<div id="test">
					<h1>QR Login</h1>
					<div id="output">
						<div id="outputMessage">
							QR????????? ???????????? ???????????? ?????????
						</div>
			    		<div id="outputLayer" hidden>
			    			<span id="outputData"></span>
			    		</div>
					</div>
				</div>
				<div id="frame">
					<div id="loadingMessage">
						???? ????????? ???????????? ????????? ??? ??? ????????????<br />????????? ??????????????? ????????? ??????????????????
					</div>
					<div class="form-row">
						<div class="col-sm-12">
							<canvas id="canvas" style="width:100%;height:350px;"></canvas>
						</div>
						<div id="output">
							<span id="outputData"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
<form id="fm" action="<%=request.getContextPath() %>/common/login.do" method="post">
	<input type="hidden" id="empNo" name="empNo">
	<input type="hidden" id="empPwd" name="empPwd">
</form>
	
	
	
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var video = document.createElement("video");
	var canvasElement = document.getElementById("canvas");
	var canvas = canvasElement.getContext("2d");
	var loadingMessage = document.getElementById("loadingMessage");
	var outputContainer = document.getElementById("output");
	var outputMessage = document.getElementById("outputMessage");
	var outputData = document.getElementById("outputData");

	function drawLine(begin, end, color) {
		canvas.beginPath();
		canvas.moveTo(begin.x, begin.y);
		canvas.lineTo(end.x, end.y);
		canvas.lineWidth = 4;
		canvas.strokeStyle = color;
		canvas.stroke();
	}
	// ????????? ?????????
	navigator.mediaDevices.getUserMedia({
		video : {
			facingMode : "environment"
		}
	}).then(function(stream) {
		video.srcObject = stream;
		video.setAttribute("playsinline", true); // iOS ????????? ?????? ????????? ???????????? ????????? ??????
		video.play();
		requestAnimationFrame(tick);
	});

	function tick() {
		loadingMessage.innerText = "??? ?????? ????????? ????????? ????????????."
		if (video.readyState === video.HAVE_ENOUGH_DATA) {
			loadingMessage.hidden = true;
			canvasElement.hidden = false;
			outputContainer.hidden = false;

			// ??????????????? ????????? ????????? ??????
			canvasElement.height = video.videoHeight;
			canvasElement.width = video.videoWidth;
			
			canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
			var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
			var code = jsQR(imageData.data, imageData.width, imageData.height, {
						inversionAttempts : "dontInvert",
			});
			
			// QR?????? ????????? ????????? ??????
			if (code) {
				// ????????? QR????????? ????????? ????????? ??????????????? ???????????? ????????? ??????
				drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#57D658");
				drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#57D658");
				drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#57D658");
				drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#57D658");
				outputMessage.hidden = true;
				outputData.parentElement.hidden = false;

				// QR?????? ????????? ??????
// 				outputData.innerHTML = code.data;
				
				var qrid = code.data.substring(code.data.indexOf("=") + 1);
				var form = {
					'qrId' : qrid
				}
				$.ajax({
					  url : "<%=request.getContextPath() %>/common/readQr.do"
					, data : JSON.stringify(form)
		    		, async : false
		    		, type : "post"
		    		, dataType : 'json'
		    		, contentType: "application/json; charset=utf-8;"
		    		, success : function(data) {
		    			$("#empNo").val(data.empNo);
		    			$("#empPwd").val(data.empPwd);
		    			$("#fm").submit();
		    		}
				});
				
// 				setInterval(function(code){
					// return??? ?????? ????????? ??????????????? QR?????? ??????????????? ????????????.
// 					return;
// 				}, 3000);
				
				// alert??? ?????? ?????? ???????????? - alert ??? ????????? ????????? ???????????????? - ajax??? ????????? ??????????
				// alert("????????? ?????????????????????."); 
				
			}

			// QR?????? ????????? ????????? ?????? 
// 			else {
// 				outputMessage.hidden = false;
// 				outputData.parentElement.hidden = true;
// 			}
		}
		requestAnimationFrame(tick);
	}
});
</script>
</body>
</html>