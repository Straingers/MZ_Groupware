<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script>
$(document).ready(function(){
	Swal.fire({
        icon: "success",
        title: "등록이 완료되었습니다.",
        showConfirmButton: false,
        timer: 1500
	}).then((result) => {
		socket.send("업무,${empNo},${taskTitle},수신된 업무가 있습니다.,<%=request.getContextPath()%>/task/share/detail.do?taskNo=${taskNo}");	
		window.opener.parent.location.reload();
		window.close();
	});
});
</script>
</body>