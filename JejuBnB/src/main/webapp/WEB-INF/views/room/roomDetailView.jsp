<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript">
	function updatePage(){
		location.href="moveUpdatView.do?roomno=" + ${room.room_no};
	}
	function deleteRoom(){
		location.href="deleteRoom.do?roomno=" + ${room.room_no};
	}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<h1>숙소 상세 보기</h1>
<table >
<tr><th>숙소 이름</th><th>숙소 주인</th></tr>
<tr><td>${ room.room_name }</td> <td> ${ room.user_id }</td></tr>
<tr><td>숙소 소개</td> <td> ${ room.room_content }</td></tr>
<tr><td>숙소 주소 </td><td> ${ room.room_address }</td></tr>
<tr><td colspan="2">최소 인원 : ${ room.st_num_people }, 최대 인원 : ${ room.max_people }</td></tr>
<tr><td colspan="2">침대 수 : ${ room.bed }, 침실 수 : ${ room.bedroom }, 욕실 수 : ${ room.bathroom }</td></tr>
<tr><td>편의 시설 : 
<ul>
<c:forTokens items="${ room.amenity }" delims="," var="amenity">
<li>${amenity }</li>
</c:forTokens>
</ul>
<br>
시설 :
<ul>
<c:forTokens items="${room.facility }" delims="," var="facility">
<li>${facility } </li>
</c:forTokens>
</ul>
<br>
건물 유형 : 
<ul>
<c:forTokens items="${room.build_type }" delims="," var="build_type">
<li>${build_type } </li>
</c:forTokens>
</ul>
<br>
이용 규칙 : 
<ul>
<c:forTokens items="${room.rule }" delims="," var="rule">
<li>${rule } </li>
</c:forTokens>
</ul>
<br>
</table>
<%-- <c:if test="${ !empty loginMember and room.user_id eq loginMember.user_id }">   --%>
	<button onclick="updatePage()">글 수정</button>
	<button onclick="deleteRoom()">글 삭제 </button>
<%-- </c:if> --%>
</body>
</html>