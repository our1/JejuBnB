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
<h1>관리자 알림 설정</h1>
<ul>
<c:forEach items="${list }" var="notice">
<li>알림 타입 번호 : ${notice.notice_type_no}
<ul>
<li>알림 내용 1 :${notice.notice_content1 }</li>
<li> 알림 내용 2 : ${notice.notice_content2 }</li>
</ul>
</c:forEach>
</ul>
<button onclick="javascript:location.href='adUNoticeList.do'">돌아가기</button>
</body>
</html>