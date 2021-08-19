<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<body>
<script>
$(document).ready(function(){
	 Swal.fire({
	  title: "부서 수정이 성공했습니다.",
	  icon: "success",
	  showConfirmButton: false,
    timer: 1500
	 }).then((result) => {
		  location.href = "<%=request.getContextPath()%>/admin/comp/group/list";
			window.close();
		});
});
</script>
	</body>
</html>