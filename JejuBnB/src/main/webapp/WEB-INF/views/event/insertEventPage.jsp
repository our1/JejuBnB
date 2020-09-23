<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<br>
<br>
<form action="insertEvent.do" method="post" enctype="multipart/form-data">
<h1 align="center">이벤트 등록</h1>
<input type="text" name="event_name" placeholder="이벤트 제목" required><br>
번호 : <input type="text" name="coupon_no" required><br>
썸네일 이미지 : <input type="file" name="sfile" required><br>
이벤트 이미지 : <input type="file" name="efile" required><br>
쿠폰 안내 내용 : <input type="text" name="event_content" required> 
<input type="submit" value="등록">
<a href="eventPage.do">목록</a>
</form>
</body>
</html>