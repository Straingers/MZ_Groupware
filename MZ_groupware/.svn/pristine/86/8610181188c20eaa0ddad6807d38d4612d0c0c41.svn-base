<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script>
$(document).ready(function(){
	Swal.fire({
		title: "게시판을 삭제하였습니다.",
		icon: "success",
		showConfirmButton: false,
		timer: 1500
	}).then((result) => {
		location.href = "<%=request.getContextPath() %>/admin/board/list.do";
	});
});
</script>
</body>