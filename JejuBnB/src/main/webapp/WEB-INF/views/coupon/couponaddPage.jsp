<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertCoupon.do" method="post">
<h1>쿠폰 등록</h1>
<tr>
<th>금액</th>
<td><input type="number" name="coupon_money" required>
</tr>
<tr>
<th>시작날짜</th>
<td><input type="date" name="coupon_begin" max="99-12-31" id="begin">
</tr>
<tr>
<th>끝 날짜</th>
<td><input type="date" name="coupon_end" max="99-12-31" id="end">

</tr>
<input type="submit" value="추가">
<input type="button" value="뒤로가기" onclick="history.back(-1);">
</form>
</body>
</html>