<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="/member/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
  var focus = setInterval (function(){
	  document.getElementById("insert").focus();
	  
  }, 500)
  var interval = setInterval(function() {
	  $.ajax({
		    url: "selectMessageDetail.do", type: "post",
		    data:{message_no: $("#messageNo").val()},
		    success: function(data){
		    	location.reload();
		      
		    },
		    error: function(jqXHR, textstatus, errorthrown){
		      console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		    }
		  });
	  
	  
	  
	}, 15000)

 </script>
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
<c:if test="${ms.writer == loginMember.user_name }">
<div align="right">
${ms.writer } :  ${ms.content }<br>
</div>
</c:if>
<c:if test="${ms.writer != loginMember.user_name }">
<div align="left">
${ms.writer } :  ${ms.content }<br>
</div>
</c:if>
</c:forEach>


<form action="insertMessageDetail.do" method="post" >
<table align="center" width = "500" border ="1" cellspacing = "0"
cellpadding = "5">
<tr><th>내용</th> <td><textarea rows="5" cols="50" name="content" id="insert"></textarea></td></tr>
<tr><th colspan="2">
<input type="hidden" name="writer" value="${loginMember.user_name }">
<input type="hidden" name="message_no" value="${messagelist.message_no }" id="messageNo">
<input type="submit" value="보내기"> &nbsp; 
<input type="reset" value="작성취소"> &nbsp; 
</th></tr>
</table>
</form>

</body>
</html>