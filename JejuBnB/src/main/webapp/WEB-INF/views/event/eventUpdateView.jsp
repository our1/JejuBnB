<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<h1>수정 페이지</h1>
<form action="updateEvent.do" method="post" enctype="multipart/form-data">
<input type="text" name="event_name" placeholder="이벤트 제목" required><br>
번호 : <input type="text" name="coupon_no" required><br>
썸네일 이미지 : <input type="file" name="sfile" required><br>
 <%-- <input type="hidden" name="rename1" value="${event.sum_rimg }">  --%>
이벤트 이미지 : <input type="file" name="efile"  required><br>
 <%-- <input type="hidden" name="rename" value="${event.event_rimg }"> --%> 
쿠폰 안내 내용 : <input type="text" name="event_content" required> 
<input type="hidden" name="event_no" value="${event.event_no }">
<input type="submit" value="수정">
<a href="eventPage.do">목록</a>
</form>
</body>
</html>