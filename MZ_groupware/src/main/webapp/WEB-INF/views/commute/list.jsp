<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<title></title>
<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css">
<style type="text/css">

</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon2-calendar-1" style="padding: 0px 10px;"></i>
        		 근태관리 > 개인 월별 출근 기록
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
	<div class="container col-11" style="height: 100%">
		<div class="card card-custom p-0">
<!-- 		 <div class="card-header"> -->
<!-- 		  <div class="card-title"> -->
<!-- 		   <h3 class="card-label"> -->
<!-- 		   </h3> -->
<!-- 		  </div> -->
<!-- 		  <div class="card-toolbar"> -->
<!-- 		   	<p class="label label-primary label-inline font-weight-bold mr-1">출근시간</p> -->
<!-- 		   	<p class="label label-danger label-inline font-weight-bold">퇴근시간</p> -->
<!-- 		  </div> -->
		 </div>
		 <div class="card-body">
		  <div id="kt_calendar"></div>
		 </div>
	</div>
</div>
<input type="hidden" id="empNo" value="${loginUser.empNo}" />
<input type="hidden" id="empName" value="${loginUser.empName}" />
<script type="text/javascript">
function getList(){
	  var form = {
			empNo : $("#empNo").val(),
		  empName : $("#empName").val()
	  };
	  var result = new Array();
	  $.ajax({
		  url : "<%=request.getContextPath() %>/comm/getCommute.do"
		, data : JSON.stringify(form)
		, async : false
		, type : "post"
		, dataType : 'json'
		, contentType: "application/json; charset=utf-8;"
		, success : function(data) {
			for(var i = 0; i < data.list.length; i++) {
				result.push(data.list[i]);
			}
		}
	  });
	  return result;
s}
</script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/commute/commuteCal.js"></script>
</body>
