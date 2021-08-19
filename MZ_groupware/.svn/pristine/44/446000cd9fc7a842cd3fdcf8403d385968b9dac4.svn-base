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
			<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">{{replyer}} [{{prettifyDate regdate}}]</a>
			<div style="white-space:pre;" class="text-dark font-size-lg" id="{{replyNo}}-replytext">{{replytext}}</div>
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
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="btn btn-icon btn-sm btn-light mr-2 my-1">
		<i class="fas fa-angle-double-left"></i>
	</a>
</li>
<a class="btn btn-icon btn-sm btn-light mr-2 my-1" href="{{#if prev}} {{prevPageNum}} {{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
		<i class="ki ki-bold-arrow-back icon-xs"></i>
</a>

{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}}">
	<a class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1 mr-2 my-1 btn-hover-primary {{signActive this}}" href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0">
			<strong>{{this}}</strong>
	</a>
</li>
{{/each}}

<li class="paginate_button page-item">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="btn btn-icon btn-sm btn-light mr-2 my-1">
		<i class="fas fa-angle-right"></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="btn btn-icon btn-sm btn-light mr-2 my-1">
		<i class="ki ki-bold-double-arrow-next icon-xs"></i>
	</a>
</li>										
</script>
	

<script> //댓글리스트
var replyPage = 1; // 무조건 1번 페이지 보이게 함. (리스트 뿌릴 때 페이지 기준)
$(document).ready(function(){ // jquery 라이브러리 로드 전에 실행되므로 onload 함수 감싸줌.//boardReplyController
	
	// 위의 Handle bars 템플릿에서 설정한 {{prettifyDate 값}} 에 대한 함수를 js에서 등록함.
	Handlebars.registerHelper({
		"prettifyDate":function(timeValue){ // Handlbars에 날짜 출력 함수 등록
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		}, 
		"VisibleByLoginCheck":function(replyer){
			var result = "none";
			
			if(replyer == "${loginUser.empName}") result="visible";
			
			return result;
		},
		"signActive" : function(pageNum){
			if(pageNum == replyPage) return 'active';
		}
	});
	// json 형태
	
	
	getPage("<%=request.getContextPath()%>/community/${communityBoard.communityCode}/replies/${communityBoard.commNo}/"+replyPage);
	// 만들어진 li에 이벤트 먹이기(고전방식)
	$('.pagination').on('click','li a', function(event){
		//alert($(this).attr("href"));
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			//boardReplyController url
			getPage("<%=request.getContextPath()%>/community/${communityBoard.communityCode}/replies/${communityBoard.commNo}/"+replyPage);
		}
		return false;
	});	
});



function printData(replyArr, target, templateObject){ // jsonArrayData, 어디에 뿌릴지, 템플릿 데이터
	var template = Handlebars.compile(templateObject.html()); // `
	var html = template(replyArr);
	$('.replyLi').remove();
	target.after(html);
}

// ex1) value 를 할당하는 방식 : 메모리를 먹음...(var printPagenation = function(pageMaker, target, templateObject){ )

//ex2) 프로토 타입으로 function 정의하는 방식 : 메모리를 먹지 않음.
function printPagination(pageMaker, target, templateObject){ // jsonArrayData, 어디에 뿌릴지, 템플릿 데이터
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i] = pageMaker.startPage + i;
	}
	pageMaker.pageNum=pageNum;
// 	pageMaker.displayPageNum=5;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html); //메서드 체이닝 (비우고 붙여)
}

