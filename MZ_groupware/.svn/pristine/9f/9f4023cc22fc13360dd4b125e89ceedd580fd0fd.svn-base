<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<head>
<title>관리자메뉴 - 휴가관리</title>
<style type="text/css">
	td {
		height: 56px;
	}
</style>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon-buildings" style="padding: 0px 10px;"></i>
       			 휴가관리 > 연차설정
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="container col-11">
		<div class="card card-custom gutter-b">
			 <div class="card-body">
				<table class="table table-bordered">
		    		<tbody>
						<tr class="thead-light">
							<th width="25%" style="text-align: center;">근속년수</th>
							<th width="25%" style="text-align: center;">추가 지급일</th>
							<th width="25%" style="text-align: center;">전체 지급일수</th>
							<th width="25%" style="text-align: center;">비고</th>
						</tr>
						<tr>
							<td class="align-middle" width="25%" align="center">신입</td>
							<td class="align-middle" width="25%" align="center">0</td>
							<td class="align-middle" width="25%" align="center">0</td>
							<td class="align-middle" width="25%" align="center"></td>
						</tr>
						<tr>
							<td class="align-middle" width="25%" align="center">1년</td>
							<td class="align-middle" width="25%" align="center">0</td>
							<td class="align-middle" width="25%" align="center">15</td>
							<td class="align-middle" width="25%" align="center"></td>
						</tr>
						<c:forEach items="${vacationTypeList }" var="vacaType">
							<tr class="text-center">
								<td class="align-middle" width="25%" align="center">${vacaType.vacName }</td>
								<td class="align-middle" width="25%" align="center">
									<input class="form-control text-center w-25" type="number" id="code${vacaType.vacCode }" min="0" name="vacName" value="${vacaType.vacDays - 15 }" />
								</td>
								<td class="align-middle" width="25%" align="center">
									<input type="text" class="form-control text-center w-25" disabled="disabled" value="${vacaType.vacDays }" />
								</td>
								<td class="align-middle" width="25%" align="center">
									<a href="#" onclick="change_vacDay('${vacaType.vacCode }');" class="btn btn-light-primary font-weight-bold mr-2">수정</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			 </div>
		 </div>
	</div>
</div>
<form id="fm" action="<%=request.getContextPath()%>/admin/vacation/changeDay.do" method="post">
	<input type="hidden" id="fmVacCode" name="vacCode" value="" />
	<input type="hidden" id="fmVacDay" name="vacDay" value="" />
</form>
<script type="text/javascript">
	function change_vacDay(vacCode) {
		$("#fmVacCode").val(vacCode);
		$("#fmVacDay").val($("#code" + vacCode).val());
		
		var fm = $("#fm");
		fm.submit();
	}
</script>
</body>
