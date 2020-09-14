<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
        <link rel="stylesheet" href="resources/css/tourlist.css" >
  </head>
  <body>
    <div class="mainhead">
         <div class="logo">
           <a href="main.do"><img src="resources/images/무제.png"></a>
         </div>
    <div class="dropdown"><span class="myimg"></span></div>
      <ul class="dropdown-list">
          <li><a href="#">마이페이지</a></li>
          <li><a href="#">내 쿠폰</a></li>
          <li><a href="#">내가 정한 숙소</a></li>
          <li><a href="#">사장님 신청</a></li>
          <li><a href="#">알림</a></li>
          <li><a href="#">고객센터</a></li>
          <li><a href="#">로그아웃</a></li>
      </ul>
  </div>
   <div class="thead"><h1 class="tour">관광지</h1></div>
   <div style="padding: 100px 0px 0px 0px;"></div>
     <button class="live">자연</button>
     <button class="cook">맛집</button>
     <button class="act">액티비티</button>
     <button class="movelist" onclick="javascipt:location.href='tourNoMap.do'"></button>
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
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
    </div>
</div>
<button class="twri" onclick="javascript:location.href='twrite.do'">관광지 작성 하기</button>
<div style="padding: 100px 0px 0px 0px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30a1bf673317be5978a11f2b404a16b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch($("#address"), function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리 집</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
       <c:import url="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>