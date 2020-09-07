<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
	$(document).ready(function(){ $('#spreadBtn04').click(function(){
	if($("#hiddenList03").is(":visible")){
	$("#spreadBtn04").toggleClass("▼ ▲");
	$("#hiddenList03").slideUp(); }else{
	$("#spreadBtn04").toggleClass("▲ ▼");
	$("#hiddenList03").slideDown(); } 
	}); 
	});


<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>약관 및 정책</h1>
	<br>
	<hr>
	<a href="policy.do">약관</a>
	<a href="Privacy.do">개인정보</a>
	<br>
	<hr>
	<span class="▼" id="spreadBtn04">${policy_policy_no }</span>
	<ul id="hiddenList03" class="example01" style="display: none;">
	<li>${policy.policy_content }</li>
	</ul>
	<br>
	<hr>
	<a href="addpolicy.do">추가하기</a>
	
</body>
</html>