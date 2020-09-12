<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp" 
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>JejuBnB</title>
      <style>
        @font-face {
           font-family: 'Cafe24Oneprettynight';
           src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
           font-weight: normal;
           font-style: normal;
         }

        body {
          margin: 0;
          padding: 0;
          background-color: #EEF1F1;
        }
        .mainhead {
          position: fixed;
          top: 0;
          left: 0;
          width: 500px;
          padding: 0;
          z-index: 10000;
          transition: all 0.2s ease-in-out;
          height: 100px;
          background: transparent;
        }
        .logo {
          position: absolute;
          top : 50%;
          left : 50%;
        }
        .logo img{
           width : 80%;
        }
        .mainimg {
          position: absolute;
          width: 1900px;
          height: 930px;
          background: url('resources/images/09.jpg');
          background-repeat: no-repeat;
          background-size: 100% 100%;
        }

        .res {
          width: 500px;
          height: 60px;
          -webkit-border-top-left-radius: 120px 120px;
          -webkit-border-bottom-left-radius: 120px 120px;
          -webkit-border-top-right-radius: 120px 120px;
          -webkit-border-bottom-right-radius: 120px 120px;
          background-color: white;
          position: absolute;
          left : 140%;
          top : 60%;
        }
        .dropdown {
          background: #fff;
          display: inline-block;
          padding: 12px 20px;
          border-radius: 10px;
          width: 100px;
          box-sizing: border-box;
          height: 50px;
          line-height: 25px;
          position: absolute;
          left : 1500px;
          top : 65px;
          cursor: pointer;
          color: #74809d;
          font-weight: bold;
        }
        .dropdown:after {
          content: "";
          display: block;
          width: 8px;
          height: 8px;
          position: absolute;
          transform: rotate(45deg);
          top: 17px;
          border-bottom: 2px solid #74809d;
          border-right: 2px solid #74809d;
          transition: 0.4s;
        }
        .dropdown-list  {
          width: 200px;
          box-sizing: border-box;
          padding: 0;
          position: absolute;
          border-radius: 10px;
          margin-top: 140px;
          left : 1400px;
          opacity: 0;
          transition: opacity 0.2s linear;
        }

        .dropdown-list li {
          list-style: none;
          background: #fff;
          padding: 12px 16px;
          border-left: 4px solid #fff;
          font-family: 'Cafe24Oneprettynight';
          font-weight: bold;
          color: #74809d;
          height: 50px;
          line-height: 25px;
          box-sizing: border-box;
        }
        ul li:first-child {
          border-radius: 5px 5px 0 0;
        }
        ul li:last-child {
          border-bottom: none;
          border-radius: 0 0 5px 5px;
        }
        ul li:hover {
          transition: 0.2s;
          cursor: pointer;
          border-left: 4px solid #FFC19E;
          color: #526187;
          background: #f5f5f5;
        }
        .active {
          transition: 0.2s;
          background: #fff;
          color: #fff;
        }
        .active:after {
          border-bottom: 2px solid #74809d;
          border-right: 2px solid #74809d;
          transform: rotate(-135deg);
          top: 20px;
          transition: 0.4s;
        }
        .opened {
          opacity: 1 !important;
        }
        .lnr {
          font-size: 1.4em;
          margin-right: 10px;
          position: relative;
          top: 2px;
        }
        .myimg {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          background-image: url('resources/images/프로필.jfif');
          background-size: cover;
          position: absolute;
          right: 10px;
          top : 5px;
        }
        .chkin{
          position: absolute;
          left : 8%;
          top : 20%;
          font-family: 'Cafe24Oneprettynight';
          font-size: 17px;
        }
        .chkinsub {
          color: #ADAFB6;
        }
        .chkout {
          position: absolute;
          left : 35%;
          top : 20%;
          font-family: 'Cafe24Oneprettynight';
          font-size: 17px;
        }
        .chkoutsub {
          color: #ADAFB6;
        }
        .people {
          position: absolute;
          left : 62%;
          top : 20%;
          font-family: 'Cafe24Oneprettynight';
          font-size: 17px;
          display: inline-block;
          cursor: pointer;
        }
        .people:after {
          content: "";
          display: block;
          width: 8px;
          height: 8px;
          position: absolute;
          transform: rotate(45deg);
          transition: 0.4s;
        }
        .peoplelist {
          width: 300px;
          box-sizing: border-box;
          font-family: 'Cafe24Oneprettynight';
          padding: 0;
          position: relative;
          margin-top: 80px;
          left : 300px;
          opacity: 0;
          transition: opacity 0.2s linear;
        }

        .peoplelist li {
          list-style: none;
          background: #fff;
          padding: 12px 16px;
          border-bottom: 1px solid rgba(0,0,0,0.1);
          border-left: 4px solid #fff;
          font-weight: bold;
          color: #74809d;
          height: 50px;
          line-height: 25px;
          box-sizing: border-box;
        }
        .peoplesub {
          color: #ADAFB6;
        }
        .searchbut {
          width: 50px;
          height: 50px;
          border-radius: 50%;
          background-color: #FFC19E;
          position: absolute;
          left : 88.5%;
          top : 9%;
        }
        .searchbut i{
         color : white;
         position: absolute;
         left : 18%;
         top : 15%;
        }
        .slist {
          font-family: 'Cafe24Oneprettynight';
          position: absolute;
          top : 127%;
          left : 10%;
          color : gray;
          font-size: 30px;
        }
        .tlist {
          font-family: 'Cafe24Oneprettynight';
          position: absolute;
          top : 127%;
          left : 20%;
          color : gray;
          font-size: 30px;
        }
        .onelisthr {
          position: absolute;
          top : 130%;
          left : 9%;
          border : 1px solid gray;
          width: 130px;
        }
        #onelist {
          display: grid;
          grid-template-columns: 300px 300px 300px 300px 300px;
          grid-template-rows: 500px ;
          position: absolute;
          top : 140%;
          left : 10%;
        }
        .one {
          border: 1px solid gray;
          box-shadow: 2px 2px gray;
          border-radius: 5px;
        }
        .two {
          margin-left: 10%;
          border: 1px solid gray;
          box-shadow: 2px 2px gray;
          border-radius: 5px;
        }
        .three {
          margin-left: 10%;
          border: 1px solid gray;
          box-shadow: 2px 2px gray;
          border-radius: 5px;
        }
        .four {
          margin-left:10%;
          border: 1px solid gray;
          box-shadow: 2px 2px gray;
          border-radius: 5px;
        }
        .five {
          margin-left: 10%;
          border: 1px solid gray;
          box-shadow: 2px 2px gray;
          border-radius: 5px;
        }
        .block {
          border: 1px solid gray;
          border-radius: 5px;
          box-shadow: 2px 2px gray;
          position: absolute;
          top : 105%;
          height: 150px;
          width: 298px;
        }
        .block2{
          border: 1px solid gray;
          border-radius: 5px;
          box-shadow: 2px 2px gray;
          position: absolute;
          top : 105%;
          height: 150px;
          width: 268.5px;
        }
        .moreview {
          position: absolute;
          top : 215%;
          left : 90%;
        }
        .moreview a{
          text-decoration: none;
          font-family: 'Cafe24Oneprettynight';
          color : gray;
          font-size: 25px;
        }
      </style>
  </head>
  <body>
  
     <div class="mainhead">
          <div class="logo">
            <img src="resources/images/로고.png" >
          </div>
     <div class="res">
        <div class="chkin">
            체크인<br>
            <div class="chkinsub">날짜 추가</div>
        </div>
        <div class="chkout">
            체크아웃<br>
            <div class="chkoutsub">날짜 추가</div>
        </div>
        <div class="people">
            인원<br>
            <div class="peoplesub">게스트 추가</div>
        </div>
        <ul class="peoplelist">
           <li> 인원 수 <span class="peoplus"></span></li>
        </ul>
        <script type="text/javascript">
        var people = document.querySelector('.people');
        var peoplelist = document.querySelector('.peoplelist');

        people.onclick = function openList(){
        people.classList.toggle('active');
        peoplelist.classList.toggle('opened');
    }
        
        function winOpen1()
    	{
    	window.open("moveFilterList.do","필터","width=900,height=1000");
    	}
    	
    	function winOpen2()
    	{
    	window.open("myNoticeList.do?userid=${loginMember.user_id}","알림","width=800,height=500");
    	}
    	
    	function winOpen3()
    	{
    	window.open("adUNoticeList.do","알림","width=1000,height=500");
    	}
    	
    	function movePage(){
    		 window.open("loginPage.do", "로그인", 
    			"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
    	}
        </script>
        <div class="searchbut">
          <i class="fas fa-search fa-2x"></i>
        </div>
     </div>
     <div class="dropdown"><span class="lnr lnr-menu"></span><span class="myimg"></span></div>
     <c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
     	<ul class="dropdown-list">
     	<li onclick="javascript:location.href='moveMyPage.do'"><span class="lnr lnr-cog"></span> 마이페이지</li>
     	<li onclick="javascript:location.href='moveAdminPage.do'"><span class="lnr lnr-cog"></span> 관리자 페이지</li>
       <li><span class="lnr lnr-envelope"></span> 내 쿠폰</li>
       <li><span class="lnr lnr-cog"></span> 내가 정한 숙소</li>
       <li><span class="lnr lnr-cog"></span> 사장님 신청</li>
       <li><span class="lnr lnr-cog"></span> 알림</li>
       <li><span class="lnr lnr-cog"></span> 고객센터</li>
       <li onclick="javascript:location.href='logout.do'"><span class="lnr lnr-cog"></span> 로그아웃</li>
     </ul>
     </c:if>
     <c:if test="${empty loginMember }">
     	<ul class="dropdown-list">
       <li><span class="lnr lnr-cog"></span> 고객센터</li>
       <li onclick="movePage()">로그인</li>
     </ul>
     </c:if>
     <c:if test="${!empty loginMember and  empty loginMember.admin_check}">
     <ul class="dropdown-list">
       <li onclick="javascript:location.href='moveMyPage.do'"><span class="lnr lnr-cog"></span> 마이페이지</li>
   		<li onclick="javascript:location.href='moveAdminPage.do'"><span class="lnr lnr-cog"></span> 관리자 페이지</li>
       <li><span class="lnr lnr-cog"></span> 내가 정한 숙소</li>
       <li><span class="lnr lnr-cog"></span> 사장님 신청</li>
       <li><span class="lnr lnr-cog"></span> 알림</li>
       <li><span class="lnr lnr-cog"></span> 고객센터</li>
       <li onclick="winOpen2()"><span class="lnr lnr-cog"></span> 내 알림 글 보기</li>
       <li onclick="winOpen1()"><span class="lnr lnr-cog"></span> 관리자 필터 관리</li>
       <li onclick="winOpen3()"><span class="lnr lnr-cog"></span> 관리자 알림 관리</li>
       <li onclick="javascript:location.href='logout.do'"><span class="lnr lnr-cog"></span> 로그아웃</li>
       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"><span class="lnr lnr-cog"></span> 내 숙소 보기</li>
       <li onclick="javascript:location.href='roomlist.do'"><span class="lnr lnr-cog"></span> 룸 리스트</li>
       <li onclick="javascript:location.href='moveRoomWrite.do'"><span class="lnr lnr-cog"></span> 사장님 신청하기</li>
       <li onclick="javascript:location.href='main.do'"><span class="lnr lnr-cog"></span> Home</li>
     </ul>
     </c:if>
          </div>
     <script type="text/javascript">
     var dropdown = document.querySelector('.dropdown');
     var dropdownList = document.querySelector('.dropdown-list');

     dropdown.onclick = function openList(){
     dropdown.classList.toggle('active');
     dropdownList.classList.toggle('opened');
 }
     </script>
     <div class="mainimg">
     </div>
     <div class="slist">hotel list</div>
     <div class="tlist">tour list</div>
     <hr class="onelisthr">
 <div id="onelist">
   <div class="one">
      <div class="block"></div>
   </div>
   <div class="two">
     <div class="block2"></div>
   </div>
   <div class="three">
     <div class="block2"></div>
   </div>
   <div class="four">
     <div class="block2"></div>
   </div>
   <div class="five">
     <div class="block2"></div>
   </div>
 </div>
 <div class="moreview">
    <a href="tlist.do"> 더 보기 </a>
</div>

  </body>
</html>
