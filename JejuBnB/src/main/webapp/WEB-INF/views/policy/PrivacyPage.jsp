<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
	<h1>��� �� ��å</h1>
	<br>
	<hr>
	<a href="policyPage.do">���</a>
	<a href="PrivacyPage.do">��������</a>
	<br>
	<hr>
<%-- 	<span class="��" id="spreadBtn04"><input type="text" value="${policy.policy_type }">${policy.policy_type }</span>
	<ul id="hiddenList03" class="example01" style="display: none;">
	 <li>${policy.policy_content }</li> 
	</ul> --%>
	<br>
	<tr>
   <th width = "120">  </th>

   
 <c:forEach items="${policy }" var="privacy">
   <table align="center" border="1" cellspacing = "0" cellpadding = "3">
<tr>
<th></th>
<th></th>

</tr>

<tr>
<c:if test="${ privacy.policy_type eq '��������' }">
<td>${privacy.policy_no  }</td>
<td>${privacy.policy_content }</td>
</c:if>
</tr>


</table>
   </c:forEach>
  
   <td> </td>
</tr>

	
</body>
</html>