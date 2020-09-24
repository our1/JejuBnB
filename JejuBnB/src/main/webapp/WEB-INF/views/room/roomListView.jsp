<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<script type="text/javascript" src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function moveFilterPage()
		{	
		var popupX = (document.body.offsetWidth / 2) - (800 / 2);
		//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (800 / 2);
		//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

			window.name = "ListView";
	    	window.open("moveFilterPage.do","알림","width=800,height=800, left="+ popupX + ", top="+ popupY);
	    	
		}
	
		
		function insertH(room_no){
			var roomNo = room_no;
			var user_id = '${loginMember.user_id}';
			var id = 'insertHeart' + roomNo;
			$.ajax({
				url : "insertMyRoom.do",
				data : {user_id:user_id, room_no:roomNo},
				type : "post",
				success : function(result){
					if(result == "ok") {
						$("#"+id).empty();
						$("#"+id).append('<li style="float:right;"id="deleteHeart'+roomNo+'"><button class="heart" onclick="deleteH('+roomNo+')"><img id="like" src="${ pageContext.servletContext.contextPath}/resources/images/하트.png" style="width:20px;height:20px;"></button></li>');
						$("#"+id).show();
					}else {
						alert('잘못된 접근 입니다.');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}								
			});
			
		};
		
		function deleteH(room_no){
			var roomNo = room_no;
			var id = 'deleteHeart' + roomNo;
			$.ajax({
				url : "deleteMyRoom.do",
				data : {room_no:roomNo},
				type : "post",
				success : function(result){
					if(result == "ok"){
						$("#"+id).empty();
						$("#"+id).append('<li style="float:right;" id="insertHeart'+roomNo+'"><button class="heart" onclick="insertH('+roomNo+');"><img id="nolike" src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width:20px;height:20px;"></button></li>');
						$("#"+id).show();
					}else {
						alert('잘못된 접근 입니다.');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}			
			});
			
		}
		
	// 사진 슬라이드
	$(function(){
		var slideIndex = 1;
		<c:forEach items="${list}" var="room">
			showSlides(slideIndex,${room.room_no});
		</c:forEach>
	});
	
	var slideIndex = 1;
	function plusSlides(n, roomNo) {
		showSlides(slideIndex += n, roomNo);
	}
	
	function currentSlide(n, roomNo) {
		 showSlides(slideIndex = n, roomNo);
	}
	
	function showSlides(n, roomNo) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides"+roomNo);
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = 'none';  
	  }
	  slides[slideIndex-1].style.display = "block";  
	}
</script>
    <style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
      html,
      body {
        margin: 0;
        padding: 0;
      }
      
      #main {
      	height  : 800px;
      	position : relative;
      	margin : 0;
      }
      
      .container1 {
      	position : relative;
      	width : 40%;
		display : grid;
		grid-template-columns : 1fr 1fr;
		grid-template-rows : repeat(4, 500px);
		gap : 10px 5px;
		padding-left : 10px;
		margin-top : 100px;
		}
		
		
		.container1 li{
			list-style : none;
		}
		
		#RoomContent{
			margin-left : 0;
			border-top : 1px solid gray;
			padding : 0;
		}
		
		#items{	
			height : 50px;	
			padding : 10px;
			
		}
		
		#page{
			padding : 10px;
		}
		
		#right {
			height : 100%;
		}
	
		#map {	
			width: 1130px;
		    height: 1000px;
		    position: sticky;
		    left: 42%;
		    bottom: 50px;
		}
    
    
	    #moveNext{
	    	width : 25px;
	    	height : 25px;
	    	border-radius : 50%;
	    	background:#ffffff;
	    	text-align : center;
	    	line-height : 10px;
	    	border : 1px solid gray;
	    	box-shadow : 0 0 1px rgb(221,221,221);
	    	font-weidth : bold;
	    }    
	    
	    #page{
	    	width : 40%;
	    	height : 50px;
	    }
	    
	    .heart {
	    	background : none;
	    	border : none;
	    }
	    .main_one{
	    	width : 100%;
	    }
	    
	    
	    .headButton{
	    	font-family: 'Roboto', sans-serif;
			width: 140px;
			height: 40px;
			border:1px  #FFF999 solid;
			font-size: 15px;
			margin-left : 15px;
			border-radius : 2em;
			outline : none;
			background-color: #FF9999;
			text-align:center; 
			cursor: pointer; 
			color:#ffffff; 
			transition:all 0.9s, color 0.3;
	    }
	    
	    .headButton:hover{color:#FFF999;}
	    .hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; }
	    
	    .place_info span {
		 	color: #FF9999;
		 }

