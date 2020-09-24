<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JejuBnB</title>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
	<style>
	#insertform{
	 text-align: center;
    padding-top: 10%;
    width: 500px;
    
	}
	#insertf {
	 position: relative;
    padding-top: 10%;
    text-align: center;
	}
	</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:import url="/WEB-INF/views/common/servicecenterside.jsp" />
	<div id="isnertform">
	<form action="InsertFaq.do" method="post" id="insertf" >
	<hr><br>
	
<table align="center" width="500" cellspacing="5" cellpadding="0" >
<tr>
	<th colspan="2">자주묻는질문 작성</th>
</tr>
<tr>
	<th>자주 묻는 질문 유형</th>
	<select id="faqcategory_no" name="faqcategory_no">
	<option value="1">이용</option>
	<option value="2">예약</option>
	<option value="3">결제</option>
	<option value="4">쿠폰/이벤트</option>
	<option value="5">회원</option> 
	</select>
	</tr>
	<br>
	<tr>
	<th>질문</th>
	<input type="text" name="faq_title" required><br>
	</tr>
	<tr>
	<th>답변</th>
	<input type="text" name="faq_rcontent" required><br>
	</tr>
	<input type="submit" value="등록">
	</table>

	</form>
	</div>
</body>
</html>