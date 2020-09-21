<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>

<script type="text/javascript">
	function change(act) {
		if(act=='kakao') {
			location.href="pay.do?room_no=" + ${room.room_no};		
		}
		else if(act=='mu') {
			location.href="pay2.do?room_no=" + ${room.room_no};
		}
	}
</script>

</head>
<body>
<h1>JejuBnB 숙소 결제</h1>
<h3>결제 방법 선택 :</h3>
<form>
<select name="act" onchange="change(this.value);">
	<option value="">선택없음</option>
	<option value="kakao">카카오페이</option>
	<option value="mu">무통장입금</option>
</select> <br>
<button onclick="change()">결제 진행</button>
</form>

</form>
</body>
</html>