<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<style type="text/css">
		#pwdchangebut {
		   width : 300px;
		   }
		#oripwdbut {
		   width : 300px;
		   }   
		</style>
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
			function validate(){
			var pwdValue = document.getElementById("user_pwd").value;
			var pwdValue2 = document.getElementById("user_pwd2").value;
			if (pwdValue !== pwdValue2) {
				alert ("비밀번호와 비밀번호 확인의 값이 일치하지 않습니다.")
				document.getElementById("user_pwd").select();
				return false; 
			}
			}
			function pwdcheck(){
			$.ajax({
				url:"memberpwdcheck.do",
				type:"post",
				data:{user_id: $("#user_id").val(), user_pwd: $("#originPwd").val()},
				success: function(data){
					console.log("success :"+ data)
					if (data == "ok") {
						alert("기존 비밀번호와 일치 합니다.");
					} else {
						alert("기존 비밀번호가  일치하지 않습니다..\n 다시입력");
						$('#originPwd').val('');
					}
				},
				error: function(jqXHR, textstatus, errorthrown){
					console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
				},
			});
			return false;
		}
		</script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<br><br>
		<h1 align="center">비밀번호 변경 페이지</h1>
		<div align="center">
			<form action="updatepwd2.do" method="post" onsubmit="return validate();">
				기존 비밀번호 : <input type="password" id="originPwd" required> <br>
				<button onclick="return pwdcheck();" id="oripwdbut">비밀번호 확인 </button> <br><br>
				새로운 비밀번호 : <input type="password" name="user_pwd" id="user_pwd"required> <br>
				비밀번호 재확인 : <input type="password" id="user_pwd2" required> <br>
				<input type="hidden" name="user_id" id="user_id" value="${loginMember.user_id }">
				<input type="submit" value="비밀번호 변경" id="pwdchangebut">
			</form>
		</div>
	</body>
</html>