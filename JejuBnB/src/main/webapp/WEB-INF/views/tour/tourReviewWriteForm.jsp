<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
      <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
      <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
	  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
	  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	  <script src="resources/summernote/lang/summernote-ko-KR.js"></script>
      <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
</head>
<body>
<h1 class="footer__logo" style="margin-top : 0px;">JejuBnB</h1>
<form action="trinsert.do" method="post">
<input type="hidden" name="tour_review_no">
<input type="number" name="tour_score">
<textarea rows="" cols="" placeholder="리뷰를 작성해주세요" name="tour_review_content"></textarea>
<input type="hidden" name="user_id">
<button type="submit" value="작성 완료">리뷰 달기</button>
</form>
</body>
</html>