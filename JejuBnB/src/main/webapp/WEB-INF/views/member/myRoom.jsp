<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>JejuBnB</title>
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
		function deleteMyRoom(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"deleteMyRoom.do",
				type:"post",
				data:{room_no: checkedValue},
				success: function(data){
				console.log("success :"+ data)
				alert(checkedValue + "번 숙소를 삭제했습니다.");
				location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				}
			});
		}
		</script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<br>
		<br><br>
		<h1 align="center">내가 저장한 숙소</h1>
		<c:forEach items="${mlist }" var="list">
		<table align="center" border="1" cellspacing="0" width="700">
			<tr>
				<th colspan="3">
				<a href="moveDetailView.do?room_no=${list.room_no}">
				<img src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ list.room_rename_file }" />
				</a>
				</th>
			</tr>
				<tr><td> 숙소 이름 </td> <td>숙소 주소 </td></tr>
				<tr><td>${list.room_name }</td><td>${list.room_address }</td>
			<tr>
				<td colspan="2" align="center">${list.room_no }번 숙소 <input type="radio" name="check" id ="${list.room_no }" value="${list.room_no }"><button onclick="return deleteMyRoom();">삭제</button></td>
			</tr>
		</table>
		</c:forEach>
	</body>
</html>