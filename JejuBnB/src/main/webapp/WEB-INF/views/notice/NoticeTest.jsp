<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<h1> 알림 설정 테스트 창</h1>
<ul>
	<li> 예약 알림 Test </li>
	<form action="insertNotice.do" method="post">
	<input type="hidden" name="to_user" value="${loginMember.user_id }">	
	<ul>
		<li><input type="text" name="roomName"></li>
	</ul>
</form>
</ul>
</body>
</html>