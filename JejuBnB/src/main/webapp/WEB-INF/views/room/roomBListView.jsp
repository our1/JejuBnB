<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<h1> 게시글 형태로 보기</h1>
<button onclick="javascipt:location.href='roomlist.do'">지도랑 같이 보기</button>
<c:forEach items="${list }" var="room">
<table align="center" border="1" cellspacing="0" width="700">
<tr><th colspan="3"><img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }" /></th></tr>
<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
<tr><td><a href="moveDetailView.do?roomno=${room.room_no}">${room.room_name }</a>  </td><td>${room.room_address }</td>
</table>
</c:forEach>
</body>
</html>