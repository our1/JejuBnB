<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JejuBnB</title>
<link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
<style>
    .logo {
      font-family: 'Alex Brush', cursive;
      font-size: 35px;
      position: relative;
      left: 14%;
      top: 17%;
      color: lightcoral;
    }
    .form-inline {
        display: inline-block;
    }
	.navbar {
		background: transparent;;
		padding-left: 16px;
		padding-right: 16px;
		box-shadow: 0 0 4px rgba(0,0,0,.1);
		position: fixed;
    	width: 100%;
    	border : none;
    	z-index: 10000;
        transition: all 0.4s ease-in-out;
	}
	.nav img {
		border-radius: 50%;
		width: 36px;
		height: 36px;
		margin: -8px 0;
		float: left;
		margin-right: 10px;
	}
	.navbar .navbar-brand {
		color: #555;
		padding-left: 0;
		padding-right: 50px;
		font-family: 'Merienda One', sans-serif;
	}
	.navbar .navbar-brand i {
		font-size: 20px;
		margin-right: 5px;
	}
	.navbar ul li i {
		font-size: 18px;
	}
	.navbar .dropdown-menu i {
		font-size: 16px;
		min-width: 22px;
	}
	.navbar .dropdown.open > a {
		background: none !important;
	}
	.navbar .dropdown-menu {
		border-radius: 1px;
		border-color: #e5e5e5;
		box-shadow: 0 2px 8px rgba(0,0,0,.05);
		cursor: pointer;
	}
	.navbar .dropdown-menu li a {
		color: #fff;
		padding: 8px 20px;
		line-height: normal;
	}
	.navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
		color: #fff;
	}
	.navbar .dropdown-menu .material-icons {
		font-size: 21px;
		line-height: 16px;
		vertical-align: middle;
		margin-top: -2px;
	}
	.navbar .badge {
		background: #f44336;
		font-size: 11px;
		border-radius: 20px;
		position: absolute;
		min-width: 10px;
		padding: 4px 6px 0;
		min-height: 18px;
		top: 5px;
	}
	.navbar ul.nav li a.notifications, .navbar ul.nav li a.messages {
		position: relative;
		margin-right: 10px;
		color : #fff;
	}
	.navbar ul.nav li a.messages {
		margin-right: 20px;
	}
	.navbar a.notifications .badge {
		margin-left: -8px;
	}
	.navbar a.messages .badge {
		margin-left: -4px;
	}
	.navbar .active a, .navbar .active a:hover, .navbar .active a:focus {
		background: transparent !important;
	}
	@media (min-width: 1200px){
		.form-inline .input-group {
			width: 300px;
			margin-left: 30px;
		}
	}
	@media (max-width: 1199px){
		.form-inline {
			display: block;
			margin-bottom: 10px;
		}
		.input-group {
			width: 100%;
		}
	}
  .dropdown-menu li {
    margin-left: 7%;
    font-family: 'Cafe24Oneprettynight';
    font-size: 17px;
  }
  #na.active {
    background-color : rgba(25, 25, 25, 0.85);
    -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
    border : none;
  }
</style>
<script type="text/javascript">
$(window).on("scroll", function() {
  if($(window).scrollTop() > 50) {
      $("#na").addClass("active");
  } else {
      //remove the background property so it comes transparent again (defined in your css)
     $("#na").removeClass("active");
  }
});
function winOpen1() {
	window.open("moveFilterList.do","필터","width=900,height=1000");
}
function winOpen2() {
	window.open("myNoticeList.do?userid=${loginMember.user_id}","알림","width=1700,height=900, left=100, top=50");
}
function winOpen3() {
	window.open("adUNoticeList.do","알림","width=1700,height=900, left=100, top=50");
}
function movePage() {
 	window.open("loginPage.do", "로그인",
	"width=1700, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes, status= no, location= no" ); 
}
function message() {
	window.open("message.do?user_one=${loginMember.user_id }&user_two=user02" , "메세지함",
"width=400, height=700, left=600, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
}
</script>
</head>
<body>
<nav class="navbar navbar-default" id="na">
	<div class="navbar-header">
		<a class="navbar-brand" href="main.do"><div class="logo">JejuBnB</div></a>
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			<span class="navbar-toggler-icon"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<div id="navbarCollapse" class="collapse navbar-collapse">
		<ul class="nav navbar-nav navbar-right">
			<li onclick="winOpen2();"><a class="notifications"><i class="fa fa-bell-o"></i><span class="badge">1</span></a></li>
			<li onclick="message();"><a href="#" class="messages"><i class="fa fa-envelope-o"></i><span class="badge">10</span></a></li>
			<li class="dropdown">
				<a href="#" data-toggle="dropdown" class="dropdown-toggle user-action"><img src="resources/images/프로필.jfif" class="avatar" alt="Avatar"> 전범관 님 <b class="caret"></b></a>
				<c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
				<ul class="dropdown-menu">
					<li onclick="javascript:location.href='moveAdminPage.do'"> 관리자 </li>
			        <li onclick="winOpen1()"> 필터 관리</li>
		       		<li onclick="winOpen3()"> 알림 관리</li>
			        <li class="divider">
			        <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
			        <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
		        </ul>
		     </c:if>
		     <c:if test="${empty loginMember }">
		     	<ul class="dropdown-menu">
		     	   <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
		     	   <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
		     	   <li class="divider">
			       <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
			       <li onclick="movePage()">로그인</li>
		        </ul>
		     </c:if>
		     <c:if test="${!empty loginMember and  empty loginMember.admin_check}">
			     <ul class="dropdown-menu">
			       <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
			       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
			       <li onclick="javascript:location.href='moveRoomWrite.do'"> 사장님 신청하기</li>
			       <li class="divider">
			       <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
			       <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
			       <li class="divider">
			       <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
			       <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
			     </ul>
		     </c:if>
			</li>
		</ul>
	</div>
</nav>
</body>
</html>