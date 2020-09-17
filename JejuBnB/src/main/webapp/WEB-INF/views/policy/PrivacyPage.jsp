<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#accordian {
	background: #333333;
	width: 400px;
	margin: 10px auto 0 auto;
	color: white;
	box-shadow: 0 5px 15px 1px rgba(0, 0, 0, 0.6), 0 0 200px 1px
		rgba(255, 255, 255, 0.5);
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
	<h1>약관 및 정책</h1>
	<br>
	<hr>
	<a href="policyPage.do">약관</a>
	<a href="PrivacyPage.do">개인정보</a>
	<br>
	<hr>
 <c:forEach items="${requestScope.policy }" var="privacy">
	<form action="deletePolicy.do" method="post">	
<c:if test="${ privacy.policy_type eq '개인정보' }">
<div id="accordian">
				<ul>
					<li>
						<h3>
							<span class="icon-dashboard"></span>${privacy.policy_title }
							<input type="checkbox" name="policy_no" value="${privacy.policy_no}">
						</h3>
						<ul>
							<li><a href="#">${privacy.policy_content }</a></li>
						</ul>
					</li>
					<li class="active">
					</li>
				</ul>
			</div>
</c:if>
   </c:forEach>
<hr>
	<a href="movePolicyAdd.do">추가하기</a>
	<input type="submit" value="삭제">
	</form>
</body>
</html>