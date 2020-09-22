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
		function adminMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"beHostMember.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 Host계정으로 변경했습니다.");
					location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
		}
		</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
		<table align = "center" width= "1500" cellspacing = "5" cellpadding = "0">
			<tr>
				<td> Room Number </td>
				<td> 아 이 디 </td>
				<td> 이 름 </td>
				<td> 숙소 이름 </td>
				<td> 숙소 주소</td>
				<td> 전화번호 </td>
				<td> Host Y/N </td>
				<td> Host 신청 허락 </td>
			</tr>
			<c:forEach items="${hostlist }" var = "host">
			<tr>
			<td><a href="moveDetailView.do?room_no=${host.room_no}">${host.room_no }</a></td>
			<td>${host.user_id }</td>
			<td>${host.user_name }</td>
			<td>${host.room_name }</td>
			<td>${host.room_address }</td>
			<td>${host.phone }</td>
			<td>${(host.host_check == null)? "신청 대기중" : "Y"}</td>
			<td><input type="radio" name="check" id ="${host.user_id }" value="${host.user_id }"></td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan = "8">
					<a href="main.do" > 시작페이지로 </a> &nbsp; <button onclick="return adminMember();">관리자 등업</button>
				</th>
			</tr>
		</table>
</body>
</html>