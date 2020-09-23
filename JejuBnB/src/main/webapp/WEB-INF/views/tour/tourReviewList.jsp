<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function moveReviewWrite() {
			window.open("trwrite.do", "리뷰 작성",
					"width=800, height=900, left=300, top=50, toolbar=no, menubar=no, scrollbars=no, menubar=no");
		}
</script>
</head>
<body>
  <div class="modal fade" id="tour_review_more" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span>&#9733;</span> 4.8 점 ( 135 ) 개</h4>
          <button type="button" class="rvwrite" data-dismiss="modal"></button>
         </div>
        <div class="modal-body">
          <p></p>
        </div>
       
      </div>
      
    </div>
  </div>

<%-- <fieldset>
  <c:forEach items="${ requestScope.list }" var="tour_review">
    <div class="one">
          <div class="reviewdate"><fmt:formatDate value="${ tour_review.tour_review_date }" pattern="yyyy-MM-dd" /></div><br>
			 ${ tour_review.tour_review_content }
           </div>
   </c:forEach>
</fieldset> --%>

        <button class="rvwrite" onclick="moveReviewWrite()">리뷰 작성하기</button>
</body>
</html>