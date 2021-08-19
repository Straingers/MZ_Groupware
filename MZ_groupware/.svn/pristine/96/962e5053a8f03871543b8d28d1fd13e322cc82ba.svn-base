<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
var KTSummernoteDemo = function () {
	 // Private functions
	 var demos = function () {
		  $('.summernote').summernote({
		   height: 400,
		   isableResizeEditor: true,
		   callbacks: {
				onImageUpload : function(files, editor, welEditable){
					//alert("image selected");
					//file size check!
					for(var file of files) {
						//alert(file.name);
						if(file.size > 1024*1024*5) {
							alert("이미지는 5MB 미만입니다.");
							return;
						}
						if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
							alert("JPG 이미지 형식만 가능합니다.");
							return;
						}
					}
					
					for(var file of files) {
						//this가 summernote 의미. summernote 자체에 넣을 수 없기 때문에 summernote에 this를 이용해 파일을 던지고 summernote에서 control하게 됨
						sendFile(file,this);
					}
				},
				onMediaDelete : function(target){
					//alert(target[0].src.split("=")[1]);
					var answer = confirm("정말 이미지를 삭제하시겠습니까?");
					if (answer) {
						deleteFile(target[0].src);
					}
				}
			}
		 });
	 }
	 return {
		// public functions
		init: function() {
		 demos();
		}
	 };
}();

// Initialization
$(document).ready(function() {
	KTSummernoteDemo.init();
	
	$('.fileInput').on('change','input[type="file"]', function(event) {
		if(this.files[0].size>1024*1024*40){
			alert("파일 용량이 40MB를 초과하였습니다.");
			this.value="";
			$(this).focus();
			return false;
		}
	});
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){
		//alert("click X btn");
		$(this).parent('div.inputRow').remove();
	});
});

function sendFile(file, el) {
	
	var form_data = new FormData();
	form_data.append("file",file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '<%=request.getContextPath() %>/uploadImg.do',
		cache : false,
		contentType : false,
		processData : false,
		success : function(img_url){
			$(el).summernote('editor.insertImage',img_url);
		},
		error : function(){
			alert("이미지 업로드에 실패했습니다.");
		}
	});
}

function deleteFile(src) {
	var splitSrc = src.split("=");
	var fileName = splitSrc[splitSrc.length-1];
	var fileData = {fileName:fileName};
	
	$.ajax({
		url : "<%=request.getContextPath() %>/deleteImg.do",
		data : JSON.stringify(fileData),
		type : "post",
		contextType : "application/json",
		success : function(res) {
			console.log(res);
		},
		error : function() {
			alert("이미지 삭제가 불가능합니다.");
		}
	});
}
</script>