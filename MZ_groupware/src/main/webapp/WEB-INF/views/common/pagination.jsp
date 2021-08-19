<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <nav aria-label="member list Navigation"> -->
<!-- 	<ul class="pagination justify-content-center m-0"> -->
<!-- 		<li class="page-item"> -->
<%-- 		<a class="page-link" href="javascript:list_go(1,'${list_url }');"> --%>
<!-- 			<i class="fas fa-angle-double-left"></i> -->
<!-- 		</a> -->
<!-- 	</li> -->
<!-- 	<li class="page-item"> -->
<%-- 		<a class="page-link" href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : 1},'${list_url }');"> --%>
<!-- 			<i class="fas fa-angle-left"></i> -->
<!-- 		</a> -->
<!-- 	</li> -->
<%-- 	<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" > --%>
<%-- 		<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}"> --%>
<%-- 			<a class="page-link" href="javascript:list_go(${pageNum},'${list_url }');" >${pageNum }</a> --%>
<!-- 		</li> -->
<%-- 	</c:forEach> --%>
<!-- 	<li class="page-item"> -->
<%-- 		<a class="page-link" href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page},'${list_url }');"> --%>
<!-- 			<i class="fas fa-angle-right" ></i> -->
<!-- 		</a> -->
<!-- 	</li> -->
<!-- 	<li class="page-item"> -->
<%-- 		<a class="page-link" href="javascript:list_go(${pageMaker.realEndPage} ,'${list_url }');"> --%>
<!-- 			<i class="fas fa-angle-double-right"></i> -->
<!-- 		</a> -->
<!-- 	</li>	 -->
<!-- 	</ul> -->
<!-- </nav> -->
<div class="d-flex justify-content-center align-items-center flex-wrap">
    <div class="d-flex flex-wrap py-2 mr-3">
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:list_go(1,'${list_url }');">
			<i class="ki ki-bold-double-arrow-back icon-xs"></i>
		</a>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : 1},'${list_url }');">
			<i class="ki ki-bold-arrow-back icon-xs"></i>
		</a>
		<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
			<a class="btn btn-icon border-0 btn-light mr-2 ${pageNum == pageMaker.cri.page ? 'btn-hover-primary active' : '' } my-1 mr-2 my-1" href="javascript:list_go(${pageNum},'${list_url }');" >
			
				<strong>${pageNum }</strong>
			</a>			
		</c:forEach>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:list_go(${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page},'${list_url }');">
			<i class="ki ki-bold-arrow-next icon-xs" ></i>
		</a>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:list_go(${pageMaker.realEndPage} ,'${list_url }');">
			<i class="ki ki-bold-double-arrow-next icon-xs"></i>
		</a>
    </div>
</div>
<form id="jobForm">
	<input type='hidden' name="page" value="${pageMaker.cri.page}" />
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
	<input type='hidden' name="searchType" value="${pageMaker.cri.searchType }" />
	<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
</form>

