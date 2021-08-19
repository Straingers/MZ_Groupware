<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="communityList" value="${dataMap.communityList }"/>
<head>
<title></title>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon-list-1" style="padding: 0px 10px;"></i>
       	 마이페이지 > 내가 작성한 댓글
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Card-->
			<div class="card card-custom" style="height: 100%">
				<div class="card-body p-0">
					<div class="row d-flex justify-content-between mt-3 mb-6">
							<div class="col-lg-6 col-xl-8">
							</div>
							<div class="col-lg-6 col-xl-4">
								<div class="align-items-center">
									<div class="my-2 my-md-0">
										<div class="input-group row">
											<select class="form-control col-md-4" name="perPageNum" id="perPageNum"
											        onchange="list_go(1, 'boardReply.do');">
										  		<option value="10" ${pageMaker.cri.perPageNum == 10 ? 'selected' : '' } >10개 보기</option>
										  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected' : '' }>20개 보기</option>
										  		<option value="30" ${pageMaker.cri.perPageNum == 30 ? 'selected' : '' }>30개 보기</option>
										  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected' : '' }>50개 보기</option>
										  	</select>		
											<select class="form-control col-md-3" name="searchType" id="searchType">
												<option value="brtc" ${pageMaker.cri.searchType eq 'brtc' ? 'selected' : '' }>전 체</option>
												<option value="bt" ${pageMaker.cri.searchType eq 'bt' ? 'selected' : '' }>글 제목</option>
												<option value="rc" ${pageMaker.cri.searchType eq 'rc' ? 'selected' : '' }>댓글 내용</option>
											</select>	
											<input  class="form-control" type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
											<span class="input-group-append">
												<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1, 'boardReply.do');">
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
										<th style="text-align: center;" width="12%">게시판유형</th>
										<th style="text-align: center;" width="26%">제목</th>
										<th style="text-align: center;" width="12%">게시글작성일</th>
										<th style="text-align: center;" width="38%">댓글</th>
										<th style="text-align: center;" width="12%">댓글작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${communityList }" var="community">
									<tr>
										<td class="align-middle text-center" rowspan="${community.replyList.size() }">${community.communityName }</td>
										<td rowspan="${community.replyList.size() }" class="align-middle">
											<a class="text-dark text-hover-primary mb-1 font-size-lg" href="javascript:OpenWindow('<%=request.getContextPath()%>/board/anony/detail.do?commNo=${community.commNo}','상세보기',800,700);">${community.commTitle }</a>
										</td>
										<td style="text-align: center;" class="align-middle" rowspan="${community.replyList.size() }"><span><fmt:formatDate value="${community.commRegdate }" pattern="yyyy-MM-dd" /></span></td>
										<td>${community.replyList[0].replytext}</td>
										<td style="text-align: center;"><fmt:formatDate value="${community.replyList[0].regdate }" pattern="yyyy-MM-dd" /></td>
									</tr>
										<c:if test="${community.replyList.size() gt 1 }">
											<c:forEach begin="1" end="${community.replyList.size() - 1 }" items="${community.replyList }" var="reply">
											<tr>
												<td>${reply.replytext}</td>
												<td style="text-align: center;"><fmt:formatDate value="${reply.regdate }" pattern="yyyy-MM-dd" /></td>
											</tr>
											</c:forEach>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						<!--end: Datatable-->
						</div>
					</div>
					<div class="card-footer">
						<c:set var="list_url" value="boardReply.do"></c:set>
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
</script>
</body>
