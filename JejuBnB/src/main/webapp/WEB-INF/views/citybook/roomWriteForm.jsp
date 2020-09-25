<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html lang="en">
    <head>
        <!--=============== basic  ===============-->
        <meta charset="UTF-8">
        <title>Citybook -Directory Listing Template</title>
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
    </head>
    <body>
        <!-- loader -->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--  loader end -->
        <!-- Main   -->
        <div id="main">
<c:import url="/WEB-INF/views/citybook/header.jsp" />
           
            <!-- wrapper -->	
            <div id="wrapper">
                <!--content -->  
                <div class="content">
                    <!--section --> 
                    <section id="sec1">
                        <!-- container -->
                        <div class="container">
                            <!-- profile-edit-wrap -->
                            <div class="profile-edit-wrap">
                                <div class="profile-edit-page-header">
                                    <h2>숙소 등록 하기</h2>
                                    <div class="breadcrumbs"><a href="#">Home</a><a href="#">숙소</a><span>숙소 등록하기</span></div>
                                </div>
                                <div class="row">
                                   
                                    <div class="col-md-9" style="margin-left:13%;">
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>숙소 기본 정보</h4>
                                            </div>
                                             <div class="custom-form">
                                                <label>숙소 이름 <i class="fa fa-home"></i></label>
                                                <input type="text" placeholder="숙소 이름을 입력해 주세요." style="padding-left : 40px;"/>
                                               
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end--> 
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>Location /  Contacts</h4>
                                            </div>
                                            <div class="custom-form">
                                                <label>Address<i class="fa fa-map-marker"></i></label>
                                                <input type="text" placeholder="Address of your business" value=""/>
                                                <div class="row">
                                                	<div class="col-md-6">
                                                        <label>Latitude:<i class="fa fa-map-marker"></i></label>
                                                        <input type="text" id="lat" placeholder="" value=""/>                                                    
                                                    </div>
                                                	<div class="col-md-6">
                                                        <label>Longitude:<i class="fa fa-map-marker"></i></label>
                                                        <input type="text" id="long" placeholder="" value=""/>                                                    
                                                    </div>
                                                </div>
                                                <div class="map-container">
                                                    <div id="singleMap" data-latitude="40.7427837" data-longitude="-73.11445617675781"></div>
                                                </div>
                                                <label>Location</label>
                                                <select data-placeholder="Location" class="chosen-select" >
                                                    <option>All Locations</option>
                                                    <option>Bronx</option>
                                                    <option>Brooklyn</option>
                                                    <option>Manhattan</option>
                                                    <option>Queens</option>
                                                    <option>Staten Island</option>
                                                </select>
                                                <label>Phone<i class="fa fa-phone"></i></label>
                                                <input type="text" placeholder="Your Phone" value=""/>
                                                <label>Email<i class="fa fa-envelope-o"></i></label>
                                                <input type="text" placeholder="Your Email" value=""/>
                                                <label>Website<i class="fa fa-globe"></i></label>
                                                <input type="text" placeholder="Your Website" value=""/>
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->                                         
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>Header Media</h4>
                                            </div>
                                            <div class="custom-form">
                                                <div class="row">
                                                    <!--col --> 
                                                    <div class="col-md-4">
                                                        <div class="add-list-media-header">
                                                            <label class="radio inline"> 
                                                            <input type="radio" name="gender"  checked>
                                                            <span>Background image</span> 
                                                            </label>
                                                        </div>
                                                        <div class="add-list-media-wrap">
                                                            <form   class="fuzone">
                                                                <div class="fu-text">
                                                                    <span><i class="fa fa-picture-o"></i> Click here or drop files to upload</span>
                                                                </div>
                                                                <input type="file" class="upload">
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <!--col end--> 
                                                    <!--col --> 
                                                   
                                                    <!--col end-->                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->                                         
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>Detailed Information</h4>
                                            </div>
                                            <div class="custom-form">
                                                <label>Description</label>
                                                <textarea cols="40" rows="3" placeholder=""></textarea>
                                                <!-- Checkboxes -->
                                                <div class=" fl-wrap filter-tags">
                                                    <h4>Amenities </h4>
                                                    <input id="check-a" type="checkbox" name="check">
                                                    <label for="check-a">Elevator in building</label>
                                                    <input id="check-b" type="checkbox" name="check">
                                                    <label for="check-b">Friendly workspace</label>
                                                    <input id="check-c" type="checkbox" name="check">
                                                    <label for="check-c">Instant Book</label>
                                                    <input id="check-d" type="checkbox" name="check">
                                                    <label for="check-d">Wireless Internet</label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->                                          
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>Content Widgets</h4>
                                            </div>
                                            <div class="custom-form">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <!-- act-widget--> 
                                                        <div class="act-widget fl-wrap">
                                                            <div class="act-widget-header">
                                                                <h4>1. Promo video</h4>
                                                                <div class="onoffswitch">
                                                                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch5" checked>
                                                                    <label class="onoffswitch-label" for="myonoffswitch5">
                                                                    <span class="onoffswitch-inner"></span>
                                                                    <span class="onoffswitch-switch"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="add-list-media-wrap">
                                                                <form   class="fuzone">
                                                                    <div class="fu-text">
                                                                        <span><i class="fa fa-picture-o"></i> Click here or drop files to upload</span>
                                                                    </div>
                                                                    <input type="file" class="upload">
                                                                </form>
                                                                <label>Video url :  <i class="fa fa-youtube"></i></label>
                                                                <input type="text" placeholder="https://www.youtube.com/" value=""/>   
                                                            </div>
                                                        </div>
                                                        <!-- act-widget end-->
                                                    </div>
                                                    <div class="col-md-4">
                                                        <!-- act-widget--> 
                                                        <div class="act-widget fl-wrap">
                                                            <div class="act-widget-header">
                                                                <h4>2. Gallery Thumbnails</h4>
                                                                <div class="onoffswitch">
                                                                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch6" checked>
                                                                    <label class="onoffswitch-label" for="myonoffswitch6">
                                                                    <span class="onoffswitch-inner"></span>
                                                                    <span class="onoffswitch-switch"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="add-list-media-wrap">
                                                                <form  class="fuzone">
                                                                    <div class="fu-text">
                                                                        <span><i class="fa fa-picture-o"></i> Click here or drop files to upload</span>
                                                                    </div>
                                                                    <input type="file" class="upload">
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!-- act-widget end-->
                                                    </div>
                                                    <div class="col-md-4">
                                                        <!-- act-widget--> 
                                                        <div class="act-widget fl-wrap">
                                                            <div class="act-widget-header">
                                                                <h4>3. Slider</h4>
                                                                <div class="onoffswitch">
                                                                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch7">
                                                                    <label class="onoffswitch-label" for="myonoffswitch7">
                                                                    <span class="onoffswitch-inner"></span>
                                                                    <span class="onoffswitch-switch"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="add-list-media-wrap">
                                                                <form   class="fuzone">
                                                                    <div class="fu-text">
                                                                        <span><i class="fa fa-picture-o"></i> Click here or drop files to upload</span>
                                                                    </div>
                                                                    <input type="file" class="upload">
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <!-- act-widget end-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->                                       
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container add-list-container">
                                            <div class="profile-edit-header fl-wrap">
                                                <h4>Sidebar Widgets</h4>
                                            </div>
                                            <div class="custom-form">
                                                <!-- act-widget--> 
                                                <div class="act-widget fl-wrap">
                                                    <div class="act-widget-header">
                                                        <h4>1. Booking Form</h4>
                                                        <div class="onoffswitch">
                                                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
                                                            <label class="onoffswitch-label" for="myonoffswitch">
                                                            <span class="onoffswitch-inner"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- act-widget end--> 
                                                <!-- act-widget--> 
                                                <div class="act-widget fl-wrap">
                                                    <div class="act-widget-header">
                                                        <h4>2. Event Counter</h4>
                                                        <div class="onoffswitch">
                                                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch2">
                                                            <label class="onoffswitch-label" for="myonoffswitch2">
                                                            <span class="onoffswitch-inner"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <label>Event Date<i class="fa fa-calendar-o"></i></label>
                                                    <input type="text" placeholder="Date Example : 09/12/2019" value=""/>        
                                                </div>
                                                <!-- act-widget end-->                                                    
                                                <!-- act-widget--> 
                                                <div class="act-widget fl-wrap">
                                                    <div class="act-widget-header">
                                                        <h4>3. Working Hours</h4>
                                                        <div class="onoffswitch">
                                                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
                                                            <label class="onoffswitch-label" for="myonoffswitch3">
                                                            <span class="onoffswitch-inner"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <textarea cols="40" rows="3" placeholder="Details"></textarea>
                                                </div>
                                                <!-- act-widget end--> 
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->                                         
                                        <!-- profile-edit-container--> 
                                        <div class="profile-edit-container">
                                            <div class="profile-edit-header fl-wrap" style="margin-top:30px">
                                                <h4>Socials</h4>
                                            </div>
                                            <div class="custom-form">
                                                <label>Facebook <i class="fa fa-facebook"></i></label>
                                                <input type="text" placeholder="https://www.facebook.com/" value=""/>
                                                <label>Twitter<i class="fa fa-twitter"></i>  </label>
                                                <input type="text" placeholder="https://twitter.com/" value=""/>
                                                <label>Vkontakte<i class="fa fa-vk"></i>  </label>
                                                <input type="text" placeholder="vk.com" value=""/>
                                                <label> Whatsapp <i class="fa fa-whatsapp"></i>  </label>
                                                <input type="text" placeholder="https://www.whatsapp.com" value=""/>
                                                <button class="btn  big-btn  color-bg flat-btn">Save Changes<i class="fa fa-angle-right"></i></button>
                                            </div>
                                        </div>
                                        <!-- profile-edit-container end-->   
                                    </div>
                                </div>
                            </div>
                            <!--profile-edit-wrap end -->
                        </div>
                        <!--container end -->
                    </section>
                    <!-- section end -->	
                    <div class="limit-box fl-wrap"></div>
                    <!--section -->
                    <section class="gradient-bg">
                        <div class="cirle-bg">
                            <div class="bg" data-bg="images/bg/circle.png"></div>
                        </div>
                        <div class="container">
                            <div class="join-wrap fl-wrap">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h3>Do You Have Questions ?</h3>
                                        <p>Lorem ipsum dolor sit amet, harum dolor nec in, usu molestiae at no.</p>
                                    </div>
                                    <div class="col-md-4"><a href="contacts.html" class="join-wrap-btn">Get In Touch <i class="fa fa-envelope-o"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- section end -->
                </div>
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
                                <div class="copyright"> &#169; Speech 2017 .  All rights reserved.</div>
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
            <a class="to-top"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
        <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC95dqGGKveZsk11F5F7irIrx0ExnBNfDk&libraries=places&callback=initAutocomplete"></script>
		<script type="text/javascript" src="resources/js/map-add.js"></script>		
    </body>
</html>