<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style type="text/css">
	div.list {
		border : 1px solid black;
		padding : 10px;
		margin : 10px; 
	}
	
	div.alist {
		border : 1px solid navy;
		margin : 15px;
		display : inline;
	}
</style>
<script type="text/javascript">


	function nameCheck1(){
	var amenity = $("input[name=amenity_no]:checked").val();
	
	if(amenity != null){
		return true;
	} else {
		alert("선택 없음"); 
		return false;
	}
	
	};
	
	function nameCheck2(){
		var facility = $("input[name=facility_no]:checked").val();
		if(facility != null){
			return true;
		} else {
			alert("선택 없음"); 
			return false;
		}
	};
		
	function nameCheck3(){
		var bu_type_no = $("input[name=bu_type_no]:checked").val();
		if(bu_type_no != null){
			return true;
		} else {
			alert("선택 없음"); 
			return false;
		}
	};
	
	
	function nameCheck4(){
		var rule_no = $("input[name=rule_no]:checked").val();
		if(rule_no != null){
			return true;
		} else {
			alert("선택 없음"); 
			return false;
		}
	};
	
</script>
</head>
<body>
<h1> 필터 리스트 뷰</h1>
<div id="Adiv" class="list">
편의 시설 :  <br>
<form action="Adelete.do" method="post" onsubmit="return nameCheck1()">
<c:forEach var="count1" begin="0" end="${AlistSize }" step="4">
<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">
${ alist.amenity_name } <input type="checkbox" class="amenity" name="amenity_no" value="${alist.amenity_no }" >
</c:forEach> <br>
</c:forEach> <br>
<button type="submit" id="getCheckedAll" style="margin:10px;">삭제하기</button>
</form>

<form action="Ainsert.do" method="post">
<input type="text" name="amenity_name" placeholder="추가" required>
<button type="submit">추가하기</button>
</form>
 <br>
 </div>
 
<div id="Fdiv" class="list">
시설 :<br>
<form action="Fdelete.do" method="post" onsubmit="return nameCheck2()">
<c:forEach var="count2" begin="0" end="${FlistSize }" step="3">
<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
${ flist.facility_name } <input type="checkbox" name="facility_no" value="${flist.facility_no }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<button type="submit">삭제하기</button>
</form>
<form action="Finsert.do" method="post">
<input type="text" name="facility_name" placeholder="추가" required>
<button type="submit">추가하기</button>
</form>
<br>
</div>

<div id="Bdiv" class="list">
건물 유형 :<br>
<form action="Bdelete.do" method="post" onsubmit="return nameCheck3()">
<c:forEach var="count3" begin="0" end="${BlistSize }" step="4">
<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
${ blist.bu_type_name } <input type="checkbox" name="bu_type_no" value="${blist.bu_type_no }"> &nbsp; &nbsp;
</c:forEach> <br>
</c:forEach>
<button type="submit">삭제하기</button>
</form>

<form action="Dinsert.do" method="post">
<input type="text" name="bu_type_name" placeholder="추가" required>
<button type="submit">추가하기</button>
</form>
<br>
</div>

<div id="Rdiv" class="list">
이용 규칙 :<br>
<form action="rdelete.do" method="post" onsubmit="return nameCheck4()">
<c:forEach items="${Rlist }" var="rlist">
${rlist.rule_name } <input type="checkbox" name="rule_no" value="${rlist.rule_no }"> &nbsp; &nbsp;
</c:forEach>
<button type="submit">삭제하기</button>
<br>
</form>
<form action="Rinsert.do" method="post">
<input type="text" name="rule_name" placeholder="추가" required>
<button type="submit">추가하기</button>
</form>
</div>
</body>
</html>