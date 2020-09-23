<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>

<c:import url="/WEB-INF/views/common/header.jsp" />
<br>

<h1>마이 페이지 </h1>
<c:url var="callMyinfo" value="myinfo.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyCoupon" value="moveMyCoupon.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<c:url var="moveMyRoom" value="seleteMyRoom.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<a href="${callMyinfo}">회원 정보 보기 페이지 버튼 </a> <br>
<a href="${moveMyCoupon}">내 쿠폰함 보기 페이지 버튼 </a> <br>
<a href="${moveMyRoom}">내가 저장한 숙소 보기 페이지 버튼 </a>  <br>
<a href="moveMessageTemp.do">메세지함 보기 버튼 </a>  <br>




</body>
</html>