<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }"/>
<c:set var="noticeBoardList" value="${dataMap.noticeBoardList }"/>
<c:set var="importantNoticeBoardList" value="${dataMap.importantNoticeBoardList }"/>


<body>
<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-users" style="padding: 0px 10px;"></i>
			게시판 > 공지사항</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<!-- --------------------- -->
<!-- --------------------- -->


<div class="content d-flex flex-column flex-column-fluid" id="kt_content" style="padding: 0px;">
	<div class="d-flex flex-column-fluid">
		<!--begin::Container-->
		<div class="container col-12">
			<!--begin::Card-->
			<div class="card card-custom gutter-b example example-compact">
				<div class="card-header flex-wrap border-0 pt-6 pb-0" id="card-header">
					<div class="card-title">
						
					<div id="divBtnDelete" style="display: none;">
						<button class="btn btn-primary font-weight-bolder" onclick="javascript:OpenWindow('<%=request.getContextPath()%>/board/notice/registForm.do','공지사항 등록',800,700);" >
						<span class="svg-icon svg-icon-md">
							<!--begin::Svg Icon | path:assets/media/svg/icons/Design/Flatten.svg-->
							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
								<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
									<rect x="0" y="0" width="24" height="24"></rect>
									<circle fill="#000000" cx="9" cy="15" r="6"></circle>
									<path d="M8.8012943,7.00241953 C9.83837775,5.20768121 11.7781543,4 14,4 C17.3137085,4 20,6.6862915 20,10 C20,12.2218457 18.7923188,14.1616223 16.9975805,15.1987057 C16.9991904,15.1326658 17,15.0664274 17,15 C17,10.581722 13.418278,7 9,7 C8.93357256,7 8.86733422,7.00080962 8.8012943,7.00241953 Z" fill="#000000" opacity="0.3"></path>
								</g>
							</svg>
							<!--end::Svg Icon-->
						</span>작성</button>
					</div>
				</div>
						
						
						
						
			<div class="card-toolbar">
						<div class="row align-items-center">
							<div class="my-2 my-md-0">
								<div class="input-group row">
									<select class="form-control col-md-3" name="perPageNum" id="perPageNum" style="width: 135px;"
									        onchange="list_go(1);">
											  		<option value="10" ${pageMaker.cri.perPageNum==10 ? 'selected':'' } >10개 보기</option>
											  		<option value="20" ${pageMaker.cri.perPageNum==20 ? 'selected':'' }>20개 보기</option>
											  		<option value="30" ${pageMaker.cri.perPageNum==30 ? 'selected':'' }>30개 보기</option>
											  		<option value="50" ${pageMaker.cri.perPageNum==50 ? 'selected':'' }>50개 보기</option>
											  		
											  	</select>		
												<select class="form-control col-md-3" name="searchType" id="searchType">
													<option value="tw" ${pageMaker.cri.searchType eq 'tw' ? 'selected':'' }>전 체</option>
													<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':'' }>제 목</option>
													<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected':'' }>내 용</option>
												</select>	
																
												<input  class="form-control" id="keyword" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
												<span class="input-group-append">
													<button class="btn btn-light-primary px-6 font-weight-bold" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
														<i class="fa fa-fw fa-search"></i>
													</button>
												</span>
											</div>	
										</div>
									</div>
							</div>
						</div>
					<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">NO</th>
									<th class="text-center">제목</th>
									<th class="text-center" style="width: 100px;">작성자</th>
									<th class="text-center" style="width: 100px;">작성일</th>
									<th class="text-center" style="width: 100px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${importantNoticeBoardList }" var="importantNoticeBoardList" varStatus="i">
								<tr style="left: 0px; background-color: #FAFAFA; border-bottom: 1px solid #EBEDF3; color: red;" >						
									<td class="text-center align-middle">
										<span class="svg-icon svg-icon-primary svg-icon-x" style="width: 137px;">
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
									        <rect x="0" y="0" width="24" height="24"/>
									        <path d="M11.6734943,8.3307728 L14.9993074,6.09979492 L14.1213255,5.22181303 C13.7308012,4.83128874 13.7308012,4.19812376 14.1213255,3.80759947 L15.535539,2.39338591 C15.9260633,2.00286161 16.5592283,2.00286161 16.9497526,2.39338591 L22.6066068,8.05024016 C22.9971311,8.44076445 22.9971311,9.07392943 22.6066068,9.46445372 L21.1923933,10.8786673 C20.801869,11.2691916 20.168704,11.2691916 19.7781797,10.8786673 L18.9002333,10.0007208 L16.6692373,13.3265608 C16.9264145,14.2523264 16.9984943,15.2320236 16.8664372,16.2092466 L16.4344698,19.4058049 C16.360509,19.9531149 15.8568695,20.3368403 15.3095595,20.2628795 C15.0925691,20.2335564 14.8912006,20.1338238 14.7363706,19.9789938 L5.02099894,10.2636221 C4.63047465,9.87309784 4.63047465,9.23993286 5.02099894,8.84940857 C5.17582897,8.69457854 5.37719743,8.59484594 5.59418783,8.56552292 L8.79074617,8.13355557 C9.76799113,8.00149544 10.7477104,8.0735815 11.6734943,8.3307728 Z" style="fill:red ;"/>
									        <polygon style="fill:red ;" opacity="0.3" transform="translate(7.050253, 17.949747) rotate(-315.000000) translate(-7.050253, -17.949747) " points="5.55025253 13.9497475 5.55025253 19.6640332 7.05025253 21.9497475 8.55025253 19.6640332 8.55025253 13.9497475"/>
									    </g>
										</svg><!--end::Svg Icon--></span>
									</td>
									<td class="text-dark text-hover-primary mb-1" style="text-align: left; color: #007bff; cursor:pointer; "
										onclick="javascript:OpenWindow('<%=request.getContextPath()%>/board/notice/detail.do?noticeNo=${importantNoticeBoardList.noticeNo}','상세보기',800,700);">
										<span style="color:red;" >${importantNoticeBoardList.noticeTitle }</span> &nbsp;
										<c:if test="${!empty importantNoticeBoardList.attachList}">
											<i class="nav-icon fas fa-file"></i>
										</c:if>	
									</td>
									<td class="text-center align-middle">관리자</td>
									<td class="text-center align-middle">
										<fmt:formatDate value="${importantNoticeBoardList.noticeRegdate}" pattern="yyyy-MM-dd" />
									</td>
									<td class="text-center align-middle">${importantNoticeBoardList.noticeViewcnt}</td>
								</tr>
								</c:forEach>
								
								
								<c:if test="${noticeBoardList eq null}">
									<tr>
										<td class="text-center" colspan="5">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${noticeBoardList }" var="noticeBoard" varStatus="i">
									
								<tr>
									<td class="text-center align-middle">${pageMaker.totalCount - ((cri.page - 1) * cri.perPageNum + i.index)-3 }</td>
									<td class="text-dark text-hover-primary mb-1" style="text-align: left; color: #007bff; cursor:pointer;"
										onclick="javascript:OpenWindow('<%=request.getContextPath()%>/board/notice/detail.do?noticeNo=${noticeBoard.noticeNo}','상세보기',800,700);">
											<span >${noticeBoard.noticeTitle}</span> &nbsp;
									  <c:if test="${!empty noticeBoard.attachList}">
											<i class="nav-icon fas fa-file"></i>
										</c:if>
									</td>
									<td class="text-center align-middle">관리자</td>
									<td class="text-center align-middle">
										<fmt:formatDate value="${noticeBoard.noticeRegdate}" pattern="yyyy-MM-dd" />
									</td>
									<td class="text-center align-middle">${noticeBoard.noticeViewcnt}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					<!--end: Datatable-->
					<div class="card-footer">
						<c:set var="list_url" value="list.do"></c:set>
						<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				
					</div>
					</div>
				</div>
			<!--end::Card-->
			</div>
		<!--end::Container-->
		</div>
	</div><!-- d-flex flex-column-fluid -->
</div>

<script>
	$(document).ready(function(){
		 $.ajax({
		        type: "GET",
		        url: "/mz/board/adminCheck",
		        success: function (response) {
		        	  $("#divBtnDelete").css("display", "inline");
		        },error:function(error){
		        	$("#card-header").css("min-height", "0px");
		        }
		      });		
	});
	
	$("#keyword").keydown(function(key) {
	    if (key.keyCode == 13) {
	    	list_go(1);
	    }
	});
	
</script>

</body>