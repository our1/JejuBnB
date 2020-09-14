<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js">
	$(document).ready(function(){ $('#spreadBtn04').click(function(){
	if($("#hiddenList03").is(":visible")){
	$("#spreadBtn04").toggleClass("▼ ▲");
	$("#hiddenList03").slideUp(); }else{
	$("#spreadBtn04").toggleClass("▲ ▼");
	$("#hiddenList03").slideDown(); } 
	}); 
	});
</script> -->
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
	<h1>약관 및 정책</h1>
	<br>
	<hr>
	<a href="policyPage.do">약관</a>
	<a href="PrivacyPage.do">개인정보</a>
	<br>
	<hr>
<%-- 	<span class="▼" id="spreadBtn04"><input type="text" value="${policy.policy_type }">${policy.policy_type }</span>
	<ul id="hiddenList03" class="example01" style="display: none;">
	 <li>${policy.policy_content }</li> 
	</ul> --%>
	<br>
<table align="center" width="500" border="1" cellspacing="0" 
cellpadding="1">
	<tr>
   <th width = "120">번호</th><th>내용</th>
<c:forEach items="${requestScope.policy }" var="po">
<tr>
<c:if test="${  po.policy_type eq '약관' }">
<td>${po.policy_no  }</td>
<td>${po.policy_content }</td>
</c:if>
</tr>
</c:forEach>
</tr>
</table>
	<hr>
	<a href="movePolicyAdd.do">추가하기</a>
	
</body>
</html>