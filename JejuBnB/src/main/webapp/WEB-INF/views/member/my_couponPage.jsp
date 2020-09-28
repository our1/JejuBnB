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
		<h1 align="center">내 쿠폰함</h1>
		<table align = "center" width= "1500" cellspacing = "5" cellpadding = "0">
			<tr>
				<td> 쿠폰 번호 </td>
				<td> 할인 금액 </td>
				<td > 쿠폰 사용 가능  기한</td>
				<td > 쿠폰 만료 기한   </td>
			</tr>
			<c:forEach items="${mycouponlist }" var="list">
			<tr>
				<td>${list.coupon_no }</td>
				<td>${list.coupon_money }</td>
				<td>${list.coupon_begin }</td>
				<td>${list.coupon_end }</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan = "8">
					<a href="main.do" > 시작페이지로 </a> 
				</th>
			</tr>
		</table>
	</body>
</html>