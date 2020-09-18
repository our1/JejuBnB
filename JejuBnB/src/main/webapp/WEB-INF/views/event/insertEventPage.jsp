<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<br>
<br>
<form action="insertEvent.do" method="post" enctype="multipart/form-data">
<h1 align="center">이벤트 등록</h1>
<input type="text" name="event_name" placeholder="이벤트 제목"><br>
기간 : <input type="date" name="coupon_begin">&nbsp;-&nbsp;<input type="date" name="coupon_end"><br>
썸네일 이미지 : <input type="file" name="sum_fimg"><br>
이벤트 이미지 : <input type="file" multiple="multiple" name="event_fimg"><br>
쿠폰 안내 내용 : <input type="text" name="event_content"> 
<input type="submit" value="등록">
</form>
</body>
</html>