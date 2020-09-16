<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<style type="text/css">
		table th {background-color : #ffffff, }
		table#outer { border : 2x solid navy, }
		</style>
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
		<center>
		<h1 align="center"> (Facebook 유저)<br> 회원 가입 페이지  </h1>
		<br>
		<form method="post" action="enroll.do" onsubmit= "return validate();">
	
			<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
				<tr>
					<th colspan = "2"> JejuBnB </th>
		
				</tr>
				<tr>
					<th> 아 이 디 </th>
					<td> <input type="text" name="user_id" id="user_id" value="${param.email }" readonly > &nbsp; 
					</td>
				</tr>
				<tr>
					<th width = "120"> 이 름  </th>
					<td> <input type="text" name="user_name" value="${param.name }"required ></td>
				</tr>
				<tr>
					<th> 비밀번호 </th>
					<td> <input type="password" name="user_pwd" id = "userpwd" required></td>
				</tr>
				<tr>
					<th> 비밀번호 확인 </th>
					<td> <input type="password" id="userpwd2"></td>
				</tr>
				<tr>
					<th> 생 년 월 일  </th>
					<td> <input type="text" name="birthday"> </td>
				</tr>
				<tr>
					<th> 전화번호 </th>
					<td> <input type="tel" name="phone" required> </td>
				</tr>
				<input type="hidden" name="facebook_id" value="Y">
				<tr>
					<th colspan = "2">
				<input type="submit" value = "가입하기"> &nbsp;
				<input type="reset" value = "작성취소"> &nbsp;
				<a href="main.do"> 시작페이지로 </a>
				</th>
				</tr>
			</table>
		</form>
	</center>
	</body>
</html>