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
<c:url value="message.do" var="message2">
	<c:param name="user_one" value="${loginMember.user_id }"/>
	<c:param name="user_two" value="bgy8135@naver.com"/>
</c:url>

<a href="${message }">user02 에게 보내기</a>
<a href="${message2 }">bgy8135에게 보내기</a>


</body>
</html>