<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script> <!-- handlebars cdn -->
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi d-flex align-items-center mb-10" >
		<div class="symbol symbol-40 symbol-light-success mr-5">
			<span class="symbol-label">
			<img src="<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto={{empPhoto}}" class="h-100 w-100 align-self-end" alt="">
			</span>
		</div>
		<div class="d-flex flex-column flex-grow-1 font-weight-bold">
			<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">{{empName}} [{{prettifyDate regdate}}]</a>
			<span class="text-dark font-size-lg" id="{{replyNo}}-replytext">{{replytext}}</span>
		</div>

		<div class="dropdown dropdown-inline ml-2" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
			<a href="#" class="btn btn-xs label label-lg label-light-primary label-inline font-weight-bold py-4 {{replyNo}}-a" id="modifyReplyBtn" data-replyNo={{replyNo}}
						 onclick="replyModifyModal_go('{{replyNo}}');"
						 style="display:{{VisibleByLoginCheck replyer}};"
             			 data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">
			<i class="flaticon2-pen text-primary"></i>
			</a>
		</div>
	</div>
   </div>
</div>
{{/each}}   
</script>
<script type="text/x-handlebars-template"  id="reply-pagination-template" >
	<div class="d-flex flex-wrap py-2 mr-3">
		<a class="btn btn-icon btn-sm btn-light mr-2 my-1" href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" >
			<i class="ki ki-bold-double-arrow-back icon-xs"></i>
		</a>
		<a class="btn btn-icon btn-sm btn-light mr-2 my-1" href="{{#if prev}} {{prevPageNum}} {{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
			<i class="ki ki-bold-arrow-back icon-xs"></i>
		</a>
		{{#each pageNum}}
		<a class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1 mr-2 my-1 btn-hover-primary {{signActive this}}" href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
			<strong>{{this}}</strong>
		</a>
		{{/each}}
		<a class="btn btn-icon btn-sm btn-light mr-2 my-1" href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
			<i class="ki ki-bold-arrow-next icon-xs" ></i>
		</a>
		<a class="btn btn-icon btn-sm btn-light mr-2 my-1" href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
			<i class="ki ki-bold-double-arrow-next icon-xs"></i>
		</a>
	</div>									
</script>
	

<script>
var replyPage = 1; 
$(document).ready(function(){
	Handlebars.registerHelper({
		"prettifyDate":function(timeValue){ 
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		}, 
		"VisibleByLoginCheck":function(replyer){
			var result = "none";
			
			if(replyer == "${loginUser.empNo}") result="visible";
			
			return result;
		},
		"signActive" : function(pageNum){
			if(pageNum == replyPage) return 'active';
		}
	});
	
	getPage("<%=request.getContextPath()%>/admin/${board.boardCode}/reply/${board.addNo}/" + replyPage);
	$('.pagination').on('click','li a', function(event){
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			getPage("<%=request.getContextPath()%>/admin/${board.boardCode}/reply/${board.addNo}/"+replyPage);
		}
		return false;
	});	
});



function printData(replyArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}

function printPagination(pageMaker, target, templateObject){
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i] = pageMaker.startPage + i;
	}
	pageMaker.pageNum = pageNum;
	pageMaker.prevPageNum = pageMaker.startPage-1;
	pageMaker.nextPageNum = pageMaker.endPage+1;
	
	var template = Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html); 
}

function getPage(pageInfo){ 
	$.getJSON(pageInfo, function(data){
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function replyRegist_go(){
	var boardCode = $("#boardCode").val();
	var replyer = $('#newReplyWriter').val();
	var replytext = $('#newReplyText').val();
	var addNo = $('input[name="addNo"]').val();
	
	if(!(replyer && replytext)){
		alert("작성자 혹은 내용은 필수입니다.");
		return;
	}
	
	var data = {
			"addNo" : addNo,
			"replyer" : replyer,
			"replytext" : replytext,
			"boardCode" : boardCode
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/board",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if(result[0] == "SUCCESS"){
				Swal.fire({
				  	title: "댓글 작성이 완료되었습니다.",
				  	icon: "success",
				  	showConfirmButton: false,
				    timer: 1500
				}).then((result) => {
					getPage("<%=request.getContextPath()%>/admin/" + boardCode + "/reply/" + addNo + "/1");
					$('#newReplyText').val("");	
				})
			}else{
				alert('댓글 등록을 실패했습니다.');	
			}
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}	
	});
}


function replyModifyModal_go(replyNo){
	$('#replytext').val($('div #' + replyNo + '-replytext').text());
	$('.modal-title').text(replyNo);
}
function replyModify_go(){
	var addNo = $('#addNo').val();
	var boardCode = $('#boardCode').val();
	var replyNo = $('.modal-title').text();
	var replytext = $('#replytext').val();
	
	var sendData={
			replytext : replytext
	};
	
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/board/reply/" + replyNo,
		type:"put",
		headers:{
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:'application/json',
		success:function(data){
			Swal.fire({
			  	title: "댓글이 수정되었습니다.",
			  	icon: "success",
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				replyPage = 1;
				getPage("<%=request.getContextPath()%>/admin/" + boardCode + "/reply/" + addNo + "/" + replyPage);
			});
		},
		error:function(error){ 
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go(){
	if(!confirm("정말 삭제하시겠습니까?")) {
		return;
	}
	var addNo = $('#addNo').val();
	var boardCode = $('#boardCode').val();
	var replyNo = $('.modal-title').text();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/" + boardCode + "/reply/" + addNo + "/" + replyNo +"/" + replyPage,
		type:"DELETE",
		headers:{
			"X-HTTP-Method-Override" : "delete"
		},
		success:function(page){
			Swal.fire({
			  	title: "댓글이 삭제되었습니다.",
			  	icon: "success",
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				getPage("<%=request.getContextPath()%>/admin/" + boardCode + "/reply/" + addNo + "/" + page);
				replyPage = page;
			})
		},
		error:function(error){ 
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}
</script>

