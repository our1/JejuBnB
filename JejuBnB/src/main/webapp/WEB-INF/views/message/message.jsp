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
<c:import url="/WEB-INF/views/common/header.jsp" /> <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:forEach items ="${list2 }" var = "ms">
<c:if test="${ms.writer == loginMember.user_id }">
<div align="left">
${ms.content } ${ms.message_date }<br>
</div>
</c:if>
<c:if test="${ms.writer != loginMember.user_id }">
<div align="right">
${ms.writer }<br>
${ms.content }<br>
</div>
</c:if>
</c:forEach>


<form action="insertMessageDetail.do" method="post" >
<table align="center" width = "500" border ="1" cellspacing = "0"
cellpadding = "5">
<tr><th>내용</th> <td><textarea rows="5" cols="50" name="content" id="insert"></textarea></td></tr>
<tr><th colspan="2">
<input type="hidden" name="writer" value="${loginMember.user_id }">
<input type="hidden" name="message_no" value="${messagelist.message_no }">
<input type="submit" value="보내기"> &nbsp; 
<input type="reset" value="작성취소"> &nbsp; 
<input type="button" value="이전 페이지로 이동" onclick="javascript:history.go(-1); return false;"> &nbsp; 
</th></tr>
</table>
</form>

</body>
</html>