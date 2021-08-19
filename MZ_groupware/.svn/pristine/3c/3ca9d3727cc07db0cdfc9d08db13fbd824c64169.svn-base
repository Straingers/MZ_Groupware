<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>:: jsQR 테스트 ::</title>
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
					<a href="<%=request.getContextPath()%>/common/finale">
						<img src="<%=request.getContextPath() %>/resources/bootstrap/media/logos/main.png" alt="" height="200px"/>
					</a>
				</div>
				<div>
					<h1 class="mb-9 text-left">출/퇴근 페이지</h1>
					<div id="frame">
						<div id="loadingMessage">
							🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
						</div>
						<div class="form-row">
							<div class="col">
								<canvas id="canvas" style="width:100%;height:350px;"></canvas>
							</div>
							<div class="col" id="test">
								<h3>출/퇴근 정보</h3>
								<div id="output">
									<div id="outputMessage" hidden>정보나오는칸</div>
									<div id="outputLayer" hidden>
										<span id="outputData"></span>
									</div>
									<table class="table table-bordered table-striped table-light">
										<tr>
											<th scope="row" width="40%">성 명</th>
											<td id="empName"></td>
										</tr>
										<tr>
											<th scope="row">소 속</th>
											<td id="deptName"></td>
										</tr>
										<tr>
											<th scope="row">출근시간</th>
											<td id="inTime"></td>
										</tr>
										<tr>
											<th scope="row">퇴근시간</th>
											<td id="outTime"></td>
										</tr>
									</table>
									
									<div id="commute-success" class="alert alert-custom alert-notice alert-light-success" role="alert" style="display:none">
									    <div class="alert-icon"><i class="flaticon-like"></i></div>
									    <div class="alert-text">출/퇴근이 성공하였습니다.</div>
									</div>
									<div id="commute-fail" class="alert alert-custom alert-notice alert-light-danger" role="alert" style="display:none">
									    <div class="alert-icon"><i class="flaticon2-warning"></i></div>
									    <div class="alert-text">부적절한 QR 코드입니다.</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
	
	
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>

	
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
	// 카메라 사용시
	navigator.mediaDevices.getUserMedia({
		video : {
			facingMode : "environment"
		}
	}).then(function(stream) {
		video.srcObject = stream;
		video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달
		video.play();
		requestAnimationFrame(tick);
	});

	function tick() {
		loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."
		if (video.readyState === video.HAVE_ENOUGH_DATA) {
			loadingMessage.hidden = true;
			canvasElement.hidden = false;
			outputContainer.hidden = false;

			// 읽어들이는 비디오 화면의 크기
			canvasElement.height = video.videoHeight;
			canvasElement.width = video.videoWidth;
			canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
			var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
			var code = jsQR(imageData.data, imageData.width, imageData.height, {
						inversionAttempts : "dontInvert",
					});
			
			
			// QR코드 인식에 성공한 경우
			if (code) {
				// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
				drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#57D658");
				drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#57D658");
				drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#57D658");
				drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#57D658");
				outputMessage.hidden = true;
				outputData.parentElement.hidden = false;

				// QR코드 메시지 출력
// 				outputData.innerHTML = code.data;
				
					console.log(code.data);
				$.ajax({
					type : 'GET',
					url : code.data,
					dataType : 'json'
				}).done(function (result) {
					console.log(result);
					$('#empName').text(result.empName);
					$('#deptName').text(result.deptName);
					$('#inTime').text(result.inTime.substring(0, result.inTime.length - 3));
					$('#outTime').text(result.outTime);
					$('#commute-success').show();
					$('#commute-success').fadeOut(5000);
				}).fail(function (error) {
					console.log('잘못된 QR');
					$('#commute-fail').show();
					$('#commute-fail').fadeOut(5000);
				}).always(function () {
					requestAnimationFrame(tick);
			 	})
				
				return;
				
				// alert가 계속 뜨는 문제있음 - alert 안 띄우고 정보만 출력하는건? - ajax에 영향은 없는지?
				// alert("인식이 성공하였습니다."); 
				
			}

			// QR코드 인식에 실패한 경우 
// 			else {
// 				outputMessage.hidden = false;
// 				outputData.parentElement.hidden = true;
// 			}
		}
		requestAnimationFrame(tick);
	}
});
</script>
</html>
</body>