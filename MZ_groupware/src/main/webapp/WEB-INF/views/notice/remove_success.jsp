<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
$(document).ready(function(){
	Swal.fire({
	  	title: "공지사항이 삭제되었습니다.",
	  	icon: "success",
	  	showConfirmButton: false,
	    timer: 1500
	}).then((result) => {
		window.opener.parent.location.reload();
		window.close();
	});
});
</script>