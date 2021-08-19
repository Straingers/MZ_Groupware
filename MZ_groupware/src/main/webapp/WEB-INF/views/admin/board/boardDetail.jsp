<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>${menu.menuName } 게시글</title>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<!-- Main content -->
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">${menu.menuName } 게시글 상세보기</h3>
					<div class="card-toolbar">
						<button class="btn btn-light-primary font-weight-bolder mr-2" onclick="CloseWindow();">닫기</button>
						<c:if test="${loginUser.empNo eq board.empNo }">
							<div class="btn-group">
								<button type="button" class="btn btn-primary font-weight-bolder mr-2" onclick="modify_go();">수정</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-primary font-weight-bolder" onclick="remove_go();">삭제</button>
							</div>
						</c:if>
					</div>
				</div>
				<!--begin::Form-->
				<div class="card-body">
					<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/board/additional/regist.do" name="registForm">
						<div class="form-group row">
							<label for="commTitle" class=" col-2 col-form-label">제목</label>
							<div class="col-10">
								<input class="form-control" type="text" id="addTitle" name="addTitle" value="${board.addTitle}" readonly />
							</div>
						</div>
						
						<div class="form-group mb-1">
							<label for="exampleTextarea">내용
							<span class="text-danger">*</span></label>
							<div>${board.addContent}</div>
						</div>
					</form>
				</div><!-- card-body -->
			</div><!-- card -->
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">첨부파일</h3>
				</div>
				<div class="card-footer">
					<c:forEach items="${board.attachList}" var="attach">
					<div class="col-sm-12" onclick="location.href='<%=request.getContextPath()%>/board/getFiles.do?attachNo=${attach.attachNo}';">
						<div class="d-flex align-items-center mb-10">
							<!--begin::Symbol-->
							<div class="symbol symbol-40 symbol-light-success mr-5">
								<span class="symbol-label">
									<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24"></rect>
											<path d="M2,13 C2,12.5 2.5,12 3,12 C3.5,12 4,12.5 4,13 C4,13.3333333 4,15 4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 C2,15 2,13.3333333 2,13 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
											<rect fill="#000000" opacity="0.3" x="11" y="2" width="2" height="14" rx="1"></rect>
											<path d="M12.0362375,3.37797611 L7.70710678,7.70710678 C7.31658249,8.09763107 6.68341751,8.09763107 6.29289322,7.70710678 C5.90236893,7.31658249 5.90236893,6.68341751 6.29289322,6.29289322 L11.2928932,1.29289322 C11.6689749,0.916811528 12.2736364,0.900910387 12.6689647,1.25670585 L17.6689647,5.75670585 C18.0794748,6.12616487 18.1127532,6.75845471 17.7432941,7.16896473 C17.3738351,7.57947475 16.7415453,7.61275317 16.3310353,7.24329415 L12.0362375,3.37797611 Z" fill="#000000" fill-rule="nonzero"></path>
										</g>
									</svg>
									
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Text-->
							<div class="d-flex flex-column flex-grow-1 font-weight-bold">
								<a href="#" class="text-dark text-hover-primary mb-1 font-size-lg">${attach.attachFilename}</a>
								<span class="text-muted"><fmt:formatDate value="${attach.attachRegdate}" pattern="yyyy-MM-dd" /></span>
							</div>
							<!--end::Text-->
						</div>
					</div>
					</c:forEach>
				</div><!-- card-footer -->
			</div><!-- card -->
			
		<c:if test="${addType.replyUse eq 'Y' }">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">댓글목록</h3>
				</div>
				<div class="card-body pt-2">
					
					<div class="time-label" id="repliesDiv">
					</div>
					<div class='text-center'>
						<ul id="pagination" class="pagination justify-content-center m-0">
							
						</ul>
					</div><!-- ./text-center -->
				</div><!-- card-footer -->
					<div class="card-footer">
						<input class="form-control" type="hidden" placeholder="USER ID"	 id="newReplyWriter" readonly value="${loginUser.empNo}"> 
						<input class="form-control" type="text"	placeholder="댓글을 입력하세요." id="newReplyText">
						<br/>
						<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">댓글작성</button>
					</div>	
			</div><!-- card -->
		</c:if>
		</div>
	</div>
</div> 

<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" style="display:none;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control" value="${replytext}"></p>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary font-weight-bolder mr-2" id="replyModBtn" onclick="replyModify_go();">
							<i class="ki ki-check icon-xs"></i>수정하기</button>
		<button type="button" class="btn btn-primary font-weight-bolder" id="replyDelBtn" onclick="replyRemove_go();">
							<i class="ki ki-close icon-nm"></i>삭제하기</button>	
		<button class="btn btn-light-primary font-weight-bolder mr-2" data-dismiss="modal">
							<i class="ki ki-long-arrow-back icon-xs"></i>취소하기</button>				
      </div>
    </div>
  </div>
</div>

<form role="form">
	<input type="hidden" id="addNo" name="addNo" value="${board.addNo}" />
	<input type="hidden" id="boardCode" name="boardCode" value="${board.boardCode}" />
</form>
<script>
$('body').removeClass(
	'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
);// 카드 상단 공백 제거 용
	
function modify_go(){
	var formObj = $("form[role='form']");
	//alert("click modify btn");
	formObj.attr({
		'action':'modifyForm.do',
		'method':'post'
	});
	formObj.submit();
}
function remove_go(){
	var formObj = $("form[role='form']");
	//alert("click remove btn");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){		
		formObj.attr("action", "remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
}
</script>

<%@include file="./reply_js.jsp" %>
</body>