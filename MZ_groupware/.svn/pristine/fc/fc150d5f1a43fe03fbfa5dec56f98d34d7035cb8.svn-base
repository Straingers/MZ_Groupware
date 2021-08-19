<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="card card-custom" data-card="true" id="kt_card_1">
	<div class="card-header">
		<div class="card-title">
			<h3 class="card-label">파일 업로드</h3>
		</div>
	</div>
	<div class="card-body">
		<form id="registForm" action="<%=request.getContextPath()%>/cloud/file/regist.do" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<div id="kt_tree_4" style="width:360px;"></div>
				<button class="btn btn-outline-primary float-right" type="button" id="addFileBtn" style="width: 110px;">
					<svg class="float-left" aria-hidden="true" focusable="false" width="32" height="32" viewBox="0 0 32 32">
					    <g fill="none" fillRule="evenodd">
					        <rect class="uppy-ProviderIconBg" width="32"height="32" rx="16" fill="#2275D7"></rect>
					        <path d="M21.973 21.152H9.863l-1.108-5.087h14.464l-1.246 5.087zM9.935 11.37h3.958l.886 1.444a.673.673 0 0 0 .585.316h6.506v1.37H9.935v-3.13zm14.898 3.44a.793.793 0 0 0-.616-.31h-.978v-2.126c0-.379-.275-.613-.653-.613H15.75l-.886-1.445a.673.673 0 0 0-.585-.316H9.232c-.378 0-.667.209-.667.587V14.5h-.782a.793.793 0 0 0-.61.303.795.795 0 0 0-.155.663l1.45 6.633c.078.36.396.618.764.618h13.354c.36 0 .674-.246.76-.595l1.631-6.636a.795.795 0 0 0-.144-.675z" fill="#FFF"></path>
					    </g>
					</svg>
					<div class="uppy-DashboardTab-name" style="line-height: 32px;">+</div>
				</button>
			</div>
			<div class="form-group mb-1 fileInput"></div>
			<input type="hidden" id="selectedFolderCode1" name="cloudFolderCode"/>
		</form>
	</div>
	<div class="card-footer">
		<button type="button" class="btn btn-light-primary font-weight-bold" onclick="CloseWindow();">취소</button>
		<button type="button" class="btn btn-primary font-weight-bold" onclick="regist_go();">업로드</button>
	</div>
</div>

<script>
var flag="board";
function regist_go() {
	$("#selectedFolderCode1").val($(".jstree-clicked").parent().attr("id"));
	
	$("#registForm").submit();
}

//파일 업로드
$('#addFileBtn').on('click',function(event){

	var inputFile=$('input[name="uploadFile"]').length;
	var attachCount=inputFile;
		
	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline"); 
		var div=$('<div>').addClass("inputRow");
		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");
		div.appendTo('.fileInput');
		
});
		
	$('div.fileInput').on('click','div.inputRow > button',function(event){
		$(this).parent('div.inputRow').remove();
	});
	 	
	$('.fileInput').on('change','input[type="file"]',function(event){
	if(this.files[0].size>1024*1024*40){
		alert("파일 용량이 40MB를 초과하였습니다.");
		this.value="";
		$(this).click();		 			
		return false;
	} 
});

$(document).ready(function(){
	$("#checkall").click(function(){
		$("[name=chk]").prop("checked", $(this).prop("checked") );
	});
	$("[name=chk]").each(function(){
		$(this).click(function(){
			var allObj = $("#checkall");
			var objName = $(this).attr("name");

			if( $(this).prop("checked") )
			{	
				checkBoxLength = $("[name="+ objName +"]").length;
				checkedLength = $("[name="+ objName +"]:checked").length;

				if( checkBoxLength == checkedLength ) {
					allObj.prop("checked", true);
				} else {
					allObj.prop("checked", false);
				}
			}else{
				allObj.prop("checked", false);
			}
		});
	});
});
</script>
<%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %>