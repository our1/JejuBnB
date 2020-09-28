<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<!--=============== basic  ===============-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="robots" content="index, follow" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<!--=============== css  ===============-->
<link type="text/css" rel="stylesheet" href="resources/css/reset.css">
<link type="text/css" rel="stylesheet" href="resources/css/plugins.css">
<link type="text/css" rel="stylesheet" href="resources/css/style.css">
<link type="text/css" rel="stylesheet" href="resources/css/color.css">
<!--=============== favicons ===============-->
<link rel="shortcut icon" href="resources/images/favicon.png">
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
		$('#checkinDate').datepicker(
				{
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
		$('#checkoutDate').datepicker(
				{
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
                $('#cnt_val').val(1);
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
                  $('#cnt_val').val(1);
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
            $('#cnt_val').val(1);
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
              $('#cnt_val').val(1);
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
            $('#cnt_val').val(1);
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
            $('#cnt_val').val(1);
            });

            /* $('button').on('click', function(){
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
            }); */
            $('.btn_increaseQuantity').on('click', function() {
            	if($(this).data("type") == "1") {
            		$('#nu').val('게스트' + sum  + '명' + ', ' + '유아' + num2  + '명');
            	}else if($(this).data("type") == "2") {
            		$('#nu').val('게스트' + sum1  + '명' + ', ' + '유아' + num2  + '명');
            	}else {
            		$('#nu').val('게스트' + sum2  + '명' + ', ' + '유아' + num2  + '명');
            	}
            });                         	
            
            });
            
            function formTest7() {
            	if($("#cnt_val").val() == 0) {
            		$("#nu").val("게스트1명, 유아0명");
            	}
            	
            	if(!document.testForm.checkin_date.value) {
            		alert("체크인 날짜를 선택해주세요.");
            		document.testForm.checkin_date.focus();
            		return false;
            	}
            	if(!document.testForm.checkout_date.value) {
            		alert("체크아웃 날짜를 선택해주세요.");
            		document.testForm.checkout_date.focus();
            		return false;
            	}
            }
            

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
			window.open("rewrite.do?room_no=${room.room_no}" ,"_blank","toolvar=yes,menubar=yes,width=550,height=500,left=430,top=70").focus();
		});
		$('.rpbtn').click(function(){         
	        window.open("rewrite2.do?room_no=${room.room_no}&reply_no=" + $(this).data('repno') ,"_blank","toolvar=yes,menubar=yes,width=500,height=500,left=430,top=70").focus();
	     });
	});
