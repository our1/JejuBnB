<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>JejuBnB</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="robots" content="index, follow"/>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <!--=============== css  ===============-->	
        <link type="text/css" rel="stylesheet" href="resources/css/reset.css">
        <link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
        <link type="text/css" rel="stylesheet" href="resources/css/style.css">
        <link type="text/css" rel="stylesheet" href="resources/css/color.css">
        <!--=============== favicons ===============-->
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
        
    </head>
    <style>
    	 .logo {
      font-family: 'Alex Brush', cursive;
      font-size: 35px;
      color: #ffffff;
    }
    .cat {
      background-color : #4DB7FE;
      float: left;
      border: 1px solid #eee;
      background: #4DB7FE;
      width: 100%;
      padding: 15px 20px 15px 20px;
      border-radius: 6px;
      -webkit-appearance: none;
      width : 247px;
      height : 48px;
      color : #fff;
    }
    </style>
    <script>
        var thum = ${ tour.tour_thum_image };
    	document.write("<img src = \".jpeg/"+".webp\">");
    </script>
    <body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
        <!--loader-->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--loader end-->
        <!-- Main  -->
        <div id="main">  
            <!-- wrapper -->	
            <div id="wrapper">
                <div class="content">
                    <!-- Map -->
                    <!-- <div class="map-container column-map right-pos-map">
                        <div id="map-main"></div>
                        <ul class="mapnavigation">
                            <li><a href="#" class="prevmap-nav">Prev</a></li>
                            <li><a href="#" class="nextmap-nav">Next</a></li>
                        </ul>
						<div class="scrollContorl mapnavbtn" title="Enable Scrolling"><span><i class="fa fa-lock"></i></span></div>   						
                    </div> -->
					<div id="mapBox" style="height:100%;width:1150px;position:relative;">
						<div id="map"></div>
					</div>
                    <!-- Map end -->          
                    <!--col-list-wrap -->   
                    <div class="col-list-wrap left-list">
                        <div class="listsearch-options fl-wrap" id="lisfw" >
                            <div class="container">
                                <div class="listsearch-header fl-wrap">
                                    <h3>관광지 </h3>
                                    <div class="listing-view-layout">
                                        <ul>
                                            <li><a class="grid active" href="#"><i class="fa fa-th-large"></i></a></li>
                                            <li><a class="list" href="#"><i class="fa fa-list-ul"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- listsearch-input-wrap  -->  
                                <div class="listsearch-input-wrap fl-wrap">
                                    <div class="listsearch-input-item">
                                        <button class="cat" >자 연</button>
                                    </div>
                                    <div class="listsearch-input-item">
                                    	<button class="cat">음 식</button>
                                    </div>
                                    <div class="listsearch-input-item">
                                    	<button class="cat">체 험</button>
                                    </div>
                                </div>
                                <!-- listsearch-input-wrap end -->
                            </div>
                        </div>
                        <!-- list-main-wrap-->
                        <div class="list-main-wrap fl-wrap card-listing">
                            <a class="custom-scroll-link back-to-filters btf-l" href="#lisfw"><i class="fa fa-angle-double-up"></i><span>Back to Filters</span></a> 
                            <div class="container">
                                <!-- listing-item -->
                                <c:forEach items="${ requestScope.list }" var="t">
                                <div class="listing-item">
                                    <article class="geodir-category-listing fl-wrap">
                                        <div class="geodir-category-img">
                                            <img id="uploadFile" name="tour_thum_image" class="img" value="thum" />
                                            <script type="text/javascript">
												$(function() {
												    $("#uploadFile").on("change", function(){
												        var files = !!this.files ? this.files : [];
												        if (!files.length || !window.FileReader) return; 
												        if (/^image/.test( files[0].type)){ 
												            var reader = new FileReader(); 
												            reader.readAsDataURL(files[0]); 
												            reader.onloadend = function(){ 
												             $('.imagePreview').css("background-image", "url("+this.result+")"); 
												            };
												        }
												    });
												});
												</script>
                                            <div class="overlay"></div>
                                            <div class="list-post-counter"><span>4</span><i class="fa fa-heart"></i></div>
                                        </div>
                                        <div class="geodir-category-content fl-wrap">
                                         <c:forEach items="${ requestScope.tclist }" var="tc">
                                            <a class="listing-geodir-category" href="listing.html">${ tc.tour_category_name }</a>
                                         </c:forEach>
                                            <h3><a href="tdetail.do?tour_no=${ t.tour_no }">${ t.tour_name }</a></h3>
                                            <div class="geodir-category-options fl-wrap">
                                             <c:forEach items="${ requestScope.trlist }" var="tr">
                                                <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                    <span>${ tr.tour_review_no }</span>
                                                </div>
                                              </c:forEach>
                                                <div class="geodir-category-location"><a  href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>${ t.tour_roadaddress }</a></div>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                </c:forEach>
                                <!-- listing-item end-->                            
                                <div class="clearfix"></div>                            
                 
                            </div>
                            <a class="load-more-button" href="#">Load more <i class="fa fa-circle-o-notch"></i> </a>  
                        </div>
                        <!-- list-main-wrap end-->
                    </div>
                    <!--col-list-wrap -->  
                    <div class="limit-box fl-wrap"></div>
                    <!--section -->  

                    <!--section end -->  
                </div>
                <!--content end -->   
            </div>
            <!-- wrapper end -->
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
        <script type="text/javascript" src="resources/js/map_infobox.js"></script>
        <script type="text/javascript" src="resources/js/markerclusterer.js"></script>  
        <script type="text/javascript" src="resources/js/maps.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
