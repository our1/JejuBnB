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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:forEach items ="${list }" var = "ms">
<c:if test="${ms.usere_one == loginMember.user_id }">
<div align="left">
${ms.user_one }
${ms.user_two }
<br>
</div>
</c:if>
</c:forEach>
</body>
</html>