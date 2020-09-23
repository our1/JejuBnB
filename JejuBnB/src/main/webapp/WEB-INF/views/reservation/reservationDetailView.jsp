<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	window.name = "popupPayment";
	$(document).ready(function(){	
		$('#reservPM').click(function(){
			//parameter로 데이트값이랑 주말,평일가격 값을 넘기기
			window.open("payment.do?room_no=${room.room_no}&date=${date}&room_weekday=${room.room_weekday}&room_weekend=${room.room_weekend}", "_blank","toolvar=yes,menubar=yes,width=500,height=500,left=430,top=70").focus();
		});
	});
</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" /> <br><br><br><br><br><br><br>

<h1>확인 및 결제</h1> <br>
<h2>예약정보</h2>
<h3>날짜</h3>
<h2>${ reservation.checkin_date }~${ reservation.checkout_date }</h2>
<h3>인원</h3>
<h2>${ reservation.guest }</h2> <br>
<h3>가격</h3>

<h2>평일가격: ${ room.room_weekday*date }</h2> 
<h2>주말가격: ${ room.room_weekend*date }</h2>

<h3>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time } 입니다.</h3>


<button type="button" id="reservPM">결제진행</button>




<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>