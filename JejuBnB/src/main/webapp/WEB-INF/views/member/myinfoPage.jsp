<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>second</title>
<script type="text/javascript" src="/second/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">




function moveUpdateView() {
	// 요청한 회원의 정보 수정페이지를 내보내는 서블릿을 요청함
	// 다시 요청한 회원의 아이디를 전송해서 처리함
	location.href = "mupview.do?user_id=${member.user_id}";
	// 절대경로 장점 :구조가바뀌거나 폴더가바뀌어도 구조가안바뀜
}

function sendDelete () {
	// 자바스크립트에서 서블릿 호출이나 다른 페이지 연결 처리할 때는
	// 로케이션 객체의 href 속성을 이용함. a테그의 href 사용과 같은 의미임.
	// 전송 방식은 Get 방식임
	
	// 회원 탈퇴 처리 서블릿 요청함. user_id 같이 전송함.
	location.href = "mdel.do?user_id=${requestScope.member.user_id}";
}

</script>
</head>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

   <hr>
<h1 align="center"> 내 정보 보기 페이지  </h1>
<br>
<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">

<tr>
	<th width = "120"> *이 름  </th>
	<td> ${member.user_name} </td>
</tr>
<tr>
	<th> 아 이 디 </th>
	<td>${member.user_id} </td>
</tr>


<tr>
	<th> *전화번호 </th>
	<td> ${member.phone} </td>
</tr>
<tr>
	<th colspan = "2">
		<button onclick="moveUpdateView();"> 수정페이지로 이동 </button> &nbsp;
		<button onclick="sendDelete();"> 탈퇴하기 </button> &nbsp;
		<a href="main.do"> 시작페이지로 </a>
	</th>
</tr>
</table>
<hr>
<!-- 상대경로만 사용이 가능하다/. -->
	<c:import url="/WEB-INF/views/common/header.jsp" />


</body>
</html>