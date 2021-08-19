<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="d-flex justify-content-center align-items-center flex-wrap">
    <div class="d-flex flex-wrap py-2 mr-3">
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:msgList_go(1,'${list_url }');">
			<i class="ki ki-bold-double-arrow-back icon-xs"></i>
		</a>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:msgList_go(${pageMaker.prev ? pageMaker.startPage-1 : 1},'${list_url }');">
			<i class="ki ki-bold-arrow-back icon-xs"></i>
		</a>
		<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
			<a class="btn btn-icon border-0 btn-light mr-2 ${pageNum == pageMaker.cri.page ? 'btn-hover-primary active' : '' } my-1 mr-2 my-1" href="javascript:msgList_go(${pageNum},'${list_url }');" >
			
				<strong>${pageNum }</strong>
			</a>			
		</c:forEach>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:msgList_go(${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page},'${list_url }');">
			<i class="ki ki-bold-arrow-next icon-xs" ></i>
		</a>
		<a class="btn btn-icon btn-light mr-2 my-1" href="javascript:msgList_go(${pageMaker.realEndPage} ,'${list_url }');">
			<i class="ki ki-bold-double-arrow-next icon-xs"></i>
		</a>
    </div>
</div>
<form id="jobForm">
	<input type='hidden' name="page" value="${pageMaker.cri.page}" />
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum}"/>
	<input type='hidden' name="openType" value="${pageMaker.cri.openType}"/>
	<input type='hidden' name="searchType" value="${pageMaker.cri.searchType }" />
	<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
	<input type='hidden' name="flag" value="" />
</form>
<script>
	function msgList_go(page, url){
		if(!url) url = "list.do";
		
		var jobForm = $('#jobForm');
		
		jobForm.find('[name="page"]').val(page);
		jobForm.find('[name="perPageNum"]').val($('input[name="perPageNum"]').val());
		jobForm.find('[name="openType"]').val($('select[name="openType"]').val());
		jobForm.find('[name="searchType"]').val($('select[name="searchType"]').val());
		jobForm.find('[name="keyword"]').val($('input[name="keyword"]').val());
		
		jobForm.attr({
			action : url
			, method : 'get'
		}).submit();
	}
</script>