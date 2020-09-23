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
<br><br>
<h1 align="center">내가 저장한 숙소</h1>

<c:forEach items="${mlist }" var="list">
<table align="center" border="1" cellspacing="0" width="700">
<tr>
<th colspan="3">
<a href="moveDetailView.do?room_no=${list.room_no}">
<img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ list.room_rename_file }" />
</a>
</th>
</tr>
<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
<tr><td>${list.room_name }</td><td>${list.room_address }</td>
</table>
</c:forEach>
</body>
</html>