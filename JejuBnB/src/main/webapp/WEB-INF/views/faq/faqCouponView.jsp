<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>JejuBnB</title>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon.png">
<style type="text/css">
.faq_top_link{
	    width: 400px;
    top: 200px;
    position: relative;
    text-align: center;
    left: 40%;
}

#accordian {
	background: #333333;
    width: 400px;
    margin: 10px auto 0 auto;
    color: white;
    box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px rgba(255, 255, 255, 0.5);
    left: auto;
    top: 300px;
    position: relative;
    text-align: center;
} /* 메뉴 스타일 */
#accordian h3 {
	font-size: 12px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
	background: #064461;
	background: linear-gradient(#003040, #002535);
}

#accordian h3:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}
/* 아이콘폰트 스타일 */
#accordian h3 span {
	font-size: 16px;
	margin-right: 5px;
}

#accordian li {
	list-style-type: none;
} /* 서브메뉴 스타일 */
#accordian ul ul li a {
	color: white;
	text-decoration: none;
	font-size: 11px;
	line-height: 27px;
	display: block;
	padding: 0 0px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
}

#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
} /* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}

#accordian li.active ul {
	display: block;
}

form{
	text-align: center; 
	position: relative;
}
form input[type=submit]{
	top: 300px;
    position: relative;
}
#addf{
	top: 300px;
    position: relative;
}


</style>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$("#accordian h3").click(function() {
		$("#accordian ul ul").slideUp();
		if (!$(this).next().is(":visible")) {
			$(this).next().slideDown();
		}
	})
})

</script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<c:import url="/WEB-INF/views/common/servicecenterside.jsp" />
	
	
		<div class="faq_top_link">
			<a href="faqUsing.do">이용문의</a>&nbsp;<a href="faqReservation.do">예약문의</a>&nbsp;<a
				href="faqSettlement.do">결제문의</a>&nbsp;<a href="faqCoupon.do">쿠폰/이벤트</a>&nbsp;<a
				href="faqMember.do">회원정보</a>
		</div>
		
		<form action="deleteFaq.do" method="post" >	
					<c:forEach items="${faq }" var="faq">
					<c:if test="${faq.faqcategory_name eq '쿠폰' }">
			<div id="accordian">
				<ul>
					<li>
						<h3>
							<span class="icon-dashboard"></span>${faq.faq_title }
							<c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
							<input type="checkbox" name="faq_no" value="${faq.faq_no}">
							</c:if>
						</h3>
						<ul>
							<li><a>${faq.faq_rcontent }</a></li>
						</ul>
					</li>
					<li class="active">
					</li>
				</ul>
			</div>
		</c:if>
	</c:forEach>
	<br>

	<c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
	<input type="submit" value="삭제" >
		<a id="addf" href="moveInsertFaq.do">등록</a>
	</c:if>
	</form>
	
</body>
</html>