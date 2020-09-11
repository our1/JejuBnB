<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$.{function(
			if(${message} != null){
				alert('삭제할 수 없습니다.');
			}	
	)}
</script>
<style type="text/css">
	#delete {
		width : 30px;
		height : 30px;
		border : none;
		background-color : #ffffff;
	}
</style>
</head>
<body>
<h1>${loginMember.user_id } 알림 창</H1>

<ul>	
	<c:forEach items="${list }" var="notice">
		<form action="deleteUNotice.do" method="post">
		<input type="hidden" name="userid" value="${loginMember.user_id }">
		<input type="hidden" name="noticeno" value="${notice.notice_no }">
			<li>알림 : ${notice.notice_content } <button id="delete" type="submit">X</button></li>
		
		</form>
	</c:forEach>
</ul>

</body>
</html>