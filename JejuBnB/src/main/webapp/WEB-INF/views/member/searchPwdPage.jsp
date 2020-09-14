<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JejuBnB</title>
		<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
		<script>
		function infoCheck(){
			$.ajax({
				url:"infocheck.do",
				type:"post",
				data:{user_id: $("#user_id").val(), birthday: $("#birthday").val()},
				success: function(data){
					console.log("success :"+ data)
					if (data == "ok") {
						alert("이메일로 인증번호를 전송 했습니다.");
						$.ajax({
							url:"sendEmail.do",
							type:"post",
							data:{e_mail: $("#user_id").val()},
							dataType: "json",
							success: function(jsonData){
								$("#dice").val(jsonData.no);
							},
							error: function(jqXHR, textstatus, errorthrown){
								console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
							},
						});
					} else {
						alert("회원 정보와 일치하지 않습니다..\n 다시입력");
						$('#user_id').select();
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
		<form action="searchPwd.do" method="post">
			이메일 아이디: <input type="text" name="user_id" id="user_id"> <br>
			&nbsp;&nbsp;&nbsp;
			생 년 월 일:  <input type="text" name="birthday" id="birthday">   ex) 920304   <br>
			
			<div id="submitbutton">
				<input type="button" value="본인인증" onclick=" return infoCheck();">
			</div>
			<input type="number" name="email_injeung" placeholder="  인증번호를 입력하세요. " required>
			<input type="hidden" name="dice" id="dice"> <br>
			 <button type="submit" name="submit">인증번호 확인</button>
		</form>
	</body>
</html>