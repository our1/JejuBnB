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
<h1 align="center">숙소 리스트 페이지</h1>
<c:forEach items="${list }" var="room">
<table align="center" border="1" cellspacing="0" width="700">
<tr><th colspan="3"><img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }" /></th></tr>
<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
<tr><td>${room.room_name }</td><td>${room.room_address }</td>
</table>
</c:forEach>
</body>
</html>