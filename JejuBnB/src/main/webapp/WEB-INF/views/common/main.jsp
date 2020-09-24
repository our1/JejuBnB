<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>JejuBnB</title>
	<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
    <link rel="stylesheet" href="resources/css/main.css" >
        <script type="text/javascript">
    // test.js

// JS for Local Weather App
$( document ).ready(function() {

var lat; var lon; var desc; var hum; var weatherid;
var temp = []; var wind = [];

// Request IP address from user to get location & store coordinates
$.getJSON("https://ipapi.co/json", function(data) {
  //$("#city").html(data.city);
  lat = data.latitude;
  lon = data.longitude;

  // Get weather information
  // Need to add 'https://cors-anywhere.herokuapp.com/' before URL to have HTTPS using a CORS server
  $.getJSON("https://cors-anywhere.herokuapp.com/http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon +"&APPID=44762e241a2c3fc4f616e416abc08f0e", function(weatherData) {

  $("#city").html(weatherData.name);
  // Store temperates (celsius and fahrenheit)
  temp[0] = (weatherData.main.temp - 273.15).toFixed(0) + "&#176";
  temp[1] = (((weatherData.main.temp - 273.15)*1.8) + 32).toFixed(0) + "&#176";

  // Store description, humidity, and wind
  desc = weatherData.weather[0].description;
  hum = weatherData.main.humidity + '%';

  // Store wind (km/h and mi/h)
  wind[0] = (weatherData.wind.speed * 3.6).toFixed(2) + " km/h";
  wind[1] = (weatherData.wind.speed * 2.23).toFixed(2) + " mi/h";

  // Store weather ID for icons; change icon depending on weather conditions
  weatherid = (weatherData.weather[0].id);

  if (weatherid == 800) {
    $("#currenticon").html('<i class="wi wi-day-sunny"</i>').css({"color": "#FFE14A"});
  };

  var rainIcons = [300, 301, 302, 310, 311, 312, 313, 314, 321, 500, 501, 502, 503, 504, 511, 520, 521, 522, 531];
  for (i=0; i<rainIcons.length; i++) {
    if (weatherid == rainIcons[i]) {
      $("#currenticon").html('<i class="wi wi-rain"</i>').css({"color": "#244A69"});
    };
  };

  var stormIcons = [200, 201, 202, 210, 211, 212, 221, 230, 231, 232];
  for (i=0; i<stormIcons.length; i++) {
    if (weatherid == stormIcons[i]) {
      $("#currenticon").html('<i class="wi wi-storm-showers"></i>').css({"color": "#244A69"});
    };
  };

  var cloudIcons = [801, 802, 803, 804];
  for (i=0; i<cloudIcons.length; i++) {
    if (weatherid == cloudIcons[i]) {
      $("#currenticon").html('<i class="wi wi-cloudy"></i>').css({"color": "#C1C1C1"});
    }
  }

  var snowIcons = [600, 601, 602, 611, 612, 615, 616, 620, 621, 622];
  for (i=0; i<snowIcons.length; i++) {
    if (weatherid == snowIcons[i]) {
      $("#currenticon").html('<i class="wi wi-snow"></i>').css({"color": "#FFFFFF"});
    }
  }

  var atmosphereIcons = [701, 711, 721, 731, 741, 751, 761, 762, 771, 781];
  for (i=0; i<atmosphereIcons.length; i++) {
    if (weatherid == atmosphereIcons[i]) {
      $("#currenticon").html('<i class="wi wi-dust"></i>').css({"color": "#C1C1C1"});
    }
  }

  var extremeIcons = [900, 901, 902, 903, 904, 905, 906];
  for (i=0; i<extremeIcons.length; i++) {
    if (weatherid == extremeIcons[i]) {
      $("#currenticon").html('<i class="wi wi-storm-warning"></i>').css({"color": "#FFFFFF"});
    }
  }

  var additionalIcons = [951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 961];
  for (i=0; i<additionalIcons.length; i++) {
    if (weatherid == additionalIcons[i]) {
      $("#currenticon").html('<i class="wi wi-hurricane-warning"></i>').css({"color": "#FFFFFF"});
    }
  }

  // Insert weather info temp
  $("#temp").html(temp[1]);
  $("#desc").html(desc);
  $("#hum").html(hum);
  $("#wind").html(wind[1]);
  });

  // Function to switch between units
  $(".fc").click (function() {
    if ($(".fc").text() === "F") {
      $(".fc").text("C");
      $("#temp").html(temp[0]);
      $("#wind").html(wind[0]);
    }
    else {
      $(".fc").text('F');
      $("#temp").html(temp[1]);
      $("#wind").html(wind[1]);
    }
  });

  // Switch weather icons based on description from API
  var weatherIcons = {
    sunny: ["wi-day-sunny", "#FFE14A"],
    cloudy: ["wi-cloudy", "#C1C1C1"],
    rainy: ["wi-rain", "#33436D"],
    storm: ["wi-storm-showers", "#33436D"],
    snow: ["wi-snow", "#FFFFFF"]
  };


});
});
    </script>
    <style type="text/css">
    	.secret {
    		display : grid;
    		width : 0px;
			grid-template-columns: 253px 253px 253px;
			grid-template-rows: 450px ;
			posisiton : relative;
			margin-left : 17%;
    	}
    	.roli {
    		border : 1px solid black;
    		backgroud-color : #fff;
 			border-radius: 20px;
    	}
    	.roimg {
		    width: 100%;
		    height: 100%;
		    padding: 12px;
		    border-radius: 20px;
    	}
    	.toli {
    		border : 1px solid black;
    		backgroud-color : #fff;
    		margin-left : 10%;
    		border-radius: 20px;
    	}
    	 .toimg {
    		width: 100%;
		    height: 100%;
		    padding: 12px;
    	}
    	.weli {
    		border : 1px solid black;
    		border-radius: 5px;
    		backgroud-color : #fff;
    		margin-left : 10%;
    		border-radius : 20px;
    	}
    	.weco {
    		width : 100%;
    		height : 100%;
    		padding : 12px;
    		background: linear-gradient(to bottom, #4C739B 0%, #B0D5A7 100%) ;
    	}
    	
#weatherbox {
/*box-shadow: 2px 2px 10px #FFFFFF;*/
border: 1px solid #FFFFFF;
color: #FFFFFF;
display: flex;
flex-direction: column;
justify-content: center;
left: 0;
right: 0;
top: 0;
bottom: 5vw;
margin: auto;
max-width: 100%;
max-height: 100%;
overflow: auto;
width: 300px;
height: 350px;
}

