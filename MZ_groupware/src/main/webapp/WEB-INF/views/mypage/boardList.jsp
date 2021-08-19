<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<c:set var="communityList" value="${dataMap.communityList }"/>
<c:set var="page" value="${cri.page }" />

<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon-list-1" style="padding: 0px 10px;"></i>
       	 마이페이지 > 내가 작성한 글
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Card-->
			<div class="card card-custom"  style="height: 100%;">
				<div class="card-body p-0">
						<div class="row d-flex justify-content-between mt-3 mb-6">
							<div class="col-lg-6 col-xl-8">
								<span><button style="display: none;" type="button" class="btn btn-danger" id="delBtn" onclick="delete_check();">선택삭제</button></span>
							</div>
							<div class="col-lg-6 col-xl-4">
								<div class="align-items-center">
									<div class="my-2 my-md-0">
										<div class="input-group row">
											<select class="form-control col-md-3" name="perPageNum" id="perPageNum"
											        onchange="list_go(1, 'board.do');">
										  		<option value="10" ${pageMaker.cri.perPageNum == 10 ? 'selected' : '' } >10개 보기</option>
										  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected' : '' }>20개 보기</option>
										  		<option value="30" ${pageMaker.cri.perPageNum == 30 ? 'selected' : '' }>30개 보기</option>
										  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected' : '' }>50개 보기</option>
										  	</select>		
											<select class="form-control col-md-3" name="searchType" id="searchType">
												<option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected' : '' }>전 체</option>
												<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : '' }>제 목</option>
												<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : '' }>작성자</option>
												<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected' : '' }>내 용</option>
												<option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected' : '' }>제목+내용</option>
												<option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected' : '' }>작성자+내용</option>																			
											</select>	
											<input class="form-control" type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
											<span class="input-group-append">
												<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1, 'board.do');">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>	
									</div>
								</div>
							</div>
						</div>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th width="3%" class="text-center">
										<label class="checkbox checkbox-single checkbox-all">
										<input type="checkbox" id="checkAll" name="checkAll" onchange="check();">&nbsp;<span></span>
										</label>
									</th>
									<th width="100px" class="text-center">NO</th>
									<th class="text-center">제목</th>
									<th width="100px" class="text-center">작성자</th>
									<th width="100px" class="text-center">작성일</th>
									<th width="100px" class="text-center">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="">
								</c:if>
								<c:forEach items="${communityList }" var="community" varStatus="i">
								<tr>
									<td class="text-center align-middle">
										<label class="checkbox checkbox-single">
											<input type="checkbox" name="check" value="${community.commNo }" onchange="all_check();">&nbsp;<span></span>
										</label>
									</td>
									<td width="10%" class="text-center align-middle">${pageMaker.totalCount - (cri.perPageNum * (cri.page - 1)) - i.index }</td>
									<td width="40%" class="text-left">
										<a class="text-dark text-hover-primary mb-1 font-size-lg" href="javascript:OpenWindow('<%=request.getContextPath()%>/board/anony/detail.do?commNo=${community.commNo}','상세보기',800,700);">
											${community.commTitle }
										<c:if test="${!empty community.attachList }">
											&nbsp;<i class="nav-icon fas fa-file"></i>
										</c:if>
										</a>
									</td>
									<td width="15%" class="text-center align-middle">${community.empName}</td>
									<td width="15%" class="text-center align-middle"><fmt:formatDate value="${community.commRegdate }" pattern="yyyy-MM-dd" /></td>
									<td width="8%" class="text-center align-middle">${community.commViewcnt }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer">
					<c:set var="list_url" value="board.do"></c:set>
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				
				</div>
			<!--end::Card-->
			</div>
		<!--end::Container-->
		</div>
	</div><!-- d-flex flex-column-fluid -->
</div>
<script type="text/javascript">
	$("#keyword").keyup(function(key) {
	    if (key.keyCode == 13) {
			$("#searchBtn").click();
	    }
	});
	
	function check() {
		if($("#checkAll").is(':checked')) {
	        $("input[name='check']").prop("checked", true);
	        $('#delBtn').show();
	    } else {
	        $("input[name='check']").prop("checked", false);
	        $('#delBtn').hide();
	    }
	}
	
	function all_check(){
		if($('input[name="check"]:checked').length == 0){
			$('#delBtn').hide();
		}
		if($("input[name='check']").is(':checked')) {
			$('#delBtn').show();
		}
		if($('input[name="check"]:checked').length == $("input[name='check']").length) {
			$("#checkAll").prop("checked", true);
		} else {
			$("#checkAll").prop("checked", false);
		}
	}
	
	function delete_check(){
		if(!confirm("정말로 삭제하시겠습니까?")) {
			return;
		}
		var delBoard = "";
		$("input[name='check']:checked").each(function(){
	        delBoard += $(this).val() + ",";
		});
		delBoard = delBoard.substring(0, delBoard.length - 1);
		$("#commNo").val(delBoard);
		
		$.ajax({
			url : "<%=request.getContextPath() %>/mypage/mine/boardRemove.do"
		  , data : {'commNos' : delBoard}
		  , type : "post"
   		  , success : function(data) {
				Swal.fire({
    				icon: "success",
			        title: "삭제가 완료되었습니다.",
			        showConfirmButton: false,
			        timer: 1500
          		}).then((result) => {
					if($('input[name="check"]:checked').length == ${communityList.size()}){
						list_go(${page - 1}, '${list_url }');
					} else {
						list_go(${page}, '${list_url }');
					}
        	  	});
   		    }
		});
	}
</script>
</body>