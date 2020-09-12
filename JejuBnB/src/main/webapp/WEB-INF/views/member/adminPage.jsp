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
		<h1>관리자 페이지</h1>
		<c:url var="adminMemberList" value="moveAdminMemberPage.do"/>
		<a href="${adminMemberList}">회원 관리 페이지로 이동하는 버튼  </a> <br>
		<a href="${callMyinfo}">사장님 신청 페이지로 이동하는 버튼	 </a>  <br>
		관리자 만드는 페이지로 이동하는 버튼       <!-- beAdminPage.do    beAdminPage--> <br>
		회원 관리 페이지로 이동하는 버튼             <!--  adminMemberPage.do    adminMemberPage-->  <br>
		사장님 신청 페이지로 이동하는 버튼		<!-- behostPage.do     behostPage-->  <br>
	</body>
</html>