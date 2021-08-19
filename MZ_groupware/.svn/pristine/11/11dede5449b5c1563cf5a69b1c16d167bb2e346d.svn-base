<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<script>
$(document).ready(function(){
	Swal.fire({
        icon: "error",
        title: "접근 권한이 없습니다.",
        showConfirmButton: false,
        timer: 1500
	}).then((result) => {
		if(window.opener) {
			window.close();
		} else {
			history.go(-1);
		}
	});
});
</script>
</body>