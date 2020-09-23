<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
	/* function change(act) {
		if(act=='kakao') {
			location.href="pay.do?room_no=" + ${room_no};		
		}
		else if(act=='mu') {
			location.href="pay2.do?room_no=" + ${room_no};
		}
		else {
			alert('결제 방법을 선택해주세요');
		}
	} */
	$(document).ready(function(){
		$('#btn').click(function(){
			var act = $("#sel_act").val();
			
			if(act == 'kakao') {
				//location.href="pay.do?room_no=" + ${room_no};	
				$("#form_act").attr("action", "pay.do");
				$("#form_act").submit();
				
			}
			else if(act=='mu') {
				//location.href="pay2.do?room_no=" + ${room_no};
				$("#form_act").attr("action", "pay2.do");
				$("#form_act").submit();
			}
			else {
				alert('결제 방법을 선택해주세요');
				return false;
			}
		});
	});
</script>

</head>
<body>
<h1>JejuBnB 숙소 결제</h1>
<h3>결제 방법 선택 :</h3>
<form id="form_act">
<input type="hidden" name="room_no" value="${room_no}">
<input type="hidden" name="date" value="${date}">
<select id="sel_act" name="act">
	<option value="">선택없음</option>
	<option value="kakao">카카오페이</option>
	<option value="mu">무통장입금</option>
</select> <br>
<!-- <button onclick="change()">결제 진행</button> -->
</form>
<button id="btn">결제진행</button>
</body>
</html>