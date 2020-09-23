<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
 
    <style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
     body {
     	background-color : #fff;
     }
     .logo {
      font-family: 'Alex Brush', cursive;
      font-size: 45px;
      position: relative;
      left: 27%;
      color: lightcoral;
     }
    .check_btn {
	    background: #FFC19E;
	    color: white;
	    display: block;
	    width: 92.5%;
	    max-width: 680px;
	    height: 50px;
	    border-radius: 8px;
	    margin: 0 auto;
	    border: none;
	    cursor: pointer;
	    font-size: 14px;
	    font-family: 'Roboto', sans-serif;
	    box-shadow: 0 15px 30px rgba(255, 193, 158, 0.36);
	    -webkit-transition: .2s linear;
	    transition: .2s linear;
    }
	.alr {
	font-family: 'Roboto', sans-serif;
	position: relative;
    top: -382%;
    left: 5%;
	}
	.xbu {
		border : none;
		background: none;
	    margin-left: 3%;
	    color: red;
	}
	
	li {
		list-style: none;
	    margin-left: 4%;
	    font-size: 14px;
	}
    </style>
  </head>
  <body>
  	<div class="logo">JejuBnB</div>
      <c:forEach items="${ list }" var="notice">
          <form action="deleteUNotice.do" method="post">
               <input type="hidden" name="userid" value="${loginMember.user_id }">
               <input type="hidden" name="noticeno" value="${notice.notice_no }">
               <li> ${notice.notice_content } <button id="delete" type="submit" class="xbu"><span>&#10005;</span></button></li>
          </form>
      </c:forEach>
  </body>
</html>