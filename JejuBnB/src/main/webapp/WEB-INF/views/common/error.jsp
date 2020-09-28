<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript">
function closeWindow(){
	
	
	opener.window.location = "main.do";
	window.close();  
	
}

function moveMain(){
	location.href="main.do";
}


</script>

</head>
<body>
<fieldset align="center">
<h1 id="logo"><a href="mian.do"> JejuBnB </a></h1>
   <hr>
   <h1>에러 페이지</h1>
   <c:if test="${! empty exception }">

   <h3>
      jsp 페이지 오류 발생 :
      ${exception.message}
   </h3>
   </c:if>
   <c:if test="${empty exception }">
   <h3>
      Servlet 메세지:
      ${message} >
   </h3>
 	</c:if>
   <br>
   <button onclick="closeWindow()">시작페이지로 이동</button>
      <button onclick="moveMain()">시작페이지로 이동</button>
   
   </fieldset>
</body>
</html>