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
<h1>전체 알림 조회</h1>
<table>
<c:forEach items="${list }" var="unotice">
<tr><th>알림 내용 :</th> <td>${unotice.notice_content } </td> <th>보낸 사람 : </th> <td> ${unotice.from_user } </td> <th> 보낸 날짜 ; </th> <td> ${unotice.notice_date }</td></tr>
</c:forEach>
</table>
<button onclick="javascript:location.href='adNoticeList.do'">알림 내용 설정</button>
</body>
</html>