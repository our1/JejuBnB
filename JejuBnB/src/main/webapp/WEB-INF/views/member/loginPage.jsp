<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
	 <meta charset="UTF-8">
	  <title>JejuBnB</title>
	   <style type="text/css">
	   h1{
		   font-size : 48pt;
	   	   color : black;
	   }
	   #loginForm{
	   	width : 500px;
	   	height : 200px;
	   	border : 2px solid #96c93d;
	   	position : fixed; /* 본래 표시물 위치 기준 상대위치로 지정한다는 설정임 */
	   	left : 140px;
	   	top : 280px;
	   }
	   div form {
	   	font-size : 16pt;
	   	color : black;
	   	font-weight : bold;
	   	margin : 10px;
	   	padding : 10px;
	   }
	   #facebookbutton {
	   position : fixed;
	   left : 200px;
	   top : 220px;
	   }
	   #enrollbutton {
	   position : fixed;
	   left : 500px;
	   top : 480px;
	   }
	    #searchpwdPage {
	   position : fixed;
	   left : 140px;
	   top : 480px;
	   }
	   div#loginForm form input.pos {
	   	position : fixed; /* 절대좌표 */
	   	left : 330px;
	   }
	   div#loginForm form input[type=submit] {
	   margin :10px;
	   width : 250px;
	   height : 40px;
	   position : fixed;
	   left : 260px;
	   background : #96c93d;
	   color : white;
	   font-size : 16pt;
	   font-weight : bold;
	   }
	   </style>
	<script>
	  function statusChangeCallback(response) {  
	    console.log('statusChangeCallback');
	    console.log(response);                   
	    if (response.status === 'connected') {   
	      testAPI();  
	    } else {                                 
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this webpage.';
	    }
	  }
	  function checkLoginState() {               
	    FB.getLoginStatus(function(response) {   
	      statusChangeCallback(response);
	    });
	  }
	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '{341232443584667}',
	      cookie     : true,                     
	      xfbml      : true,                     
	      version    : '{v8.0}'           
	    });
	    FB.getLoginStatus(function(response) {   
	      statusChangeCallback(response);        
	    });
	  };
	  function testAPI() {                      
	    console.log('Welcome!  Fetching your information.... ');
	    FB.api('/me?fields=id,name,email', function(response) {
	      console.log('Successful login for: ' + response.name);
	      document.getElementById('status').innerHTML =
	        'Thanks for logging in, ' + response.name + '!';
	  		location.href ="facebooklogin.do?name="+response.name+"&email="+response.email
	    });
	  }
	  FB.login(function(response){
		});
	  FB.logout(function(response) {
		});
	  </script>
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=341232443584667&autoLogAppEvents=1" nonce="4fmSTMsw"></script>
	</head>
	<body>
		 <h1 align= "center"> JejuBnB 로그인</h1>
		 <div id="facebookbutton">
			<fb:login-button scope="public_profile,email" onlogin="checkLoginState();" data-size="large" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="false" data-width="700">
			Facebook으로 로그인
			</fb:login-button>
		 </div>
		 <div id="loginForm">
			 <form action="login.do" method="post">							
				 이메일 아이디 : <input type ="text" name="user_id" id="uid" class="pos"> <br>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 비밀번호 : <input type ="password" name="user_pwd" id="upwd" class="pos"> <br>
				 <input type = "submit" value="로그인"> 
			 </form>
		 </div>
		 <div id="searchpwdPage">
			<a href="searchpwdPage.do">비밀번호 찾기</a>
		</div> 
		 <div id="enrollbutton">
			<a href="email.do">이메일로 회원 가입</a>
		</div> 
		<div id="status">
		</div>
		<div id="fb-root">
		</div>
	</body>
</html>