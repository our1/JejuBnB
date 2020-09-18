<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
      <link rel="stylesheet" href="resources/css/tourDetail.css" >
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
   <div class="thead"></div>
   		<div style="padding: 100px 0px 0px 0px;"></div>
         <div class="container">
          <div data-am-fadeshow="next-prev-navigation">

            <!-- Radio -->
            <input type="radio" name="css-fadeshow" id="slide-1" />
            <input type="radio" name="css-fadeshow" id="slide-2" />
            <input type="radio" name="css-fadeshow" id="slide-3" />

            <!-- Slides -->
            <div class="fs-slides">
              <div class="fs-slide" style="background-image: url('resources/images/01.jpg');">
              </div>
              <div class="fs-slide" style="background-image: url('resources/images/02.jpg');"></div>
              <div class="fs-slide" style="background-image: url('resources/images/03.jpg');"></div>
            </div>

            <!-- Quick Navigation -->
            <div class="fs-quick-nav">
              <label class="fs-quick-btn" for="slide-1"></label>
              <label class="fs-quick-btn" for="slide-2"></label>
              <label class="fs-quick-btn" for="slide-3"></label>
            </div>

            <!-- Prev Navigation -->
            <div class="fs-prev-nav">
              <label class="fs-prev-btn" for="slide-1"></label>
              <label class="fs-prev-btn" for="slide-2"></label>
              <label class="fs-prev-btn" for="slide-3"></label>
            </div>

            <!-- Next Navigation -->
            <div class="fs-next-nav">
              <label class="fs-next-btn" for="slide-1"></label>
              <label class="fs-next-btn" for="slide-2"></label>
              <label class="fs-next-btn" for="slide-3"></label>
            </div>

          </div>
         </div>
      <div class="tname">${ tour.tour_name }</div>
             <div class="facebook"><img src="resources/images/face.png"></div>
             <div class="instagram"><img src="resources/images/insta.png"></div>
			 <a id="create-kakao-link-btn" href="javascript:;">
			  <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
			</a>
			<script type="text/javascript">
			  function sendLink() {
				  Kakao.Link.createScrapButton(ScrapButtonSettings)({
					  container: '#kakao-link-btn',
					  requestUrl: 'https://developers.kakao.com'
					});
				  }
				function moveReviewPage() {
					window.open("trlist.do", "리뷰",
							"width=800, height=900, left=300, top=50, toolbar=no, menubar=no, scrollbars=no, menubar=no");
				}
			</script>
             <input type="checkbox" class="checkbox" id="checkbox" />
              <label for="checkbox">
                    <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                      <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                        <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2"/>
                        <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5"/>

                        <g id="grp7" opacity="0" transform="translate(7 6)">
                          <circle id="oval1" fill="#9CD8C3" cx="2" cy="6" r="2"/>
                          <circle id="oval2" fill="#8CE8C3" cx="5" cy="2" r="2"/>
                        </g>

                        <g id="grp6" opacity="0" transform="translate(0 28)">
                          <circle id="oval1" fill="#CC8EF5" cx="2" cy="7" r="2"/>
                          <circle id="oval2" fill="#91D2FA" cx="3" cy="2" r="2"/>
                        </g>

                        <g id="grp3" opacity="0" transform="translate(52 28)">
                          <circle id="oval2" fill="#9CD8C3" cx="2" cy="7" r="2"/>
                          <circle id="oval1" fill="#8CE8C3" cx="4" cy="2" r="2"/>
                        </g>

                        <g id="grp2" opacity="0" transform="translate(44 6)">
                          <circle id="oval2" fill="#CC8EF5" cx="5" cy="6" r="2"/>
                          <circle id="oval1" fill="#CC8EF5" cx="2" cy="2" r="2"/>
                        </g>

                        <g id="grp5" opacity="0" transform="translate(14 50)">
                          <circle id="oval1" fill="#91D2FA" cx="6" cy="5" r="2"/>
                          <circle id="oval2" fill="#91D2FA" cx="2" cy="2" r="2"/>
                        </g>

                        <g id="grp4" opacity="0" transform="translate(35 50)">
                          <circle id="oval1" fill="#F48EA7" cx="6" cy="5" r="2"/>
                          <circle id="oval2" fill="#F48EA7" cx="2" cy="2" r="2"/>
                        </g>

                        <g id="grp1" opacity="0" transform="translate(24)">
                          <circle id="oval1" fill="#9FC7FA" cx="2.5" cy="3" r="2"/>
                          <circle id="oval2" fill="#9FC7FA" cx="7.5" cy="2" r="2"/>
                        </g>
                      </g>
                    </svg>
                  </label>
        <div class="ts">
            <span>&#9733;</span> 4.8 ( 135 ) &nbsp;&nbsp; ${ tour.tour_address }
              <hr class="tshr">
        </div>
        <div style="padding: 190px 0px 0px 0px;"></div>
        <div class="tcontent"><div class="tct">프로그램</div><br>
             <div class="tcon">${ tour.tour_content }</div>
            <hr class="tchr">
        </div>
        <div style="padding: 190px 0px 0px 0px;"></div>
        <div class="tmap">
          방문 장소<br>
	<div id="map" style="width:1300px;height:400px;z-index:0;"></div>

	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f30a1bf673317be5978a11f2b404a16b"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 6, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도 중심 좌표 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'center_changed', function () {
			console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});

		// 지도 확대 레벨 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'zoom_changed', function () {
			console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
		});

		// 지도 영역 변화 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'bounds_changed', function () {
			var mapBounds = map.getBounds(),
				message = '지도의 남서쪽, 북동쪽 영역좌표는 ' +
							mapBounds.toString() + '입니다.';

			console.log(message);	
		});

		// 지도 시점 변화 완료 이벤트를 등록한다
		kakao.maps.event.addListener(map, 'idle', function () {
			var message = '지도의 중심좌표는 ' + map.getCenter().toString() + ' 이고,' + 
							'확대 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
			console.log(message);
		});

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		});	

		// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
		kakao.maps.event.addListener(map, 'drag', function () {
			var message = '지도를 드래그 하고 있습니다. ' + 
							'지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
			console.log(message);
		});
	</script>
        <hr class="tmhr">
      </div>
      <div style="padding: 80px 0px 0px 0px;"></div>
      <div class="treview">
        <span>&#9733;</span> 4.8 점 ( 135 ) 개
            <div class="reviewlist">
            <c:forEach items="${ requestScope.list }" var="tour_review">
              <div class="one">
                ${ tour_review.user_id } <br>
                <div class="reviewdate"><fmt:formatDate value="${ tour_review.tour_review_date }" pattern="yyyy-MM-dd" /></div><br>
					${ tour_review.tour_review_content }
              </div>
             </c:forEach>
              <button class="reviewmore" onclick="moveReviewPage()">리뷰 더보기</button>
         <hr class="trhr">
      </div>
      </div>
      <div style="padding: 140px 0px 0px 0px;"></div>
      <div class="moreimpo">
        알아두어야 할 사항 <br>
          <div class="moreimpocontent">
          ${ tour.tour_moreinfo }
          </div>
          <hr class="mihr">
      </div>
      <div style="padding: 100px 0px 0px 0px;"></div>
		   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		   <script src="resources/js/head.js"></script>
		   <script src="resources/js/tourDetail.js"></script>
   <c:import url="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