#topbox {
border-bottom: 1px #FFFFFF solid;
height: 20%;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
font-family: 'Montserrat', sans-serif;
font-size: 25px;
}

#middlebox {
height: 50%;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
font-family: 'Montserrat', sans-serif;
}

#midmid {
display: flex;
flex-direction: row;
align-items: center;
}

#bottombox {
height: 30%;
display: flex;
flex-direction: row;
justify-content: space-around;
align-items: center;
font-family: 'Montserrat', sans-serif;
}

.bottomsides {
height: 100%;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}

.wi {
width: 100%;
font-size: 55px;
}

.fc button {
color: #FFFFFF;
outline: none;
}

#temp {
font-size: 75px;
padding-left: 10px;
}

.fc {
border: none;
border-radius: 50%;
font-size: 35px;
height: 1.5em;
width: 1.5em;
text-align: center;
text-decoration: none;
background: none;
cursor: pointer;
padding: 0px;
}

.fc:hover {
color: #FFFFFF;
border: 1px solid #FFFFFF;
/*color: #4C739B;
background-color: #FFFFFF;*/
}
    	
    	
    </style>
  </head>
  <body>

<c:import url="/WEB-INF/views/common/header.jsp" />

<body onload="window.open('cou.do','쿠폰',
		'width=400px, height=430px, left=300px, top=50px, toolbar=0, status=yes, menubars=0, scrollbars=0, resizable=0, location=0, directories=0')">


     <video autoplay muted loop id="myVideo">
	   <source src="resources/video/night.mp4" type="video/mp4">
     </video>
     <div class="mainpre">가까운 곳에서<br> 즐기는 색다른 여행 </div>
	 <div class="mainpresub">가까운 곳의 숨겨진 아름다움을  발견하는 <br> 색다른 휴가를 즐겨보세요.</div>
