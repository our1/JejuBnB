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
<c:import url="/WEB-INF/views/common/header.jsp" /> <br>

<h1>Message 보내기 버튼 임시 페이지</h1>
<c:url value="message.do" var="message">
	<c:param name="user_one" value="${loginMember.user_id }"/>
	<c:param name="user_two" value="user02"/>
</c:url>

<a href="${message }">메세지창</a>


</body>
</html>