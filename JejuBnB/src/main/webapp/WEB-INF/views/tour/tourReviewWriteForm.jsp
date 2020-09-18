<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<form action="treviewinsert.do" method="post">
<input type="hidden" name="user_id">
<input type="number" name="tour_score">
<textarea rows="" cols="" placeholder="리뷰를 작성해주세요"></textarea>
</form>
<button type="submit" value="작성 완료"></button>
</body>
</html>