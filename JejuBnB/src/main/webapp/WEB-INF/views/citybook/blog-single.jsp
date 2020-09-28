<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!--loader-->
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
                        <a href="index.html"><img src="resources/images/logo.png" alt=""></a>
                    </div>
                    <div class="header-search vis-header-search">
                        <div class="header-search-input-item">
                            <input type="text" placeholder="Keywords" value=""/>
                        </div>
                        <div class="header-search-select-item">
                            <select data-placeholder="All Categories" class="chosen-select" >
                                <option>All Categories</option>
                                <option>Shops</option>
                                <option>Hotels</option>
                                <option>Restaurants</option>
                                <option>Fitness</option>
                                <option>Events</option>
                            </select>
                        </div>
                        <button class="header-search-button" onclick="window.location.href='listing.html'">Search</button>
                    </div>
                    <div class="show-search-button"><i class="fa fa-search"></i> <span>Search</span></div>
                    <a href="dashboard-add-listing.html" class="add-list">Add Listing <span><i class="fa fa-plus"></i></span></a>
                    <div class="show-reg-form modal-open"><i class="fa fa-sign-in"></i>Sign In</div>
                    <!-- nav-button-wrap--> 
                    <div class="nav-button-wrap color-bg">
                        <div class="nav-button">
                            <span></span><span></span><span></span>
                        </div>
                    </div>
                    <!-- nav-button-wrap end-->
                    <!--  navigation --> 
                    <div class="nav-holder main-menu">
                        <nav>
                            <ul>
                                <li>
                                    <a href="#">Home <i class="fa fa-caret-down"></i></a>
                                    <!--second level -->   
                                    <ul>
                                        <li><a href="index.html">Parallax Image</a></li>
                                        <li><a href="index2.html">Video</a></li>
                                        <li><a href="index3.html">Map</a></li>
                                        <li><a href="index4.html">Slideshow</a></li>
                                        <li><a href="index5.html">Sider</a></li>
                                    </ul>
                                    <!--second level end-->
                                </li>
                                <li>
                                    <a href="#">Listings <i class="fa fa-caret-down"></i></a>
                                    <!--second level -->
                                    <ul>
                                        <li><a href="listing.html">Column map</a></li>
                                        <li><a href="listing2.html">Column map 2</a></li>
                                        <li><a href="listing3.html">Fullwidth Map</a></li>
                                        <li><a href="listing4.html">Fullwidth Map 2</a></li>
                                        <li><a href="listing5.html">Without Map</a></li>
                                        <li><a href="listing6.html">Without Map 2</a></li>
                                        <li>
                                            <a href="#">Single <i class="fa fa-caret-down"></i></a>
                                            <!--third  level  -->
                                            <ul>
                                                <li><a href="listing-single.html">Style 1</a></li>
                                                <li><a href="listing-single2.html">Style 2</a></li>
                                                <li><a href="listing-single3.html">Style 3</a></li>
												<li><a href="listing-single4.html">Style 4</a></li>
                                            </ul>
                                            <!--third  level end-->
                                        </li>
                                    </ul>
                                    <!--second level end-->
                                </li>
                                <li>
                                    <a href="blog.html" class="act-link">News</a>
                                </li>
                                <li>
                                    <a href="#">Pages <i class="fa fa-caret-down"></i></a>
                                    <!--second level -->   
                                    <ul>
                                        <li><a href="about.html">About</a></li>
                                        <li><a href="contacts.html">Contacts</a></li>
                                        <li><a href="author-single.html">User single</a></li>
                                        <li><a href="how-itworks.html">How it Works</a></li>
                                        <li><a href="pricing-tables.html">Pricing</a></li>
                                        <li><a href="dashboard-myprofile.html">User Dasboard</a></li>
                                        <li><a href="blog-single.html">Blog Single</a></li>
                                        <li><a href="dashboard-add-listing.html">Add Listing</a></li>
                                        <li><a href="404.html">404</a></li>
                                        <li><a href="coming-soon.html">Coming Soon</a></li>
                                        <li><a href="header2.html">Header 2</a></li>
                                        <li><a href="footer-fixed.html">Footer Fixed</a></li>
                                    </ul>
                                    <!--second level end-->                                
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- navigation  end -->
                </div>
            </header>
            <!--  header end -->	
            <!-- wrapper -->	
            <div id="wrapper">
                <!-- content -->
                <div class="content">
                    <!--section -->
                    <section class="parallax-section" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align">
                                <h2><span>Blog Post Title</span></h2>
                                <div class="breadcrumbs fl-wrap"><a href="#">Home</a><a href="#">Blog</a><span>Blog Single</span></div>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec1" class="custom-scroll-link">Let's Start</a></div>
                        </div>
                    </section>
                    <!-- section end -->
                    <!--section -->   
                    <section class="gray-section" id="sec1">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="list-single-main-wrapper fl-wrap" id="sec2">
                                        <!-- article> --> 
                                        <article>
                                            <div class="list-single-main-media fl-wrap">
                                                <div class="single-slider-wrapper fl-wrap">
                                                    <div class="single-slider fl-wrap"  >
                                                        <div class="slick-slide-item"><img src="resources/images/all/1.jpg" alt=""></div>
                                                        <div class="slick-slide-item"><img src="resources/images/all/1.jpg" alt=""></div>
                                                        <div class="slick-slide-item"><img src="resources/images/all/1.jpg" alt=""></div>
                                                    </div>
                                                    <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                                                    <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                                                </div>
                                            </div>
                                            <div class="list-single-main-item fl-wrap">
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Aliquam erat volutpat. Curabitur convallis.</h3>
                                                </div>
                                                <p>
                                                    Vestibulum orci felis, ullamcorper non condimentum non, ultrices ac nunc. Mauris non ligula suscipit, vulputate mi accumsan, dapibus felis. Nullam sed sapien dui. Nulla auctor sit amet sem non porta. Integer iaculis tellus nulla, quis imperdiet magna venenatis vitae..
                                                </p>
                                                <p>Ut nec hinc dolor possim. An eros argumentum vel, elit diceret duo eu, quo et aliquid ornatus delicatissimi. Cu nam tale ferri utroque, eu habemus albucius mel, cu vidit possit ornatus eum. Eu ius postulant salutatus definitionem,  explicari. Graeci viderer qui ut, at habeo facer solet usu. Pri choro pertinax indoctum ne, ad partiendo persecuti forensibus est.</p>
                                                <blockquote>
                                                    <p>Vestibulum id ligula porta felis euismod semper. Sed posuere consectetur est at lobortis. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper.</p>
                                                </blockquote>
                                                <p>Ut nec hinc dolor possim. An eros argumentum vel, elit diceret duo eu, quo et aliquid ornatus delicatissimi. Cu nam tale ferri utroque, eu habemus albucius mel, cu vidit possit ornatus eum. Eu ius postulant salutatus definitionem, an e trud erroribus explicari. Graeci viderer qui ut, at habeo facer solet usu. Pri choro pertinax indoctum ne, ad partiendo persecuti forensibus est.</p>
                                                <div class="post-author"><a href="#"><img src="resources/images/avatar/1.jpg" alt=""><span>By , Alisa Noory</span></a></div>
                                                <div class="post-opt">
                                                    <ul>
                                                        <li><i class="fa fa-calendar-check-o"></i> <span>25 April 2018</span></li>
                                                        <li><i class="fa fa-eye"></i> <span>264</span></li>
                                                        <li><i class="fa fa-tags"></i> <a href="#">Photography</a> , <a href="#">Design</a> </li>
                                                    </ul>
                                                </div>
                                                <span class="fw-separator"></span>
                                                <div class="list-single-main-item-title fl-wrap">
                                                    <h3>Tags</h3>
                                                </div>
                                                <div class="list-single-tags tags-stylwrap blog-tags">
                                                    <a href="#">Event</a>
                                                    <a href="#">Conference</a>
                                                    <a href="#">Strategies</a>
                                                    <a href="#">Trends</a>
                                                </div>
                                                <div class="share-holder hid-share">
                                                    <div class="showshare"><span>Share </span><i class="fa fa-share"></i></div>
                                                    <div class="share-container  isShare"></div>
                                                </div>
                                                <span class="fw-separator"></span>
                                                <div class="post-nav fl-wrap">
                                                    <a href="#" class="post-link prev-post-link"><i class="fa fa-angle-left"></i>Prev <span class="clearfix">The Sign of Experience</span></a>
                                                    <a href="#" class="post-link next-post-link"><i class="fa fa-angle-right"></i>Next<span class="clearfix">Dedicated to Results</span></a>
                                                </div>
                                            </div>
                                        </article>
                                        <!-- article end -->       
                                        <span class="section-separator"></span>
                                        <!-- list-single-main-item -->   
                                        <div class="list-single-main-item fl-wrap" id="sec4">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>Comments -  <span> 3 </span></h3>
                                            </div>
                                            <div class="reviews-comments-wrap">
                                                <!-- reviews-comments-item -->  
                                                <div class="reviews-comments-item">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt=""> 
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <a href="#" class="new-dashboard-item">Reply</a>
                                                        <h4><a href="#">Jessie Manrty</a></h4>
                                                        <div class="clearfix"></div>
                                                        <p>" Commodo est luctus eget. Proin in nunc laoreet justo volutpat blandit enim. Sem felis, ullamcorper vel aliquam non, varius eget justo. Duis quis nunc tellus sollicitudin mauris. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>27 May 2018</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end-->  
                                                <!-- reviews-comments-item -->  
                                                <div class="reviews-comments-item reply-comment-item ">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt=""> 
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <a href="#" class="new-dashboard-item">Reply</a>
                                                        <h4><a href="#">Mark Rose</a></h4>
                                                        <div class="clearfix"></div>
                                                        <p>" Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>12 April 2018</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end--> 
                                                <!-- reviews-comments-item -->  
                                                <div class="reviews-comments-item">
                                                    <div class="review-comments-avatar">
                                                        <img src="resources/images/avatar/1.jpg" alt=""> 
                                                    </div>
                                                    <div class="reviews-comments-item-text">
                                                        <a href="#" class="new-dashboard-item">Reply</a>
                                                        <h4><a href="#">Adam Koncy</a></h4>
                                                        <div class="clearfix"></div>
                                                        <p>" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc posuere convallis purus non cursus. Cras metus neque, gravida sodales massa ut. "</p>
                                                        <span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>03 December 2017</span>
                                                    </div>
                                                </div>
                                                <!--reviews-comments-item end-->                                                                  
                                            </div>
                                        </div>
                                        <!-- list-single-main-item end -->   
                                        <!-- list-single-main-item -->   
                                        <div class="list-single-main-item fl-wrap" id="sec5">
                                            <div class="list-single-main-item-title fl-wrap">
                                                <h3>Add Comment</h3>
                                            </div>
                                            <!-- Add Review Box -->
                                            <div id="add-review" class="add-review-box">
                                                <!-- Review Comment -->
                                                <form id="add-comment" class="add-comment custom-form">
                                                    <fieldset>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label><i class="fa fa-user-o"></i></label>
                                                                <input type="text" placeholder="Your Name *" value=""/>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label><i class="fa fa-envelope-o"></i>  </label>
                                                                <input type="text" placeholder="Email Address*" value=""/>
                                                            </div>
                                                        </div>
                                                        <textarea cols="40" rows="3" placeholder="Your Review:"></textarea>
                                                    </fieldset>
                                                    <button class="btn  big-btn  color-bg flat-btn">Submit Comment <i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                                                </form>
                                            </div>
                                            <!-- Add Review Box / End -->
                                        </div>
                                        <!-- list-single-main-item end -->                                
                                    </div>
                                </div>
                                <!--box-widget-wrap -->
                                <div class="col-md-4">
                                    <div class="box-widget-wrap">
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>Search In blog : </h3>
                                            </div>
                                            <div class="box-widget search-widget">
                                                <form action="#" class="fl-wrap">
                                                    <input name="se" id="se" type="text" class="search" placeholder="Search.." value="Search..." />
                                                    <button class="search-submit" id="submit_btn"><i class="fa fa-search transition"></i> </button>
                                                </form>
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->  
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>About Athor : </h3>
                                            </div>
                                            <div class="box-widget list-author-widget">
                                                <div class="list-author-widget-header shapes-bg-small  color-bg fl-wrap">
                                                    <span class="list-author-widget-link"><a href="author-single.html">Alisa Noory</a></span>
                                                    <img src="resources/images/avatar/1.jpg" alt=""> 
                                                </div>
                                                <div class="box-widget-content">
                                                    <div class="list-author-widget-text">
                                                        <div class="list-author-widget-contacts">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla.</p>
                                                        </div>
                                                        <div class="list-widget-social">
                                                            <ul>
                                                                <li><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                                <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                                <li><a href="#" target="_blank"><i class="fa fa-vk"></i></a></li>
                                                                <li><a href="#" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>Popular posts : </h3>
                                            </div>
                                            <div class="box-widget widget-posts blog-widgets">
                                                <div class="box-widget-content">
                                                    <ul>
                                                        <li class="clearfix">
                                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg"  alt=""></a>
                                                            <div class="widget-posts-descr">
                                                                <a href="#" title="">Cafe "Lollipop"</a>
                                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 21 Mar 2017 </span> 
                                                            </div>
                                                        </li>
                                                        <li class="clearfix">
                                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg"  alt=""></a>
                                                            <div class="widget-posts-descr">
                                                                <a href="#" title=""> Apartment in the Center</a>
                                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 7 Mar 2017 </span> 
                                                            </div>
                                                        </li>
                                                        <li class="clearfix">
                                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg"  alt=""></a>
                                                            <div class="widget-posts-descr">
                                                                <a href="#" title="">Event in City Mol</a>
                                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 7 Mar 2017 </span>
                                                            </div>
                                                        </li>
                                                        <li class="clearfix">
                                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg"  alt=""></a>
                                                            <div class="widget-posts-descr">
                                                                <a href="#" title="">Event in City Mol</a>
                                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 7 Mar 2017 </span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->     
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>Tags: </h3>
                                            </div>
                                            <div class="list-single-tags tags-stylwrap">
                                                <a href="#">Event</a>
                                                <a href="#">Design</a>
                                                <a href="#">Photography</a>
                                                <a href="#">Trends</a>
                                                <a href="#">Video</a>
                                                <a href="#">News</a>                                                                               
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->     
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>Our Instagram : </h3>
                                            </div>
                                            <div class="box-widget">
                                                <div class="box-widget-content">
                                                    <div class="jr-insta-thumb">
                                                        <ul>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                            <li>
                                                                <a href="#"><img src="resources/images/instagram/1.jpg" alt=""></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <a class="widget-posts-link" href="#" target="_blank">Follow us<span><i class="fa fa-angle-right"></i></span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->                                       
                                        <!--box-widget-item -->
                                        <div class="box-widget-item fl-wrap">
                                            <div class="box-widget-item-header">
                                                <h3>Categories : </h3>
                                            </div>
                                            <div class="box-widget">
                                                <div class="box-widget-content">
                                                    <ul class="cat-item">
                                                        <li><a href="#">Standard</a> <span>(3)</span></li>
                                                        <li><a href="#">Video</a> <span>(6) </span></li>
                                                        <li><a href="#">Gallery</a> <span>(12) </span></li>
                                                        <li><a href="#">Quotes</a> <span>(4)</span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--box-widget-item end -->                    
                                    </div>
                                </div>
                                <!--box-widget-wrap end -->
                            </div>
                        </div>
                    </section>
                    <!--section end -->
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
                                        <h3>Join our online community</h3>
                                        <p>Grow your marketing and be happy with your online business</p>
                                    </div>
                                    <div class="col-md-4"><a href="#" class="join-wrap-btn modal-open">Sign Up <i class="fa fa-sign-in"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--section end -->
                </div>
                <!--content end --> 
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
                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 21 Mar 09.05 </span> 
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title=""> In hac habitasse platea</a>
                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 7 Mar 18.21 </span> 
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <a href="#"  class="widget-posts-img"><img src="resources/images/all/1.jpg" class="respimg" alt=""></a>
                                            <div class="widget-posts-descr">
                                                <a href="#" title="">Tortor tempor in porta</a>
                                                <span class="widget-posts-date"><i class="fa fa-calendar-check-o"></i> 7 Mar 16.42 </span>
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
                                    <p>Want to be notified when we launch a new template or an udpate. Just  send you a notification by email.</p>
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
                        <h3>Sign In <span>City<strong>Book</strong></span></h3>
                        <div class="soc-log fl-wrap">
                            <p>For faster login or register use your social account.</p>
                            <a href="#" class="facebook-log"><i class="fa fa-facebook-official"></i>Log in with Facebook</a>
                            <a href="#" class="twitter-log"><i class="fa fa-twitter"></i> Log in with Twitter</a>
                        </div>
                        <div class="log-separator fl-wrap"><span>or</span></div>
                        <div id="tabs-container">
                            <ul class="tabs-menu">
                                <li class="current"><a href="#tab-1">Login</a></li>
                                <li><a href="#tab-2">Register</a></li>
                            </ul>
                            <div class="tab">
                                <div id="tab-1" class="tab-content">
                                    <div class="custom-form">
                                        <form method="post"  name="registerform">
                                            <label>Username or Email Address * </label>
                                            <input name="email" type="text"   onClick="this.select()" value=""> 
                                            <label >Password * </label>
                                            <input name="password" type="password"   onClick="this.select()" value="" > 
                                            <button type="submit"  class="log-submit-btn"><span>Log In</span></button> 
                                            <div class="clearfix"></div>
                                            <div class="filter-tags">
                                                <input id="check-a" type="checkbox" name="check">
                                                <label for="check-a">Remember me</label>
                                            </div>
                                        </form>
                                        <div class="lost_password">
                                            <a href="#">Lost Your Password?</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab">
                                    <div id="tab-2" class="tab-content">
                                        <div class="custom-form">
                                            <form method="post"   name="registerform" class="main-register-form" id="main-register-form2">
                                                <label >First Name * </label>
                                                <input name="name" type="text"   onClick="this.select()" value=""> 
                                                <label>Second Name *</label>
                                                <input name="name2" type="text"  onClick="this.select()" value="">
                                                <label>Email Address *</label>
                                                <input name="email" type="text"  onClick="this.select()" value="">                                              
                                                <label >Password *</label>
                                                <input name="password" type="password"   onClick="this.select()" value="" > 
                                                <button type="submit"     class="log-submit-btn"  ><span>Register</span></button> 
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
    </body>
</html>