<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
	#roomList {
		width : 50%;
		height : 80%;
		position : absolute;
		right : 50%;
		top : 30%;
	}
	
	#map {
		width : 50%;
		height : 80%;
		position : absolute;
		left : 50%;
		top : 30%;
	}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<h1 align="center">숙소 리스트 페이지</h1>
<div id="roomList">
<c:forEach items="${list }" var="room">
<table align="center" border="1" cellspacing="0" width="700">
<tr><th colspan="3"><img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }" /></th></tr>
<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
<tr><td><a href="moveDetailView.do?roomno=${room.room_no}">${room.room_name }</a>  </td><td>${room.room_address }</td>
</table>
</c:forEach>
</div>
<div id="map" ></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>