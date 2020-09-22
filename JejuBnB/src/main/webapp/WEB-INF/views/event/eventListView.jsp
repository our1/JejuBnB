<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnb</title>
<script src="/JejuBnB/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<br>
<br>
<h1 align="center">이벤트</h1>
<form action="deleteEvent.do" method="post">
<c:forEach items="${event }" var="ev">
<ul align="center">
<div>${listcount }개 이벤트</div>
<li><a href="eventDetailView.do?event_no=${ev.event_no}">${ev.event_name }</li><input type="checkbox" name="event_no" value="${ev.event_no }"><br>
<a>기한 : ${ev.coupon_begin } ~ ${ev.coupon_end }</a><br>
<img src="${pageContext.servletContext.contextPath}/resources/eventsum/${ev.sum_rimg}" width="400" height="200">
</ul>
</c:forEach>
<div id="page" style="text-align:center;">
	<c:if test="${currentPage == 1 }">
	<button id="moveNext" onclick="moveNext(${currentPage})">&lt;</button>
	</c:if>
<c:forEach var="pg" begin="${startPage }" end="${endPage }" step="1">
	<c:if test="${pg eq currentPage }">
		<font weigth="bold"><b>${pg }</b></font>
	</c:if>
	<c:if test="${pg ne currentPage }">
		<button id="moveNext" onclick="moveNext(${currentPage})">&lt;</button>
	</c:if>
</c:forEach>	

<c:if test="${currentPage == maxPage }">
	<button id="moveNext" onclick="moveNext(${currentPage})">&gt;</button>
</c:if>
</div>
<br>
<br>
<tr >
	<th colspan = "2" padding="10">
	<c:if test="${!empty loginMember and  loginMember.admin_check eq 'Y' }">
		<a href="insertEventPage.do">등록</a>
	<input type="submit" value="삭제">
	</c:if>
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</form>

</body>
</html>