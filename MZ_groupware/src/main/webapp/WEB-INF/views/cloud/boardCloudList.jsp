<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div class="card card-custom" data-card="true" id="kt_card_1"> -->
<!-- 	<div class="card-header"> -->
<!-- 		<div class="card-title"> -->
<!-- 			<h3 class="card-label">폴더 수정</h3> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="card-body"> -->
<!-- 			<div class="form-group row"> -->
<!-- 				<div id="kt_tree_4" style="width:200px;"></div> -->
<!-- 				<div class="form-group"> -->
<!-- 					<table class="table" style="font-size: 12.5px;"> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 						        <th scope="col">파일명</th> -->
<!-- 						        <th scope="col">업로드 일자</th> -->
<!-- 						    </tr> -->
<!-- 						</thead> -->
<!-- 						<tbody id="listBody"> -->
<!-- 							<tr> -->
<!-- 								<td colspan="4">폴더를 선택해주세요.</td> -->
<!-- 							</tr> -->
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<input type="hidden" id="folderUpCode" name="folderCode"/> -->
<!-- 			<div class="col-6"> -->
<!-- 				<table class="table table-hover" id="fileTable" style="overflow:auto;"> -->
<!-- 			        <tr> -->
<!-- 			            <th scope="col">파일명</th> -->
<!-- 			            <th scope="col">업로드 일자</th> -->
<!-- 			        </tr> -->
<!-- 			    </table> -->
<!-- 			</div> -->
<!-- 	</div> -->
<!-- 	<div class="card-footer"> -->
<!-- 		<button type="button" class="btn btn-light-primary font-weight-bold float-right" onclick="CloseWindow();">취소</button> -->
<!-- 		<button type="button" class="btn btn-primary font-weight-bold float-right mr-3" onclick="ref_go();">등록</button> -->
<!-- 	</div> -->
<!-- </div> -->

<div class="modal fade" id="cloudModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 100%; width: auto; display: table;">
            <div class="modal-content" style="height: 700px; width: 800px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">클라우드 파일첨부</h5>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div id="kt_tree_4" class="col-4" style="border: 1px solid #EBEDF3;">
                        </div>
                        <div class="col-8" style="border: 1px solid #EBEDF3;height: 310px;">
                        	<table class="table overflow-auto" style="font-size: 12.5px;">
								<thead>
									<tr>
								        <th scope="col">파일명</th>
								        <th scope="col">업로드 일자</th>
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
					<div class="col-12">
						<table class="table table-hover" id="fileTable" style="overflow:auto;">
					        <tr>
					            <th scope="col">파일명</th>
					            <th scope="col">업로드 일자</th>
					        </tr>
					    </table>
					</div>
                </div>
                <div class="modal-footer">
					<button type="button" class="btn btn-light-primary font-weight-bold float-right" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary font-weight-bold float-right mr-3" onclick="ref_go();">등록</button>
                </div>
            </div>
        </div>
    </div>
<script>

var flag = "board";
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

function fn_attregist_go(cloudNo, filename, regdate) {
	var cnt = 0;
	$("tr[name='file']").each(function() {
		if (cloudNo == $(this).attr("id")) {
			alert('이미 추가된 파일입니다.');
			cnt = 1;
		}
	});
	if(cnt == 0) {
		$('#fileTable').append(
			"<tr onclick='javascript:$(this).remove();'" + "id=" + cloudNo + " name='file'>" +
			"	<td>" + filename + "</td>" +
			"	<td>" + regdate + "</td>" +
			"</tr>"
		);
	}
}

function ref_go(){
	var cloudNo = "";
	$("tr[name='file']").each(function() {
		cloudNo += "," + $(this).attr("id");
	});
	cloudNo = cloudNo.substring(1);
	$("#cloudNoStr").val(cloudNo);
	console.log(cloudNo);
	$.ajax({
		url: '<%=request.getContextPath()%>/cloud/file/detail.do',
		type: 'post',
		data: cloudNo,
// 		async:true,
		contentType: 'application/json;charset=utf-8',
		success: function(data) {
			Swal.fire({
		        icon: "success",
		        title: "등록이 완료되었습니다.",
		        showConfirmButton: false,
		        timer: 1500
			}).then((result) => {
				var cloudNoStr = "";
				var list = [];
				for(var i = 0; i < data.fileList.length; i++) {
					list.push(data.fileList[i]);
				}
				for(var i = 0; i < list.length; i++) {
					var cloudSpan = "<span name='cloud' id='" + list[i].cloudNo +"'>" + list[i].cloudFilename.split("\\$\\$")[1] + "</span>";
					var div = $('<div>').addClass("cloudRow");
			  		div.append(cloudSpan).append("<button style='border:0;ouline:0;' class='label label-rounded label-danger' type='button'>X</button>");
			  		$('.fileInput').append(div);
				}
				$("#cloudModal").modal("hide");
			})
		},
		error:function(err) {
			console.log('에러발생 : ' + err);
		}
	});
}

$('div.fileInput').on('click','div.cloudRow > button',function(event){
	$(this).parent('div.cloudRow').remove();
});

</script>
<%-- <%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %> --%>
<%@ include file="/WEB-INF/views/cloud/jstree_js.jsp" %>