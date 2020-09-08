<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
header { margin : 0; padding : 0;}
header h1#logo {
	font-size : 50pt;
	font-style : italic;
	color : #FFE08C;
	text-shadow : 2px 2px 2px gray;
}
header ul#menubar { 
	list-style: none;
	position : relative;
	left: 150px;
	top : -30px;		
}
header ul#menubar li {
	float : left;
	width : 120px;
	height : 30px;
	margin-right : 5px;
	padding : 0;
}
header ul#menubar li a {
	text-decoration : none;
	width : 120px;
	height : 30px;
	display : block;
	background-color:#FFE08C;
	text-align : center;
	color : #505050;
	font-weight:bold;
	margin : 0;
	text-shadow: 1px 1px 1px white;
	padding-top:5px;
}
header ul#menubar li a:hover {
	text-decoration : none;
	width : 120px;
	height : 30px;
	display : block;
	background-color:navy;
	text-align : center;
	color : white;
	font-weight:bold;
	margin : 0;
	text-shadow: 1px 1px 1px navy;
	padding-top:5px;
}
hr { clear: both; }


</style>
</head>

<body>
<header>
<h1 id="logo"><a href="mian.do"> JejuBnB </a></h1>
<c:if test= "${ !empty loginMember and loginMember.user_id eq 'admin'}">
	<%// 관리자가 로그인 했을때	%>
<ul id="menubar">
<li><a href="/testm/mlist"> 회원관리</a></li></li>
<li><a href="/testm/nlist.ad"> 공지글관리</a></li></li>
<li><a href="/testm/blist"> 게시글관리</a></li></li>
<li><a href="#">Q&A관리</a></li></li>
<li><a href="#">사진게시판관리</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath} }/moveAjax.do">Ajax테스트</a></li>
<li><a href="${ pageContext.servletContext.contextPath}/moveFile.do"> 파일 업로드 테스트</a></li>
<li><a href="/testm/index.jsp">Home</a></li></li>
</ul>
</c:if>
<c:if test="${ !empty sessionScope.loginMember and ! (loginMember.user_id eq 'admin') }">
<ul id="menubar">
<li><a href="/testm/mlist"> 암호화회원관리</a></li></li>
<li><a href="/testm/nlist"> 공지사항</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath}/roomlist.do"> 게시글</a></li></li>
<li><a href="#">Q&A</a></li></li>
<li><a href="#">사진게시판</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath}/moveFile.do"> 파일 업로드 테스트</a></li>
<li><a href="${ pageContext.servletContext.contextPath}/moveAjax.do">Ajax테스트</a></li>
<li><a href="/testm/index.jsp">Home</a></li></li>
</ul>
</c:if>
<c:if test="${ empty loginMember }">
<ul id="menubar">
<li><a href="/testm/views/member/enrollPage.html"> 회원가입</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath}/moveFile.do"> 파일 업로드 테스트</a></li>
<li><a href="${ pageContext.servletContext.contextPath}/roomlist.do""> 숙소 </a></li></li>
<li><a href="#">Q&A</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath}/moveCrypto.do">암호화회원관리</a></li></li>
<li><a href="${ pageContext.servletContext.contextPath}/roomlist.do">룸 리트스</a></li>
<li><a href="/testm/index.jsp">Home</a></li></li>
</ul>
</c:if>
</header>
</body>
</html>