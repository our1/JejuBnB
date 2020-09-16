<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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
        <div style="padding: 100px 0px 0px 0px;"></div>
        <div class="tcontent"><div class="tct">프로그램</div><br>
             ${ tour.tour_content }
            <hr class="tchr">
        </div>
        <div style="padding: 100px 0px 0px 0px;"></div>
        <div class="tmap">
          방문 장소
          <div class="tcmap">
        </div>
        <hr class="tmhr">
      </div>
      <div style="padding: 100px 0px 0px 0px;"></div>
      <div class="treview">
        <span>&#9733;</span> 4.8 점 ( 135 ) 개
            <div class="reviewlist">
              <div class="one">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                너무 좋았습니다 ㅠㅠㅠㅠ 예상보다 훨씬 큰 감동과 경험을 하고 갑니다.
                다음 번 제주도에 온다면 또 하고, 주변에도 추천해드릴려구요 !!
              </div>
              <div class="two">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                너무 좋았습니다 ㅠㅠㅠㅠ 예상보다 훨씬 큰 감동과 경험을 하고 갑니다.
                다음 번 제주도에 온다면 또 하고, 주변에도 추천해드릴려구요 !!
              </div>
              <div class="three">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                소중한 경험이었습니다! 사진도 너무 예쁘게 나왔고 호스트분이 너무 친절하셨어요 ㅎㅎ
              </div>
              <div class="four">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                딸과 함께 예쁜 사진 찍고 싶어서 했는데 정말 특별한 경험으로 인생사진 남겼어요.
                보는것보다 훨씬 더 좋았고요 원색이 사진이 잘나온다고 하셨는데 빨간색 원피스 강추입니다!! 정말 사진이 예술로 나와요
              </div>
              <div class="five">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                너무 친절하시고 센스있게 촬영해주셨어요!! 별자리도 보여주시고 밤하늘 별사진도 찍었구요
                ㅠㅠ진짜 후회없이 체험했습니다! 다음 제주도에서도 또 이용하고싶어요^^
              </div>
              <div class="six">
                작성자 아이디 <br>
                <div class="reviewdate">2020 / 09 / 10 </div><br>
                늦은시간이라 걱정했는데 위험하지도않고 너무 재밌고 특별한 경험이었어요^^
                한번은 꼭 체험해봐야될 경험인거같아요 담번에 항마력좀 키워서 다시 재도전할 계획입니다^^
              </div>
              <button class="reviewmore">리뷰 더보기</button>
         <hr class="trhr">
      </div>
      </div>
      <div style="padding: 100px 0px 0px 0px;"></div>
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
