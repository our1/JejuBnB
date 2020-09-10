<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp" 
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
div.lineA { 
   height : 100px; 
   border : 1px solid gray;
   float: left;
   position : relative;
   left : 120px;
   margin : 5px;
   padding : 5px;
}

div#banner {
   width : 750px;
   padding : 0;   
}

div#loginBox {
   width : 274px;
   font-size : 9pt;
   text-align : left;
   padding-left : 20px;
}

div#loginBox button {
   width : 250px;
   height : 35px;
   background-color : navy;
   color : white;
   margin-top : 10px;
   margin-bottom : 15px;   
   font-size : 14pt;
   font-weight : bold;
}
div#banner img { 
   margin : 0; 
   padding : 0;
   width : 750px;
   height : 110px;
}
section {
   position: relative;
   left: 120px;
}
section > div { width: 360px; background: #ccffff; }
section div table { width: 350px; background: white; }
</style>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function movePage(){
	 window.open("loginPage.do", "로그인", 
		"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}


</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr style="clear:both;">
<div id="banner" class="lineA">
<img src="resources/images/photo2.jpg">
</div>
<c:if test="${ empty loginMember }">
<div id="loginBox" class="lineA">
JejuBnB 사이트 방문을 환영합니다.<br>
<!-- <button onclick="javascript:location.href='views/member/loginPage.html';">로그인 하세요.</button><br> --> 
<button onclick="movePage();">로그인 하세요</button><br>
<a>아이디/비밀번호 조회</a>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

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
</div>
</c:if>

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
        </script>
        <div class="searchbut">
          <i class="fas fa-search fa-2x"></i>
        </div>
     </div>
     <div class="dropdown"><span class="lnr lnr-menu"></span><span class="myimg"></span></div>
     <c:if test="${empty loginMember }">
     	<ul class="dropdown-list">
       <li><span class="lnr lnr-home"></span> 마이페이지</li>
       <li><span class="lnr lnr-envelope"></span> 내 쿠폰</li>
       <li><span class="lnr lnr-cog"></span> 내가 정한 숙소</li>
       <li><span class="lnr lnr-cog"></span> 사장님 신청</li>
       <li><span class="lnr lnr-cog"></span> 알림</li>
       <li><span class="lnr lnr-cog"></span> 고객센터</li>
       <li><a href="loginPage.do">로그인</a></li>
     </ul>
     </c:if>
     <c:if test="${!empty loginMember }">
     <ul class="dropdown-list">
       <li><span class="lnr lnr-home"></span> 마이페이지</li>
       <li><span class="lnr lnr-envelope"></span> 내 쿠폰</li>
       <li><span class="lnr lnr-cog"></span> 내가 정한 숙소</li>
       <li><span class="lnr lnr-cog"></span> 사장님 신청</li>
       <li><span class="lnr lnr-cog"></span> 알림</li>
       <li><span class="lnr lnr-cog"></span> 고객센터</li>
       <li onclick="winOpen2()"><span class="lnr lnr-cog"></span> 내 알림 글 보기</li>
       <li onclick="winOpen1()"><span class="lnr lnr-cog"></span> 관리자 필터 관리</li>
       <li onclick="winOpen3()"><span class="lnr lnr-cog"></span> 관리자 알림 관리</li>
       <li onclick="javascript:location.href='logout.do'"><span class="lnr lnr-cog"></span> 로그아웃</li>
       <li onclick="javascript:location.href='movemyroom.do?userid=${loginMember.user_id }'"><span class="lnr lnr-cog"></span> 내 숙소 보기</li>
       <li onclick="javascript:location.href='roomlist.do'"><span class="lnr lnr-cog"></span> 룸 리스트</li>
       <li onclick="javascript:location.href='moveroomwrite.do'"><span class="lnr lnr-cog"></span> 사장님 신청하기</li>
       <li onclick="javascript:location.href='main.do'"><span class="lnr lnr-cog"></span> Home</li>
     </ul>
     </c:if>
          </div>
     <script type="text/javascript">
     var dropdown = document.querySelector('.dropdown');
     var dropdownList = document.querySelector('.dropdown-list');

<c:if test="${ !empty loginMember and  loginMember.user_id eq 'admin' }">
<div id="loginBox" class="lineA">
${ sessionScope.loginMember.user_name } 님<br>
<button onclick="javascript:location.href='logout.do';">로그아웃</button><br>
<c:url var="callMyinfo" value="myinfo.do">
     <c:param name="user_id" value="${ loginMember.user_id }"></c:param>
</c:url>
<a href="${ callMyinfo }">My Page</a>
<!-- 쿼리스트링(Query String) : ?이름=전송값&이름=전송값 -->
</div>
</c:if>


<c:if test="${ !empty sessionScope.loginMember and ! (loginMember.user_id eq 'admin')}">
<div id="loginBox" class="lineA">
${ sessionScope.loginMember.user_name } 님<br>
<button onclick="javascript:location.href='logout.do';">로그아웃</button><br>
<a>쪽지</a> &nbsp; &nbsp; 
<a>메일</a> 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<c:url var="callMyinfo2" value="myinfo.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<a href="${ callMyinfo2 }">My Page</a>
<!-- 쿼리스트링(Query String) : ?이름=전송값&이름=전송값 -->
</div>
</c:if>
<hr style="clear:left;">
<section>
<!-- 최근 등록 공지글 3개 조회 출력  -->
<div style="float:left;border:1px solid navy;padding:5px;margin:5px">
<h4>최근 공지글</h4>
<table id="newnotice" border="1" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>날짜</th></tr>
</table>
</div>
<!-- 조회수 많은 게시글 3개 조회 출력 -->
<div style="float:left;border:1px solid navy;padding:5px;margin:5px">
<h4>인기 게시글</h4>
<table id="toplist" border="1" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>조회수</th></tr>
</table>
</div>
</section>
<hr style="clear:both;">
<!-- 상대경로만 사용 가능함 -->
<%-- <%@ include file="views/common/footer.jsp" %> --%>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>