<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<script>
	window.onload=function(){
		var mupay = document.getElementById('mupay');
		mupay.onclick=function(){
			document.muForm.target = opener.name;
			document.muForm.submit();
			self.close();
		}
	};
</script>

<h1>결제완료</h1> <br><br><br><br>
<div> 
	<div>예약날짜 : ${ reserv.checkin_date }~${ reserv.checkout_date }</div>  
	<div>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time }입니다.<div>
	<div>결제금액 : ${ room.room_weekday*date }</div> 
</div>

<form action="mm.do" name="muForm" method="post">
	<input type="hidden" name="room_no" value="${room_no}">
	<input type="hidden" name="date" value="${date}">
	<input type="button" id="mupay" value="메인으로">
</form>

</body>
</html>