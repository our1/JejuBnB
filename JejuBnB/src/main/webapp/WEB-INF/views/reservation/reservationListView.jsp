<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div>
<h1>${ room.room_name }</h1> <br>
<style>
	*{margin:0;padding:0;}
	ul,li{list-style:none;}
	#slide{height:300px;position:relative;overflow:hidden;}
	#slide ul{width:400%;height:100%;transition:1s;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:25%;height:100%;}
	#slide li:nth-child(1){background:#faa;}
	#slide li:nth-child(2){background:#ffa;}
	#slide li:nth-child(3){background:#faF;}
	#slide li:nth-child(4){background:#aaf;}
  #slide li:nth-child(5){background:#aaf;}
  #slide li:nth-child(6){background:#aaf;}
	#slide input{display:none;}
	#slide label{display:inline-block;vertical-align:middle;width:10px;height:10px;border:2px solid #666;background:#fff;transition:0.3s;border-radius:50%;cursor:pointer;}
	#slide .pos{text-align:center;position:absolute;bottom:10px;left:0;width:100%;text-align:center;}
	#pos1:checked~ul{margin-left:0%;}
	#pos2:checked~ul{margin-left:-100%;}
	#pos3:checked~ul{margin-left:-200%;}
	#pos4:checked~ul{margin-left:-300%;}
  #pos5:checked~ul{margin-left:-400%;}
  #pos6:checked~ul{margin-left:-500%;}
	#pos1:checked~.pos>label:nth-child(1){background:#666;}
	#pos2:checked~.pos>label:nth-child(2){background:#666;}
	#pos3:checked~.pos>label:nth-child(3){background:#666;}
	#pos4:checked~.pos>label:nth-child(4){background:#666;}
  #pos5:checked~.pos>label:nth-child(5){background:#666;}
  #pos6:checked~.pos>label:nth-child(6){background:#666;}
</style>
<div id="slide">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
	<input type="radio" name="pos" id="pos3">
	<input type="radio" name="pos" id="pos4">
	<input type="radio" name="pos" id="pos5">
	<input type="radio" name="pos" id="pos6">
	<ul>
		<li></li>
		<li></li>
		<li></li>
    <li></li>
    <li></li>
		<li></li>
	</ul>
	<p class="pos">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<label for="pos3"></label>
		<label for="pos4"></label>
	    <label for="pos5"></label>
	    <label for="pos6"></label>
	</p>
</div>
    
<h3>${ room.user_id } 님의 JejuBnB</h3> <br>
<h4>최대 인원  ${ room.max_people } 명, 침대수 ${ room.num_bed } 개, 
	침실수 ${ room.num_bedroom } 개, 욕실수  ${ num_bathroom } 개
</h4> <br><hr>

<h4></h4>

</div>





<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>