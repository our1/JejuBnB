<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>second</title>
<script type="text/javascript" src="/second/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//테스트 버튼1 클릭했을 떄 값 보내기
	$("#test1").on("click", function(){
		$.ajax({
			url: "test1.do",
			data: {name: $("#name").val() , age: $("#age").val()},
			type: "post",
			success: function(result){
				if(result == "ok"){
					alert("값 보내기 성공!!!");
					console.log("result: " + result);
					$("#d1").html("<h5>" + result + "<h5>");
				}else{    //ok가 아니면 
					alert("값 전송 실패!");
				}
			},
			error: function(request, status, errorDate){
				console.log("error code: " + request.status + "\n Message : " + request.responseText + "\n Error : " + errorDate);
			}
		});  //ajax
	}); //테스트 1 클릭 했을 때 
	
	//테스트 2버튼을 클릭하면 서버 컨트롤러에서 전송한 json 받아서 출력
	$("#test2").on("click", function(){
		$.ajax({
			url: "test2.do",
			type: "post",  //json 을 받을 때믄 post로 지정해야함 
			dataType: "json", //받는 값의 종류 지정 (기본값은 text)
			success: function(jsonData){
				//json 객체 한 개를 받았을 때는 바로 출력 처리할 수 있음 
				console.log("jsonData : " + jsonData);
				$("#d2").html("번호 : " + jsonData.no + jsonData.title + decodeURIComponent(jsonData.writer) + decodeURIComponent(jsonData.content.replace(/\+/gi, " ")));
			/* 				+ jsonData.title );
						+ "작성자" + decodeURIComponent(jsonData.writer) 
						+ "내용: " + decodeURIComponent(jsonData.content.replace(/\+/gi, " ")));  //출력하는게 중요!! 이거 몰랐었음  */
			
			
			},
			error: function(request, status, errorDate){
				console.log("error code: " + request.status + "\n Message : " + request.responseText + "\n Error : " + errorDate);
			}
		}); //ajax
		
	}); //test2 click
	
	
	
 	//테스트 3버튼을 클릭하면 서버 컨트롤러에서 전송한 json 받아서 출력
	$("#test3").on("click", function(){
		$.ajax({
			url: "test3.do",
			type: "post",
			dataType: "json",
			success: function(obj){
				//json 배열을 가진 객체를 받은 경우
				// object를  String으로 또 parsing : json으로 바꾼다
				console.log(obj);  //object로 나옴
				
				//리턴된 객체를 문자열로 변환 처리
				var objStr = JSON.stringify(obj);
				//객체 문자열을 다시 json객체로 바꿈
				var jsonObj = JSON.parse(objStr);
				
				//출력용 문자열 준비
				var output = $("#d3").html();
				
				//출력용 문자열 만들기
				for(var i in jsonObj.list){
					output += jsonObj.list[i].userid
								+ ", " + jsonObj.list[i].userpwd
								+ ", " + decodeURIComponent(jsonObj.list[i].username.replace(/\+/gi, " "))
								+ ", " + jsonObj.list[i].age
								+ ", " + jsonObj.list[i].email
								+ ", " + jsonObj.list[i].phone
								+ ", " + jsonObj.list[i].birth + "<br>"
								
				}
				$("#d3").html(output);
			},
			error: function(request, status, errorDate){
				console.log("error code: " + request.status + "\n Message : " + request.responseText + "\n Error : " + errorDate);
			}
		});
		
	});  //test3 click 
	
	
	//테스트 4버튼을 클릭하면 서버 컨트롤러에서 전송한 Map 객체 받아서 출력
	$("#test4").on("click", function(){
		$.ajax({
			url: "test4.do",
			type: "post",
			dataType: "json",
			success: function(jsonObj){
				console.log(jsonObj);
				
				$("#d4").html("받은 Map 안의 객체 정보 확인 <br>"
						+ "이름 : " + decodeURIComponent(jsonObj.hashMap.samp.name).replace(/\+/gi, " ")
						+ "<br>나이 : " + jsonObj.hashMap.samp.age);
			},
			error: function(request, status, errorDate){
				console.log("error code: " + request.status + "\n Message : " + request.responseText + "\n Error : " + errorDate);
			}
			
		});
		
	});   //test4 click
	
	
	
	
	//테스트 5버튼을 클릭하면 서버 컨트롤러에서 전송한 json 받아서 출력
	$("#test5").on("click", function(){});   //test5 click
	//테스트 6버튼을 클릭하면 서버 컨트롤러에서 전송한 json 받아서 출력
	$("#test6").on("click", function(){});  //test6 click
});
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<hr>
<h1>spring second : Ajax test page</h1>
<ol>
<li>서버쪽 컨트롤러 메소드로 값 보내기 <button id="test1">테스트1</button></li>
<input type = "text" id="name" ><br>
<input type = "number" id="age" >
<p><div id="d1"></div></p>


<li>컨트롤러에서 보낸 json 객체 받사서 출력 <button id="test2">테스트2</button></li>
<p><div id="d2"></div></p>




<li>컨트롤러에서 보낸 json 배열 받아서 출력하기 <button id="test3">테스트3</button></li>
<p><div id="d3"></div></p>
<li>컨트롤러에서 보낸 map 객체 받아서 출력하기 <button id="test4">테스트4</button></li>
<p><div id="d4" align="center"></div></p>


<li>컨트롤러로  json 객체 보내기 <button id="test5">테스트5</button></li>
<p><div id="d5"></div></p>
<li>컨트롤러로 json  배열 보내기 <button id="test6">테스트6</button></li>
<p><div id="d6"></div></p>
</ol>






<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>