<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<body>
<!-- --------------------- -->
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" 
style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl fas fa-building " style="padding: 0px 10px;"></i>
				로그관리 > 출/퇴근 IP관리
			</h3>
		</div>
	</div>
</div>
<!-- --------------------- -->
<div class="content d-flex flex-column flex-column-fluid p-0" id="kt_content">
    <div class="d-flex flex-column-fluid">
        <!--begin::Container-->
        <div class="container col-12">
        	<div id="kt_scrolltop" class="scrolltop">
				<i class="fas fa-angle-double-up"></i>
			</div>
            <div class="card card-custom" style="height:100%">
				<div class="card-body p-3">
					<button class="btn btn-primary font-weight-bolder" data-toggle="modal" data-target="#exampleModal">
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
						</span>IP 추가
					</button>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th class="text-center" style="width: 100px;">NO</th>
									<th class="text-center">허용 IP 주소</th>
									<th class="text-center" style="width: 200px;">사용여부</th>
									<th class="text-center" style="width: 150px;">관리</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${fn:length(resultList) eq 0}">
									<tr>
										<td class="text-center" colspan="4">출/퇴근 허용 IP가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${resultList}" var="resultBean" varStatus="i" begin="1">
									<tr>
										<td class="text-center align-middle">${i.index}</td>
										<td class="text-center align-middle"><c:out value="${resultBean.ipAddress}" /></td>
										<td class="text-center align-middle"><c:out value="${resultBean.ipUse eq 'Y' ? '사용' : '미사용'}" /></td>
										<td class="text-center align-middle">
											<c:if test="${resultBean.ipUse eq 'Y'}">
												<a href="javascript:fn_update('${resultBean.ipSeq}', 'N');" class="btn btn-light-dark font-weight-bold btn-sm">사용해제</a>
											</c:if>
											<c:if test="${resultBean.ipUse eq 'N'}">
												<a href="javascript:fn_update('${resultBean.ipSeq}', 'Y');" class="btn btn-light-primary font-weight-bold btn-sm">사용하기</a>
											</c:if>
											<a href="javascript:fn_remove('${resultBean.ipSeq}');" class="btn btn-icon btn-danger btn-sm">
												<i class="flaticon2-trash"></i>
											</a>
										</td>
									</tr>
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			<!--end::Card-->
			</div>
		<!--end::Container-->
		</div>
	</div><!-- d-flex flex-column-fluid -->
</div>
<div class="modal fade" id="exampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">허용 IP 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
			    <div class="col">
	              <span>등록할 IP를 입력하세요.</span>
			      <input type="text" id="ip" class="form-control mt-5" placeholder="ex) 127.0.0.1">
			    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary font-weight-bold" onclick="fn_regist()">등록</button>
            </div>
        </div>
    </div>
</div>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>
<form id="form1">
	<input id="ipAddress" name="ipAddress" type="hidden">
</form>
<form id="form2">
	<input id="ipSeq" name="ipSeq" type="hidden">
	<input id="ipUse" name="ipUse" type="hidden">
</form>
<script>
function fn_regist() {
	$('#ipAddress').val($('#ip').val());
	$('#form1').attr("action", '<%=request.getContextPath()%>/admin/log/ipManage/regist');
	$('#form1').attr("method", "POST");
	$('#form1').submit();
}

function fn_remove(ipSeq) {
	if (confirm('허용 ip를 삭제하시겠습니까?')) {
		$('#ipSeq').val(ipSeq);
		$('#form2').attr("action", '<%=request.getContextPath()%>/admin/log/ipManage/remove');
		$('#form2').attr("method", "POST");
		$('#form2').submit();
	}
}

function fn_update(ipSeq, use) {
	$('#ipSeq').val(ipSeq);
	$('#ipUse').val(use);
	$('#form2').attr("action", '<%=request.getContextPath()%>/admin/log/ipManage/update');
	$('#form2').attr("method", "POST");
	$('#form2').submit();	
}
</script>
</body>