</script>
<script>
	$(document).ready(function(){
		$('.writeReReply').click(function(){
			var table = $(this).parent();
			console.log(table.text());
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
	margin-left: 20%;
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

	<%-- <c:import url="/WEB-INF/views/citybook/header.jsp" /> --%>
	<!-- wrapper -->
	<div id="wrapper">
		<!--  content-->
		<div class="content">
			<!--  carousel-->
			<div class="list-single-carousel-wrap fl-wrap" id="sec1">
				<div class="fw-carousel fl-wrap full-height lightgallery">
					<!-- slick-slide-item -->
					<div class="slick-slide-item">
						<div class="box-item">
							<img src="images/all/single/1.jpg" alt=""> <a
								href="images/all/single/1.jpg" class="gal-link popup-image"><i
								class="fa fa-search"></i></a>
						</div>
					</div>
					<!-- slick-slide-item end -->
					<!-- slick-slide-item -->
					<div class="slick-slide-item">
						<div class="box-item">
							<img src="images/all/single/1.jpg" alt=""> <a href="images/all/single/1.jpg" class="gal-link popup-image">
							<i class="fa fa-search"></i></a>
						</div>
					</div>
					<!-- slick-slide-item end -->
					<!-- slick-slide-item -->
					<div class="slick-slide-item">
						<div class="box-item">
							<img src="images/all/single/1.jpg" alt=""> <a href="images/all/single/1.jpg" class="gal-link popup-image"> 
							<i class="fa fa-search"></i></a>
						</div>
					</div>
					<!-- slick-slide-item end -->
					<!-- slick-slide-item -->
					<div class="slick-slide-item">
						<div class="box-item">
							<img src="images/all/single/1.jpg" alt=""> <a href="images/all/single/1.jpg" class="gal-link popup-image">
							<i class="fa fa-search"></i></a>
						</div>
					</div>
					<!-- slick-slide-item end -->
					<!-- slick-slide-item -->
					<div class="slick-slide-item">
						<div class="box-item">
							<img src="images/all/single/1.jpg" alt=""> <a href="images/all/single/1.jpg" class="gal-link popup-image">
							<i class="fa fa-search"></i></a>
						</div>
					</div>
					<!-- slick-slide-item end -->
				</div>
				<div class="swiper-button-prev sw-btn">
					<i class="fa fa-long-arrow-left"></i>
				</div>
				<div class="swiper-button-next sw-btn">
					<i class="fa fa-long-arrow-right"></i>
				</div>
			</div>
			<!--  carousel  end-->
			<!-- <div class="scroll-nav-wrapper fl-wrap">
                        <div class="container">
                            <nav class="scroll-nav scroll-init">
                                <ul>
                                    <li><a class="act-scrlink" href="#sec1">Gallery</a></li>
                                    <li><a href="#sec2">Details</a></li>
                                    <li><a href="#sec3">Video </a></li>
                                    <li><a href="#sec4">Reviews</a></li>
                                </ul>
                            </nav>
                            <a href="#" class="save-btn"> <i class="fa fa-heart"></i> Save </a>
                        </div>
                    </div> -->
			<!--  section   -->
			<section class="gray-section no-top-padding">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<!-- list-single-main-wrapper -->
							<div class="list-single-main-wrapper fl-wrap" id="sec2">
								<div class="breadcrumbs gradient-bg  fl-wrap">
									<b>${ room.user_id }</b>님의 JejuBnB &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									최대 인원 ${ room.max_people } 명, 침대수 ${ room.bed } 개, 침실수
										${ room.bedroom }개, 욕실수 ${ room.bathroom } 개
								</div>
								<!-- list-single-header -->
								<div
									class="list-single-header list-single-header-inside fl-wrap">
									<div class="container">
										<div class="list-single-header-item">
											<div class="row">
												<div class="col-md-8">
													<div class="list-single-header-item-opt fl-wrap">
														<div class="list-single-header-cat fl-wrap"></div>
													</div>
													<h2>${room.room_name}</h2>
													<span class="section-separator"></span>
													<div class="listing-rating card-popup-rainingvis"
														data-starrating2="5"></div>
													<div class="list-post-counter single-list-post-counter">
														청결도 : ${ review.clean_score } &nbsp;&nbsp;&nbsp; 가격 대비 만족도
														: ${ review.value_score } &nbsp;&nbsp;&nbsp; 서비스 : ${ review.service_score }
														<i class="fa fa-heart"></i>
													</div>
												</div>
												<div class="col-md-4">
													<div class="fl-wrap list-single-header-column">
														<button type="button" class="custom-scroll-link"
															id="popupBtn">
															<i class="fa fa-hand-o-right"></i>리뷰 등록
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="list-single-main-item fl-wrap">
								<div class="list-single-main-item-title fl-wrap">
									<h3>호스트의 숙소 소개</h3>
								</div>
								<p>${room.room_content}</p>
								<span class="fw-separator"></span>
								<div class="list-single-main-item-title fl-wrap">
									<h3>편의기능</h3>
								</div>
								<div class="listing-features fl-wrap">
									<ul>
										<c:if test="${ amenity.amenity_no eq '1' }">
											<li><i class="fa fa-cutlery"></i>주방</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '2' }">
											<li><i class="fa fa-shower"></i>샴푸</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '3' }">
											<li><i class="fa fa-thermometer-full"></i>난방</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '4' }">
											<li><i class="fa fa-snowflake-o"></i>에어컨</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '5' }">
										</c:if>
										<li><i class="fa fa-renren"></i>세탁기</li>
										<c:if test="${ amenity.amenity_no eq '6' }">
										</c:if>
										<li><i class="fa fa-paw"></i>건조기</li>
										<c:if test="${ amenity.amenity_no eq '7' }">
										</c:if>
										<li><i class="fa fa-wifi"></i>무선인터넷</li>
										<c:if test="${ amenity.amenity_no eq '8' }">
											<li><i class="fa fa-spoon"></i>아침식사</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '9' }">
											<li><i class="fa fa-university"></i>실내벽난로</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '10' }">
											<li><i class="fa fa-caret-square-o-down"></i>옷걸이</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '11' }">
											<li><i class="fa fa-reddit-square"></i>다리미</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '12' }">
											<li><i class="fa fa-font-awesome"></i>헤어 드라이기</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '13' }">
											<li><i class="fa fa-television"></i>TV</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '14' }">
										</c:if>
										<li><i class="fa fa-bed"></i>아기 침대</li>
										<c:if test="${ amenity.amenity_no eq '15' }">
											<li><i class="fa fa-universal-access"></i>유아용 식탁</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '16' }">
											<li><i class="fa fa-hand-paper-o"></i>셀프 체크인</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '17' }">
											<li><i class="fa fa-fire"></i>화재 경보기</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '18' }">
											<li><i class="fa fa-anchor"></i>해변과 인접</li>
										</c:if>
										<c:if test="${ amenity.amenity_no eq '19' }">
											<li><i class="fa fa-bath"></i>욕실 단독 사용</li>
										</c:if>
									</ul>
								</div>

								<!-- list-single-main-item -->
								<div class="list-single-main-item fl-wrap" id="sec4">
									<div class="list-single-main-item-title fl-wrap">
										<h3>Review</h3>
									</div>
									<div class="reviews-comments-wrap">
										<!-- reviews-comments-item -->

										<div class="reviews-comments-item">
											<div class="review-comments-avatar">
												<img src="resources/images/avatar/1.jpg" alt="">
											</div>
											<div class="reviews-comments-item-text">
											<c:forEach items="${ requestScope.list }" var="review">
												<form action="replydel.do" id="replyForm" method="post">
													<input type="hidden" name="room_no" value="${room.room_no}">
													<input type="hidden" name="reply_no" value="${review.reply_no}">
													<%-- <c:forEach items="${ requestScope.list }" var="review"> --%>
														<c:if test="${ loginMember.user_id ne review.user_id and loginMember.user_id ne room.user_id}">
															<h4>${review.user_id}</h4>
															<div class="clearfix"></div>
															<p>${review.review_content}</p>
															<span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>
															<fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" /></span>
															${review.review_content}
														</c:if>
														<c:if test="${ loginMember.user_id eq review.user_id}">
															<h4>${review.user_id}</h4>
															<div class="clearfix"></div>
															<p>${review.review_content}</p>
															<span class="reviews-comments-item-date"><i class="fa fa-calendar-check-o"></i>
															<fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" /></span>
															<button type="button" class="rpbtn" id="popupBtn_rp" data-repno="${review.reply_no}">수정</button> 
															<input type="submit" value="삭제">
														</c:if>			
													<%-- </c:forEach> --%>
												</form>
												</c:forEach>
											</div>
										</div>
									</div>					
								</div> <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
								<!--reviews-comments-item end-->
								<!-- list-single-main-item end -->
								
								 <div id="add-review" class="add-review-box">
                                   <form action="reserv.do" method="post" name="testForm" onsubmit="return formTest7()">
									<input type="hidden" id="cnt_val" name="cnt_val" value="0">
									<input type="hidden" name="room_no" value="${ room.room_no }">
									<input type="hidden" name="user_id"
										value="${ loginMember.user_id }">
									<div class="main-form">
										<h2 class="form-title1"><b>요금을 확인하려면 날짜를 입력하세요.</b></h2>
										<div class="inline-block">
											<div class="form-title2">체크인</div>
											<div class="form form-2">
												<label for="checkinDate"></label> <input type="text"
													name="checkin_date" id="checkinDate" readonly
													placeholder="날짜추가" value="${ reservation.checkin_date }">
											</div>
										</div>
										<div class="inline-block">
											<div class="form-title2">체크아웃</div>
											<div class="form form-2">
												<label for="checkoutDate"></label> <input type="text"
													name="checkout_date" id="checkoutDate" readonly
													placeholder="날짜추가" value="${ reservation.checkout_date }">
											</div>
										</div>
										<div class="form-title2">인원</div>
										<div class="dropdown_1">
											<input id="nu" type="text" class="dropbtn_1" readonly
												placeholder="인원" name="guest">
											<div class="dropdown-content_1">
												<div class="number">
													<input type="hidden" name="a_num" id="num" value="1">
													<input type="hidden" name="c_num" id="num1" value="0">
													<input type="hidden" name="i_num" id="num2" value="0">
													<input type="hidden" name="room_weekday"
														value="${ room.room_weekday }"> <input
														type="hidden" name="room_weekend"
														value="${ room.room_weekend }">
													<h4>성인</h4>
													<span><button id="decreaseQuantity" 
															class="btn_increaseQuantity" data-type="1">&#8722;</button></span>
													<span id="numberUpDown">1</span> <span><button
															id="increaseQuantity" class="btn_increaseQuantity"
															data-type="1">&#43;</button></span>
													<h4>어린이</h4>
													<span><button id="decreaseQuantity2"
															class="btn_increaseQuantity" data-type="2">&#8722;</button></span>
													<span id="numberUpDown2">0</span> <span><button
															id="increaseQuantity2" class="btn_increaseQuantity"
															data-type="2">&#43;</button></span>
													<h4>유아</h4>
													<span><button id="decreaseQuantity3"
															class="btn_increaseQuantity" data-type="3">&#8722;</button></span>
													<span id="numberUpDown3">0</span> <span><button
															id="increaseQuantity3" class="btn_increaseQuantity"
															data-type="3">&#43;</button></span>
												</div>
											</div>
										</div>
										<input name="check" class="search-button" type="submit" value="예약 진행하기">
									</div>
								</form>            
                                 </div>
								
								
								<!-- list-single-main-item -->
							</div>
							
							
						</div>
					
						<!--box-widget-wrap -->
						<div class="col-md-4">		
							<div class="box-widget-wrap">
					
							<!--box-widget-item -->
								<div class="box-widget-item fl-wrap">
									<div class="box-widget-item-header">
										<h3>Location / Contacts :</h3>
									</div>
									<div class="box-widget">
										<div class="map-container">
											<div id="singleMap" data-latitude="40.7427837"
												data-longitude="-73.11445617675781"
												data-mapTitle="Our Location"></div>
										</div>
										<div class="box-widget-content">
											<div
												class="list-author-widget-contacts list-item-widget-contacts">
												<ul>
													<li><span><i class="fa fa-map-marker"></i> ${room.room_address} :</span></li>
													<li><span><i class="fa fa-sign-in"></i> 체크인 시간 :</span>${room.checkin_time }</li>
													<li><span><i class="fa fa-sign-out"></i> 체크아웃 시간 :</span>${room.checkout_time }</li>												
												</ul>
											</div>										
										</div>
									</div>
								</div>
								<!--box-widget-item end -->
								<!--box-widget-item -->
								<div class="box-widget-item fl-wrap">
									<div class="box-widget-item-header">
										<h3>Hosted by :</h3>
									</div>
									<div class="box-widget list-author-widget">
										<div
											class="list-author-widget-header shapes-bg-small  color-bg fl-wrap">
											<span class="list-author-widget-link"><b>${room.user_id }</b></span> 
										</div>
										<div class="box-widget-content">
											<div class="list-author-widget-text">
												<div class="list-author-widget-contacts">
													<c:if test="${member.user_id eq room.user_id }">
													<ul>				
														<li><span><i class="fa fa-user-circle-o"></i> Name : ${member.user_name }</span> </li>									
														<li><span><i class="fa fa-phone"></i> Phone : ${member.phone}</span></li>
														<li><span><i class="fa fa-facebook"></i> Facebook ID : ${member.facebook_id }</span> </li>
													</ul>
													</c:if>
												</div>											
											</div>
										</div>
									</div>
								</div>
								<!--box-widget-item end -->
							</div>
						
							</div>				
					</section>
			<!--  section  end-->
			 </div>
                <!--  content  end--> 
            </div>
            <!-- wrapper end -->
			<div class="limit-box fl-wrap"></div>

			<%-- <table>	
		<c:forEach items="${ requestScope.list }" var="review"> 
		<form action="replydel.do" id="replyForm" method="post">
		<input type="hidden" name="room_no" value="${room.room_no}">
		<input type="hidden" name="reply_no" value="${review.reply_no}">
			<c:if test="${ loginMember.user_id ne review.user_id and loginMember.user_id ne room.user_id}">
			<tr>				
				<td>${review.user_id} </td> 
				<td><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" /> </td>
				<td>${review.review_content}</td>
			</tr>
			</c:if>
			<c:if test="${ loginMember.user_id eq review.user_id}">
			<tr>				
				<td>${review.user_id} </td> 
				<td><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd" /> </td>
				<td>${review.review_content}</td>
				<td>
					<button type="button" class="rpbtn" id="popupBtn_rp" data-repno="${review.reply_no}">수정</button>
					<input type="submit" value="삭제">
				</td>
			</tr>	
			</c:if>
			</form>
		</c:forEach>
	</table> --%>
			



			<%-- <c:import url="/WEB-INF/views/common/footer.jsp"/> --%>
</body>
</html>