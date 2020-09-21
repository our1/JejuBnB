<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="/JejuBnB/resources/js/jquery-3.5.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- !!중요. - autoload=false 를 반드시 붙혀주셔야 합니다.-->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function PostCall() {
    	daum.postcode.load(function(){
            new daum.Postcode({
            	 oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
               

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("PostNumber").value = data.zonecode;
                document.getElementById("room_roadaddress").value = roadAddr;
               
            }
        }).open();
    })
   
    }
    
    
    function show(){
    	$("#addressDiv").show();
    	$("#ShowAddress").hide();
    
    }
    
</script>
<style type="text/css">
body {
		margin : 0;
		padding : 0;
		text-align : center;
		font-family: 'Nanum Gothic Coding', monospace;
	}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<form action="roomupdate.do" method="post" enctype="multipart/form-data">
<div id="first">
숙소 이름 : <input type="text" name="room_name" placeholder="숙소 이름" value="${room.room_name }"> <br>
숙소 소개 : <textarea rows="5" cols="50" name="room_content" >${room.room_content } </textarea> <br>
<div id = "addressDiv" style="display:none">
<input type="text" id="PostNumber" placeholder="우편번호"  readonly><br>
숙소 주소 : <button onclick="PostCall()" type="button">우편번호 검색</button><br>
<input type="text" id="room_roadaddress" name="room_roadaddress" placeholder="도로명주소" readonly value="${room.room_roadaddress }"><br>
<input type="text" id="DetailAddress" name="address" placeholder="상세주소" ><br>
</div>
<div id="ShowAddress" >
<input type="text" value="${room.room_address }" name="room_address" readonly>
<button onclick="show()" type="button">주소 수정</button>
</div>
기준 인원 : <input type="number" name="st_num_people" value="${room.st_num_people }" >명 <br>
최대 인원 : <input type="number" name="max_people" value="${room.max_people }"><br>
평일 금액 : <input type="number" name="room_weekday" value="${room.room_weekday}"><br>
주말 금액 : <input type="number" name="room_weekdend" value="${room.room_weekend }"><br>

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
<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="4">
<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">

<c:set var="loop_flag" value="true" />
<c:set var="checked" value="" />

<c:forTokens items="${room.amenity }" delims="," var="amenity_name">

<c:if test="${loop_flag }" >

	<c:if test="${fn:trim(alist) eq fn:trim(amenity_name)}">
		<c:set var="checked" value="checked" />
		<c:set var="loop_flag" value="false" />
		
	</c:if>
</c:if>
</c:forTokens>

${ alist } <input type="checkbox" name="amenity" value="${alist }" ${checked } > &nbsp; &nbsp; 

</c:forEach> <br>
</c:forEach>
 <br>
시설 :<br>
<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">

<c:set var="loop_flag" value="true" />
<c:set var="checked" value="" />

<c:forTokens items="${room.facility }" delims="," var="facility_name">

<c:if test="${loop_flag }" >

	<c:if test="${fn:trim(flist) eq fn:trim(facility_name)}">
		<c:set var="checked" value="checked" />
		<c:set var="loop_flag" value="false" />
		
	</c:if>
</c:if>
</c:forTokens>

${ flist } <input type="checkbox" name="facility" value="${flist }" ${checked }> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>
건물 유형 :<br>
<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">

<c:set var="loop_flag" value="true" />
<c:set var="checked" value="" />

<c:forTokens items="${room.build_type }" delims="," var="build_name">

<c:if test="${loop_flag }" >

	<c:if test="${fn:trim(blist) eq fn:trim(build_name)}">
		<c:set var="checked" value="checked" />
		<c:set var="loop_flag" value="false" />
		
	</c:if>
</c:if>
</c:forTokens>

${ blist } <input type="checkbox" name="build" value="${blist }" ${checked }> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>

이용 규칙 :<br>
<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">


<c:set var="loop_flag" value="true" />
<c:set var="checked" value="" />

<c:forTokens items="${room.rule }" delims="," var="rule_name">
<c:if test="${loop_flag }" >

	<c:if test="${rlist eq rule_name}">
		<c:set var="checked" value="checked" />
		<c:set var="loop_flag" value="false" />
		
	</c:if>
</c:if>
</c:forTokens>

${rlist } <input type="checkbox" name="rule" value="${rlist }" ${checked }> &nbsp; &nbsp;
</c:forEach>
</c:forEach>
<br><br>
인원 추가 금액 : <input type="number" name="plus_charge" value="${room.plus_charge }"><br>
</div>
<div id="third">
숙소 대표 사진 : <div ><img style="width:100px;height:100px;" src="${ pageContext.servletContext.contextPath}/resources/roomThumbnail/${ room.room_rename_file }"> </div><br>
숙소 대표 변경 : <input type="file" name="ofile"> <br>
<hr>
<c:if test="${!empty rflist }">
<c:forEach items="${rflist }" var="rf">
숙소 사진들 : ${ rf.original_file} <br>
</c:forEach>

</c:if>
숙소 사진들 : <input multiple="multiple" type="file" name="upfile">
<input type="submit" value="전송">
</div>
</form>
</body>
</html>