function getPage(pageInfo){ // 비동기 호출
	$.getJSON(pageInfo, function(data){
		printData(data.replyList,$('#repliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function replyRegist_go(){
// 	alert("add reply btn");
	var communityCode=$("#communityCode").val();
	var replyer=$('#newReplyWriter').val();
	var replytext=$('#newReplyText').val();
	var commNo = $('input[name="commNo"]').val();
	
	if(!(replyer && replytext)){ // replyer , replytext 존재여부 확인
		alert("작성자 혹은 내용은 필수입니다.");
		return;
	}
	
	// data 내 bno를 board.bno를 주어도 됨.
	// bno 앞에 ""를 붙인 이유는 문자 형으로 하겠다 라는 것을 명시적으로 표시한 것.
	var data = {
			"commNo" : ""+commNo+"",
			"replyer":replyer,
			"replytext":replytext,
			"communityCode":communityCode
	}
	
	//boardReplyController url
	$.ajax({
		url:"<%=request.getContextPath()%>/community/replies",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				Swal.fire({
				  	title: "댓글 작성이 완료되었습니다.",
				  	icon: "success",
				  	showConfirmButton: false,
				    timer: 1500
				}).then((result) => {
					replyPage=1; //페이지이동
					getPage("<%=request.getContextPath()%>/community/"+communityCode+"/replies/"+commNo+"/"+replyPage); //리스트 출력
					$('#newReplyText').val("");	
				})
			}else{
				alert('댓글 등록을 실패했습니다.');	
			}
		}
	});
}


function replyModifyModal_go(replyNo){
// 	alert(rno+"클릭");
// 	var replyer=$('.'+rno+'-a').attr("data-replyer");
// 	var replytext=$('div#'+rno+'-replytext').text();
	
	//alert("rno : " + rno + "\nreplyer:"+replyer+"\nreplytext:"+replytext);
	$('#replytext').val($('div #'+replyNo+'-replytext').text());
	$('.modal-title').text(replyNo);
}
function replyModify_go(){
	var commNo=$('#commNo').val();
	var communityCode=$('#communityCode').val();
	var replyNo=$('.modal-title').text();
	var replytext=$('#replytext').val();
	
	var sendData={
			replytext:replytext
	}
	
	//boardReplyController url (path variable 연습)
	//type : put,fatch, delete 인식이 브라우저마다 다름.
	//headers : 브라우저가 put, fatch 처리 위해 설정
	$.ajax({
		url:"<%=request.getContextPath()%>/community/replies/"+replyNo,
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
				replyPage=1; //페이지이동
				getPage("<%=request.getContextPath()%>/community/"+communityCode+"/replies/"+commNo+"/"+replyPage); // 리스트 출력
				$('#newReplyText').val("");	
			})
				
		},
		error:function(error){ // throw 하면 error 코드를 부여하지 않으므로 주의!
			alert('수정 실패했습니다.');
		},
		complete:function(){ // 200 500 상관없이 수행됨
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go(){
	var commNo=$('#commNo').val();
	var communityCode=$('#communityCode').val();
	var replyNo=$('.modal-title').text();
	
	//boardReplyController url (path variable 연습)
	//type : put,fatch, delete 인식이 브라우저마다 다름.
	//headers : 브라우저가 put, fatch 처리 위해 설정
	$.ajax({
		url:"<%=request.getContextPath()%>/community/replies/"+commNo+"/"+replyNo,
<%-- 		url:"<%=request.getContextPath()%>/community/"+commNo+"/"+replyNo+"/"+replyPage, --%>
		type:"delete",
		headers:{
			"X-HTTP-Method-Override":"delete"
		},
		success:function(page){//page 유지하려면controller에서entity에 page번호를 작성해주어야함.
				
			Swal.fire({
			  	title: "댓글이 삭제되었습니다.",
			  	icon: "success",
			  	showConfirmButton: false,
			    timer: 1500
			}).then((result) => {
				replyPage=1; //페이지이동
				getPage("<%=request.getContextPath()%>/community/"+communityCode+"/replies/"+commNo+"/"+replyPage); // 리스트 출력
				$('#newReplyText').val("");	
			})
			
			
				
<%-- 				getPage("<%=request.getContextPath()%>/replies/${board.bno}/"+page); // 리스트 출력 --%>
		},
		error:function(error){ // throw 하면 error 코드를 부여하지 않으므로 주의!
			alert('삭제 실패했습니다.');
		},
		complete:function(){ // 200 500 상관없이 수행됨
			$('#modifyModal').modal('hide');
		}
	});
}

</script>

