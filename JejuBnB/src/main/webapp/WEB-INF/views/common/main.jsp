<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="/WEB-INF/views/common/error.jsp" 
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
div.lineA { 
   height : 100px; 
   border : 1px solid gray;
   float: left;
   position : relative;
   left : 120px;
   margin : 5px;
   padding : 5px;
}

div#banner {
   width : 750px;
   padding : 0;   
}

div#loginBox {
   width : 274px;
   font-size : 9pt;
   text-align : left;
   padding-left : 20px;
}

div#loginBox button {
   width : 250px;
   height : 35px;
   background-color : navy;
   color : white;
   margin-top : 10px;
   margin-bottom : 15px;   
   font-size : 14pt;
   font-weight : bold;
}
div#banner img { 
   margin : 0; 
   padding : 0;
   width : 750px;
   height : 110px;
}
section {
   position: relative;
   left: 120px;
}
section > div { width: 360px; background: #ccffff; }
section div table { width: 350px; background: white; }
</style>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function movePage(){
	 window.open("loginPage.do", "로그인", 
		"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}


</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr style="clear:both;">
<div id="banner" class="lineA">
<img src="resources/images/photo2.jpg">
</div>
<c:if test="${ empty loginMember }">
<div id="loginBox" class="lineA">
JejuBnB 사이트 방문을 환영합니다.<br>
<!-- <button onclick="javascript:location.href='views/member/loginPage.html';">로그인 하세요.</button><br> --> 
<button onclick="movePage();">로그인 하세요</button><br>
<a>아이디/비밀번호 조회</a>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

</div>
</c:if>


<c:if test="${ !empty loginMember and  loginMember.user_id eq 'admin' }">
<div id="loginBox" class="lineA">
${ sessionScope.loginMember.user_name } 님<br>
<button onclick="javascript:location.href='logout.do';">로그아웃</button><br>
<c:url var="callMyinfo" value="myinfo.do">
     <c:param name="user_id" value="${ loginMember.user_id }"></c:param>
</c:url>
<a href="${ callMyinfo }">My Page</a>
<!-- 쿼리스트링(Query String) : ?이름=전송값&이름=전송값 -->
</div>
</c:if>


<c:if test="${ !empty sessionScope.loginMember and ! (loginMember.user_id eq 'admin')}">
<div id="loginBox" class="lineA">
${ sessionScope.loginMember.user_name } 님<br>
<button onclick="javascript:location.href='logout.do';">로그아웃</button><br>
<a>쪽지</a> &nbsp; &nbsp; 
<a>메일</a> 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<c:url var="callMyinfo2" value="myinfo.do">
     <c:param name="user_id" value="${ sessionScope.loginMember.user_id }" />
</c:url>
<a href="${ callMyinfo2 }">My Page</a>
<!-- 쿼리스트링(Query String) : ?이름=전송값&이름=전송값 -->
</div>
</c:if>
<hr style="clear:left;">
<section>
<!-- 최근 등록 공지글 3개 조회 출력  -->
<div style="float:left;border:1px solid navy;padding:5px;margin:5px">
<h4>최근 공지글</h4>
<table id="newnotice" border="1" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>날짜</th></tr>
</table>
</div>
<!-- 조회수 많은 게시글 3개 조회 출력 -->
<div style="float:left;border:1px solid navy;padding:5px;margin:5px">
<h4>인기 게시글</h4>
<table id="toplist" border="1" cellspacing="0">
<tr><th>번호</th><th>제목</th><th>조회수</th></tr>
</table>
</div>
</section>
<hr style="clear:both;">
<!-- 상대경로만 사용 가능함 -->
<%-- <%@ include file="views/common/footer.jsp" %> --%>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>