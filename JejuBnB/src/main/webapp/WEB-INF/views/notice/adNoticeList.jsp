<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="/JejuBnB/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function updateNotice(){
		
	}
	
</script>
</head>
<body>
<h1>관리자 알림 설정</h1>
<form action="deleteNotice.do" method="post"> 
<ul>
<c:forEach items="${list }" var="notice">
<li>알림 타입 번호 : ${notice.notice_type_no}</li>
<li>알림 타입 : ${notice.notice_name} </li>
<ul>
<li>알림 내용 1 :${notice.notice_content1 }</li>
<li> 알림 내용 2 : ${notice.notice_content2 }</li>
</ul>
<li> <button onclick="updateNotice()">수정</button> <input type="checkbox" name="notice_type_no" value="${notice.notice_type_no }" > </li>
</c:forEach>
</ul>
<button type="submit">삭제하기</button>
</form>
</body>
</html>