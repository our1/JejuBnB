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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script>
	window.name = "popupPayment";
	$(document).ready(function(){	
		$('#reservPM').click(function(){
			//parameter로 데이트값이랑 주말,평일가격 값을 넘기기
			window.open("payment.do?room_no=${room.room_no}&date=${date}&room_weekday=${room.room_weekday}&room_weekend=${room.room_weekend}&re_num=${reserv.re_num}", "_blank","toolvar=yes,menubar=yes,width=500,height=500,left=430,top=70").focus();
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn').click(function(){
			var act = $("#sel_act").val();
			
			if(act == 'cou') {
				$("#couForm").attr("action", "redirect:/reservationDetailView");
				$("#couForm").submit();			
			}
			else {
				alert('쿠폰을 선택해주세요');
				return false;
			}
		});
	});
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/common/header.jsp"/>
	
            <!-- wrapper -->	
            <div id="wrapper">
                <!--Content -->
                <div class="content">
                    <!--section -->
                   <!--  <section class="parallax-section" data-scrollax-parent="true" id="sec1">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay"></div>
                        <div class="container">
                            <div class="section-title center-align">
                                <h2><span>About Our Company</span></h2>
                                <div class="breadcrumbs fl-wrap"><a href="#">Home</a><span>About</span></div>
                                <span class="section-separator"></span>
                            </div>
                        </div>
                        <div class="header-sec-link">
                            <div class="container"><a href="#sec2" class="custom-scroll-link">Let's Start</a></div>
                        </div>
                    </section>
                    section end
                    section
                    <div class="scroll-nav-wrapper fl-wrap">
                        <div class="container">
                            <nav class="scroll-nav scroll-init inline-scroll-container">
                                <ul>
                                    <li><a class="act-scrlink" href="#sec1">Top</a></li>
                                    <li><a href="#sec2">About</a></li>
                                    <li><a href="#sec3">Facts</a></li>
                                    <li><a href="#sec4">Team</a></li>
                                    <li><a href="#sec5">Testimonials</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div> -->
                    <section  id="sec2">
                        <div class="container">
                            <div class="section-title">
                                <h2>예약 진행하기</h2>
                                <div class="section-subtitle">Reservation</div>
                                <span class="section-separator"></span>
                            </div>
                            <!--about-wrap --> 
                            <div class="about-wrap">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="video-box fl-wrap">
                                            <img src="resources/images/all/1.jpg" alt="">
                                            <!-- <a class="video-box-btn image-popup" href="https://vimeo.com/110234211"><i class="fa fa-play" aria-hidden="true"></i></a> -->
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="list-single-main-item-title fl-wrap">
                                            <h3>${loginMember.user_id} 님의 <span>- 예약 정보</span></h3>
                                            <span class="section-separator fl-sec-sep"></span>
                                        </div>
                                       <p>예약날짜 : ${ reservation.checkin_date }~${ reservation.checkout_date }</p>
                                       <p>예약인원 : ${ reservation.guest }</p>
                                       <p>체크인 시간은 AM ${ room.checkin_time }, 체크아웃 시간 PM ${ room.checkout_time }</p>
                                       <h4><b>적용가능한 쿠폰</b></h4>
								<form id="couForm" method="POST">
									<input type="hidden" name="room_no" value="${room.room_no}">
									<input type="hidden" name="date" value="${date}"> 
									<input type="hidden" name="user_id" value="${v.user_id}"> 
									<input type="hidden" name="cald" value="${cald}">
									<h4><select id="sel_act" name="act">
										<option value="">쿠폰선택</option>
										<c:forEach items="${mycoupon}" var="v">
											<c:if test="${ loginMember.user_id eq v.user_id}">
												<option value="cou">${v.coupon_money}</option>
											</c:if>
										</c:forEach>
									</select>
									<button id="btn" >쿠폰적용</button></h4>
								</form>

								<h4>가격</h4><h4>
							<%-- 	<c:if test="${ loginMember.user_id eq mycoupon.user_id}"> --%>
								<%-- <c:forEach items="${mycoupon}" var="v">
									<c:if test="${cald eq null }">
										<c:if test="${checkin eq 1 || checkin eq 7}">
											<fmt:formatNumber
												value="${room.room_weekend*date-v.coupon_money}"
												type="currency" />
										</c:if>
										<c:if test="${checkin ne 1 && checkin ne 7}">
											<fmt:formatNumber
												value="${room.room_weekday*date-v.coupon_money}"
												type="currency" />
										</c:if>
									</c:if>

									<c:if test="${cald ne null}">
										<c:if test="${checkin eq 1 || checkin eq 7}">
											<fmt:formatNumber
												value="${room.room_weekend*cald-v.coupon_money}"
												type="currency" />
										</c:if>
										<c:if test="${checkin ne 1 && checkin ne 7}">
											<fmt:formatNumber
												value="${room.room_weekday*cald-v.coupon_money}"
												type="currency" />
										</c:if>
									</c:if>
								</c:forEach> --%>
								<%-- </c:if> --%>
								<%-- <c:if test="${ loginMember.user_id ne mycoupon.user_id}"> --%>
								<c:if test="${cald eq null }">
									<c:if test="${checkin eq 1 || checkin eq 7}">
										<fmt:formatNumber value="${room.room_weekend*date}"
											type="currency" />
									</c:if>
									<c:if test="${checkin ne 1 && checkin ne 7}">
										<fmt:formatNumber value="${room.room_weekday*date}"
											type="currency" />
									</c:if>
								</c:if>

								<c:if test="${cald ne null}">
									<c:if test="${checkin eq 1 || checkin eq 7}">
										<fmt:formatNumber value="${room.room_weekend*cald}"
											type="currency" />
									</c:if>
									<c:if test="${checkin ne 1 && checkin ne 7}">
										<fmt:formatNumber value="${room.room_weekday*cald}"
											type="currency" />
									</c:if>
								</c:if>
								<%--  </c:if> --%></h4>
								<h4><button type="button" id="reservPM" class="btn  big-btn  color-bg flat-btn">결제진행</button></h4>
								 </div>
                                </div>
                            </div>
                            <!-- about-wrap end  --> 
                            <!-- <span class="fw-separator"></span>
                            features-box-container 
                            <div class="features-box-container fl-wrap row">
                                features-box 
                                <div class="features-box col-md-4">
                                    <div class="time-line-icon">
                                        <i class="fa fa-medkit"></i>
                                    </div>
                                    <h3>24 Hours Support</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla.  </p>
                                </div>
                                features-box end  
                                features-box 
                                <div class="features-box col-md-4">
                                    <div class="time-line-icon">
                                        <i class="fa fa-cogs"></i>
                                    </div>
                                    <h3>Admin Panel</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla.  </p>
                                </div>
                                features-box end  
                                features-box 
                                <div class="features-box col-md-4">
                                    <div class="time-line-icon">
                                        <i class="fa fa-television"></i>
                                    </div>
                                    <h3>Mobile Friendly</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla.  </p>
                                </div>
                                features-box end                                                    
                            </div>
                            features-box-container end  
                        </div>
                    </section>
                    section end
                    section
                    <section class="color-bg" id="sec3">
                        <div class="shapes-bg-big"></div>
                        <div class="container">
                            <div class=" single-facts fl-wrap">
                                inline-facts
                                <div class="inline-facts-wrap">
                                    <div class="inline-facts">
                                        <div class="milestone-counter">
                                            <div class="stats animaper">
                                                <div class="num" data-content="0" data-num="254">154</div>
                                            </div>
                                        </div>
                                        <h6>New Visiters Every Week</h6>
                                    </div>
                                </div>
                                inline-facts end
                                inline-facts 
                                <div class="inline-facts-wrap">
                                    <div class="inline-facts">
                                        <div class="milestone-counter">
                                            <div class="stats animaper">
                                                <div class="num" data-content="0" data-num="12168">12168</div>
                                            </div>
                                        </div>
                                        <h6>Happy customers every year</h6>
                                    </div>
                                </div>
                                inline-facts end
                                inline-facts 
                                <div class="inline-facts-wrap">
                                    <div class="inline-facts">
                                        <div class="milestone-counter">
                                            <div class="stats animaper">
                                                <div class="num" data-content="0" data-num="172">172</div>
                                            </div>
                                        </div>
                                        <h6>Won Awards</h6>
                                    </div>
                                </div>
                                inline-facts end                            
                                inline-facts 
                                <div class="inline-facts-wrap">
                                    <div class="inline-facts">
                                        <div class="milestone-counter">
                                            <div class="stats animaper">
                                                <div class="num" data-content="0" data-num="732">732</div>
                                            </div>
                                        </div>
                                        <h6>New Listing Every Week</h6>
                                    </div>
                                </div>
                                inline-facts end                             
                            </div>
                        </div>
                    </section>
                    section end
                    section
                    <section id="sec4">
                        <div class="container">
                            <div class="section-title">
                                <h2>Our Team</h2>
                                <div class="section-subtitle">The Team</div>
                                <span class="section-separator"></span>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                            </div>
                            <div class="team-holder section-team fl-wrap">
                                team-item
                                <div class="team-box">
                                    <div class="team-photo">
                                        <img src="images/team/1.jpg" alt="" class="respimg"> 									
                                    </div>
                                    <div class="team-info">
                                        <h3><a href="#">Alisa Gray</a></h3>
                                        <h4>Business consultant</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  </p>
                                        <ul class="team-social">
                                            <li><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-tumblr"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-behance"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                team-item  end
                                team-item
                                <div class="team-box">
                                    <div class="team-photo">
                                        <img src="images/team/1.jpg" alt="" class="respimg"> 										
                                    </div>
                                    <div class="team-info">
                                        <h3><a href="#">Austin Evon</a></h3>
                                        <h4>Photographer</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  </p>
                                        <ul class="team-social">
                                            <li><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-tumblr"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-behance"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                team-item end 
                                team-item
                                <div class="team-box">
                                    <div class="team-photo">
                                        <img src="images/team/1.jpg" alt="" class="respimg"> 										
                                    </div>
                                    <div class="team-info">
                                        <h3><a href="#">Taylor Roberts</a></h3>
                                        <h4>Co-manager associated</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  </p>
                                        <ul class="team-social">
                                            <li><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-tumblr"></i></a></li>
                                            <li><a href="#" target="_blank"><i class="fa fa-behance"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                team-item end 
                            </div>
                        </div>
                    </section>
                    section end
                    section
                    <section class="parallax-section" data-scrollax-parent="true">
                        <div class="bg par-elem "  data-bg="images/bg/1.jpg" data-scrollax="properties: { translateY: '30%' }"></div>
                        <div class="overlay co lor-overlay"></div>
                        container
                        <div class="container">
                            <div class="intro-item fl-wrap">
                                <h2>Need more information</h2>
                                <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.</h3>
                                <a class="trs-btn" href="contacts.html">Get in Touch + </a>
                            </div>
                        </div>
                    </section>
                    <section id="sec5">
                        <div class="container">
                            <div class="section-title">
                                <h2>Testimonials</h2>
                                <div class="section-subtitle">Clients Reviews</div>
                                <span class="section-separator"></span>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar.</p>
                            </div>
                        </div>
                        testimonials-carousel 
                        <div class="carousel fl-wrap">
                            testimonials-carousel
                            <div class="testimonials-carousel single-carousel fl-wrap">
                                slick-slide-item
                                <div class="slick-slide-item">
                                    <div class="testimonilas-text">
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="5"> </div>
                                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi arch itecto beatae vitae dicta sunt explicabo. </p>
                                    </div>
                                    <div class="testimonilas-avatar-item">
                                        <div class="testimonilas-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <h4>Lisa Noory</h4>
                                        <span>Restaurant Owner</span>
                                    </div>
                                </div>
                                slick-slide-item end
                                slick-slide-item
                                <div class="slick-slide-item">
                                    <div class="testimonilas-text">
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="4"> </div>
                                        <p>Aliquam erat volutpat. Curabitur convallis fringilla diam sed aliquam. Sed tempor iaculis massa faucibus feugiat. In fermentum facilisis massa, a consequat purus viverra.</p>
                                    </div>
                                    <div class="testimonilas-avatar-item">
                                        <div class="testimonilas-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <h4>Antony Moore</h4>
                                        <span>Restaurant Owner</span>
                                    </div>
                                </div>
                                slick-slide-item end
                                slick-slide-item
                                <div class="slick-slide-item">
                                    <div class="testimonilas-text">
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="5"> </div>
                                        <p>Feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te odio dignissim qui blandit praesent.</p>
                                    </div>
                                    <div class="testimonilas-avatar-item">
                                        <div class="testimonilas-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <h4>Austin Harisson</h4>
                                        <span>Restaurant Owner</span>
                                    </div>
                                </div>
                                slick-slide-item end                      
                                slick-slide-item
                                <div class="slick-slide-item">
                                    <div class="testimonilas-text">
                                        <div class="listing-rating card-popup-rainingvis" data-starrating2="4"> </div>
                                        <p>Qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram seacula quarta decima et quinta decima.</p>
                                    </div>
                                    <div class="testimonilas-avatar-item">
                                        <div class="testimonilas-avatar"><img src="images/avatar/1.jpg" alt=""></div>
                                        <h4>Garry Colonsi</h4>
                                        <span>Restaurant Owner</span>
                                    </div>
                                </div>
                                slick-slide-item end   
                            </div>
                            testimonials-carousel end
                            <div class="swiper-button-prev sw-btn"><i class="fa fa-long-arrow-left"></i></div>
                            <div class="swiper-button-next sw-btn"><i class="fa fa-long-arrow-right"></i></div>
                        </div>
                        carousel end
                    </section>
                    section end
                    section
                    <section class="gray-section">
                        <div class="container">
                            <div class="fl-wrap spons-list">
                                <ul class="client-carousel">
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                    <li><a href="#" target="_blank"><img src="images/clients/1.png" alt=""></a></li>
                                </ul>
                                <div class="sp-cont sp-cont-prev"><i class="fa fa-angle-left"></i></div>
                                <div class="sp-cont sp-cont-next"><i class="fa fa-angle-right"></i></div>
                            </div>
                        </div>
                    </section>
                    section end
                    section
                    <section class="gradient-bg">
                        <div class="cirle-bg">
                            <div class="bg" data-bg="images/bg/circle.png"></div>
                        </div>
                        <div class="container">
                            <div class="join-wrap fl-wrap">
                                <div class="row">
                                    <div class="col-md-8">
                                        <h3>Join our online community</h3>
                                        <p>Grow your marketing and be happy with your online business</p>
                                    </div>
                                    <div class="col-md-4"><a href="#" class="join-wrap-btn modal-open">Sign Up <i class="fa fa-sign-in"></i></a></div>
                                </div>
                            </div>
                        </div> -->
                    </section>
                    <!-- section end -->
                    <div class="limit-box"></div>
                </div>
                <!--content end -->
            </div>
            <!-- wrapper end -->

