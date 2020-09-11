<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
        <link rel="stylesheet" href="resources/css/tourNoMapList.css" >
  </head>
  <body>
    <div class="mainhead">
         <div class="logo">
           <img src="resources/images/무제.png">
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
   <div class="thead"></div>
    <h1 class="tour">관광지</h1>
     <button class="live">자연</button>
     <button class="cook">맛집</button>
     <button class="act">액티비티</button>
     <button class="movelist" onclick="javascipt:location.href='tlist.do'"></button>
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
       <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
       <script src="resources/js/head.js"></script>
  </body>
</html>