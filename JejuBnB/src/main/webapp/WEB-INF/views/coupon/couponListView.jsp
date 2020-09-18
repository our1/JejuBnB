<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coupon</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br>
<br>
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
	<center>
<h1>쿠폰리스트</h1>
<br>

<form action="deleteCoupon.do" method="post">

<c:forEach items="${coupon}" var="co">
<br>
<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
<tr>
<th>금액</th>
<td>${co.coupon_money }</td>
</tr>
<tr>
<th>시작</th>
<td>${co.coupon_begin }</td>
</tr>
<tr>
<th>끝</th>
<td>${co.coupon_end }</td> <input type="checkbox" name="coupon_no" value="${co.coupon_no }"  >
</tr>
<br>
</table>
</c:forEach>
<tr>
	<th colspan = "2" align="center" padding="10">
		<a href="couponaddPage.do">등록</a>
	<input type="submit" value="삭제">
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>

</form>
</center>
</body>
</html>