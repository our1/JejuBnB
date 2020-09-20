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
<script src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function moveFilterPage()
		{	
			window.name = "ListView";
	    	window.open("moveFilterPage.do","알림","width=1000,height=500");
	    	
		}
	$(document).ready(function(){
		
		function insertH(room_no){
			var roomNo = room_no;
			var user_id = '${loginMember.user_id}';
			
			$.ajax({
				url : "insertMyRoom.do",
				data : {user_id:user_id, room_no:roomNo},
				type : "post",
				success : function(result){
					if(result == "ok") {
						$("#nolike").html('<img id="like" src="${ pageContext.servletContext.contextPath}/resources/images/하트.png" style="width:20px;height:20px;">');
					}else {
						alert('잘못된 접근 입니다.');
					}
				},
				error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}								
			});
			
		};
	});
</script>
    <style type="text/css">

      html,
      body {
        margin: 0;
        padding: 0;
      }
      
      a{
      	text-decoration : none;
      }
      
      #main {
      	height  : 800px;
      	position : relative;
      }
      
      .container {
      	width : 40%;
      	height : 1600px;
		display : grid;
		grid-template-columns : 200px 500px;
		grid-template-rows : repeat(8, 200px);
		gap : 10px 5px;
		padding-left : 10px;
		}
		
		.container img{
			width : 200px;
			height : 200px;
			padding : 0;
		}
		
		.container #roomImg{
			width : 200px;
			height : 200px;
			margin : 0;
			border-radius : 5px;
			
		}
		
		.container #roomImg img{
			width : 100%;
			height : 100%;
			margin : 0;
			padding : 0;
			border-radius : 5px;
			
		}
		
		.container li{
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
	
		#map {	
			width : 1100px;
			height : 1000px;
			position: sticky;			
			left : 40%;
 			bottom : 150px;
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
	    
	   
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr>
<div>
<h1 align="center">숙소 리스트 페이지</h1>
<div id="main">
<div id="items">
${listCount }개 숙소 검색 . ${inMonth }월${inday }일 - ${outMonth }월${outday }일 . 게스트 ${people }명 <br>
<button onclick="javascript:location.href='moveRoomBList.do'">리스트로 보기</button>

<button onclick="moveFilterPage()">필터 추가하기</button>
</div>
<div class="container">
<c:forEach items="${list }" var="room" >
	<div id="roomImg" >
		<img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }">
	</div>
	<div id="RoomContent">
		<ul>
			<li> 숙소 이름 : <a href="moveDetailView.do?room_no=${room.room_no}">${room.room_name }</a> </li>
			<li> 숙소 주소 : ${room.room_address } </li>
			<li> 금액 : 
			<c:if test="${week eq 6 || week eq 7}">
				<fmt:formatNumber value="${room.room_weekday }" type="currency" />
			</c:if>
			<c:if test="${week ne 6 && week ne 7}">
				<fmt:formatNumber value="${room.room_weekend }" type="currency" />
			</c:if>
			</li>
			<c:if test="${!empty loginMember}" >
				<c:if test="${!empty mlist }">
					<c:forEach items="${mlist }" var="roomNo">
						<c:if test="${room.room_no eq roomNo }">
							<li style="float:right;"><button class="heart" id="deleteHeart"><img id="like" src="${ pageContext.servletContext.contextPath}/resources/images/하트.png" style="width:20px;height:20px;"></button></li>
						</c:if>
						<c:if test="${room.room_no ne roomNo }">
							<li style="float:right;"><button class="heart" id="insertHeart" onclick="insertH(${room.room_no})"><img id="nolike" src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width:20px;height:20px;"></button></li>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${empty mlist }" >
					<li style="float:right;"><button class="heart" id="insertHeart" onclick="insertH(${room.room_no})"><img id="nolike" src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width:20px;height:20px;"></button></li>
				</c:if>
			
			</c:if>
			<c:if test="${empty loginMember }">
				<li style="float:right;"><button class="heart" onclick="javascript:alert('로그인 후 이용해주세요.')"><img src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width:20px;height:20px;"></button></li>
			</c:if>
			
		</ul>
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

</div>


<div id="map"></div>
</div>

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
var roomName = [];
<c:forEach items="${list }" var="room">
roomName.push('${room.room_name}');
list.push('${room.room_roadaddress}');
</c:forEach>



for(var i = 0; i < '${fn:length(list)}'; i++){
	console.log(roomName[i]);
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


</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>