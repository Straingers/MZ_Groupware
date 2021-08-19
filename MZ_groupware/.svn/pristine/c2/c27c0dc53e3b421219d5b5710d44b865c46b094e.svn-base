<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="fas fa-cloud-upload-alt" style="padding: 0px 10px;"></i>
				클라우드
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<div class="content p-0 d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<div class="container col-4">
			<div class="card card-custom" data-card="true" id="kt_card_1">
				<div class="card-body">
					<button class="btn btn-light-primary" 
						onclick="OpenWindow('<%=request.getContextPath()%>/cloud/folder/registForm.do','폴더생성',600,500);">
						폴더 생성</button>&nbsp;&nbsp;
					<button class="btn btn-light-primary" 
						onclick="OpenWindow('<%=request.getContextPath()%>/cloud/folder/modifyForm.do','폴더수정',600,500);">
						폴더 수정</button>&nbsp;&nbsp;
					<button class="btn btn-light-primary" 
						onclick="folder_remove_go()">
						폴더 삭제</button>
					<span class="form-text text-danger">* 삭제 시 하위폴더 및 하위폴더 내에 모든 파일이 <br>&nbsp;&nbsp;&nbsp;삭제 됩니다.</span>
				</div>
			</div>
			<div class="card card-custom" data-card="true" id="kt_card_1">
				<div class="card-body">
					<div id="kt_tree_4" class="tree-demo"></div>
				</div>
			</div>
		</div>
		<div class="container col-8">
			<div class="card card-custom" data-card="true" id="kt_card_1">
				<div class="card-header">
					<div class="card-title">
						<h3 class="card-label"></h3>
					</div>
					<div class="card-toolbar">
						<button type="button" class="btn btn-light-primary float-right mr-3" id="removebtn" onclick="file_remove_go()">삭제</button>
						<button type="button" class="btn btn-light-primary float-right mr-3" 
							onclick="OpenWindow('<%=request.getContextPath()%>/cloud/file/registForm.do','작성',600,500);">
							올리기</button>
						<button type="button" class="btn btn-light-primary float-right" onclick="download();">내려받기</button>
					</div>
				</div>
				<div class="card-body">
					<table class="table" style="font-size: 12.5px;">
						<thead>
							<tr>
								<th scope="col" class="text-center" style="width: 10%;">
									<input type="checkbox" id="checkall">
								</th>
								<th scope="col" class="text-center" style="width: 10%;">NO</th>
								<th scope="col" class="text-center">파일 이름</th>
								<th scope="col" class="text-center" style="width: 15%;">업로드 일자</th>
							</tr>
						</thead>
						<tbody id="listBody">
							<tr>
								<td colspan="4">폴더를 선택해주세요.</td>
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>
<form role="fileList">
	<input type="hidden" id="folderCode" name="cloudFolderCode" value="0" onchange="file_go()">
	<input type="hidden" id="attacher" name="attacher" value="">
