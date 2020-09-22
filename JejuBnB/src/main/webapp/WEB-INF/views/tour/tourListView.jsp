<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
        <link rel="stylesheet" href="resources/css/tourlist.css" >
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
  </head>
  <body>
    <div class="mainhead">
         <div class="logo">
           <a href="main.do"><img src="resources/images/무제.png"></a>
         </div>
    <div class="dropdown"><span class="myimg"></span></div>
          <c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
     	<ul class="dropdown-list">
	     	<li onclick="javascript:location.href='moveAdminPage.do'"> 관리자 </li>
	        <li onclick="winOpen1()"> 필터 관리</li>
       		<li onclick="winOpen3()"> 알림 관리</li>
	        <li onclick="winOpen2()"> 알림</li>
	        <hr class="divider">
	        <li> 고객센터</li>
	        <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
        </ul>
     </c:if>
     <c:if test="${empty loginMember }">
     	<ul class="dropdown-list">
     	   <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
     	   <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
     	   <hr class="divider">
	       <li> 고객센터</li>
	       <li onclick="movePage()">로그인</li>
        </ul>
     </c:if>
     <c:if test="${!empty loginMember and  empty loginMember.admin_check}">
     <ul class="dropdown-list">
       <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
       <li onclick="winOpen2()"> 알림</li>
       <li onclick="javascript:location.href='moveRoomWrite.do'"> 사장님 신청하기</li>
       <hr class="divider">
       <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
       <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
       <hr class="divider">
       <li> 고객센터</li>
       <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
     </ul>
     </c:if>
  </div>
   <div class="thead"><h1 class="tour">관광지</h1></div>
   <div style="padding: 100px 0px 0px 0px;"></div>
     <button class="live">자연
     	<div class="livecount">7 개</div>
     </button>
     <button class="cook">음식
     	<div class="cookcount">10 개</div>
     </button>
     <button class="act">체험
     	<div class="actcount">5 개</div>
     </button>
     <button class="movelist" onclick="javascipt:location.href='tourNoMap.do'">X</button>
     <div style="padding: 100px 0px 0px 0px;"></div>
       <div class="tourlist">
	       <c:forEach items="${ requestScope.list }" var="t">
	         <div class="one">
	           <a href="tdetail.do?tour_no=${ t.tour_no }" target="_blank"><img src="resources/images/01.jpg" width=100% height=100%>  
	            <span>&#9733;</span> 4.8 ( 135 )<br>
	             <br>${ t.tour_name }
	           </a>
	         </div>
	        </c:forEach>
	    </div>
	    <div id="container">
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
    </div>
</div>
<button class="twri" onclick="javascript:location.href='test.do'">관광지 작성 하기</button>
<div style="padding: 100px 0px 0px 0px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30a1bf673317be5978a11f2b404a16b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var list = [];
var tourName = [];
<c:forEach items="${ list }" var="tour">
tourName.push('${tour.tour_name}');
list.push('${tour.tour_roadaddress}');
</c:forEach>
console.log(list);


for(var i = 0; i < '${fn:length(list)}'; i++){
	console.log(tourName[i]);
	geocoder.addressSearch(list[i], function(result, status) {
	 if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	        
	     /* // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	        var content = '<div class="customoverlay"><span class="title">'+
	        roomName[i] + '</span></div>';
	        // 커스텀 오버레이가 표시될 위치입니다 
	        var position = coords;  

	        // 커스텀 오버레이를 생성합니다
	        var customOverlay = new kakao.maps.CustomOverlay({
	            map: map,
	            position: position,
	            content: content,
	            yAnchor: 1 
	        }); */
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
       <c:import url="/WEB-INF/views/common/footer.jsp" />
       	   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	       <script src="resources/js/head.js"></script>
  </body>
</html>