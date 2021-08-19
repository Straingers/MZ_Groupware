<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<c:if test="${empty loginUser }">
<script>
	if (parent && parent != this) {
		window.parent.location.href = "<%=request.getContextPath()%>/common/loginForm.do";
	}
</script>
</c:if>
<meta charset="UTF-8">
<title><decorator:title default="MZ GroupWare"/></title>

<%@ include file="/WEB-INF/views/include/style.jsp" %>

<decorator:head />
</head>
<body class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading footer-fixed footer-mobile-fixed" 
	  onload="init();">
	  
<decorator:body />

<%@ include file="/WEB-INF/views/include/js.jsp" %>	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/pages/features/miscellaneous/toastr.js"></script>

<script>
	// 전역변수 설정
	var socket  = null;
	$(document).ready(function(){
	    // 웹소켓 연결
	    sock = new SockJS("<c:url value='/echo-ws' />");
	    socket = sock;
	
	    // 데이터를 전달 받았을때 
	    sock.onmessage = function(evt) { // toast 생성
	    	var data = evt.data;
	    	var obj = data.split("$$");
// 	    	if(obj[4] != '${loginUser.empNo}') {
// 	    		return;
// 	    	}
	    	
	        $('#notifyNum', parent.document).css("display", "");
	        $('#notifyNum', parent.document).text(parseInt($('#notifyNum', parent.document).text()) + 1);
	        $("#noNoti", parent.document).remove();
	         // toast
	        toastr.options = {
	              "closeButton": true,
	              "debug": false,
	              "newestOnTop": true,
	              "progressBar": false,
	              "positionClass": "toast-top-center",
	              "preventDuplicates": false,
	              "onclick": null,
	              "showDuration": "300",
	              "hideDuration": "1000",
	              "timeOut": "5000",
	              "extendedTimeOut": "1000",
	              "showEasing": "swing",
	              "hideEasing": "linear",
	              "showMethod": "fadeIn",
	              "hideMethod": "fadeOut"
	          };
	          toastr.warning(obj[0]);
	          
	          var str = '<div class="align-items-center" id="' + obj[2] + '">'
			      		+ '<div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">'
						+ '<div class="d-flex flex-column font-weight-bold">';
			
				if(obj[0].substring(1, 3) == "쪽지") {
					str += '<a href="javascript:OpenWindow(' + "'" + obj[3] + "'" + ", '상세보기', 500, 450); javascript:removeNotify('" 
							+ obj[2] + "');" + '" class="font-weight-bold text-dark-75 text-truncate text-hover-primary" style="width: 250px;">';
				} else {
					str += '<a href="javascript:OpenWindow(' + "'" + obj[3] + "'" + ", '상세보기', 1000, 700); javascript:removeNotify('" 
							+ obj[2] + "');" + '" class="font-weight-bold text-dark-75 text-truncate text-hover-primary" style="width: 250px;">';
				}
				
				str += obj[1]
						+ '</a>'
						+ '</div>'
						+ '<div align="left">'
						+ '<a href="javascript:removeXNotify(' + "'" +  obj[2] + "');" + '" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_cart_close">'
						+ '<i class="ki ki-close icon-xs text-muted"></i>'
						+ '</a>'
						+ '</div>'
						+ '</div>'
						+ '</div>';
		  	$(".notifyList", parent.document).prepend(str);
		  	
		} 
	});
</script>
</body>
</html>
