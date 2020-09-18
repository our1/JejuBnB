<%@ page language="java" contentType="text/html;  charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<style>
		/* 사이드바 스타일 */
		.sidenav {
			height:500px;
			width: 300px;
			position: fixed;
			z-index:1;
			left: 0;
			background-color: rgb(0,154,200);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			    margin-top: 20%;
  			 margin-left: 5%;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #fff;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: #000;
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		.openmenu:hover {
			color:rgb(0,154,200);
			transition:0.5s ease-in-out;
		}
		.openmenu {
			padding-top: 0;
			margin-top: 15%;
		    margin-left: 5%;
			width: 15%;
   			height: 5%;
			font-size: 45px;
			cursor:pointer;
			position: fixed;
			transition:0.5s ease-in-out;
		}
		.openmenu > i {
			font-size: 30px;
		}
		/* 미디어쿼리 적용 */
		@media screen and (max-height:450px) {
			.sidenav {
				padding-top:15px;
			}
			.sidenav a {
				font-size: 18px;
			}
		}
	</style>
<title>Coupon</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br>
<br>
<c:import url="/WEB-INF/views/common/servicecenterside.jsp"/>
<!-- <div id="mysidenav" class="sidenav" value="고객센터">
		<a href="#" class="closebtn" onclick='closeNav()'>x</a>
		<a href="couponPage.do">쿠폰</a>
		<a href="policyPage.do">약관 및 개인정보</a>
		<a href="#">이벤트</a>
		<a href="#">1:1문의</a>
		<a href="#">자주묻는질문(FAQ)</a>
	</div>
	<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> 고객센터</span>

	<script>
		function openNav() {
			document.getElementById('mysidenav').style.width = '250px';
		}
		function closeNav() {
			document.getElementById('mysidenav').style.width = '0';
		}
	</script> -->
	<center>
<h1>쿠폰리스트</h1>
<br>

<form action="deleteCoupon" method="post">

<c:forEach items="${coupon}" var="co">
<br>
<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
<tr>
<th>금액</th>
<td>${co.coupon_money }</td>
</tr>
<tr>
<th>시작</th>
<td>${co.coupon_begin }</td>
</tr>
<tr>
<th>끝</th>
<td>${co.coupon_end }</td> <input type="checkbox" name="coupon_no" >
</tr>
<br>
</c:forEach>
<tr>
	<th colspan = "2" align="center" padding="10">
		<a href="couponaddPage.do">등록</a>
	<input type="submit" value="삭제">
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</table>
</form>
</center>
</body>
</html>