<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/dist/jquery.min.js"></script>
</head>
<body>
<table border=1>
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
	<tr>
		<th>QR이미지</th>
		<th>사번</th>
		<th>이름</th>
		<th>부서명</th>
		<th>직위명</th>
		<th>현재시간</th>
	</tr>
	<c:forEach var="emp" items="${empList}">
	<tr>
		<td><img id="img" src="<c:url value="/createCode.do?qrCode=${emp.qrCode}" />"/></td>
		<td>${emp.empNo}</td>
		<td>${emp.empName}</td>
		<td>${emp.deptName}</td>
		<td>${emp.psName}</td>
		<td><c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set><c:out value="${date}" /></td>
	</tr>
	</c:forEach>
</table>

<div id="employee">

</div>
<script>

// 	$.ajax({
// 		type : 'GET',
// 		url : '/mz/emp/commute?qrCode=1039c114-6e17-4d6a-a5ee-0db2f3f698b9',
// 		dataType : 'json'
// 	}).done(function (result) {
// 		var html = '<div>' + result.empName + '</div>'
// 		$('#employee').html(html);
// 	}).fail(function (error) {
// 		alert('실패');
// 	}).always(function () {
// 		alert('항상');
// 	})
</script>
</body>
