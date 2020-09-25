<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

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
<style> 
.bank {
	border : 1px solid black;
}
.bb {
	border : 1px solid black;
}
</style>
</head>
<body>

<h1>무통장입금</h1>
<div class="bank">
	<div class="bb">예금주 : ${ room.user_id }</div> 
	<div class="bb">은행 : ${ account.bank_name }</div>  
	<div class="bb">계좌번호 :${ account.account_num }</div> 
	<div class="bb">결제금액 : ${ room.room_weekday*date }</div> 
</div>

<form action="reservST.do" name="muForm" method="post">
<input type="hidden" name="room_no" value="${room_no}">
<input type="hidden" name="date" value="${date}">
<input type="button" id="mupay" value="완료">
<input type="button" value="이전페이지" onclick="javascript:history.go(-1); return false;">
</form>
</body>
</html>