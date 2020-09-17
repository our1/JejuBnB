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
<hr><br>
<h1 align="center">약관 및 개인정보 추가</h1>
<form action="insertpolicy.do" method="post">
<table align="center" width="500" cellspacing="5" cellpadding="0">
<tr>
	<th colspan="2">약관 정보 입력</th>
</tr>
<tr>
<th width="120">약관 유형</th>	
<select id="policy_type" name="policy_type"> 
<option>약관</option>
<option>개인정보</option>
</select>
</tr>
<tr>
<th>약관 제목</th>
<input type="text" name="policy_title"><br>
</tr>
<tr>
<th>약관 정보</th>
<input type="text" name="policy_content"><br>
</tr>
<th colspan="2">
<input type="submit" value="추가">
<input type="button" value="뒤로가기" onclick="history.back(-1);">
</th>
</table>
</form>
</body>
</html>