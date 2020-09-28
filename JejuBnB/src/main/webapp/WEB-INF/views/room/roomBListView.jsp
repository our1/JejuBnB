<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
	#mainContainer{
		display : grid;
		grid-template-columns : 1fr 1fr 1fr 1fr 1fr;
		gaq : 10px 10px;
		margin : 5px;
	}	
	
	.main_one {
		height : 500px;
	}
	
	.heart {
		border : none;
		background :none;
	} 
	
	.slideshow-container img{
		width : 200px;
		height : 200px;
		border-radius : 5%;
		margin : 0;
		padding : 0;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<div id="mainList">
	
	<h1> 게시글 형태로 보기</h1>
	<button onclick="javascipt:location.href='roomlist.do'">지도랑 같이 보기</button>
	
		<div id="mainContainer">
			<c:forEach items="${list }" var="room">		
			<div class="main_one">
						<div id="roomImg">
								<div class="slideshow-container">	
									<c:forEach items="${rflist }" var="rf">
										<c:if test="${room.room_no eq rf.room_no }">
											<div class="mySlides fade">
												<img src="${ pageContext.servletContext.contextPath}/resources/roomFiles/${ rf.rename_file }">
											</div>
										</c:if>
									</c:forEach>
									
									<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
									<a class="next" onclick="plusSlides(1)">&#10095;</a>
									
								</div>
							</div>
							<div class="place_info">
								<a href="moveDetailView.do?room_no=${room.room_no}"><h3>${room.room_name }</h3></a>
								<p style="width:300px;">${room.room_address }</p>
								<div class="rating_days d-flex justify-content-between" style="width:300px;">
									<span class="d-flex justify-content-center align-items-center">
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<i class="fa fa-star"></i> 
										<a href="#">(20 Review)</a>
									</span>
									<div class="days">
									<c:if
										test="${week eq 6 || week eq 7}">
										<fmt:formatNumber value="${room.room_weekday }"	type="currency" />
									</c:if> <c:if test="${week ne 6 && week ne 7}">
										<fmt:formatNumber value="${room.room_weekend }" type="currency" />
									</c:if>
										<c:if test="${!empty loginMember}">
											<c:if test="${!empty mlist }">
												<c:set var="check" value="true" />
												<c:forEach items="${mlist }" var="roomNo">
													<c:if test="${check }">
														<c:if test="${room.room_no eq roomNo.room_no }">
															<li style="float: right;"
																id="deleteHeart${room.room_no }"><button
																	class="heart" onclick="deleteH(${room.room_no})">
																	<img id="like"
																		src="${ pageContext.servletContext.contextPath}/resources/images/하트.png"
																		style="width: 20px; height: 20px;">
																</button></li>
															<c:set var="check" value="false" />
														</c:if>
													</c:if>
												</c:forEach>

												<c:if test="${check}">
													<li style="float: right;" id="insertHeart${room.room_no }"><button
															class="heart" onclick="insertH(${room.room_no});">
															<img id="nolike"
																src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png"
																style="width: 20px; height: 20px;">
														</button></li>
												</c:if>
											</c:if>
											<c:if test="${empty mlist }">
												<li style="float: right;" id="insertHeart${room.room_no }"><button
														class="heart" onclick="insertH(${room.room_no});">
														<img id="nolike"
															src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png"
															style="width: 20px; height: 20px;">
													</button></li>
											</c:if>
										</c:if>
										<c:if test="${empty loginMember }">
											<li style="float: right;">
											<button class="heart" onclick="javascript:alert('로그인 후 이용해주세요.')">
												<img src="${ pageContext.servletContext.contextPath}/resources/images/빈하트.png" style="width: 20px; height: 20px;">
											</button></li>
										</c:if>
									</div>
								</div>
							</div>
						</div>
			</c:forEach>
		</div>
		
	</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>