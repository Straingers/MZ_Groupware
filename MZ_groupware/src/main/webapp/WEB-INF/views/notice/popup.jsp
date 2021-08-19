<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>공지</title>

<body>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content" style="padding: 0px;">
	<!-- Main content -->
	<div class="d-flex flex-column-fluid">
		<div class="container">
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">중요 공지</h3>
				</div>
				<!--begin::Form-->
				<div class="card-body">
					<form enctype="multipart/form-data" role="form" method="post" action="<%=request.getContextPath()%>/board/qna/regist.do" name="registForm">
						
						<div class="form-group row">
							<label for="noticeTitle" class=" col-2 col-form-label">제목</label>
							<div class="col-10">
								<input class="form-control" type="text" id="noticeTitle" name="noticeTitle" value="${noticeBoard.noticeTitle}" readonly />
							</div>
						</div>
						
						
						<div class="form-group mb-1">
							<div>${noticeBoard.noticeContent}</div>
						</div>
					</form>
				</div><!-- card-body -->
			</div><!-- card -->
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header">
					<h3 class="card-title">첨부파일</h3>
				</div>
				<div class="card-footer">
					<c:forEach items="${noticeBoard.attachList}" var="attach">
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
					<div style="float: right;">
						<p><input type="checkbox" id="check" onclick="closePopup();" style="position: relative; top: 1.5px;"> 
						<label for="check" style="position:relative; top:-1.5px; cursor:pointer;"><b>오늘 하루동안 이 창을 열지 않음</b></label></p>
					</div>
					</div><!-- card-footer -->
			</div><!-- card -->
			
		</div>
	</div>
</div> 


<form role="form">
	<input type="hidden" id="noticeNo" name="noticeNo" value="${noticeBoard.noticeNo}" />
</form>
<script>

$(document).ready(function(){
	 $.ajax({
	        type: "GET",
	        url: "/mz/board/adminCheck",
	        success: function (response) {
	        },error:function(error){
	        }
	      });		
	 
});

function modify_go(){
	var formObj = $("form[role='form']");
	formObj.attr({
		'action':'modifyForm.do',
		'method':'post'
	});
	formObj.submit();
}
function remove_go(){
	var formObj = $("form[role='form']");
	var answer = confirm("정말 삭제하시겠습니까?");
	if(answer){		
		formObj.attr("action", "<%=request.getContextPath()%>/board/notice/remove.do");
		formObj.attr("method", "post");
		formObj.submit();
	}
}

</script>

<script>
		$('body').removeClass(
			'header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable'
		);// 카드 상단 공백 제거 용
   
		
		//오늘 하루 안보기
	function setCookie(name, value, expiredays) {
        var date = new Date();
        date.setDate(date.getDate() + expiredays);
        document.cookie = escape(name) + "=" + escape(value) + "; expires=" + date.toUTCString() + "; path=/mz";
//         alert(document.cookie);
    }

    function closePopup() {
        if (document.getElementById("check").value) {
            setCookie("${noticeBoard.noticeNo}", "N", 1);
            self.close();
        }
    }


</script>

</body>