<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JejuBnB</title>
   		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="resources/css/tourNoMapList.css" >
        <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
        <style type="text/css">
       			.trhead {
				  position : relative;
				  width : 100%;
				  height : 600px;
				  background-image : url('resources/images/40.jpg');
				  background-size: cover;
			}
			.fa-eye {
				color : gray;
			}
			.fa-heart {
				color : #D57777;
			}
				.wh {
				float : right;
				color : gray;
			}
       	</style>
  </head>
  <body>
   <div class="trhead">
	<!-- <h1 class="tour">관광지</h1> --></div>
   <div style="padding: 70px 0px 0px 0px;"></div>
     <button class="live">자연
     	<div class="livecount">7 개</div>
     </button>
     <button class="cook">음식
     	<div class="cookcount">10 개</div>
     </button>
     <button class="act">체험
     	<div class="actcount">5 개</div>
     </button>
     <button class="movelist" onclick="javascipt:location.href='tlist.do'"><i class="fa fa-map" aria-hidden="true"></i></button>
     <div style="padding: 100px 0px 0px 0px;"></div>
       <div class="tourlist">
	       <c:forEach items="${ requestScope.list }" var="t">
	         <div class="one">
	           <a href="tdetail.do?tour_no=${ t.tour_no }" target="_blank"><img src="resources/images/01.jpg" width=100% height=100%>
	            <span class="st">&#9733;</span> 4.8 ( 135 )<br>
	             <br>${ t.tour_name } <span class="wh"> <i class="fa fa-eye"></i> ${ t.tour_readcount } <i class="fa fa-heart"></i> </span>  
	           </a>
	         </div>
	        </c:forEach>
	    </div>
	    <div style="padding: 100px 0px 0px 0px;"></div>
		       <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		       <script src="resources/js/head.js"></script>
       <c:import url="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>