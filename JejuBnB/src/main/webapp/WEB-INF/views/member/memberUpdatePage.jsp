<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testm</title>
</head>
<body>

<c:import url="/WEB-INF/views/common/header.jsp" /> 
   
   <hr>
<h1 align = "center"> 회원정보 수정페이지 </h1>
<br>
<form method="post" action="mupdate.do" >

<!-- <form method="post" action="" onsubmit = "return validate();">-->
<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">

<tr>
	<th width = "120"> *이 름  </th>
	<td> <input type="text" name="username" value= "${requestScope.member.username }" readonly ></td>
</tr>
<tr>
	<th> 아 이 디 </th>
	<td> <input type="text" name="userid" value= "${requestScope.member.userid }" readonly ></td>
</tr>

<tr>
	<th> *암 호 </th>
	<td> <input type="password" name="userpwd" id = "userpwd" value = "${requestScope.member.userpwd }" ></td>
</tr>
<tr>
	<th> *암호 확인 </th>
	<td> <input type="password" id="userpwd2"></td>
</tr>
<tr>
	<th> 성 별 </th>
	<td> 
		<c:if test="${member.gender eq 'M' }">
		 <input type="radio" name="gender" value = "M" checked >남 &nbsp;
		 <input type="radio" name="gender" value = "F">여 
		 </c:if>
		 <c:if test="${member.gender eq 'F' }">
		 <input type="radio" name="gender" value = "M" >남 &nbsp;
		 <input type="radio" name="gender" value = "F" checked>여 
		 </c:if>
	</td>
</tr>
<tr>
	<th> 나 이 </th>
	<td> <input type="number" name="age" min="19" max="200" value = "${requestScope.member.age }" ></td>
</tr>
<tr>
	<th> *전화번호 </th>
	<td> <input type="tel" name="phone" value = "${requestScope.member.phone }"> </td>
</tr>
<tr>
	<th> *이메일 </th>
	<td> <input type="email" name="email" value = "${requestScope.member.email }"> </td>
</tr>
<tr>
	<th> 취 미 </th>
	<td> 
	
	<c:forTokens items="${requestScope.member.hobby }" delims="," var="hb">
		<c:if test="${hb eq 'game' }"><c:set var="checked0" value="checked"/></c:if>
		<c:if test="${hb eq 'reading' }"><c:set var="checked1" value="checked"/></c:if>
		<c:if test="${hb eq 'climb' }"><c:set var="checked2" value="checked"/></c:if>
		<c:if test="${hb eq 'sport' }"><c:set var="checked3" value="checked"/></c:if>
		<c:if test="${hb eq 'music' }"><c:set var="checked4" value="checked"/></c:if>
		<c:if test="${hb eq 'movie' }"><c:set var="checked5" value="checked"/></c:if>
		<c:if test="${hb eq 'travel' }"><c:set var="checked6" value="checked"/></c:if>
		<c:if test="${hb eq 'cook' }"><c:set var="checked7" value="checked"/></c:if>
		<c:if test="${hb eq 'etc' }"><c:set var="checked8" value="checked"/></c:if>
	</c:forTokens>
	<table width ="350"> 
	<table>
	<tr>
		<td> <input type="checkbox" name="hobby" value="game" ${checked0 }> 게임 </td>
		<td> <input type="checkbox" name="hobby" value="reading" ${checked1 }> 독서 </td>
		<td> <input type="checkbox" name="hobby" value="climb" ${checked2 }> 등산 </td>
	</tr>
	<tr>
		<td> <input type="checkbox" name="hobby" value="sport" ${checked3 }> 운동 </td>
		<td> <input type="checkbox" name="hobby" value="music" ${checked4 }> 음악듣기</td>
		<td> <input type="checkbox" name="hobby" value="movie" ${checked5 }> 영화보기</td>
	</tr>
	<tr>
		<td> <input type="checkbox" name="hobby" value="travel" ${checked6 }> 여행 </td>
		<td> <input type="checkbox" name="hobby" value="cook" ${checked7 }> 요리 </td>
		<td> <input type="checkbox" name="hobby" value="etc" ${checked8 }> 기타 </td>
	</tr>
	</table>
	</td>
</tr>

<tr>
	<th> 하고싶은 말 </th>
	<td><textarea name="etc" rows="5" cols="50" ${requestScope.member.etc }></textarea></td>
</tr>
<tr>
	<th colspan = "2">
		<input type="submit" value = "수정하기"> &nbsp;
		<input type="reset" value = "수정취소"> &nbsp;
		<a href= "javascript:history.go(-1);"> 이전 페이지로 이동 </a> &nbsp;
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</table>
</form>
<br>
<!-- 상대경로만 사용이 가능하다/. -->
	<c:import url="/WEB-INF/views/common/header.jsp" />

</body>
</html>