<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JejuBnB</title>
      <link rel="stylesheet" href="resources/css/header.css">
	
	<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
      <script type="text/javascript">
         function winOpen1() {
            window.open("moveFilterList.do","필터","width=900,height=1000");
         }
         function winOpen2() {
            window.open("myNoticeList.do?userid=${loginMember.user_id}","알림","width=1700,height=900, left=100, top=50");
         }
         function movePage() {
             window.open("loginPage.do", "로그인",
            "width=1700, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes, status= no, location= no" ); 
         }
      </script>
      
      <style type="text/css">
      	#search {
		width : 600px;
		psdding : 0;
		margin-top : 20px;
		position : absolute;
		left : 30%;
	}
      </style>
</head>

<body>

<div class="mainhead">
         <div class="logo">
           <a href="main.do"><img src="resources/images/무제.png"></a>
         </div>
         
         <div id="search">
         <form action="roomlist.do" method="post">
         
         <c:if test="${!empty loginMember }">
         	<input type="hidden" name="userid" value="${loginMember.user_id }">
         </c:if>
         
         <c:if test="${!empty checkin}">
         	<input type="date" name="checkin"required value="${checkin }">          
         </c:if>         
         <c:if test="${empty checkin}">
         	<input type="date" name="checkin" required >          
         </c:if>
         
         <c:if test="${!empty checkout}">
         	<input type="date" name="checkout" required value="${checkout }">          
         </c:if>         
         <c:if test="${empty checkout}">
         	<input type="date" name="checkout" required >          
         </c:if>
         
         <c:if test="${!empty people}">
         	<input type="number" name="people" placeholder="인원" required value="${people }">          
         </c:if>         
         <c:if test="${empty people}">
         	<input type="number" name="people" placeholder="인원" required >          
         </c:if>
            <button type="submit" >검색 </button>
         </form>   
         </div>
    <div class="dropdown"><span class="myimg"></span></div>
       <c:if test="${ !empty loginMember and  loginMember.admin_check eq 'Y' }">
        <ul class="dropdown-list">
           <li onclick="javascript:location.href='moveAdminPage.do'"> 관리자 </li>
           <li onclick="winOpen1()"> 필터 관리</li>
           <li onclick="winOpen2()"> 알림</li>
           <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
  		   <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
           <hr class="divider">
           <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
           <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
        </ul>
     </c:if>
     <c:if test="${empty loginMember }">
     	<ul class="dropdown-list">
     	   <li onclick="javascript:location.href='roomlist.do'"> 숙소</li>
     	   <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
     	   <hr class="divider">
	       <li onclick="javascript:location.href='couponPage.do'"> 고객센터</li>
	       <li onclick="movePage()">로그인</li>
        </ul>
     </c:if>
     <c:if test="${!empty loginMember and  empty loginMember.admin_check and loginMember.host_check ne 'Y'}">
     <ul class="dropdown-list">
       <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
       <li onclick="winOpen2()"> 알림</li>
       <li onclick="javascript:location.href='moveRoomWrite.do'"> 사장님 신청하기</li>
       <hr class="divider">
       <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
       <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
       <hr class="divider">
       <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
       <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
     </ul>
     </c:if>
     
     <c:if test="${!empty loginMember and  empty loginMember.admin_check and loginMember.host_check eq 'Y'}">
     <ul class="dropdown-list">
       <li onclick="javascript:location.href='moveMyPage.do'"> 내 정보 보기</li>
       <li onclick="javascript:location.href='moveMyRoom.do?userid=${loginMember.user_id }'"> 저장 목록</li>
       <li onclick="winOpen2()"> 알림</li>
       <li onclick="javascript:location.href='moveRoomWrite.do'"> 숙소 추가 등록</li>
       <li onclick="#">내 숙소 보기</li>
       <hr class="divider">
       <li onclick="javascript:location.href='roomlist.do?userid=${loginMember.user_id }'"> 숙소</li>
       <li onclick="javascript:location.href='tlist.do'"> 관광지</li>
       <hr class="divider">
       <li onclick="javascript:location.href='policyPage.do'"> 고객센터</li>
       <li onclick="javascript:location.href='logout.do'"> 로그아웃</li>
     </ul>
     </c:if>
  </div>
          <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
          <script src="resources/js/head.js"></script>
</body>
</html>