/* 	   ///////////////////////////////////////////////   슬라이드 css*/	

.roomImg{
	width : 300px;
	height : 300px;
	border-radius : 5%;
}
/* Slideshow container */
.slideshow-container {
  position: relative;
  margin: 300px;
  padding : 0;
  margin : 0;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: 30px;
  height : 30px;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 50%;
  padding : 7px;
  text-decoration : none;
}

.prev:hover, .next:hover {
  background-color: #ffffff;
}

/* Position the "next button" to the right */
.next {
  right: 50px;
  border-radius: 50%;
}


/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

 
 
 .markerInfo{
 	width : 100px;
 	height : 30px;
 	font-family: 'Roboto', sans-serif;
	border:1px  #FFF999 solid;
	font-size: 15px;
	margin-left : 15px;
	border-radius : 2em;
	outline : none;
	background-color: #FF9999;
	text-align:center; 
	cursor: pointer; 
	color:#ffffff; 
	transition:all 0.9s, color 0.3;
 }
 
	    .markerInfo:hover{color:#FFF999;}
	    .hover1:hover{ box-shadow:200px 0 0 0 rgba(0,0,0,0.5) inset; }
	    
	    
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div style="margin:0;padding:0;height:2300px;">
<div id="main">
<div id="items">
<h6 id="resultS" style="margin-left:15px;">${listCount }개 숙소 검색 . ${inMonth }월${inday }일 - ${outMonth }월${outday }일 . 게스트 ${people }명 </h6>
<button class="headButton hover1" onclick="javascript:location.href='moveRoomBList.do'">리스트로 보기</button>
<button class="headButton hover1" onclick="moveFilterPage()">필터 추가하기</button> <br>
<h3>제주도의 숙소</h3>
<hr style="margin : 5px;">
</div>
<div class="container1">
				<c:forEach items="${list }" var="room">
					<div class="main_one">
						<div class="slideshow-container">
							<c:forEach items="${rflist }" var="rf">
								<c:if test="${room.room_no eq rf.room_no }">
									<div class="mySlides${rf.room_no}">
										<img class="roomImg" src="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ rf.rename_file }">
									</div>
								</c:if>
							</c:forEach>
							
							<a class="prev" onclick="plusSlides(-1, ${room.room_no});">&#10094;</a>
							<a class="next" onclick="plusSlides(1, ${room.room_no});">&#10095;</a>
							
						</div>
							
							<div class="place_info">
								<a href="moveDetailView.do?room_no=${room.room_no}"><h3>${room.room_name }</h3></a>
								<p style="width:300px;font-size:12px;">${room.room_address }</p>
								<div class="rating_days d-flex justify-content-between" style="width:300px;">
									<span class="d-flex justify-content-center align-items-center">
										<c:set var="rvCheck" value="true" />
											<c:forEach items="${rvlist }" var="rv">
												<c:if test="${rvCheck }">												
													<c:if test="${rv.room_no eq room.room_no }">
														<span >&#9733;</span> 
														<fmt:formatNumber value="${(rv.clean_score +  rv.value_score + rv.service_score)/3 }" pattern=".0"/> (${rv.reply_no } Review)
														<c:set var="rvCheck" value="false" />
													</c:if>
												</c:if>
											</c:forEach>
										<c:if test="${rvCheck }">
											<span >&#9733;</span> 
											0.0 (0 Review)
										</c:if>
									</span>
									<div class="days" style="font:bold;">
									<c:if
										test="${week eq 6 || week eq 7}">
										<fmt:formatNumber value="${room.room_weekend }"
											type="currency" />
									</c:if> <c:if test="${week ne 6 && week ne 7}">
										<fmt:formatNumber value="${room.room_weekday }"
											type="currency" />
									</c:if>
										<c:if test="${!empty loginMember}">
											<c:if test="${!empty mlist }">
												<c:set var="check" value="true" />
												<c:forEach items="${mlist }" var="roomNo">
													<c:if test="${check }">
														<c:if test="${room.room_no eq roomNo.room_no }">
															<li style="float: right;"
																id="deleteHeart${room.room_no }"><button
																	class="heart" onclick="deleteH(${room.room_no})">
																	<img id="like"
																		src="${ pageContext.servletContext.contextPath}/resources/images/하트.png"
																		style="width: 20px; height: 20px;">
																</button></li>
															<c:set var="check" value="false" />
														</c:if>
													</c:if>
												</c:forEach>

												<c:if test="${check}">
													<li style="float: right;" id="insertHeart${room.room_no }"><button
															class="heart" onclick="insertH(${room.room_no});">
															<img id="nolike"
																src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png"
																style="width: 20px; height: 20px;">
														</button></li>
												</c:if>
											</c:if>
											<c:if test="${empty mlist }">
												<li style="float: right;" id="insertHeart${room.room_no }"><button
														class="heart" onclick="insertH(${room.room_no});">
														<img id="nolike"
															src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png"
															style="width: 20px; height: 20px;">
													</button></li>
											</c:if>
										</c:if>
										<c:if test="${empty loginMember }">
											<li style="float: right;"><button class="heart"
													onclick="javascript:alert('로그인 후 이용해주세요.')">
													<img
														src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png"
														style="width: 20px; height: 20px;">
												</button></li>
										</c:if>
									</div>
								</div>
							</div>
						</div>
				</c:forEach>
			</div>
<div id="page" style="text-align:center;">
	<c:if test="${ currentPage == 1 }">
	<button id="moveNext" onclick="moveNext(${currentPage})">&lt;</button>
	</c:if>	

<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
	<c:if test="${ p eq currentPage }">	
			<font weight="bold"><b>${ p }</b></font>			
	</c:if>
	<c:if test="${ p ne currentPage }">
		<button id="moveBack" onclick="moveNext(${currentPage})">&gt;</button>
	</c:if>
</c:forEach>
	
	<c:if test="${ currentPage == maxPage }">
	<button id="moveNext" onclick="moveNext(${currentPage})">&gt;</button>
	</c:if>

</div>
<div id="testAjax">

</div>

</div>

<div id="map"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
<script>
$(function() {	
	var checkin = null;
	var checkout = null;
	var people = 1;
	var userid = null;

	if(${!empty checkin}){
	    checkin = ${checkin};
		checkout = ${checkout};
		people = ${people};
		if(${!empty loginMember}){
		userid = '${loginMember.user_id}';	
		}
	}
	
	
	
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
	   
	   moveCenter(swLat, swLng, neLat, neLng, checkin, checkout, people, userid, center, level);
		
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
var roomName = [];
<c:forEach items="${list }" var="room">
	if(${week eq 6 || week eq 7}){
		insertMarker('${room.room_roadaddress}', ${room.room_weekend},'${room.room_no}');
	}else {
		insertMarker('${room.room_roadaddress}', ${room.room_weekday},'${room.room_no}');
	}
</c:forEach>


function moveCenter(swLat, swLng, neLat, neLng, checkin, checkout, people, userid,center, level){	
	location.href="roomlist.do?swLat="+swLat+"&swLng="+swLng+"&neLat="+neLat+"&neLng="+neLng+"&checkin="+checkin+"&checkout="+checkout+"&people="+people+"&userid="+userid +"&center="+center + "&level="+level;	
}


function insertMarker(roadaddress, roomWeek, roomNo){
	var money = roomWeek;
	var payMoney = money.toLocaleString();
	var geocoder = new kakao.maps.services.Geocoder();
		geocoder.addressSearch(roadaddress, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			coords = new kakao.maps.LatLng(result[0].y, result[0].x);			     
		    var content = '<button id="markerInfo'+roomNo+'" class="markerInfo hover1" onclick="javascript:location.href="moveDetailView.do?room_no='+ roomNo +'">&#8361;'+payMoney+'</button>';
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
<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>