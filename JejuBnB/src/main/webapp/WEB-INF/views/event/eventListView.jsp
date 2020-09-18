<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnb</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<br>
<br>
<h1 align="center">이벤트</h1>
<form action="deleteEvent.do">
<c:forEach items="${event }" var="ev">
<ul align="center">
<li>${ev.event_name }</li><br>

<a>기한 : ${ev.coupon_begin } ~ ${ev.coupon_end }</a>

</ul>

</c:forEach>
<tr>
	<th colspan = "2" align="center" padding="10">
		<a href=insertEventPage.do">등록</a>
	<input type="submit" value="삭제">
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</form>
</body>
</html>