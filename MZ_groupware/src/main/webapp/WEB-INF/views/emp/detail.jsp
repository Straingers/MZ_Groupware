<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
<table border=1>
	<tr>
		<th>QR주소</th>
		<th>사번</th>
		<th>이름</th>
		<th>부서명</th>
		<th>직위</th>
		<th>현재시간</th>
	</tr>
	<tr>
		<td>${emp.qrCode}</td>
		<td>${emp.empNo}</td>
		<td>${emp.empName}</td>
		<td>${emp.deptName}</td>
		<td>${emp.psName}</td>
		<td><c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd HH:mm" /></c:set><c:out value="${date}" /></td>
	</tr>
</table>
	<form role="form" action="<%=request.getContextPath()%>/comm/regist.do" method="post">
		<input type="hidden" name="empNo" value="${emp.empNo}"/>
		<input type="hidden" name="empName" value="${emp.empName}"/>
		<input type="hidden" name="deptName" value="${emp.deptName}"/>
		<input type="hidden" name="psName" value="${emp.psName}"/>
		<input type="submit" id="commCheck" value="출/퇴근 췌킷"/>
	</form>
</html>