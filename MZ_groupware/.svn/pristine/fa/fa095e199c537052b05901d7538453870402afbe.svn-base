<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script> <!-- handlebars cdn -->
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi d-flex align-items-center mb-10" >
		<!--begin::Symbol-->
		<div class="symbol symbol-40 symbol-light-success mr-5">
			<!--replyMapper에 b.emp_photo replyerPhoto 작업 해주어야 함.-->
			<div style="width: 40px;height: 40px; border-radius: 0.42rem; background-position:center;background-repeat:no-repeat;background-size:cover;background-image:url('<%=request.getContextPath() %>/admin/comp/member/getPicture?empPhoto={{replyerPhoto}}')"></div>
		</div>
		<!--end::Symbol-->
		<!--begin::Text-->
		<div class="d-flex flex-column flex-grow-1 font-weight-bold">
			<span class="text-mute mb-1 font-size-lg">{{empName}} [{{prettifyDate replyRegdate}}]</span>
			<span class="text-dark font-size-lg" id="{{replyNo}}-replyText">{{replyText}}</span>
		</div>

		<div class="dropdown dropdown-inline ml-2" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
			<a href="#" class="btn btn-xs label label-lg label-light-primary label-inline font-weight-bold py-4 {{replyNo}}-a" id="modifyReplyBtn" data-replyNo={{replyNo}}
						 onclick="replyModifyModal_go('{{replyNo}}');"
						 style="display:{{VisibleByLoginCheck replyer}};"
             			 data-replyer={{replyer}} data-toggle="modal" data-target="#modifyModal">
			<i class="flaticon2-pen text-primary"></i>
			</a>
		</div>
		<!--end::Text-->
		<!--begin::Dropdown-->
		<!--end::Dropdown-->
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
		"VisibleByLoginCheck":function(taskReplyer){
			var result = "none";
			
			if(taskReplyer == "${loginUser.empNo}") result="visible";
			
			return result;
		},
		"signActive" : function(pageNum){
			if(pageNum == replyPage) return 'active';
		}
	});
	
	getPage("<%=request.getContextPath()%>/approval/reply/${approval.appNo}/"+replyPage);
	$('.pagination').on('click','div a', function(event){
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			getPage("<%=request.getContextPath()%>/approval/reply/${approval.appNo}/"+replyPage);
		}
		return false;
	});	
});



function printData(replyArr, target, templateObject){
	var template = Handlebars.compile(templateObject.html()); // `
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}

function printPagination(pageMaker, target, templateObject){
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i] = pageMaker.startPage + i;
	}
	pageMaker.pageNum=pageNum;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}

function getPage(pageInfo){
	$.getJSON(pageInfo, function(data){
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('span#pagination'),$('#reply-pagination-template'));
	});
}

function replyRegist_go(){
	var replyer=$('#newReplyWriter').val();
	var replyText=$('#newApprovalReplytext').val();
	var appNo = $('input[name="appNo"]').val();
	
	if(!(replyer && replyText)){
		alert("작성자 혹은 내용은 필수입니다.");
		return;
	}
	
	var data = {
			"appNo" : appNo,
			"replyer":replyer,
			"replyText":replyText
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/approval/reply",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				Swal.fire({
					icon: "success",
				  	title: "등록이 완료되었습니다.",
				  	showConfirmButton: false,
				  	timer: 1500
				}).then((result) => {
					replyPage=1; //페이지이동
					getPage("<%=request.getContextPath()%>/approval/reply/"+appNo+"/"+replyPage);
					$('#newApprovalReplytext').val("");	
					socket.send("전자결재," + result[2] + "," + result[3] + ",작성하신 결재문서에 의견이 등록되었습니다.,<%=request.getContextPath()%>/approval/lib/ing/detail.do?appNo=" + appNo);
				})
			}else{
				alert('댓글 등록을 실패했습니다.');	
			}
		},
		error:function(error) {
			console.log(error);
		}
		
	});
}


function replyModifyModal_go(replyNo){
	$('#replyText').val($('div #'+replyNo+'-replyText').text());
	$('.modal-title').text(replyNo);
}
function replyModify_go(){
	var appNo=$('[name="appNo"]').val();
	var replyNo=$('.modal-title').text();
	var replyText=$('#replyText').val();
	var sendData={
			"replyText":replyText
	};
	$.ajax({
		url:"<%=request.getContextPath()%>/approval/reply/"+replyNo,
		type:"put",
		headers:{
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:'application/json',
		success:function(data){
			Swal.fire({
				icon: "success",
			  	title: "수정이 완료되었습니다.",
			  	showConfirmButton: false,
			  	timer: 1500
			}).then((result) => {
				replyPage=1;
				getPage("<%=request.getContextPath()%>/approval/reply/"+appNo+"/"+replyPage);
				$('#newApprovalReplytext').val("");	
			});
		},
		error:function(error){
			alert('수정 실패했습니다.');
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go(){
	var appNo=$('[name="appNo"]').val();
	var replyNo=$('.modal-title').text();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/approval/reply/"+appNo+"/"+replyNo,
		type:"delete",
		headers:{
			"X-HTTP-Method-Override":"delete"
		},
		success:function(page){
				
			Swal.fire({
				icon: "success",
			  	title: "삭제가 완료되었습니다.",
			  	showConfirmButton: false,
			  	timer: 1500
			}).then((result) => {
				replyPage=1;
				getPage("<%=request.getContextPath()%>/approval/reply/"+appNo+"/"+replyPage);
				$('#newApprovalReplytext').val("");	
			})
		},
		error:function(error){
			alert('삭제 실패했습니다.');
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}
</script>

