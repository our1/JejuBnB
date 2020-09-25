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
         <!-- loader -->
      <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div> 
        <!--loader end-->
        <!-- Main  -->
        <div id="main">
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
                    <c:if test="${empty loginMember }">
                    <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#" class="act-link">Home </a>                                  
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
                                    <a href="#">관광지 </a>    
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
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
                    <c:if test="${!empty loginMember and loginMember.admin_check eq 'Y' }">
                    	<div class="nav-holder main-menu">
                        <nav>
                            <ul>
                            	<li>
                                    <a href="#" class="act-link">Home </a>                                  
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
                                    <a href="#">관광지 </a>    
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
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
                                    <a href="#" class="act-link">Home </a>                                  
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
                                    <a href="#">관광지 </a>    
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
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
                                    <a href="#" class="act-link">Home </a>                                  
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
                                    <a href="#">관광지 </a>    
                                    <ul>
                                        <li><a href="index.html">이벤트</a></li>
                                        <li><a href="index2.html">자주 묻는 질문</a></li>
                                        <li><a href="index3.html">문의하기</a></li>
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
            <!--  header end -->	
            <!-- wrapper -->	
            <div id="wrapper">
                <!-- Content-->   
                <div class="content">
                    <!--section -->
                    <section class="scroll-con-sec hero-section" data-scrollax-parent="true" id="sec1">
                        <div class="media-container video-parallax" data-scrollax="properties: { translateY: '200px' }">
                            <div class="bg mob-bg" style="background-image: url(images/bg/1.jpg)"></div>
                            <div class="video-container" style="width: 941px; height: 776px;">
                                <video autoplay  loop muted  class="bgvid">
                                    <source src="resources/video/night.mp4" type="video/mp4">
                                </video>
                            </div>
                                    <!--  
                                        Vimeo code
                                        
                                         <div  class="background-vimeo" data-vim="97871257"> </div> --> 
                                    <!--  
                                        Youtube code 
                                        
                                         <div  class="background-youtube-wrapper" data-vid="Hg5iNVSp2z8" data-mv="1"> </div> -->
                            
                        </div>
                        <div class="overlay"></div>
                        <div class="hero-section-wrap fl-wrap">
                            <div class="container">
                                <div class="intro-item fl-wrap">
                                    <h2>We will help you to find all</h2>
                                    <h3>Find great places , hotels , restourants , shops.</h3>
                                </div>
                                <div class="main-search-input-wrap">
                                    <div class="main-search-input fl-wrap">
                                        <div class="main-search-input-item">
                                            <input type="text" placeholder="What are you looking for?" value=""/>
                                        </div>
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <input type="text" placeholder="Location" id="autocomplete-input" value=""/>
                                            <a href="#"><i class="fa fa-dot-circle-o"></i></a>
                                        </div>
                                        <div class="main-search-input-item">
                                            <select data-placeholder="All Categories" class="chosen-select" >
                                                <option>All Categories</option>
                                                <option>Shops</option>
                                                <option>Hotels</option>
                                                <option>Restaurants</option>
                                                <option>Fitness</option>
                                                <option>Events</option>
                                            </select>
                                        </div>
                                        <button class="main-search-button" onclick="window.location.href='listings-half-screen-map-list.html'">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bubble-bg"> </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec2" class="custom-scroll-link">Let's Start</a></div>
                        </div>
                    </section>
                    <!-- section end -->
                    <!--section -->
                    <section id="sec2">
                        <div class="container">
                            <div class="section-title">
                                <h2>Featured Categories</h2>
                                <div class="section-subtitle">Catalog of Categories</div>
                                <span class="section-separator"></span>
                                <p>Explore some of the best tips from around the city from our partners and friends.</p>
                            </div>
                            <!-- portfolio start -->
                            <div class="gallery-items fl-wrap mr-bot spad">
                                <!-- gallery-item-->
                                <div class="gallery-item">
                                    <div class="grid-item-holder">
                                        <div class="listing-item-grid">
											<div class="bg"  data-bg="images/all/1.jpg"></div>
                                            <div class="listing-counter"><span>10 </span> Locations</div>
                                            <div class="listing-item-cat">
                                                <h3><a href="listing.html">Conference and Event</a></h3>
                                                <p>Constant care and attention to the patients makes good record</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- gallery-item end-->
                                <!-- gallery-item-->
                                <div class="gallery-item gallery-item-second">
                                    <div class="grid-item-holder">
                                        <div class="listing-item-grid">
											<div class="bg"  data-bg="images/all/1.jpg"></div>
                                            <div class="listing-counter"><span>6 </span> Locations</div>
                                            <div class="listing-item-cat">
                                                <h3><a href="listing.html">Cafe - Pub</a></h3>
                                                <p>Constant care and attention to the patients makes good record</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- gallery-item end-->
                                <!-- gallery-item-->
                                <div class="gallery-item">
                                    <div class="grid-item-holder">
                                        <div class="listing-item-grid">
                                            <div class="bg"  data-bg="images/all/1.jpg"></div>
                                            <div class="listing-counter"><span>21 </span> Locations</div>
                                            <div class="listing-item-cat">
                                                <h3><a href="listing.html">Gym - Fitness</a></h3>
                                                <p>Constant care and attention to the patients makes good record</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- gallery-item end-->
                                <!-- gallery-item-->
                                <div class="gallery-item">
                                    <div class="grid-item-holder">
                                        <div class="listing-item-grid">
                                            <div class="bg"  data-bg="images/all/1.jpg"></div>
                                            <div class="listing-counter"><span>7 </span> Locations</div>
                                            <div class="listing-item-cat">
                                                <h3><a href="listing.html">Hotels</a></h3>
                                                <p>Constant care and attention to the patients makes good record</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- gallery-item end-->
                                <!-- gallery-item-->
                                <div class="gallery-item">
                                    <div class="grid-item-holder">
                                        <div class="listing-item-grid">
                                            <div class="bg"  data-bg="images/all/1.jpg"></div>
                                            <div class="listing-counter"><span>15 </span> Locations</div>
                                            <div class="listing-item-cat">
                                                <h3><a href="listing.html">Shop - Store</a></h3>
                                                <p>Constant care and attention to the patients makes good record</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- gallery-item end-->
                            </div>
                            <!-- portfolio end -->
                            <a href="listing.html" class="btn  big-btn circle-btn dec-btn  color-bg flat-btn">View All<i class="fa fa-eye"></i></a>
                        </div>
                    </section>
                    <!-- section end -->
                    <!--section -->
                    <section class="gray-section" style="height:960px;;">
                        <div class="container">
                            <div class="section-title">
                                <h2>Popular listings</h2>
                                <div class="section-subtitle">Best Listings</div>
                                <span class="section-separator"></span>
                                <p>Nulla tristique mi a massa convallis cursus. Nulla eu mi magna.</p>
                            </div>
                        </div>
                        <!-- carousel --> 
                        <div class="list-carousel fl-wrap card-listing ">
                            <!--listing-carousel-->
                            <div class="listing-carousel  fl-wrap ">
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>4</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Retail</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Lisa Smith</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Event in City Mol</a></h3>
                                                <p>Sed interdum metus at nisi tempor laoreet.  </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(7 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->                         
                                </div>
                                <!--slick-slide-item end-->
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>15</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Event</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Mark Rose</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Cafe "Lollipop"</a></h3>
                                                <p>Morbi suscipit erat in diam bibendum rutrum in nisl.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="4">
                                                        <span>(17 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->  
                                </div>
                                <!--slick-slide-item end-->  
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>13</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Gym </a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Nasty Wood</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Gym In Brooklyn</a></h3>
                                                <p>Morbiaccumsan ipsum velit tincidunt . </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="3">
                                                        <span>(16 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end--> 
                                </div>
                                <!--slick-slide-item end-->                                
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>3</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Shops</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Nasty Wood</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Shop in Boutique Zone</a></h3>
                                                <p>Morbiaccumsan ipsum velit tincidunt . </p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="4">
                                                        <span>(6 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end--> 
                                </div>
                                <!--slick-slide-item end-->                                
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>35</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Cars</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Kliff Antony</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Best deal For the Cars</a></h3>
                                                <p>Lorem ipsum gravida nibh vel velit.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(11 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->  
                                </div>
                                <!--slick-slide-item end-->                                                             
                                <!--slick-slide-item-->
                                <div class="slick-slide-item">
                                    <!-- listing-item -->
                                    <div class="listing-item">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <img src="resources/images/all/1.jpg" alt="">
                                                <div class="overlay"></div>
                                                <div class="list-post-counter"><span>553</span><i class="fa fa-heart"></i></div>
                                            </div>
                                            <div class="geodir-category-content fl-wrap">
                                                <a class="listing-geodir-category" href="listing.html">Restourants</a>
                                                <div class="listing-avatar"><a href="author-single.html"><img src="resources/images/avatar/1.jpg" alt=""></a>
                                                    <span class="avatar-tooltip">Added By  <strong>Adam Koncy</strong></span>
                                                </div>
                                                <h3><a href="listing-single.html">Luxury Restourant</a></h3>
                                                <p>Sed non neque elit. Sed ut imperdie.</p>
                                                <div class="geodir-category-options fl-wrap">
                                                    <div class="listing-rating card-popup-rainingvis" data-starrating2="5">
                                                        <span>(7 reviews)</span>
                                                    </div>
                                                    <div class="geodir-category-location"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i> 27th Brooklyn New York, NY 10065</a></div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <!-- listing-item end-->   
                                </div>
                                <!--slick-slide-item end-->                              
                            </div>
                            <!--listing-carousel end-->
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                        </div>
                        <!--  carousel end--> 
                    </section>
                    <!-- section end -->
                  
                </div>
                <!-- Content end -->      
            </div>
            <!-- wrapper end -->
            
            <!--footer -->
            <footer class="main-footer dark-footer  ">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>About Us</h3>
                                <div class="footer-contacts-widget fl-wrap">
                                    <p>In ut odio libero, at vulputate urna. Nulla tristique mi a massa convallis cursus. Nulla eu mi magna. Etiam suscipit commodo gravida. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam. </p>
                                    <ul  class="footer-contacts fl-wrap">
                                        <li><span><i class="fa fa-envelope-o"></i> Mail :</span><a href="#" target="_blank">yourmail@domain.com</a></li>
                                        <li> <span><i class="fa fa-map-marker"></i> Adress :</span><a href="#" target="_blank">USA 27TH Brooklyn NY</a></li>
                                        <li><span><i class="fa fa-phone"></i> Phone :</span><a href="#">+7(111)123456789</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>Our Last News</h3>
                                <div class="widget-posts fl-wrap">
                                    <ul>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Vivamus dapibus rutrum</a>
                                                <span class="widget-posts-date"> 21 Mar 09.05 </span> 
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title=""> In hac habitasse platea</a>
                                                <span class="widget-posts-date"> 7 Mar 18.21 </span> 
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Tortor tempor in porta</a>
                                                <span class="widget-posts-date"> 7 Mar 16.42 </span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>Our  Twitter</h3>
                                <div id="footer-twiit"></div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer-widget fl-wrap">
                                <h3>Subscribe</h3>
                                <div class="subscribe-widget fl-wrap">
                                    <p>Want to be notified when we launch a new template or an udpate. Just sign up and we'll send you a notification by email.</p>
                                    <div class="subcribe-form">
                                        <form id="subscribe">
                                            <input class="enteremail" name="email" id="subscribe-email" placeholder="Email" spellcheck="false" type="text">
                                            <button type="submit" id="subscribe-button" class="subscribe-button"><i class="fa fa-rss"></i> Subscribe</button>
                                            <label for="subscribe-email" class="subscribe-message"></label>
                                        </form>
                                    </div>
                                </div>
                                <div class="footer-widget fl-wrap">
                                    <div class="footer-menu fl-wrap">
                                        <ul>
                                            <li><a href="#">Home </a></li>
                                            <li><a href="#">Blog</a></li>
                                            <li><a href="#">Listing</a></li>
                                            <li><a href="#">Contacts</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sub-footer fl-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="about-widget">
                                    <img src="resources/images/logo.png" alt="">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="copyright"> &#169; CityBook 2018 .  All rights reserved.</div>
                            </div>
                            <div class="col-md-4">
                                <div class="footer-social">
                                    <ul>
                                        <li><a href="#" target="_blank" ><i class="fa fa-facebook-official"></i></a></li>
                                        <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-chrome"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-vk"></i></a></li>
                                        <li><a href="#" target="_blank" ><i class="fa fa-whatsapp"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--footer end  -->
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
                                            <input name="user_id" type="email"   onClick="this.select()"> 
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
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
		 <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwJSRi0zFjDemECmFl9JtRj1FY7TiTRRo&libraries=places&callback=initAutocomplete"></script>
    </body>
</html>