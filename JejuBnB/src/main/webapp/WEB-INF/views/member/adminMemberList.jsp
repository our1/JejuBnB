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
		
		function deleteMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"adminDel.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 삭제헀습니다.");
					location.reload();
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
		}
		function adminMember(){
			var checkedValue = $("input[type=radio][name=check]:checked").val() 
			$.ajax({
				url:"beAdminMember.do",
				type:"post",
				data:{user_id: checkedValue},
				success: function(data){
					console.log("success :"+ data)
					alert(checkedValue + "회원님을 관리자로 변경헀습니다.");
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
		<h1 align="center">회원 관리 페이지</h1>
		<table align="center" border="1" cellspacing = "0" cellpadding = "3">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>host check</th>
				<th>페이스북 아이디 check</th>
				<th>관리자 check</th>
				<th>선택</th>
			</tr>
		<c:forEach items="${memberlist}" var = "list">
			<tr>
				<th>${list.user_id }</th>
				<th>${list.user_name }</th>
				<th>${list.birthday }</th>
				<th>${list.phone }</th>
				<th>${list.host_check }</th>
				<th>${list.facebook_id }</th>
				<th>${list.admin_check }</th>
				<th><input type="radio" name="check" id ="${list.user_id }" value="${list.user_id }"></th>
			</tr>
		</c:forEach>
		</table>
		<div align="center">
			<button onclick="return deleteMember();">회원 삭제</button>
			<button onclick="return adminMember();">관리자 등업</button>
		</div>
	</body>
</html>