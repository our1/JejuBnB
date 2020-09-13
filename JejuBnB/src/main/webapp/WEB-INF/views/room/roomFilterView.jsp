<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<form action="SearchFilter.do" method="post">
침대 수 : <input type="number" name="bedCount" placeholder="0" value="0"> <br>
침실 수 : <input type="number" name="bedroomCount" placeholder="0" value="0"> <br>
욕실 수 : <input type="number" name="bathroomCount" placeholder="0" value="0"> <br>


편의 시설 :
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
<button type="submit" >검색</button>
</form>
</body>
</html>