<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script>
$(document).ready(function(){
	Swal.fire({
        icon: "success",
        title: "삭제가 완료되었습니다.",
        showConfirmButton: false,
        timer: 1500
	}).then((result) => {
		location.href="<%=request.getContextPath()%>/admin/log/attach/attach/list.do";
	});
});
</script>
</body>