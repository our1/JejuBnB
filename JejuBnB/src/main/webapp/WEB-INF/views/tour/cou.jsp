<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
	@font-face {
   font-family: 'Cafe24Oneprettynight';
   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
   font-weight: normal;
   font-style: normal;
 }
 body {
 	margin : 0;
 	padding : 0;
 	font-family: 'Cafe24Oneprettynight';
 }
 
 input.clo {
 	position : relative;
 	left : 58%;
 	background: none;
 	border : none;
 }
 a {
 	text-decoration : none;
 	color : #fff;
 	position : absolute;
 	top: 84%;
    left: 39%;
 }
</style>
</head>
<body>
<div class="couimg">
	<img src="resources/images/coupon.png" width=100% height=100%>
	<a href="#">자세히 보기</a>
</div>
<input type="checkbox">오늘 하루 보지 않기
<input class="clo" type="button" value="X"onclick="self.close()">
</body>
</html>