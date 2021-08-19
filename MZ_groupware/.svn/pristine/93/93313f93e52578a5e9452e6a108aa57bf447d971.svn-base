<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<title>관리자 - 게시판관리</title>
<style type="text/css">
	.custom-select : focus {
    	outline: none !important;
	}
</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
	style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
			관리자메뉴 > 게시판 관리</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="container col-12">
		<div class="row">
			<div class="col-5">
				<div class="card card-custom card-stretch gutter-b" style="border: 4px solid #F3F6F9">
					<div class="card-header">
						<h3 class="card-title font-weight-bolder text-dark">게시판 목록</h3>
						<div class="card-toolbar">
							<a href="#" onclick="makeBoard();" id="addBtn" class="btn btn-primary btn-sm font-size-sm">게시판 추가</a>
						</div>
					</div>
					<div class="card-body pt-2">
						<ul class="navi navi-hover navi-active">
						    <c:forEach items="${boardList }" var="board">
							    <li class="navi-item">
							        <a class="navi-link board" id="${board.boardCode }" href="#" onclick="clickBoard('${board.boardCode}');">
							            <span class="navi-text">${board.boardName }</span>
							        </a>
							    </li>
							</c:forEach>
						</ul>
					</div>
					<!--end::Body-->
				</div>
<!-- 				<div class="input-group"> -->
<!-- 					<select class="custom-select" size="14" style="overflow: hidden;"> -->
<%-- 						<c:forEach items="${boardList }" var="board"> --%>
<%-- 						  <option class="font-size-h4 p-1" style="height: 30px" onclick="clickBoard('${board.boardCode}');"> --%>
<%-- 						  	${board.boardName } --%>
<!-- 						  </option> -->
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
<!-- 				</div> -->
			</div>
			<div class="col-7">
				<div class="flex-row-fluid ml-lg-8">
					<!--begin::Card-->
					<div class="card card-custom card-stretch">
						<div class="card-body">
							<div class="form-group row">
								<label class="col-3 col-form-label">게시판명</label>
								<div class="col-6">
									<input class="form-control form-control-lg" id="boardName" type="text" value="">
								</div>
								<div class="col-3"></div>
							</div>
							<div class="form-group row">
								<label class="col-3 col-form-label">댓글 사용 여부</label>
								<div class="col-9">
									<span class="switch switch-icon">
									   <label>
										   <input type="checkbox" id="replyUse" name="select"/>
										   <span></span>
									   </label>
									</span>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-3 col-form-label">첨부파일 수</label>
								<div class="radio-inline input-group col-9">
									<label class="radio radio-square">
							            <input type="radio" name="attach" value="0"/>
							            <span></span>
							           	 없음
							        </label>
									<label class="radio radio-square">
							            <input type="radio" name="attach" value="1"/>
							            <span></span>
							            1
							        </label>
							        <label class="radio radio-square">
							            <input type="radio" name="attach" value="2"/>
							            <span></span>
							            2
							        </label>
							        <label class="radio radio-square">
							            <input type="radio" name="attach" value="3"/>
							            <span></span>
							            3
							        </label>
							        <label class="radio radio-square">
							            <input type="radio" name="attach" value="4"/>
							            <span></span>
							            4
							        </label>
							        <label class="radio radio-square">
							            <input type="radio" name="attach" value="5"/>
							            <span></span>
							            5
							        </label>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-3 col-form-label">게시판 사용여부</label>
								<div class="input-group col-9">
									<span class="switch switch-icon">
									    <label>
									     <input type="checkbox" id="isUse" name="select"/>
									     <span></span>
									    </label>
									 </span>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-3 col-form-label"></label>
							
							<div class="col-6 text-right" id="changeBtn" style="display: none;" >
								<button type="button" onclick="submit_go('delete');" class="btn btn-danger mr-2">삭제</button>
								<button type="button" onclick="submit_go('update');" class="btn btn-primary mr-2">수정</button>
							</div>
							<div class="col-6 text-right" id="insertBtn">
								<button type="button" onclick="submit_go('insert');" class="btn btn-primary mr-2">추가</button>
							</div>
							<div class="col-3">
							</div>
						</div>
						<!--end::Body-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<form class="form" id="fm" action="" method="post">
		<input type="hidden" id="fmBoardCode" name="boardCode">
		<input type="hidden" id="fmBoardName" name="boardName">
		<input type="hidden" id="fmAttachNum" name="attachNum">
		<input type="hidden" id="fmReplyUse" name="replyUse">
		<input type="hidden" id="fmIsUse" name="isUse">
	</form>
</div>

<script>
	function makeBoard() {
		$(".board").attr("class", "navi-link board");
		$("#boardName").val("");
		$("input:checkbox[id='replyUse']").prop("checked", false);
		$("input:radio[name ='attach']:input[value='0']").attr("checked", true);
		$("input:checkbox[id='isUse']").prop("checked", false);
		$("#insertBtn").css("display", "inline");
		$("#changeBtn").css("display", "none");
		$("#deleteBtn").css("display", "none");
		$("#boardName").focus();
	}

	function clickBoard(boardCode) {
		$(".board").attr("class", "navi-link board");
		$("#" + boardCode).attr("class", "navi-link board active");
		$("#fmBoardCode").val(boardCode);
		$.ajax({
			url : "<%=request.getContextPath()%>/admin/board/getBoard.do"
		  , type : "post"
		  , data : JSON.stringify({'boardCode' : boardCode})	
		  , contentType : 'application/json'
		  , success : function(data){
			  var board = data.board;
			  $("#boardName").val(board.boardName);
			  if(board.replyUse == "Y"){
				  $("input:checkbox[id='replyUse']").prop("checked", true);
			  } else {
				  $("input:checkbox[id='replyUse']").prop("checked", false);
			  }
			  $("input:radio[name ='attach']:input[value='" + board.attachNum + "']").prop("checked", true);
			  if(board.isUse == "Y") {
				  $("input:checkbox[id='isUse']").prop("checked", true);
			  } else {
				  $("input:checkbox[id='isUse']").prop("checked", false);
			  }
			  $("#insertBtn").css("display", "none");
			  $("#changeBtn").css("display", "inline");
			  $("#deleteBtn").css("display", "inline");
		  }
		});
	}

	function submit_go(status) {
		var url = "";
		if(status == "insert") {
			url = "<%=request.getContextPath()%>/admin/board/regist.do";
		} else if(status == "update") {
			url = "<%=request.getContextPath()%>/admin/board/modify.do";
			if(!confirm("해당 게시판을 수정하시겠습니까?")) {
				return;
			}
		} else if(status == "delete") {
			url = "<%=request.getContextPath()%>/admin/board/remove.do";
			if(!confirm("해당 게시판을 삭제하시겠습니까?")) {
				return;
			}
		}
		$("#fmBoardName").val($("#boardName").val());
		$("#fmAttachNum").val($('input[name="attach"]:checked').val());
		
		if($("input:checkbox[id='replyUse']").is(":checked") == true) {
			$("#fmReplyUse").val("Y");
		} else {
			$("#fmReplyUse").val("N");
		}
		if($("input:checkbox[id='isUse']").is(":checked") == true) {
			$("#fmIsUse").val("Y");
		} else {
			$("#fmIsUse").val("N");
		}
		$("#fm").attr("action", url);
		$("#fm").submit();
	}
</script>
</body>
