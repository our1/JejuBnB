<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<style>

/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
}
</style>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(function() {
		//오늘 날짜를 출력
		$("#today").text(new Date().toLocaleDateString());

		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		//시작일.
		$('#checkinDate').datepicker({
			//showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
			//buttonImage: "images/calendar.gif", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			//buttonText: "날짜선택",             // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			minDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#checkoutDate").datepicker("option", "minDate", selectedDate);
			}
		});

		//종료일
		$('#checkoutDate').datepicker({
			//showOn: "both",
			//buttonImage: "images/calendar.gif",
			buttonImageOnly : true,
			//buttonText: "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			minDate : 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
				$("#checkinDate").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
 <script type="text/javascript">
            $(function(){
              var num=1; //성인 수 
              var num1=0; //어린이 수
              var num2=0; //유아 수
              var sum; //성인 + 어린이 수
              var sum1; //성인 + 어린이 수
              var sum2; //성인 + 어린이 수
              $('#decreaseQuantity').click(function(e){
                e.preventDefault();
                var stat = $('#numberUpDown').text();
                num = parseInt(stat,10);
                num--;
                sum=num+num1;
                if(num<=0){
                  alert('최소인원을 선택해주세요.');
                  num = num +1;
                }
                $('#numberUpDown').text(num);
                $('#num').val(num);
                
                });

                $('#increaseQuantity').click(function(e){
                  e.preventDefault();
                  var stat = $('#numberUpDown').text();
                  num = parseInt(stat,10);
                  num++;
                  sum = num + num1;
                  if(sum+num2>10){
                    alert('최대인원을 초과하였습니다.');
                    sum3;
                  }
                  $('#numberUpDown').text(num);
                  $('#num').val(num);
                 
                });

            $('#decreaseQuantity2').click(function(e){
              e.preventDefault();
              var stat1 = $('#numberUpDown2').text();
              num1 = parseInt(stat1,10);
              num1--;
              sum1 = num + num1;
              
              if(num1<0){
                alert('최소인원을 선택해주세요.');
                sum3;
              }
            $('#numberUpDown2').text(num1);
            $('#num1').val(num1);
            });

            $('#increaseQuantity2').click(function(e){
              e.preventDefault();
              var stat1 = $('#numberUpDown2').text();
              num1 = parseInt(stat1,10);
              num1++;
              sum1 = num + num1;
              if(sum1+num2>10){
                alert('최대인원을 초과하였습니다.');
                sum3;
              }
              $('#numberUpDown2').text(num1);
              $('#num1').val(num1);
              });

            $('#decreaseQuantity3').click(function(e){
              e.preventDefault();
              var stat2 = $('#numberUpDown3').text();
              num2 = parseInt(stat2,10);
              num2--;
              if(num2<0){
                alert('최소인원을 선택해주세요.');
                num2=0;
              }
            $('#numberUpDown3').text(num2);
            $('#num2').val(num2);
            });
            
            $('#increaseQuantity3').click(function(e){
              e.preventDefault();
              var stat2 = $('#numberUpDown3').text();
              num2 = parseInt(stat2,10);
              num2++;
              sum2 = num + num1;
              if(sum2+num2>10){
                alert('최대인원을 초과하였습니다.');
                sum3;
              }
            $('#numberUpDown3').text(num2);
            $('#num2').val(num2);
            });

            $('button').on('click', function(){
              if($('button#increaseQuantity').on('click', function(){
                $('#nu').val('게스트' + sum  + '명' + ', ' + '유아' + num2  + '명');
              }))
              if($('button#increaseQuantity2').on('click', function(){
                $('#nu').val('게스트' + sum1  + '명' + ', ' + '유아' + num2  + '명');
              }))
              if($('button#increaseQuantity3').on('click', function(){
                $('#nu').val('게스트' + sum2  + '명' + ', ' + '유아' + num2  + '명');
              }))
              $('#nu').val('게스트' + num  + '명' + ', ' + '유아' + num2  + '명');
            });
                        	
            
            });
            

        </script>
<!-- <script type="text/javascript">
function moveReservPage(){
	location.href="redetail.do?room_no=" + ${room.room_no};
}	
</script> -->
<script>
	window.name = "reservationListView";
	$(document).ready(function(){	
		$('#popupBtn').click(function(){			
			window.open("rewrite.do?room_no=${room.room_no}" ,"_blank","toolvar=yes,menubar=yes,width=500,height=500,left=430,top=70").focus();
		});
	});
</script>
<!-- <script>
	$(document).ready(function(){
		$("input[name='check']").click(function(){
			$("#numberUpDown").each(function(){
				
			});
		});
	});
</script> -->
<style type="text/css">
._1044tk8 {
	display: flex !important;
	margin-bottom: 24px !important;
}
._fz3zdn {
	flex-shrink: 0 !important;
}
._1mqc21n {
	margin-left: 16px !important;
}
._1qsawv5 {
	color: rgb(34, 34, 34) !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		"Helvetica Neue", sans-serif !important;
	font-weight: 600 !important;
	font-size: 16px !important;
	line-height: 20px !important;
	margin-bottom: 4px !important;
}
._1jlr81g {
	color: rgb(113, 113, 113) !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		"Helvetica Neue", sans-serif !important;
	font-weight: 400 !important;
	font-size: 14px !important;
	line-height: 20px !important;
}
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
.main-form {
	background-color: white;
	margin-left: 38%;
	padding: 20px;
	width: 460px;
	border-radius: 4px;
	box-shadow: 0 16px 40px rgba(0, 0, 0, 0.12);
	overflow: visible;
	height: 350px;
}
.form-title2 {
	font-size: 12px;
	padding-top: 20px;
	font-weight: 400;
}
.form>input {
	padding: 10px;
	font-size: 15px;
	height: 46px;
	border: solid 1px #ccc;
	border-radius: 5px;
}
.form-1>input {
	width: 375px;
}
.form-2>input {
	width: 185px;
}
.inline-block {
	display: inline-block;
}
.search-button {
	background-color: #FF5A5F;
	padding: 10px 22px;
	margin: 50px 130px;
	border: 2px solid #FF5A5F;
	border-radius: 5px;
	font-size: 16px;
	font-weight: 900;
	color: white;
	float: right;
}
.bottom-text {
	color: white;
	font-weight: 800;
	position: absolute;
	bottom: 10px;
	right: 5px;
}
/* Style The Dropdown Button */
.dropbtn_1 {
	background-color: white;
	color: black;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}
/* The container <div> - needed to position the dropdown content */
.dropdown_1 {
	position: relative;
	display: inline-block;
	border: solid 1px #ccc;
}
/* Dropdown Content (Hidden by Default) */
.dropdown-content_1 {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	width: 300px;
	height: 200px;
}
/* Links inside the dropdown */
.dropdown-content_1 a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
}
/* Change color of dropdown links on hover */
.dropdown-content_1 a:hover {
	background-color: white
}
/* Show the dropdown menu on hover */
.dropdown_1:hover .dropdown-content_1 {
	display: block;
}
/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown_1:hover .dropbtn_1 {
	background-color: white;
}
._svr7sj {
	color: rgb(34, 34, 34) !important;
	font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto,
		"Helvetica Neue", sans-serif !important;
	font-weight: 600 !important;
	font-size: 22px !important;
	line-height: 26px !important;
}
._14i3z6h {
	color: inherit !important;
	font-size: 1em !important;
	font-weight: inherit !important;
	line-height: inherit !important;
	margin: 0px !important;
	padding: 0px !important;
}
._1byskwn {
	margin-left: -8px !important;
	margin-right: -8px !important;
	width: calc(100% + 16px) !important;
}
._1byskwn {
	margin-left: -6px !important;
	margin-right: -6px !important;
	width: calc(100% + 12px) !important;
}
._1byskwn {
	-webkit-box-pack: start !important;
	-webkit-box-align: stretch !important;
	display: flex !important;
	align-items: stretch !important;
	justify-content: flex-start !important;
	flex-wrap: wrap !important;
	width: calc(100% + 12px) !important;
	margin-left: -6px !important;
	margin-right: -6px !important;
}
._19xnuo97 {
	padding-left: 8px !important;
	padding-right: 8px !important;
}
._19xnuo97 {
	padding-left: 6px !important;
	padding-right: 6px !important;
}
._19xnuo97 {
	position: relative !important;
	width: 100% !important;
	margin-left: 0% !important;
	margin-right: 80% !important;
	padding-left: 6px !important;
	padding-right: 6px !important;
}
._1nlbjeu {
	-webkit-box-direction: reverse !important;
	-webkit-box-orient: horizontal !important;
	-webkit-box-pack: end !important;
	justify-content: flex-end !important;
	flex-direction: row-reverse !important;
	max-width: 83.3333% !important;
}
._1nlbjeu {
	-webkit-box-pack: justify !important;
	-webkit-box-align: center !important;
	display: flex !important;
	align-items: center !important;
	justify-content: space-between !important;
	padding-bottom: 16px !important;
}
._yp1t7a {
	margin-right: 16px !important;
	margin-left: 0px !important;
}
._yp1t7a {
	min-width: 24px !important;
	margin-left: 16px !important;
}
</style>
</head>
<body>
	<%-- <c:import url="/WEB-INF/views/common/header.jsp"/>--%> <br><br><br><br><br> 
	<div>
		<h1>${ room.room_name }</h1>
		<h2> ${room.room_address } </h2>
		<br>
<style>
* {
	margin: 0;
	padding: 0;
}

ul, li {
	list-style: none;
}

#slide {
	height: 300px;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 100%;
}

#slide li:nth-child(1) {
	background: #faa;
}

