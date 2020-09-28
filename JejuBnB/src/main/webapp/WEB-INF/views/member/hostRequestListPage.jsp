<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<br>
		<h1 align="center">호스트 신청 목록</h1>
		<table align = "center" width= "800" cellspacing = "5" cellpadding = "0">
			<tr>
				<td> 아 이 디 </td>
				<td> 이 름 </td>
				<td> 전화번호</td>
				<td> Host Y/N </td>
			</tr>
			<c:forEach items="${hostlist }" var = "host">
			<tr>
				<td><a href="hostListDetail.do?user_id=${host.user_id }">${host.user_id }</a></td>
				<td>${host.user_name }</td>
				<td>${host.phone }</td>
				<td>${(host.host_check == null)? "신청 대기중" : "Y"}</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan = "4">
					<a href="main.do" > 시작페이지로 </a>
				</th>
			</tr>
		</table>
		
	</body>
</html>