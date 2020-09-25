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
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h1>확인 및 결제</h1>
	<br>
	<h2>예약정보</h2>
	<h3>날짜</h3>
	<h2>${ reservation.checkin_date }~${ reservation.checkout_date }</h2>
	<h3>인원</h3>
	<h2>${ reservation.guest }</h2>
	<br>
	<h3>가격</h3>
	
	<c:if test="${ loginMember.user_id eq mycoupon.user_id }">
	<form id="form_act" method="POST">
	<input type="hidden" name="room_no" value="${room_no}">
	<input type="hidden" name="date" value="${date}">
	<%-- <input type="hidden" name="user_id" value="${user_id}"> --%>
	<select id="sel_act" name="act">
		<option value="">사용가능 쿠폰</option>
		<option value="">${ mycoupon.coupon_no }</option>
		<option value="">무통장입금</option>
	</select> <br>
	</form>
	<button id="btn">쿠폰적용하기</button>
	</c:if>
	
	<div>	
	<c:if test="${cald eq null}">
	<c:if test="${checkin eq 1 || checkin eq 7}">
		<fmt:formatNumber value="${room.room_weekend*date}" type="currency" />
	</c:if>
	<c:if test="${checkin ne 1 && checkin ne 7}">
		<fmt:formatNumber value="${room.room_weekday*date}" type="currency" />
	</c:if>
	</c:if>
	<c:if test="${cald ne null}">
	<c:if test="${checkin eq 1 || checkin eq 7}">
		<fmt:formatNumber value="${room.room_weekend*cald}" type="currency" />
	</c:if>
	<c:if test="${checkin ne 1 && checkin ne 7}">
		<fmt:formatNumber value="${room.room_weekday*cald}" type="currency" />
	</c:if>
	</c:if>
	</div>
	
	<h3>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time }
		입니다.</h3>


	<button type="button" id="reservPM">결제진행</button>




	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>