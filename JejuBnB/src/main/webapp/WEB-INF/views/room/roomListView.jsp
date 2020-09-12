<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>

<script type="text/javascript">
	function moveFilterPage()
		{
	    	window.open("moveFilterPage.do","알림","width=1000,height=500");
	    }
</script>
    <style type="text/css">

      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
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
    img {
    	width : 300px;
    	height : 300px;
    }
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<h1 align="center">숙소 리스트 페이지</h1>
<div id="roomList">
<button onclick="javascript:location.href='moveRoomBList.do'">리스트로 보기</button>
<button onclick="moveFilterPage()">필터 추가하기</button>


<c:forEach items="${list }" var="room">
<table align="center" border="1" cellspacing="0" width="700">
<tr><th colspan="3"><img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }" /></th></tr>
<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
<tr><td><a href="moveDetailView.do?roomno=${room.room_no}">${room.room_name }</a>  </td><td id="address">${room.room_address }</td>
</table>
</c:forEach>



</div>
<div id="map" style="width:50%;height:100%;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var list = [];
<c:forEach items="${list }" var="room">
console.log='${room.room_roadaddress}';
list.push('${room.room_roadaddress}');
</c:forEach>


for(var i = 0; i < '${fn:length(list)}'; i++){
	geocoder.addressSearch(list[i], function(result, status) {
	 if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	    } 
	})   
}
// 주소로 좌표를 검색합니다
/* geocoder.addressSearch("제주특별자치도 서귀포시 토평로 15", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${room.room_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});     */
</script>

</body>
</html>