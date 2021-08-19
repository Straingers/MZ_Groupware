<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script>
$(document).ready(function(){
	Swal.fire({
		title: "게시글 수정이 완료되었습니다.",
		icon: "success",
		showConfirmButton: false,
		timer: 1500
	}).then((result) => {
		location.href = "<%=request.getContextPath() %>/board/additional/detail.do?from=modify&addNo=${board.addNo}";
	});
});
</script>
</body>