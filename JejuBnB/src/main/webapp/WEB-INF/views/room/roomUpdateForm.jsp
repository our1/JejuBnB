<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<form action="roomupdate.do" method="post" >
<div id="first">
숙소 이름 : <input type="text" name="room_name" placeholder="숙소 이름" value="${room.room_name }"> <br>
숙소 소개 : <textarea rows="50" cols="50" name="room_content" >${room.room_content } </textarea> <br>
숙소 주소 : <input type="text" name="room_address" placeholder="숙소 주소" value="${room.room_address }"> <br>
기준 인원 : <input type="number" name="st_num_people" value="${room.st_num_people }" >명 <br>
최대 인원 : <input type="number" name="max_people" placeholder="최대 인원" value="${room.max_people }"><br>
체크인 시간 : <select name="inhour">
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
			</select> : 
			<select name="inminute">
				<option value="00">00</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select> &nbsp; &nbsp; ~ &nbsp; &nbsp;
체크아웃 시간 : <select name="outhour">
				<option value="09">09</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> : 
			<select name="outminute">
				<option value="00">00</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
			</select> <br>
</div>

<div id="second">
침대 수 : <input type="number" name="bed" placeholder="1" value="${room.bed }"> 개 <br>
침실 수 : <input type="number" name="bedroom" placeholder="1" value="${room.bedroom }"> 개 <br>
욕실 수 : <input type="number" name="bathroom" placeholder="1" value="${room.bathroom }"> 칸 <br>
편의 시설 :  <br>
<c:forEach var="count1" begin="0" end="${AlistSize }" step="4">
<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">
${ alist } <input type="checkbox" name="amenity" value="${alist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
 <br>
시설 :<br>
<c:forEach var="count2" begin="0" end="${FlistSize }" step="3">
<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
${ flist } <input type="checkbox" name="facility" value="${flist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>
건물 유형 :<br>
<c:forEach var="count3" begin="0" end="${BlistSize }" step="4">
<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
${ blist } <input type="checkbox" name="build" value="${blist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>

이용 규칙 :<br>
<c:forEach items="${Rlist }" var="rlist">
${rlist } <input type="checkbox" name="rule" value="${rlist }"> &nbsp; &nbsp;
</c:forEach>
<br><br>
인원 추가 금액 : <input type="number" name="plus_charge" value="${room.plus_charge }"><br>
</div>
<div id="third">
숙소 대표 사진 : <input type="file" name="ofile"> <br>

<input type="submit" value="전송">
</div>
</form>
</body>
</html>