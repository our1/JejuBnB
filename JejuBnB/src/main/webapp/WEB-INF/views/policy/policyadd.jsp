<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>final</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<h1 align="center">약관 및 개인정보 추가</h1>
<form action="insertpolicy.do" method="post">
<table align="center" width="500" cellspacing="5" cellpadding="0">
<tr>
	<th colspan="2">약관 정보 입력</th>
</tr>

<tr>
<th>약관 정보</th>
<input type="text" name="policy_content"><br>
</tr>
<tr>
<th>약관 유형</th>
<input type="text" name="policy_type"><br>
</tr>
<th colspan="2">
<input type="submit" value="추가">
<input type="reset" value="취소">
</th>
</table>
</form>
</body>
</html>