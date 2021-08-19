<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script> <!-- handlebars cdn -->
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="replyLi d-flex align-items-center mb-10" >
	<div class="symbol symbol-40 symbol-light-success mr-5">
		<span class="symbol-label">
			<img src="<%=request.getContextPath()%>/emp/getPictureByEmpNo/{{replyer}}" class="h-75 align-self-end" alt="">
		</span>
	</div>
	<div class="d-flex flex-column flex-grow-1 font-weight-bold">
		<span class="text-mute mb-1 font-size-lg">{{empName}} [{{prettifyDate replyRegdate}}]</span>
		<span class="text-dark font-size-lg" id="{{replyNo}}-replyText">{{replyText}}</span>
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
</script>