<!-- 	      <div class="res">
        <div class="chkin">
            체크인<br>
            <div class="chkinsub">날짜 추가</div>
        </div>
        <div class="chkout">
            체크아웃<br>
            <div class="chkoutsub">날짜 추가</div>
        </div>
        <div class="people">
            인원<br>
            <div class="peoplesub">게스트 추가</div>
        </div>
        <div class="searchbut">
          <i class="fas fa-search fa-2x"></i>
        </div>
     </div> -->
	 
   <!--  <main class="main">
 	 <div class="container">
  	  <div class="tab">
     	 <div class="tab-menu">
      	  <button class="tab-menu-link active" data-content="first">
       	   <span data-title="first">숙소</span>
      	  </button>
      	  <button class="tab-menu-link" data-content="second">
      	    <span data-title="second">관광지</span>
      	  </button>
          <button class="tab-menu-link" data-content="third">
         	 <span data-title="third">Third Tab Content</span>
          </button>
      </div>
        <div class="tab-bar">
        <div class="tab-bar-content active" id="first">
		  <div id="onelist">
			   <div class="one">
			   </div>
			   <div class="two">
			   </div>
			   <div class="three">
			   </div>
			   <div class="four">
			   </div>
			   <div class="five">
			   </div>
		  </div>
		  <div class="moreview">
			    <a href="roomlist.do"> 더 보기 </a>
			</div>
		</div>
		<div class="tab-bar-content" id="second">
		    <div id="onelist">
			   <div class="one">
			   </div>
			   <div class="two">
			   </div>
			   <div class="three">
			   </div>
			   <div class="four">
			   </div>
			   <div class="five">
			   </div>
		    </div>
		     <div class="moreview">
			    <a href="tlist.do"> 더 보기 </a>
			</div>
		   </div>
         </div>
      </div>
    </div>
  </main> -->
  <div style="padding: 100px 0px 0px 0px;"></div>
  	<div class="secret">
 	 <div class="roli">
 	 	<div class="roimg">
 	 		<img src="resources/images/33.jpg" style="width:100%;height:100%;border-radius: 20px;">
 	 	</div>
 	 </div>
  	 <div class="toli">
  	 	<div class="toimg">
 	 		<img src="resources/images/36.jpg" style="width:100%;height:100%;border-radius: 20px;">
 	 	</div>
 	 </div>
 	 <div class="weli">
 	 	<div class="weco">
 	 	  <div id="weatherbox">
		      <div id="topbox">
		        <span id="city"></span>
		      </div>
		      <div id="middlebox">
		        <div id="midmid">
		          <span><i id="currenticon"></i></span>
		          <span id="temp"></span>
		          <button class="fc">F</button>
		        </div>
		        <span id="desc"></span>
		      </div>
		      <div id="bottombox">
		        <div class="bottomsides">
		          <span><i class="wi wi-raindrop"></i></span>
		          <span id="hum"></span>
		        </div>
		        <div class="bottomsides">
		          <span><i class="wi wi-strong-wind"></i></span>
		          <span id="wind"></span>
		        </div>
		      </div>
		    </div>
 	 	</div>
	 </div>
	</div> 
  <div style="padding: 100px 0px 0px 0px;"></div>
 		   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	       <script src="resources/js/main.js"></script>
<c:import url="/WEB-INF/views/common/footer.jsp" />

  </body>
</html>
