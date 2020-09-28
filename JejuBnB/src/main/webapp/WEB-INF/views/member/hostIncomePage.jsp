<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 
	<title>JejuBnB</title>
	  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	  <script type="text/javascript">
	    google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["5월", "Density", { role: "style" } ],
	        ["6월", 600000, "skyblue"],
	        ["7월", $("#7income").val(), "skyblue"],
	        ["8월", $("#8income").val(), "skyblue"],
	        ["9월", $("#9income").val(), "skyblue"]
	      ]);
	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);
	      var options = {
	        title: "호스트 월 매출",
	        width: 700,
	        height: 800,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	  }
	  </script>
			<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
			<script>
			function checkIncome(){
				var checkedValue = $("input[type=radio][name=check]:checked").val() 
				$.ajax({
					url:"checkIncome.do",
					type:"post",
					data:{re_num: checkedValue},
					success: function(data){
						console.log("success :"+ data)
						alert("결제를 완료 처리 했습니다.");
						location.reload();
					},
					error: function(jqXHR, textstatus, errorthrown){
						console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
					},
				});
			}
			</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
			<br>
	<h1 align="center">host Income Page</h1>
	  <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
			<table align = "right" width= "800" cellspacing = "5" cellpadding = "0">
				<tr>
					<td> Room Number </td>
					<td> 숙소 이름 </td>
					<td> 게스트 아이디</td>
					<td> 요금 </td>
					<td> 체크인 </td>
					<td> 체크아웃 </td>
					<td> 결제 상태 </td>
					<td> 결제 확인완료  </td>
				</tr>
				<c:forEach items="${list }" var = "list">
				<tr>
					<td><a href="moveDetailView.do?room_no=${list.room_no}">${list.room_no }</a></td>
					<td>${list.room_name }</td>
					<td>${list.guest_id }</td>
					<c:if test="${!empty list.room_weekday }">
					<td>${list.room_weekday }</td>
					</c:if>
					<c:if test="${empty list.room_weekday }">
					<td>${list.room_weekend }</td>
					</c:if>
					<td>${list.checkin_date }</td>
					<td>${list.checkout_date }</td>
					<td>${(list.payment_status == 'N')? "결제 대기중" : "결제 완료" }</td>
					<td><input type="radio" name="check" id ="${list.re_num }" value="${list.re_num }"></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan = "8" align="right">
						<a href="main.do" > 시작페이지로 </a> &nbsp; <button onclick="return checkIncome();">결제 확인</button>
					</td>
				</tr>
			</table>
		<c:set var="total6" value="0"/>
		<c:set var="total7" value="0"/>
		<c:set var="total8" value="0"/>
		<c:set var="total9" value="0"/>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and  '2020-07-01' gt list.checkin_date and list.checkin_date ge '2020-06-01' }">
		<input type="hidden" value="${list.room_weekday }">
		<c:set var="total6" value="${total6 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-08-01' gt list.checkin_date and list.checkin_date ge '2020-07-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total7" value="${total7 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-09-01' gt list.checkin_date and list.checkin_date ge '2020-08-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total8" value="${total8 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
	<c:forEach items="${list }" var = "list">
		<c:if test="${list.payment_status =='Y' and '2020-10-01' gt list.checkin_date and list.checkin_date ge '2020-09-01' }">
		<input type="hidden" value="${list.room_weekday }" >
		<c:set var="total9" value="${total9 + list.room_weekday + list.room_weekend}"/>
		</c:if>
	</c:forEach>
		<input type="hidden" value="${total6 }" id="6income">
		<input type="hidden" value="${total7 }" id="7income">
		<input type="hidden" value="${total8 }" id="8income">
		<input type="hidden" value="${total9 }" id="9income">
  </body>

</body>
</html>