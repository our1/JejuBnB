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

</head>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script>

	
	
	function validate(){
	// 유효성 검사 코드 작성함
	// 서버 컨트롤러로 전송할 값들이 요구한 조건을 모두 만족하였는지 검사함

	// 암호와 암호 확인이 일치하는지 확인함
	var pwdValue = document.getElementById("userpwd").value;
	var pwdValue2 = document.getElementById("userpwd2").value;
	if (pwdValue !== pwdValue2) {
		alert ("암호와 암호 확인의 값이 일치하지 않습니다.")
		document.getElementById("userpwd").select();
		return false; // 전송 취소함

	}
	return true; //전송함

}
	
	// ID 중복 체크 확인을 위한 AJAX 실행 처리용 함수
	function dupIdCheck(){
		$.ajax({
			url:"idchk.do",
			type:"post",
			data:{user_id: $("#user_id").val()},
			success: function(data){
				console.log("success :"+ data)
				if (data == "ok") {
					alert("사용가능한 아이디입니다...");
					$("#user_name").focus();
				} else {
					alert("이미사용중인 아이디입니다..\n 다시입력");
					$('#user_id').select();
				}
			},
			error: function(jqXHR, textstatus, errorthrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			},
		});
		
		return false; // 클릭 이벤트가 전달되어서 submit이 동작되지 않게 함
		
	}

	
</script>
<body>
<center>
<h1 align="center"> 회원 가입 페이지  </h1>
<br>
<form method="post" action="enroll.do" onsubmit= "return validate();">

<!-- <form method="post" action="" onsubmit = "return validate();">-->
<table align = "center" width= "500" cellspacing = "5" cellpadding = "0">
<tr>
	<th colspan = "2"> JejuBnB <br> 회원 정보를 입력해 주세요. </th>
	
</tr>
<tr>
	<th> 아 이 디 </th>
	<td> <input type="text" name="user_id" id="user_id" value="${user_id }" readonly> &nbsp; 
		 <input type="button" value="중복체크" onclick="return dupIdCheck();"> </td>
</tr>
<tr>
	<th width = "120"> 이 름  </th>
	<td> <input type="text" name="user_name" id ="user_name" required ></td>
</tr>
<tr>
	<th> 암 호 </th>
	<td> <input type="password" name="user_pwd" id = "userpwd" required></td>
</tr>
<tr>
	<th> 암호 확인 </th>
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