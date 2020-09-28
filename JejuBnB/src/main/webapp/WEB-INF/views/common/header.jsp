<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML>
<html>
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>JejuBnB</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="robots" content="index, follow"/>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <!--=============== css  ===============-->	
        <link type="text/css" rel="stylesheet" href="resources/css/reset.css">
        <link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
        <link type="text/css" rel="stylesheet" href="resources/css/style.css">
        <link type="text/css" rel="stylesheet" href="resources/css/color.css">
        <!--=============== favicons ===============-->
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC95dqGGKveZsk11F5F7irIrx0ExnBNfDk&libraries=places&callback=initAutocomplete"></script>
    </head>
    <body>       
            <!-- header-->
            <header class="main-header dark-header fs-header sticky">
                <div class="header-inner">
                    <div class="logo-holder">
                        <a class="navbar-brand" href="main.do"><div class="logo">JejuBnB</div></a>
                    </div>
                    <form action="roomList.do" method="post">
                    <div class="header-search vis-header-search">
                        <div class="header-search-input-item">
                            <input type="text" placeholder="checkin" value=""/>
                        </div>
                        <div class="header-search-select-item">
                            <input type="text" placeholder="people" class="chosen-select"/>
                        </div>
                         <div class="header-search-select-item">
                            <input type="text" placeholder="people" class="chosen-select"/>
                        </div>
                        <button class="header-search-button" type="submit">Search</button>                        
                    </div>
                    </form>
                    <div class="show-search-button"><i class="fa fa-search"></i> <span>Search</span></div>
                    <div class="show-reg-form modal-open"><i class="fa fa-sign-in"></i>Sign In</div>
                    <!-- nav-button-wrap--> 
                    <div class="nav-button-wrap color-bg">
                        <div class="nav-button">
                            <span></span><span></span><span></span>
                        </div>
                    </div>
                    <!-- nav-button-wrap end-->
                    <!--  navigation --> 
                    <c:if test="${ empty loginMember }">
                    <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#">Home </a>                                  
                                </li>
                                <li>
                                    <a href="#">숙소 </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">숙소 등록</a></li>                                    
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">관광지 </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_category_no=1">자 연</a></li>
                                        <li><a href="tlist.do?tour_category_no=2">음 식</a></li>
                                        <li><a href="tlist.do?tour_category_no=3">체 험</a></li>
                                    </ul>                                
                                </li>
                               
                                <li>
                                    <a href="#">고객센터 </a>     
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <c:if test="${ !empty loginMember and loginMember.admin_check eq 'Y' }">
                    	<div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#">Home </a>                                  
                                </li>
                                <li>
                                    <a href="#">숙소 </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">숙소 등록</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">관광지 </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_category_no=1">자 연</a></li>
                                        <li><a href="tlist.do?tour_category_no=2">음 식</a></li>
                                        <li><a href="tlist.do?tour_category_no=3">체 험</a></li>
                                        <li><a href="test.do">관광지 등록</a></li>
                                    </ul>                               
                                </li>
                               
                                <li>
                                    <a href="#">고객센터 </a>     
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <c:if test="${!empty loginMember and loginMember.admin_check eq 'N' and loginMember.host_check eq 'Y' }">
                    	<div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#">Home </a>                                  
                                </li>
                                <li>
                                    <a href="#">숙소 </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">숙소 추가</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">관광지 </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_category_no=1">자 연</a></li>
                                        <li><a href="tlist.do?tour_category_no=2">음 식</a></li>
                                        <li><a href="tlist.do?tour_category_no=3">체 험</a></li>
                                        <li><a href="test.do">관광지 등록</a></li>
                                    </ul>                               
                                </li>
                               
                                <li>
                                    <a href="#">고객센터 </a>     
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <c:if test="${!empty loginMember and loginMember.admin_check eq 'N' and loginMember.host_check eq 'N'}">
                    	<div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#">Home </a>                                  
                                </li>
                                <li>
                                    <a href="#">숙소 </a>  
                                    <ul>
                                        <li><a href="moveRoomWrite.do">숙소 등록</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul>                                 
                                </li>
                                <li>
                                    <a href="tlist.do">관광지 </a>    
                                    <ul>
                                        <li><a href="tlist.do?tour_category_no=1">자 연</a></li>
                                        <li><a href="tlist.do?tour_category_no=2">음 식</a></li>
                                        <li><a href="tlist.do?tour_category_no=3">체 험</a></li>
                                        <li><a href="test.do">관광지 등록</a></li>
                                    </ul>                               
                                </li>
                               
                                <li>
                                    <a href="#">고객센터 </a>     
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
                                    </ul> 
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </c:if>
                    <!-- navigation  end -->
                </div>          
            </header>
              <!--register form -->
            <div class="main-register-wrap modal">
                <div class="main-overlay"></div>
                <div class="main-register-holder">
                    <div class="main-register fl-wrap">
                        <div class="close-reg"><i class="fa fa-times"></i></div>
                        <h3>Sign In <span>JejuBnB</span></h3>
                        <div class="soc-log fl-wrap">
                            <p>더 빨리 로그인하거나 등록하려면 소셜 계정을 사용하십시오.</p>
                            <a href="#" class="facebook-log"><i class="fa fa-facebook-official"></i>페이스북 로그인</a>
                        </div>
                        <div class="log-separator fl-wrap"><span>또는</span></div>
                        <div id="tabs-container">
                            <ul class="tabs-menu">
                                <li class="current"><a href="#tab-1">로그인</a></li>
                                <li><a href="#tab-2">회원가입</a></li>
                            </ul>
                            <div class="tab">
                                <div id="tab-1" class="tab-content">
                                    <div class="custom-form">
                                        <form method="post" action="login.do"  name="registerform">
                                            <label>이메일 * </label>
                                            <input name="user_id" type="text"   onClick="this.select()"> 
                                            <label >비밀번호 * </label>
                                            <input name="user_pwd" type="password"   onClick="this.select()"> 
                                            <button type="submit"  class="log-submit-btn"><span>Log In</span></button> 
                                            <div class="clearfix"></div>
                                           
                                        </form>
                                        <div class="lost_password">
                                            <a href="#">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab">
                                    <div id="tab-2" class="tab-content">
                                        <div class="custom-form">
                                            <form method="post" action="enroll.do"  name="registerform" class="main-register-form" id="main-register-form2">
                                                <label >이름 * </label>
                                                <input name="user_name" type="text" placeholder="이름"> 
                                                <label>이메일 * </label>
                                                <input name="user_id" type="email" placeholder="이메일 " onClick="this.select()" >
                                                <label>비밀번호 * </label>
                                                <input name="user_pwd" type="password" placeholder="비밀번호 " onClick="this.select()">                                              
                                                <label >전화번호 * </label>
                                                <input name="phone" type="tel" placeholder="전화번호 " onClick="this.select()"> 
                                                <label >생년월일 </label>
                                                <input name="birthday" type="text" placeholder="생년월일 "  onClick="this.select()"> 
                                                <button type="submit"     class="log-submit-btn"  ><span>회원가입</span></button>  
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--register form end -->
             <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwJSRi0zFjDemECmFl9JtRj1FY7TiTRRo&libraries=places&callback=initAutocomplete"></script>
    
            
            </body>
            </html>