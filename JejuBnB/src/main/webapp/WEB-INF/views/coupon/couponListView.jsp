<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Coupon</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br>
<br>
<h1>쿠폰리스트</h1>
<form action="deleteCoupon">
<c:forEach items="">
</c:forEach>
</form>

</body>
</html>