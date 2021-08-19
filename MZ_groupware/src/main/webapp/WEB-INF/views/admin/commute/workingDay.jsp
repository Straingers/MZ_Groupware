<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>사내 근무일 설정</title>
<style type="text/css">
	.fc{
		color:black;
		border-color: #000000;
	}
	.fc-sun { 
		color:black;  
		background-color: #FFE3EE;
	}
	.fc-sat{
		color:black;  
		background-color: #FFE3EE;
	}
</style>
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon-calendar-with-a-clock-time-tools" style="padding: 0px 10px;"></i>
       		 근태관리 > 근무일 설정
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
	<div class="container col-11" style="height: 100%">
		<div class="alert alert-custom alert-white alert-shadow fade show gutter-b mb-0" role="alert">
			<div class="alert-icon">
				<span class="svg-icon svg-icon-primary svg-icon-xl">
					<!--begin::Svg Icon | path:/metronic/theme/html/demo1/dist/assets/media/svg/icons/Tools/Compass.svg-->
					<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
						<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
							<rect x="0" y="0" width="24" height="24"></rect>
							<path d="M7.07744993,12.3040451 C7.72444571,13.0716094 8.54044565,13.6920474 9.46808594,14.1079953 L5,23 L4.5,18 L7.07744993,12.3040451 Z M14.5865511,14.2597864 C15.5319561,13.9019016 16.375416,13.3366121 17.0614026,12.6194459 L19.5,18 L19,23 L14.5865511,14.2597864 Z M12,3.55271368e-14 C12.8284271,3.53749572e-14 13.5,0.671572875 13.5,1.5 L13.5,4 L10.5,4 L10.5,1.5 C10.5,0.671572875 11.1715729,3.56793164e-14 12,3.55271368e-14 Z" fill="#000000" opacity="0.3"></path>
							<path d="M12,10 C13.1045695,10 14,9.1045695 14,8 C14,6.8954305 13.1045695,6 12,6 C10.8954305,6 10,6.8954305 10,8 C10,9.1045695 10.8954305,10 12,10 Z M12,13 C9.23857625,13 7,10.7614237 7,8 C7,5.23857625 9.23857625,3 12,3 C14.7614237,3 17,5.23857625 17,8 C17,10.7614237 14.7614237,13 12,13 Z" fill="#000000" fill-rule="nonzero"></path>
						</g>
					</svg>
					<!--end::Svg Icon-->
				</span>
			</div>
			<div class="alert-text">날짜를 선택시 휴무일과 근무일을 지정할 수 있습니다.
			</div>
		</div>
		<div class="card card-custom mt-0">
		 <div class="card-body" style="height: 100%">
		  <div id="kt_calendar"></div>
		 </div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/admin/commute/holidayCal.jsp" %>
<script type="text/javascript">
	function getHoliday() {
		var result = [
					{
						start : "${list.get(0).start }"
						, end : '${list.get(0).end}'
					 	, color : '${list.get(0).color}'
					 	, rendering : '${list.get(0).rendering}'
						}
	<c:if test="${list.size() gt 1 }">
		<c:forEach begin="1" end="${list.size() }" items="${list }" var="data">
					, {
						start : '${data.start}'
					 	, end : '${data.end}'
					 	, color : '${data.color}'
					 	, rendering : '${data.rendering}'
					 } 
		</c:forEach>
	</c:if>
					];
		
		return result;
	}
</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
</body>
