<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<link href="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.css" rel="stylesheet" type="text/css">
	<%@ include file="/WEB-INF/views/admin/comp/group/jstree_css.jsp" %>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/custom/jstree/jstree.bundle.js"></script>
</head>
<script id="fileListContent" type="text/template">
{{#if fileList}}
	{{#each fileList}}
		<tr id="filelist">
			<td class='text-center align-middle' name='fname'>{{filename}}</td>
			<td class='text-center align-middle' name='fdate'>{{cloudRegdate}}</td>
			<td class='text-center align-middle'>
				<a href="javascript:fn_attregist_go('{{cloudNo}}', '{{filename}}', '{{cloudRegdate}}')" id='addCloud' class='btn btn-sm font-weight-bold btn-pill btn-outline-success mr-2'>추가</a>
			</td>
		</tr>
	{{/each}}
{{else}}
	<tr class="text-center" id="filelist">
		<td colspan="5">폴더가 비었습니다.</td>
	</tr>
{{/if}}
</script>
<script>
var jsonArr = [];
$.ajax({
	url: "<%=request.getContextPath()%>/cloud/folder/list.do?flag=" + flag
	, type : "get"
	, contentType : "application/json; charset=utf-8;"
	, async : false
	, success : function (data) {
		for(var i=0; i < data.treeList.length; i++){
			var json = {'id': data.treeList[i].id
				  ,'parent': data.treeList[i].parent
				  ,'text': data.treeList[i].text
				  ,'icon' : data.treeList[i].icon
				  ,'state' : {'opened' : data.treeList[i].state.opened
				  			,'disabled' : data.treeList[i].state.disabled
				  			,'selected' : data.treeList[i].state.selected
				  }};
			jsonArr.push(json);
		}
	}
	, error: function (xhr) {
		console.log(xhr);
	}
});

$('#kt_tree_4').jstree({ 'core' : {
	  'data' : jsonArr
	}
});

$(document).on('click', '.jstree-anchor', function(e) {
	var param = {
		cloudFolderCode : $(this).parents().attr("id")
		, cloudAttacher : '${loginUser.empNo}'
	};
	
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
});
</script>