<%-- <h4>적용가능한 쿠폰</h4>
<form id="couForm" method="POST">
	<input type="hidden" name="room_no" value="${room_no}">
	<input type="hidden" name="date" value="${date}">
	<input type="hidden" name="user_id" value="${v.user_id}">
		<select id="sel_act" name="act">
		<option value="">쿠폰선택</option>
			<c:forEach items="${mycoupon}" var = "v">
				<c:if test="${ loginMember.user_id eq v.user_id}">
					<option value="cou">${v.coupon_money}</option>
				</c:if>
			</c:forEach>
		</select>
		<button id="btn">쿠폰적용</button>
</form>

	<h3>가격</h3>	
	<c:if test="${ loginMember.user_id eq mycoupon.user_id}">
	<c:forEach items="${mycoupon}" var = "v">
	<c:if test="${cald eq null }">
	<c:if test="${checkin eq 1 || checkin eq 7}">
		<fmt:formatNumber value="${room.room_weekend*date-v.coupon_money}" type="currency" />
	</c:if>
	<c:if test="${checkin ne 1 && checkin ne 7}">
		<fmt:formatNumber value="${room.room_weekday*date-v.coupon_money}" type="currency" />
	</c:if>
	</c:if>
	
	<c:if test="${cald ne null}">
	<c:if test="${checkin eq 1 || checkin eq 7}">
		<fmt:formatNumber value="${room.room_weekend*cald-v.coupon_money}" type="currency" />
	</c:if>
	<c:if test="${checkin ne 1 && checkin ne 7}">
		<fmt:formatNumber value="${room.room_weekday*cald-v.coupon_money}" type="currency" />
	</c:if>
	</c:if>
	</c:forEach>
	</c:if>

	<c:if test="${ loginMember.user_id ne mycoupon.user_id}">	
	<c:if test="${cald eq null }">
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
	</c:if>
	
	<button type="button" id="reservPM">결제진행</button> --%>




	<c:import url="/WEB-INF/views/common/footer.jsp"/> 

</body>
</html>