#slide li:nth-child(2) {
	background: #ffa;
}

#slide li:nth-child(3) {
	background: #faF;
}

#slide li:nth-child(4) {
	background: #aaf;
}

#slide li:nth-child(5) {
	background: #faF;
}

#slide li:nth-child(6) {
	background: #ffa;
}

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	border: 2px solid #666;
	background: #fff;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul {
	margin-left: 0%;
}

#pos2:checked ~ul {
	margin-left: -100%;
}

#pos3:checked ~ul {
	margin-left: -200%;
}

#pos4:checked ~ul {
	margin-left: -300%;
}

#pos5:checked ~ul {
	margin-left: -400%;
}

#pos6:checked ~ul {
	margin-left: -500%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background: #666;
}

#pos2:checked ~.pos>label:nth-child(2) {
	background: #666;
}

#pos3:checked ~.pos>label:nth-child(3) {
	background: #666;
}

#pos4:checked ~.pos>label:nth-child(4) {
	background: #666;
}

#pos5:checked ~.pos>label:nth-child(5) {
	background: #666;
}

#pos6:checked ~.pos>label:nth-child(6) {
	background: #666;
}
</style>

		<div id="slide">
			<input type="radio" name="pos" id="pos1" checked> <input
				type="radio" name="pos" id="pos2"> <input type="radio"
				name="pos" id="pos3"> <input type="radio" name="pos"
				id="pos4"> <input type="radio" name="pos" id="pos5">
			<input type="radio" name="pos" id="pos6">
			<ul>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<p class="pos">
				<label for="pos1"></label> <label for="pos2"></label> <label
					for="pos3"></label> <label for="pos4"></label> <label for="pos5"></label>
				<label for="pos6"></label>
			</p>
		</div>
		<br>

		<h3>${ room.user_id }님의 JejuBnB</h3>
		<br>
		<h4>최대 인원 ${ room.max_people } 명, 침대수 ${ room.bed } 개, 침실수 ${ room.bedroom }
			개, 욕실수 ${ num_bathroom } 개</h4>
		<br>
		<hr>

		<div data-plugin-in-point-id="HIGHLIGHTS_DEFAULT"
			data-section-id="HIGHLIGHTS_DEFAULT"
			style="padding-top: 32px; padding-bottom: 32px;">
			<div class="_1044tk8">
				<div class="_fz3zdn">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
						<path d="M17.954 2.781l.175.164 13.072 12.842-1.402 1.426-1.8-1.768L28 29a2 2 0 0 1-1.85 1.994L26 31H6a2 2 0 0 1-1.995-1.85L4 29V15.446l-1.8 1.767-1.4-1.426L13.856 2.958a3 3 0 0 1 4.097-.177zm-2.586 1.503l-.096.088L6 13.48 6 29l5-.001V19a2 2 0 0 1 1.85-1.995L13 17h6a2 2 0 0 1 1.995 1.85L21 19v9.999h5V13.48l-9.3-9.135a1.001 1.001 0 0 0-1.332-.06zM19 19h-6v9.999h6z"></path></svg>
				</div>
				<div class="_1mqc21n">
					<div class="_1qsawv5">집 전체</div>
					<div class="_1jlr81g">초소형 주택 전체를 단독으로 사용하시게 됩니다.</div>
				</div>
			</div>
			<div class="_1044tk8">
				<div class="_fz3zdn">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
						<path
							d="M25 1a2 2 0 0 1 1.995 1.85L27 3l-.001 26H29v2H3v-2h1.999L5 3a2 2 0 0 1 1.85-1.995L7 1zm-4 2H7l-.001 26H21zm4 0h-2v26h1.999zm-7 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg>
				</div>
				<div class="_1mqc21n">
					<div class="_1qsawv5">셀프 체크인</div>
					<div class="_1jlr81g">키패드를 이용해 체크인하세요.</div>
				</div>
			</div>
			<div class="_1044tk8">
				<div class="_fz3zdn">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
						<path
							d="M16 0c6.627 0 12 5.373 12 12 0 6.337-3.814 12.751-11.346 19.257L16 31.82l-1.076-.932C7.671 24.509 4 18.218 4 12 4 5.423 9.397 0 16 0zm0 2C10.504 2 6 6.525 6 12c0 5.44 3.249 11.118 9.831 17.02l.169.149.576-.518c6.178-5.65 9.293-11.092 9.42-16.318L26 12c0-5.523-4.477-10-10-10zm0 5a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z"></path></svg>
				</div>
				<div class="_1mqc21n">
					<div class="_1qsawv5">훌륭한 숙소 위치</div>
					<div class="_1jlr81g">최근 숙박한 게스트 중 90%가 위치에 별점 5점을 준 숙소입니다.</div>
				</div>
			</div>
			<div class="_1044tk8">
				<div class="_fz3zdn">
					<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
						aria-hidden="true" role="presentation" focusable="false"
						style="display: block; height: 24px; width: 24px; fill: currentcolor;">
						<path
							d="M12 0v2h8V0h2v2h6a2 2 0 0 1 1.995 1.85L30 4v15.586a2 2 0 0 1-.467 1.284l-.119.13L21 29.414a2 2 0 0 1-1.238.578l-.176.008H7a5 5 0 0 1-4.995-4.783L2 25V4a2 2 0 0 1 1.85-1.995L4 2h6V0zM4 12v13a3 3 0 0 0 2.824 2.995L7 28h11v-5a5 5 0 0 1 4.783-4.995L23 18h5v-6zm23.585 8H23a3 3 0 0 0-2.995 2.824L20 23v4.585zM4 10h24V4h-6v2h-2V4h-8v2h-2V4H4z"></path></svg>
				</div>
				<div class="_1mqc21n">
					<div class="_1qsawv5">체크인 24시간 전까지 수수료 없이 예약 취소 가능</div>
					<div class="_1jlr81g"></div>
				</div>
			</div>
		</div>
		<br>
		<hr>
		<br>

		<div class="_1gw6tte">
			<div class="_12xcxtl"></div>
			<div data-plugin-in-point-id="AMENITIES_DEFAULT"
				data-section-id="AMENITIES_DEFAULT"
				style="padding-top: 48px; padding-bottom: 48px;">
				<div style="padding-bottom: 24px;">
					<div class="_svr7sj">
						<section>
							<h2 tabindex="-1" class="_14i3z6h">편의시설</h2>
						</section>
					</div>
				</div>
				<c:if test="${ amenity.amenity_no eq '7' }">
				<div class="_1byskwn">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
								무선인터넷					
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M16 20a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm0-7a9 9 0 0 1 8.043 4.958L22.53 21.47a7.003 7.003 0 0 0-13.058 0l-1.514-1.514A9 9 0 0 1 16 15zm0-5c4.89 0 9.193 2.506 11.697 6.304l-1.45 1.45A11.993 11.993 0 0 0 16 12c-4.339 0-8.14 2.302-10.247 5.752l-1.45-1.449A13.987 13.987 0 0 1 16 10zm0-5c6.267 0 11.826 3.034 15.286 7.714l-1.432 1.432C26.773 9.821 21.716 7 16 7 10.285 7 5.228 9.82 2.146 14.145L.714 12.714C4.174 8.034 9.733 5 16 5z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>	
					<c:if test="${ amenity.amenity_no eq '17' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									화재 경보기
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M7 28H5V15c0-4.997 3.356-9.304 8.061-10.603A3 3 0 0 1 17.69 2.52l2.66-2.28 1.302 1.52L19.036 4H23v2h-4.17A3.008 3.008 0 0 1 17 7.83l.001.242a7.007 7.007 0 0 1 5.982 6.446l.013.24L23 15v15a2 2 0 0 1-1.85 1.995L21 32H11a2 2 0 0 1-1.995-1.85L9 30v-6H7zm9-18c-2.617 0-4.775 2.014-4.983 4.573l-.013.22L11 15v15h10V15.018l-.003-.206A5 5 0 0 0 16 10zm-2.654-3.6a9.002 9.002 0 0 0-6.342 8.327L7 15v7h2v-7.018l.005-.244A7.001 7.001 0 0 1 15 8.071v-.242a3.01 3.01 0 0 1-1.654-1.43zM16 4a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '3' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									난방
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M16 0a5 5 0 0 1 4.995 4.783L21 5l.001 12.756.26.217a7.984 7.984 0 0 1 2.717 5.43l.017.304L24 24a8 8 0 1 1-13.251-6.036l.25-.209L11 5A5 5 0 0 1 15.563.019l.22-.014zm0 2a3 3 0 0 0-2.995 2.824L13 5v13.777l-.428.298a6 6 0 1 0 7.062.15l-.205-.15-.428-.298L19 11h-4V9h4V7h-4V5h4a3 3 0 0 0-3-3zm1 11v7.126A4.002 4.002 0 0 1 16 28a4 4 0 0 1-1-7.874V13zm-1 9a2 2 0 1 0 0 4 2 2 0 0 0 0-4z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									건물 내 무료 주차
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M16 1c8.284 0 15 6.716 15 15 0 8.284-6.716 15-15 15-8.284 0-15-6.716-15-15C1 7.716 7.716 1 16 1zm0 2C8.82 3 3 8.82 3 16s5.82 13 13 13 13-5.82 13-13S23.18 3 16 3zm2 5a5 5 0 0 1 .217 9.995L18 18h-5v6h-2V8zm0 2h-5v6h5a3 3 0 0 0 .176-5.995z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '4' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									에어컨
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M17 1v4.03l4.026-2.324 1 1.732L17 7.339v6.928l6-3.464V5h2v4.648l3.49-2.014 1 1.732L26 11.381l4.026 2.325-1 1.732L24 12.535l-6 3.464 6 3.465 5.026-2.902 1 1.732L26 20.618l3.49 2.016-1 1.732L25 22.351V27h-2v-5.804l-6-3.465v6.929l5.026 2.902-1 1.732L17 26.97V31h-2v-4.031l-4.026 2.325-1-1.732L15 24.66v-6.929l-6 3.464V27H7v-4.65l-3.49 2.016-1-1.732 3.489-2.016-4.025-2.324 1-1.732 5.025 2.901 6-3.464-6-3.464-5.025 2.903-1-1.732L6 11.38 2.51 9.366l1-1.732L7 9.648V5h2v5.803l6 3.464V7.339L9.974 4.438l1-1.732L15 5.03V1z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '10' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
										옷걸이
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M16 2a5 5 0 0 1 1.661 9.717 1.002 1.002 0 0 0-.653.816l-.008.126v.813l13.23 9.052a3 3 0 0 1 1.299 2.279l.006.197a3 3 0 0 1-3 3H3.465a3 3 0 0 1-1.694-5.476L15 13.472v-.813c0-1.211.724-2.285 1.816-2.757l.176-.07a3 3 0 1 0-3.987-3.008L13 7h-2a5 5 0 0 1 5-5zm0 13.211L2.9 24.175A1 1 0 0 0 3.465 26h25.07a1 1 0 0 0 .565-1.825z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '12' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									헤어 드라이기
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M14 27l-.005.2a4 4 0 0 1-3.789 3.795L10 31H4v-2h6l.15-.005a2 2 0 0 0 1.844-1.838L12 27zM10 1c.536 0 1.067.047 1.58.138l.38.077 17.448 3.64a2 2 0 0 1 1.585 1.792l.007.166v6.374a2 2 0 0 1-1.431 1.917l-.16.04-13.554 2.826 1.767 6.506a2 2 0 0 1-1.753 2.516l-.177.008H11.76a2 2 0 0 1-1.879-1.315l-.048-.15-1.88-6.769A9 9 0 0 1 10 1zm5.692 24l-1.799-6.621-1.806.378a8.998 8.998 0 0 1-1.663.233l-.331.008L11.76 25zM10 3a7 7 0 1 0 1.32 13.875l.331-.07L29 13.187V6.813L11.538 3.169A7.027 7.027 0 0 0 10 3zm0 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${ amenity.amenity_no eq '2' }">
					<div class="_19xnuo97">
						<div class="_1nlbjeu">
							<div>
									샴푸
							</div>
							<div class="_yp1t7a">
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"
									aria-hidden="true" role="presentation" focusable="false"
									style="display: block; height: 24px; width: 24px; fill: currentcolor;">
									<path
										d="M11 1v7l1.898 20.819.007.174c-.025 1.069-.804 1.907-1.818 1.999a2 2 0 0 1-.181.008h-7.81l-.174-.008C1.86 30.87 1.096 30.018 1.096 29l.002-.09 1.907-21L3.001 1zm6 0l.15.005a2 2 0 0 1 1.844 1.838L19 3v7.123l-2 8V31h-2V18.123l.007-.163.02-.162.033-.16L16.719 11H13V1zm11 0a2 2 0 0 1 1.995 1.85L30 3v26a2 2 0 0 1-1.85 1.995L28 31h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7v-2h7v-2h-7V9h7V7h-7V5h7V3h-7V1zM9.088 9h-4.18L3.096 29l.058.002L10.906 29l-.004-.058zM17 3h-2v6h2zM9.002 3H5L5 7h4.004z"></path></svg>
							</div>
						</div>
					</div>
					</c:if>
					<div class="_19xnuo97">
						<div class="_1nlbjeu"></div>
					</div>
				</div>
			</div>
		</div>

		<br><br><hr><br><br><br>
		
		<div>
			<h2>호스트의 숙소 소개</h2> <br>
			<h4>${ room.room_content }</h4>	
		</div>
		<br><br><hr>
		

			<tr>
				<td>청결도 : ${ review.clean_score }</td> <br>	
				<td>가격 대비 만족도 : ${ review.value_score }</td> <br>
				<td>서비스 : ${ review.service_score }</td>	
			</tr>

	<table>
		<c:forEach items="${ requestScope.list }" var="review"> 
			<tr>
				<th>작성자 : </th>
				<td>${review.user_id} </td> <br>
				<th>작성 날짜 : </th>
				<td><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" /> </td>
			</tr>
			<tr>
				<th>리뷰내용 :</th> <br>
				<td>${review.review_content}</td>
			</tr>
		</c:forEach>
	</table>

	<button type="button" class="btn" id="popupBtn">리뷰 등록</button>
	<br><br><hr><br><br><br>
		
	<form action="reserv.do" method="post">
		<input type="hidden" name="room_no" value="${ room.room_no }">
		<input type="hidden" name="user_id" value="${ loginMember.user_id }">
			<div class="main-form">
			<h2 class="form-title1">요금을 확인하려면 날짜를 입력하세요.</h2>
			<div class="inline-block">
				<div class="form-title2">체크인</div>
				<div class="form form-2">
					<label for="checkinDate"></label> 
					<input type="text" name="checkin_date" id="checkinDate" readonly placeholder="날짜추가">
				</div>
			</div>
			<div class="inline-block">
				<div class="form-title2">체크아웃</div>
				<div class="form form-2">
					<label for="checkoutDate"></label> 
					<input type="text" name="checkout_date" id="checkoutDate" readonly placeholder="날짜추가">
				</div>
			</div>
			<div class="form-title2">인원</div>
			<div class="dropdown_1">
				<input id="nu" type="text" class="dropbtn_1" readonly placeholder="인원" name="guest">
				<div class="dropdown-content_1">
					<div class="number">
						<form>
						<input type="hidden" name="a_num" id="num" value="${ reservation.a_num }">
						<input type="hidden" name="c_num" id="num1" value="${ reservation.c_num }">
						<input type="hidden" name="i_num" id="num2" value="${ reservation.i_num }">
						<input type="hidden" name="room_weekday" value="${ room.room_weekday }">
						<input type="hidden" name="room_weekend" value="${ room.room_weekend }">
							<h4>성인</h4>
							<span><button id="decreaseQuantity">&#8722;</button></span> 
							<span id="numberUpDown">1</span> 
						    <span><button id="increaseQuantity">&#43;</button></span>
							<h4>어린이</h4>
							<span><button id="decreaseQuantity2">&#8722;</button></span> 
							<span id="numberUpDown2">0</span> 
							<span><button id="increaseQuantity2">&#43;</button></span>
							<h4>유아</h4>
							<span><button id="decreaseQuantity3">&#8722;</button></span>
							<span id="numberUpDown3">0</span> 
							<span><button id="increaseQuantity3">&#43;</button></span>
						</form>
					</div>
				</div>
			</div>
				<input name="check" class="search-button" type="submit" value="예약 진행하기">		
		</div>
	</form>
    <br><br><br><br><br>

<%-- <c:import url="/WEB-INF/views/common/footer.jsp"/> --%>


</body>
</html>