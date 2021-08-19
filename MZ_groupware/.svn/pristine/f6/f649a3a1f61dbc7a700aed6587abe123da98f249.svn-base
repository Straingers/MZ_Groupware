<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card card-custom" data-card="true" id="kt_card_1">
	<div class="card-header">
		<div class="card-title">
			<h3 class="card-label">폴더 생성</h3>
		</div>
	</div>
	<div class="card-body">
		<span class="form-text text-muted">폴더를 선택하지 않으면 최상위단계에 생성됩니다.</span><br/>
		<form id="registForm" action="<%=request.getContextPath()%>/cloud/folder/regist.do" method="post">
			<div class="form-group row">
				<div id="kt_tree_4" style="width:200px;"></div>
				<div class="form-group">
					<label>폴더명 <span class="text-danger">*</span></label>
					<input type="text" class="form-control"  placeholder="Enter Folder Name" style="width:200px;" name="folderName"/>
				</div>
			</div>
			<input type="hidden" id="folderUpCode" name="folderCode"/>
			<input type="hidden" name="empNo"/>
		</form>
	</div>
	<div class="card-footer">
		<button type="button" class="btn btn-light-primary font-weight-bold" onclick="CloseWindow();">취소</button>
		<button type="button" class="btn btn-primary font-weight-bold" onclick="folder_regist_go();">생성</button>
	</div>
</div>


<script>
var flag = "board";
function folder_regist_go() {
	$("#folderUpCode").val($(".jstree-clicked").parent().attr("id"));
	$("input[name=empNo]").val("${loginUser.empNo}");
	$("#registForm").submit();
}
</script>
<%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %>