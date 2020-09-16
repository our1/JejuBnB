<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
			function validate(){
			var pwdValue = document.getElementById("userpwd").value;
			var pwdValue2 = document.getElementById("userpwd2").value;
			if (pwdValue !== pwdValue2) {
				alert ("암호와 암호 확인의 값이 일치하지 않습니다.")
				document.getElementById("userpwd").select();
				return false; 
			}
			return true; 
		}
		</script>
	</head>
	<body>
		<h1>비밀번호 변경</h1>
		<form action="updatepwd.do" method="post" onsubmit="return validate();">
			<table>
				<tr>
					<th> 새로운 비밀번호 </th>
					<td> <input type="password" name="user_pwd" id = "userpwd" required></td>
				</tr>
				<tr>
					<th> 비밀번호  확인 </th>
					<td> <input type="password" id="userpwd2"></td>
				</tr>
				<input type="hidden" name="user_id" value="${user_id }">
				<tr>
					<th colspan = "2">
						<input type="submit" value = "비밀번호 변경하기"> &nbsp;
						<a href="main.do"> 시작페이지로 </a>
					</th>
				</tr>
			</table>
		</form>
	</body>
</html>