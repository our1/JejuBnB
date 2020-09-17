<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<style type="text/css">
	body {
	  margin : 0;
	  padding : 0;
	}
	form {
	  position : relative;
	}
	.thead{
	  width: 100%;
	  height: 329px;
	  background: linear-gradient( to right,
	                     rgba(20, 20, 20, 0.85) 0%,
	                     rgba(20, 20, 20, 0.75) 25%,
	                     rgba(20, 20, 20, 0.5) 50%,
	                     rgba(20, 20, 20, 0.25) 75%,
	                     rgba(20, 20, 20, 0) 100%
	               ),
	               url('resources/images/36.jpg');
	 background-size: cover;
	 background-repeat: no-repeat;
}
</style>
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
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="thead"></div>
<form action="roominsert.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" value="${loginMember.user_id }" >

<div id="first">
숙소 이름 : <input type="text" name="room_name" placeholder="숙소 이름" required> <br>
숙소 소개 : <textarea rows="5" cols="50" name="room_content" required placeholder="숙소 소개"></textarea> <br>

<input type="text" id="PostNumber" placeholder="우편번호" required readonly><br>
숙소 주소 : <button onclick="PostCall()" type="button">우편번호 검색</button><br>
<input type="text" id="room_roadaddress" name="room_roadaddress" placeholder="도로명주소" readonly><br>
<input type="text" id="DetailAddress" name="address" placeholder="상세주소" required><br>

기준 인원 : <input type="number" name="st_num_people" placeholder="기준 인원" required>명 <br>
최대 인원 : <input type="number" name="max_people" placeholder="최대 인원" required>명<br>
평일 금액 : <input type="number" name="room_weekday" placeholder="평일 가격"><br>
주말 금액 : <input type="number" name="room_weekend" placeholder="주말 가격"><br>

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
침대 수 : <input type="number" name="bed" placeholder="1" required> 개 <br>
침실 수 : <input type="number" name="bedroom" placeholder="1" required> 개 <br>
욕실 수 : <input type="number" name="bathroom" placeholder="1" required> 칸 <br>
편의 시설 :  <br>
<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="4">
<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">
${ alist } <input type="checkbox" name="amenity" value="${alist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
 <br>
시설 :<br>
<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
${ flist } <input type="checkbox" name="facility" value="${flist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>
건물 유형 :<br>
<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
${ blist } <input type="checkbox" name="build" value="${blist }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<br>

이용 규칙 :<br>
<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">
${rlist } <input type="checkbox" name="rule" value="${rlist }"> &nbsp; &nbsp;
</c:forEach>
</c:forEach>
<br><br>
인원 추가 금액 : <input type="number" name="plus_charge" required><br>
</div>
<div id="third">
숙소 대표 사진 : <input type="file" name="ofile"> <br>
숙소 사진들 : <input multiple="multiple" type="file" name="file" />
<input type="submit" value="전송">
</div>
</form>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>