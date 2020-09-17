<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>JejuBnB</title>

    <link rel="stylesheet" href="resources/css/main.css" >
  </head>
  <body>
<c:import url="/WEB-INF/views/common/header.jsp" />
     <video autoplay muted loop id="myVideo">
	   <source src="resources/video/night.mp4" type="video/mp4">
     </video>
     <div class="mainpre">가까운 곳에서<br> 즐기는 색다른 여행 </div>
	 <div class="mainpresub">가까운 곳의 숨겨진 아름다움을  발견하는 <br> 색다른 휴가를 즐겨보세요.</div>
    <main class="main">
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
  </main>
  <div style="padding: 150px 0px 0px 0px;"></div>
 		   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	       <script src="resources/js/main.js"></script>
<c:import url="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
