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
			<h1 align="center">메세지함</h1>
			<table align="center" width = "500" border ="1" cellspacing = "0"
				cellpadding = "5">
				<tr>
					<td>아이디</td>
				</tr>
					<c:forEach items="${messagelist }" var="list">
					<c:if test="${list.user_one != loginMember.user_id }">
					<c:url value="message.do" var="message">
						<c:param name="user_one" value="${loginMember.user_id }"/>
						<c:param name="user_two" value="${list.user_one }"/>
					</c:url>
				<tr><td><a href="${message}">${list.user_one }</a></td></tr>
				</c:if>
				<c:if test="${list.user_two != loginMember.user_id }">
				<c:url value="message.do" var="message">
					<c:param name="user_one" value="${loginMember.user_id }"/>
					<c:param name="user_two" value="${list.user_two }"/>
				</c:url>
				<tr><td><a href="${message}">${list.user_two }</a></td></tr>
				</c:if>
				</c:forEach>
			</table>
	</body>
</html>