</form>
<%-- <%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %> --%>
<script id="fileListContent" type="text/x-handlebars-template">
{{#if fileList}}
	{{#each fileList}}
		<tr id="filelist">
			<td><input type="checkbox" name="chk" value="{{cloudNo}}"/></td>
			<th scope="row" class="text-center text-dark">{{@index}}</th>
			<td><div class="ellipsis">{{filename}}</div></td>
			<td class="text-center">{{cloudRegdate}}</td>
		</tr>
	{{/each}}
{{else}}
	<tr class="text-center" id="filelist">
		<td colspan="5">폴더가 비었습니다.</td>
	</tr>
{{/if}}
</script>
<script>
var flag = "main";
$("#folderCode").val($(".jstree-clicked").parent().attr("id"));
$("#attacher").val('${loginUser.empNo}');

$(document).on('click', '.jstree-anchor', function(e) {
// 	if($(this).attr("class").include(".jstree-clicked")){
		
// 	}
// 	alert($(this).parents().attr("id"));
	var param = {
				cloudFolderCode : $(this).parents().attr("id")
				, cloudAttacher : '${loginUser.empNo}'
			};
	
	if($(this).parents().attr("id") == '-1'){
		$("#removebtn").text("휴지통 삭제");
		$.ajax({
			url: "<%=request.getContextPath()%>/cloud/file/trash.do"
	 		, type : "post"
	 		, data : JSON.stringify(param)
	 		, contentType : "application/json; charset=utf-8;"
	 		, async : false
	 		, success : function (data) {
	 			var source = $("#fileListContent").html();
	 			
	 			var template = Handlebars.compile(source);
	
	 			var html = template(data);
	 			$("#filelist").remove();
	
	 			$('#listBody').html(html);
	 		}
	 		, error: function (xhr) {
	 			console.log(xhr);
	 		}
	 	});
	} else{
		$("#removebtn").text("삭제");
		$.ajax({
			url: "<%=request.getContextPath()%>/cloud/file/list.do"
	 		, type : "post"
	 		, data : JSON.stringify(param)
	 		, contentType : "application/json; charset=utf-8;"
	 		, async : false
	 		, success : function (data) {
	 			var source = $("#fileListContent").html();
	 			
	 			var template = Handlebars.compile(source);
	
	 			var html = template(data);
	 			$("#filelist").remove();
	
	 			$('#listBody').html(html);
	 		}
	 		, error: function (xhr) {
	 			console.log(xhr);
	 		}
	 	});
	}
});

function download(){
    $(".test").remove();
	var cloudNoStr = "";
	$("[name=chk]:checked").each(function() {
		cloudNoStr += "," + $(this).val();
	});
	cloudNoStr = cloudNoStr.substring(1);
	var cloudNoList = cloudNoStr.split(",");
	for(var i = 0; i < cloudNoList.length; i++){
		
		// 숨겨진 iframe을 만들어서 cloudNo만큼 실행한다.
		var ifr = $('<iframe name="' + i + '" class="test" style="display: none;"></iframe>');
		ifr.appendTo("body");
		
        $("iframe[name=" + i + "]").attr("src", "<%=request.getContextPath()%>/cloud/getFiles.do?cloudNo=" + cloudNoList[i]);
	}
}

function folder_remove_go() {
	if($('.jstree-clicked').parent().attr('id') == "0" || $('.jstree-clicked').parent().attr('id') == "-1"){
		alert("기본폴더나 휴지통은 삭제할 수 없습니다.");
		return;
	} else{
		location.href="<%=request.getContextPath()%>/cloud/folder/remove.do?folderCode=" + $('.jstree-clicked').parent().attr('id');
	}
}

function file_remove_go() {
	var test = "";
	$("[name=chk]:checked").each(function() {
		test += "," + $(this).val();
	});
	if(test == null || test == ""){
		Swal.fire({
	        icon: "warning",
	        title: "삭제할 파일을 선택해 주세요.",
	        showConfirmButton: false,
	        timer: 1500
	   }).then((result) => {
	      location.href = "<%=request.getContextPath()%>/cloud/main.do";
		});
	}
	test = test.substring(1);
	if($('.jstree-clicked').parent().attr('id') == '-1' || $('.jstree-clicked').parent().attr('id') == '0'){
		location.href = "<%=request.getContextPath()%>/cloud/trash/remove.do?cloudNoStr=" + test;
	}else{
		location.href = "<%=request.getContextPath()%>/cloud/file/remove.do?cloudNoStr=" + test;
	}
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
		$("[name=chk]").each(function(){
			$(this).click(function(){
				var allObj = $("#checkall");
				var objName = $(this).attr("name");
	
				if( $(this).prop("checked") )
				{	
					var checkBoxLength = $("[name="+ objName +"]").length;
					var checkedLength = $("[name="+ objName +"]:checked").length;
	
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
});
</script>
<%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %>

</body>
