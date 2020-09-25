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
        <!-- loader-->
        <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div>
        <!--loader end -->
        <!--Main-->
        <div id="main">
            <!--wrapper -->
            <div class="fixed-bg">
                <div class="bg"  data-bg="images/bg/1.jpg"></div>
                <div class="overlay"></div>
                <div class="bubble-bg"></div>
            </div>
            <!-- cs-wrapper -->
            <div class="cs-wrapper fl-wrap">
                <!-- container  -->
                <div class="container small-container counter-widget" data-countDate="09/12/2019">
                    <div class="cs-logo"><img src="resources/images/logo.png" alt=""></div>
                    <span class="section-separator"></span>
                    <h3 class="soon-title">Our website is coming soon!</h3>
                    <!-- countdown -->
                    <div class="countdown fl-wrap">
                        <div class="cs-countdown-item">
                            <span class="days rot">00</span>
                            <p>days</p>
                        </div>
                        <div class="cs-countdown-item">
                            <span class="hours rot">00</span>
                            <p>hours </p>
                        </div>
                        <div class="cs-countdown-item no-dec">
                            <span class="minutes rot2">00</span>
                            <p>minutes </p>
                        </div>
                        <div class="cs-countdown-item">
                            <span class="seconds rot2">00</span>
                            <p>seconds</p>
                        </div>
                    </div>
                    <!-- countdown end -->
                    <div class="subcribe-form fl-wrap">
                        <p>Sign up now to our newsletter and you will be one of the first know
                            when our   new website as ready
                        </p>
                        <form id="subscribe">
                            <input class="enteremail" name="email" id="subscribe-email" placeholder="Email" spellcheck="false" type="text">
                            <button type="submit" id="subscribe-button" class="subscribe-button color-bg"><i class="fa fa-rss"></i> Subscribe</button>
                            <label for="subscribe-email" class="subscribe-message"></label>
                        </form>
                    </div>
                    <!-- cs-social -->
                    <div class="cs-social fl-wrap">
                        <ul>
                            <li><a href="#" target="_blank" ><i class="fa fa-facebook-official"></i></a></li>
                            <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" target="_blank" ><i class="fa fa-chrome"></i></a></li>
                            <li><a href="#" target="_blank" ><i class="fa fa-vk"></i></a></li>
                            <li><a href="#" target="_blank" ><i class="fa fa-whatsapp"></i></a></li>
                        </ul>
                    </div>
                    <!-- cs-social end -->
                </div>
                <!-- container end -->
            </div>
            <!-- cs-wrapper end-->
        </div>
        <!-- Main end -->
        <!--=============== scripts  ===============-->
         <script type="text/javascript" src="resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="resources/js/plugins.js"></script>
        <script type="text/javascript" src="resources/js/scripts.js"></script>   
    </body>
</html>