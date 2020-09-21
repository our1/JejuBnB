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
<hr>
<h1>이벤트 </h1>
<table>
<tr><td>기한 : ${event.coupon_begin }&nbsp; ~ &nbsp;${event.coupon_end }</td><tr><br>
<th>이벤트</th>
<tr><td><img src="${pageContext.servletContext.contextPath }/resources/eventimg/${event.event_rimg}"></td></tr><br>
 <a href="insertMyCoupon.do?user_id=${loginMember.user_id }&coupon_no=${event.coupon_no }" >18</a>
<th>쿠폰 안내사항</th><br>
<tr><td>${event.event_content }</td></tr>
</table>
</body>
</html>