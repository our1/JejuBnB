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
	#page{
	 width: 20%;
    height: 50%;
    padding: 0;
    margin-left: 40%;
	}
	#moveNext{
			width : 15%;
	    	height : 70%;
	    	border-radius : 50%;
	    	background:#ffffff;
	    	text-align : center;
	    	line-height : 10px;
	    	border : 1px solid gray;
	    	box-shadow : 0 0 1px rgb(221,221,221);
	    	font-weidth : bold;
	}
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
<li>${ev.event_name }</li><br>
<a>기한 : ${ev.coupon_begin } ~ ${ev.coupon_end }</a>
<img src="">
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
<tr>
	<th colspan = "2" align="center" padding="10">
		<a href="insertEventPage.do">등록</a>
	<input type="submit" value="삭제">
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</form>

</body>
</html>