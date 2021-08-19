<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card card-custom" data-card="true" id="kt_card_1">
	<div class="card-header">
		<div class="card-title">
			<h3 class="card-label">폴더 수정</h3>
		</div>
	</div>
	<div class="card-body">
		<form id="modifyForm" action="<%=request.getContextPath()%>/cloud/folder/modify.do" method="post">
			<div class="form-group row">
				<div id="kt_tree_4" style="width:200px;"></div>
				<div class="form-group">
					<label>폴더명 <span class="text-danger">*</span></label>
					<input type="text" class="form-control"  placeholder="Enter Folder Name" style="width:200px;" name="folderName"/>
					<span class="form-text text-muted">원래 폴더 이름 : <span id="beforeName"></span></span><br/>
				</div>
			</div>
			<input type="hidden" id="folderUpCode" name="folderCode"/>
		</form>
	</div>
	<div class="card-footer">
		<button type="button" class="btn btn-light-primary font-weight-bold float-right" onclick="CloseWindow();">취소</button>
		<button type="button" class="btn btn-primary font-weight-bold float-right mr-3" onclick="modify_go();">수정</button>
	</div>
</div>


<script>
var flag = "modify";
$(document).on('click', '.jstree-anchor', function(e){
// 	alert($(this).text());
	$("input[name=folderName]").val($(this).text());
	$("#beforeName").text($(this).text());
});
function modify_go() {
	if($("#beforeName").text() == $("input[name=folderName]").val()){
		Swal.fire({
	        icon: "warning",
	        title: "폴더명이 수정되지 않았습니다.",
	        showConfirmButton: false,
	        timer: 1500
	   }).then((result) => {
			return;
		});
	}else{
		$("#folderUpCode").val($(".jstree-clicked").parent().attr("id"));
		$("input[name=empNo]").val("${loginUser.empNo}");
		$("#modifyForm").submit();
	}
}
</script>
<%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %>