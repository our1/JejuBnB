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
<link href="resources/css/header.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/loginPage.css" >
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
   var popupX = (document.body.offsetWidth / 2) - (900 / 2);

   var popupY= (window.screen.height / 2) - (1000 / 2);

   window.open("moveFilterList.do","필터","width=900,height=1000, left="+ popupX + ", top="+ popupY);
}
function winOpen2() {
   window.open("myNoticeList.do?userid=${loginMember.user_id}","알림","width=376,height=600, left=1290, top=120");
}
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
/* 
FB.login(function(response){
   });
FB.logout(function(response) {
   });
    */
/* $(function(){
		if('${loginMember.user_id}' != null){
			$.ajax ({
			      url : "myNoticeList.do",
			      data : {userid : '${loginMember.user_id}'},
			      dataType : "json",
			      type : "post",
			      success : function(obj){
			    	console.log(obj);
			    	var objStr = JSON.stringify(obj);
			    	
			    	var jsonObj = JSON.parse(objStr);
			    	
			    	var output = "";
			    	
			    	for(var i in jsonObj.list){
			    		output += '<form action="deleteUNotice.do" method="post">';
			    		output += '<input type="hidden" name="userid" value="${loginMember.user_id }">';
			    		output += '<input type="hidden" name="noticeno" value="'+ jsonObj.list[i].notice_no+'">';
			    		output += '<li class="alarmco">'+ jsonObj.list[i].notice_content+'<button id="delete" type="submit" class="xbu"><span>&#10005;</span></button></li>';
			    		output += '</form>';    				
			    	}
			    	$(".noticeList").html(output);
			      },
			      error : function(request, status, errorData){
						console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
					}       
			   });
		}else {
		   alert("로그인 후 이용해 주세요");
		}
	
}); */
</script>
<style type="text/css">
    .alarmlogo {
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
   .alarmco {
      list-style: none;
       margin-left: 4%;
       font-size: 14px;
   }
     .chat {
    list-style: none;
    margin: 0;
    padding: 0;
   }
   .chat li {
       margin-bottom: 10px;
       padding-bottom: 5px;
       border-bottom: 1px dotted #B3A9A9;
   }
   .chat li.left .chat-body {
       margin-left: 60px;
   }
   .chat li.right .chat-body {
       margin-right: 60px;
   }
   .chat li .chat-body p {
       margin: 0;
       color: #777777;
   }
   .panel .slidedown .glyphicon, .chat .glyphicon {
       margin-right: 5px;
   }
   .panel-body {
       overflow-y: scroll;
       height: 500px;
   }
</style>
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
         <li data-toggle="modal" data-target="#alarm" id="alarmList"><a class="notifications"><i class="fa fa-bell-o"></i><span class="badge">1</span></a></li>
         <li data-toggle="modal" data-target="#message"><a class="messages"><i class="fa fa-envelope-o"></i><span class="badge">10</span></a></li>
         <li class="dropdown">
            <a href="#" data-toggle="dropdown" class="dropdown-toggle user-action"><img src="resources/images/프로필.jfif" class="avatar" alt="Avatar">${ loginMember.user_name } 님<b class="caret"></b></a>
            <c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
            <ul class="dropdown-menu">
               <li onclick="javascript:location.href='moveAdminPage.do'"> 관리자 </li>
                 <li onclick="winOpen1()"> 필터 관리</li>
                   <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
                  <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
                 <li class="divider">
                 <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
                 <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
              </ul>
           </c:if>
         <c:if test="${!empty loginMember and  empty loginMember.admin_check and loginMember.host_check ne 'Y'}">
          <ul class="dropdown-menu">
             <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
             <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
             <li onclick="javascript:location.href='moveRoomWrite.do'"> 사장님 신청하기</li>
             <li class="divider">
             <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
             <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
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
                <li data-toggle="modal" data-target="#loginPage">로그인</li>
              </ul>
           </c:if>
         <c:if test="${!empty loginMember and  empty loginMember.admin_check and loginMember.host_check eq 'Y'}">
               <ul class="dropdown-menu">
                 <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
                 <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
                 <li onclick="javascript:location.href='moveRoomWrite.do'"> 숙소 추가 등록</li>
                 <li onclick="#">내 숙소 보기</li>
                 <li class="divider">
                 <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
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
 
   <div class="modal fade" id="loginPage" role="dialog">
       <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
       <div class="modal-content">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
           <div class="modal-body">
               <div class="container-fluid">
           <div class="row no-gutter">
               <div class="col-md-6 d-none d-md-flex bg-image"></div>
               <div class="col-md-6 bg-light">
                   <div class="login d-flex align-items-center py-5">
                       <div class="container">
                           <div class="row">
                               <div class="col-lg-10 col-xl-7 mx-auto">
                                   <form action="login.do" method="post">   
                                       <div class="form-group mb-3">
                                           <input id="inputEmail" type="text" placeholder="Email address" required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="user_id">
                                       </div>
                                       <div class="form-group mb-3">
                                           <input id="inputPassword" type="password" placeholder="Password" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="user_pwd">
                                       </div>
                                       <div class="custom-control custom-checkbox mb-3">
                                           <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                                           <label for="customCheck1" class="custom-control-label">비밀번호 기억하기</label> 
                                       </div>
                                       <button type="submit" class="signin__btn">로그인</button>
                                       <div class="separator">
                                         <p>OR</p>
                                       </div>
                                           <a href="email.do" class="enroll">회원 가입</a> <br>
                                           <a href="searchpwdPage.do" class="findpas">비밀번호 찾기</a>
                                       <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" data-size="large" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="false" class="google__btn">
                                     <i class="fa fa-facebook"></i>
                                     Sign in with FaceBook
                               </fb:login-button>
                                   </form>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
         </div>
              <div id="status">
            </div>
            <div id="fb-root">
            </div>
           </div>
       </div>
     </div>
</div>

  <div class="modal fade" id="alarm" role="dialog">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
     
       <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
             <div class="alarmlogo">JejuBnB</div>
             <div class="noticeList">
           <%--  <c:forEach items="${ list }" var="notice">
                <form action="deleteUNotice.do" method="post">
                     <input type="hidden" name="userid" value="${loginMember.user_id }">
                     <input type="hidden" name="noticeno" value="${notice.notice_no }">
                     <li class="alarmco"> ${notice.notice_content } <button id="delete" type="submit" class="xbu"><span>&#10005;</span></button></li>
                </form>
             </c:forEach> --%>
             </div>
         </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" id="message" role="dialog">
       <div class="modal-dialog" style="max-width: 100%; width: 800; display: table;">
       
        <div class="modal-content">
           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
          
          <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-comment"></span> Message
                            <div class="btn-group pull-right">
                            </div>
                         </div>
                  <div class="panel-body">
                     <ul class="chat">
                     <c:forEach items ="${ list2 }" var = "ms">
                     <c:if test="${ ms.writer == loginMember.user_name }">
                     <div align="right">
                     ${ ms.writer } :  ${ ms.content }<br>
                     </div>
                     </c:if>
                     <c:if test="${ ms.writer != loginMember.user_name }">
                     <div align="left">
                     ${ ms.writer } :  ${ ms.content }<br>
                     </div>
                     </c:if>
                     </c:forEach>
                   </ul>
                  </div>
                       <div class="panel-footer">
                         <div class="input-group">
                        <form action="insertMessageDetail.do" method="post" >
                           <input id="Mensaje" type="text" name="content" class="form-control input-sm" placeholder="메세지를 입력하세요..." />
                           <input type="hidden" name="writer" value="${ loginMember.user_name }">
                           <input type="hidden" name="message_no" value="${ messagelist.message_no }">
                           <input type="submit" value="보내기"><span class="input-group-btn"></span>      
                        </form>
                        <button onclick="javascript:location.href='${ message }'">메시지 리스트</button>
                     </div>
                     </div>
                 </div>
             </div>
         </div>
      </div>
    </div>
   </div>
  </div>
</body>
</html>