<script>
$(function() {
	kakao.maps.event.addListener(map, 'idle', function() {
		// 현재 맵 정보
		var bounds = map.getBounds();
		// 중심 좌표
		var center = map.getCenter(); 
		
		// 레벨
		var level = map.getLevel();
			
		// 남서쪽 좌표
		var swLatLng = bounds.getSouthWest(); 
	   	var swLat = swLatLng.getLat();
	   	var swLng = swLatLng.getLng();
	   	
	   // 영역의 북동쪽 좌표를 얻어옵니다 
		var neLatLng = bounds.getNorthEast(); 
	    var neLat = neLatLng.getLat();
	    var neLng = neLatLng.getLng();
	   // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
		var boundsStr = bounds.toString();
	   
	   moveCenter(swLat, swLng, neLat, neLng, center, level);
		
	})
}); 
var centerLat = 33.450701;
var centerLng = 126.570667;
var levelNum = 9;
if(${!empty centerLat and !empty centerLng}){
	 centerLat = '${centerLat}';
	 centerLng = '${centerLng}';
	 levelNum = '${level}';
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
    level: levelNum // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


var list = [];
var tourName = [];
<c:forEach items="${ list }" var="tour">
	if(${week eq 6 || week eq 7}){
		insertMarker('${tour.tour_roadaddress}','${tour.tour_no}');
	}else {
		insertMarker('${tour.tour_roadaddress}','${tour.tour_no}');
	}
</c:forEach>


function moveCenter(swLat, swLng, neLat, neLng, center, level){	
	var userid = null;
	if(${!empty loginMember}){
		userid = '${loginMember.user_id}';	
		}
	location.href="tlist.do?swLat="+swLat+"&swLng="+swLng+"&neLat="+neLat+"&neLng="+neLng+"&userid="+userid +"&center="+center + "&level="+level;	
}


function insertMarker(roadaddress){
	var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(roadaddress, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			coords = new kakao.maps.LatLng(result[0].y, result[0].x);			     
		    var content = '<button id="markerInfo'+tourNo+'" class="markerInfo hover1" onclick="javascript:location.href="tdetail.do?tour_no='+ tourNo +'">&#8361;'+payMoney+'</button>';
			// 커스텀 오버레이가 표시될 위치입니다 
			// 커스텀 오버레이를 생성합니다
			var customOverlay = new kakao.maps.CustomOverlay({
			    map: map,
			    position: coords,
			    content: content,
			    yAnchor: 1 
			});				    
		}   
	});
}
</script>
    </body>
</html>