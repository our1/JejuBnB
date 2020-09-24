<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JejuBnB</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
<style type="text/css">
#list{
	position: relative;
    width: 500px;
    text-align: center;
    top: 200px;
    /* padding-top: 150px; */
    background: yellow;
    color: green;
    margin: auto;
}
 table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:import url="/WEB-INF/views/common/servicecenterside.jsp" />
	<div id=list_top>
	<a href="questionListView.do">나의 문의 내역</a>
	<a href="myQuestionAdd.do">1:1 문의 작성</a>
	</div>
	<div id="list">
	<c:forEach items="${question }" var="qu">
	<table>
	<thead>
	<tr>
	<th>나의 질문</th><th>답변</th>	
	 </tr>
	 </thead>
	 <tbody>
	 <tr>
	 <td>${qu.question_content }</td>
	 <c:if test="${!empty qu.question_rcontent }">
	 <td>답변완료</td>
	 </c:if>
	 <c:if test="${empty qu.question_rcontent }">
	 <td>답변대기</td>
	 </c:if>
	 </tr>
	 </tbody>
	</table>
	</c:forEach>
	</div>
	
</body>
</html>