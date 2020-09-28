<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <script type="text/javascript">
    $(function(){
    	$.ajax({
    		url : "roomTop.do",
    		type : "post",
    		dataType : "json",
    		success : function(job){
    			console.log(job);
    			
    			var jsonStr = JSON.stringify(job);
    			
    			var json = JSON.parse(jsonStr);
    			
    			var value = "";
    			for(var i in json.list){
    				var cs = json.list[i].clean_score;
    				var vs = json.list[i].value_score;
    				var ss = json.list[i].service_score;
    				var total = (cs + vs + ss)/3;
    				value="";
    				value += '<div class="listing-item">';
    				value += '<article class="geodir-category-listing fl-wrap">';
    				value += '<div class="geodir-category-img">';    			
    				value += '<img class="roomImg" src="${ pageContext.servletContext.contextPath}/resources/roomFiles/'+ json.list[i].rename +'">';
    				value += '<div class="overlay"></div>';
    				value += '</div>';
    				value += '<div class="geodir-category-content fl-wrap">';
    				value += '<h3><a href="listing-single.html">${room.room_name }</a></h3>';
    				value += '<p>기준 인원 : '+json.list[i].st_nu_people+' &nbsp; &nbsp; <br> ';
    				value += ' 체크인 - ${fn:substring('+json.list[i].checkin_time+',0,2)}:';
    				value += '			${fn:substring('+json.list[i].checkin_time+',2,4)} ~ 체크아웃 -';
    				value += '			${fn:substring('+json.list[i].checkout_time+',0,2)}:';
    				value += '			${fn:substring('+json.list[i].checkout_time+',2,4)} <br>';
    				value += '				<fmt:formatNumber value="'+json.list[i].room_weekday+'"	type="currency" /> /1박';
    				value += '	</p>';
    				value += '		<div class="geodir-category-options fl-wrap">';
    				value += '			<span class="d-flex justify-content-center align-items-center">';										
    				value += '			<span style="color: #4DB7FE;"><i class="fas fa-star"></i></span>';
    				value += '							<fmt:formatNumber value="'+total+'" pattern=".0" /> ('+json.list[i].reply_no+' Review)';
    				value += '	</span>';
    				value += '			<div class="geodir-category-location">';
    				value += '				<a href="#0" class="map-item"><i class="fa fa-map-marker" aria-hidden="true"></i>'+json.list[i].room_address+'</a>';
    				value += '			</div></div></div></article></div>';
    				
    				$(".slick-slide-item").html(value);
    			}
    		}
    	});
    })
    
    </script>
    <style>
    input[type="date""] {
    	border : none;
    	
    }
    
    input[type="date"]::-webkit-outer-spin-button,
	input[type="date"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}


    
    </style>
    <body>
         <!-- loader -->
      <div class="loader-wrap">
            <div class="pin"></div>
            <div class="pulse"></div>
        </div> 
        <!--loader end-->
        <!-- Main  -->
        <div id="main">
<c:import url="/WEB-INF/views/common/header.jsp" />
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
                                    <h2>여행</h2>
                                    <h3>이제는 안전한 곳에서</h3>
                                </div>
                                <form action="roomlist.do">
                                <div class="main-search-input-wrap">
                                    <div class="main-search-input fl-wrap">
                                        <div class="main-search-input-item" style="text-align:center;">
                                            <input type="text" placeholder="인원" name="people" value="1"/>
                                        </div>
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <input type="date"  name="checkin" />
                                        </div>
                                        <div class="main-search-input-item location" id="autocomplete-container">
                                            <input type="date"  name="checkout" />
                                        </div>                                         
                                        <button class="main-search-button" type="submit">Search</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                        
                    </section>
            
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
           <c:import url="/WEB-INF/views/common/footer.jsp" />

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