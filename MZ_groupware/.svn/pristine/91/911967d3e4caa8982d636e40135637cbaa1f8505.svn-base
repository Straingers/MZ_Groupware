<%@page import="java.util.List"%>
<%@page import="com.spring.approval.dto.ApprovalHistoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>
<body>
	<script>
	$(document).ready(function(){
		Swal.fire({
		  	icon: "success",
		  	title: "정상적으로 처리되었습니다.",
		  	showConfirmButton: false,
		  	timer: 1500
		}).then((result) => {
			socket.send("전자결재,${empNo},${appTitle},수신된 결재문서가 있습니다.,<%=request.getContextPath()%>/approval/lib/ing/detail.do?appNo=${appNo}");				
			window.opener.parent.location.reload();
			window.close();
		});
	});
	</script>
</body>
