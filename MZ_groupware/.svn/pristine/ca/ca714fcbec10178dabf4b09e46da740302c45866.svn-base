<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
<head>
<title></title>
</head>
<body>
<div class="row justify-content-center py-8 px-8 py-md-4 px-md-0" style="background-color: #ffffff;border-top-color: #ebedf3;border-top-width: 1px;border-style: solid;border-bottom-width: 1px;border-bottom-color: #ebedf3;margin-right: 0;margin-left: 0;color: #ffffff;">
	<div class="col-md-12 pl-6">
		<div class="d-flex justify-content-between align-items-md-center flex-column flex-md-row">
			<h3 class="display-6 font-weight-boldest text-inverse-white order-1 order-md-2 mb-0">
				<i class="icon-xl flaticon2-calendar-1" style="padding: 0px 10px;"></i>
        		 휴가관리 > 휴가사용현황
			</h3>
		</div>
	</div>
</div>
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
	<div class="container col-12">
		<div class="card card-custom gutter-b">
			 <div class="card-body">
				<table class="table table-bordered">
					<thead class="table-secondary">
						<tr align="center">
							<th colspan="6"><div class="h5">${sysYear }년도 휴가 정보</div></th>
						</tr>
		    		</thead>
		    		<tbody>
						<tr class="thead-light">
							<th width="16%" style="text-align: center;">입사일</th>
							<td width="16%"><fmt:formatDate value="${loginUser.empCreateDate }" pattern="yyyy-MM-dd" /></td>
							<th width="16%" style="text-align: center;">총연차일수</th>
							<td width="16%">${loginUser.empVac + userVaca }</td>
							<th width="16%" style="text-align: center;">연차잔여일</th>
							<td width="16%">${loginUser.empVac }</td>
						</tr>
					</tbody>
				</table>
				<br><br><br>
				<table class="table table-bordered">
					<thead class="table-secondary">
						<tr align="center">
							<th colspan="6"><div class="h5">제출 휴가 문서</div></th>
						</tr>
		    		</thead>
		    		<tbody>
						<tr class="thead-light">
							<th width="16%" style="text-align: center;">휴가분류</th>
							<th width="16%" style="text-align: center;">시작일</th>
							<th width="16%" style="text-align: center;">종료일</th>
							<th width="16%" style="text-align: center;">사용일수</th>
							<th width="16%" style="text-align: center;">신청일자</th>
							<th width="16%" style="text-align: center;">상태</th>
						</tr>
						<c:if test="${vacaList.size() == 0 }">
						<tr align="center">
							<td width="16%" colspan="6" align="center">
								<br>
								<p class="font-size-h5">제출한 휴가 문서가 없습니다.</p>
							</td>
						</tr>
						</c:if>
						<c:if test="${vacaList.size() != 0 }">
							<c:forEach items="${vacaList }" var="vaca">
							<tr class="text-center">
								<td width="16%">연차</td>
								<td width="16%">${vaca.vacStart }</td>
								<td width="16%">${vaca.vacEnd }</td>
								<td width="16%">${vaca.vacDate }</td>
								<td width="16%">${vaca.appUpDate }</td>
								<td width="16%">${vaca.appStatus }</td>
							</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			 </div>
		 </div>
	</div>
</div>
</body>
