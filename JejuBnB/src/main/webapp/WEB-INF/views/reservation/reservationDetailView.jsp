<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<h1>확인 및 결제</h1> <br>

<h2>예약정보</h2>
<h3>날짜</h3>
<h2><fmt:formatDate value="${ reservation.checkin_date }" type="date" dateStyle="yyyy-MM-dd"/>~
<fmt:formatDate value="${ reservation.checkout_date }" type="date" dateStyle="yyyy-MM-dd"/></h2> <br>
<h3>인원</h3>
<h2>${ reservation.guest }</h2> <br>
<h3>가격</h3>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>