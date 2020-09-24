<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=44262f7a543c0f64c3a92e6841cb0ddb&libraries=LIBRARY"></script>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<style type="text/css">
	body {
		margin : 0;
		padding : 0;
		text-align : center;
		font-family: 'Nanum Gothic Coding', monospace;
	}
	
	div {
		text-align : left;
	}
	
	h5{
		padding : 0;
		margin : 5px;
	}
	h4{
		padding : 0;
		margin : 0;
	}
	form {
	  position : relative;
	  text-align : center;
	  font-family: 'Nanum Gothic Coding', monospace;
	  
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
	
	#main input {
		border : 1px solid gray;
		border-radius : 5px;		
		margin : 10px;
		height : 20px;
	}
	
	textarea {
		border : 1px solid gray;
		border-radius : 5px;
		margin : 10px;
	}
	
	#main {
		width : 900px;
		position : relative;
		left : 35%;
		padding : 5px;
		margin-top : 30px;
	}
	
	input[type=checkbox] {
		width : 20px;
		height : 20px;
	}
	
	.checkBox {
		width : 250px;
		height : 20px;
		margin : 5px;
		padding : 0;
	}
	
	#container1{
		width : 400px;
		display : grid;
		grid-template-columns : 200px 200px 200px 200px;
		gap : 10px 5px;
		padding : 0;
		margin-bottom : 20px;
	}
	
	#container2{
		width : 400px;
		display : grid;
		grid-template-columns : 200px 200px 200px 200px;
		gap : 10px 5px;
		padding : 0;
		margin-bottom : 20px;
		
	}
	
	#container3{
		width : 400px;
		display : grid;
		grid-template-columns : 200px 200px 200px 200px;
		gap : 10px 5px;
		padding : 0;
		margin-bottom : 20px;
		
	}
	
	#container4{
		width : 400px;
		display : grid;
		grid-template-columns : 200px 200px;
		gap : 10px 5px;
		padding : 0;
		margin-bottom : 20px;
		
	}
	
	#imgContainer{
		display : grid;
		width : 90%;
		grid-template-columns : 1fr 1fr 1fr;
		gap : 10px 10px;
		padding : 0;
		margin : 10px;
		margin-left : 0;
	}
	
	.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #999; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	} 
	
	.filebox input[type="file"] {
	 /* 파일 필드 숨기기 */ 
	 position: absolute; 
	 width: 1px; 
	 height: 1px; 
	 padding: 0; 
	 margin: -1px; 
	 overflow: hidden; 
	 clip:rect(0,0,0,0); 
	 border: 0; 
	 }
	 
	 .dropBox{
	 	border:2px dotted #3292A2;
        width:90%;
        height:200px;
        color:#92AAB0;
        text-align:center;
        font-size:24px;
        padding-top:80px;
        margin-top:10px;
	 }
	 
	 .images{
	 	width : 200px;
	 	height : 200px;
	 	border-radius : 2em;
	 	padding : 0;
	 }
	 
	 .images img {
	 	width : 200px;
	 	height : 200px;
	 	margin : 0;
	 }
	 
	 .btn{
	 	border : none;
	 	background : none;
	 	padding : 0;
	 	margin : 5px;
	 }
	 
	 .btnImg{
	 	width : 20px;
	 	height : 20px;
	 	margin : 0;
	 }
	 
	 .right img {
	 	width : 200px;
	 	height : 200px;
	 	margin : 0;
	 	border-radius : 5%;
	 }
	 
	 .address{
	 	width : 300px;
	 }
	 
	 /* BUTTON 2 */
#submit{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius : 2em;
  margin-left : 200px;
}
#submit:hover{
  background:#fff;
  color:#1AAB8A;
}
#submit:before,#submit:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
#submit:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
#submit:hover:before,#submit:hover:after{
  width:100%;
  transition:800ms ease all;
}



</style>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<!-- !!중요. - autoload=false 를 반드시 붙혀주셔야 합니다.-->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function PostCall() {
    	var roadAddr = "";
    	daum.postcode.load(function(){
            new daum.Postcode({
            	 oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 				roadAddr = data.roadAddress; // 도로명 주소 변수

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("PostNumber").value = data.zonecode;
                document.getElementById("room_roadaddress").value = roadAddr;
              	updateLatLng(roadAddr);
          		}
       		}).open();
   		})
    }
    
    function updateLatLng(roadAddr){    	
    	 var geocoder = new kakao.maps.services.Geocoder();
	 	 geocoder.addressSearch(roadAddr, function(result, status) {
	 		if (status === kakao.maps.services.Status.OK) {
		  		coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			  	var html = "";
			  	html += '<input type="hidden" name="room_lat" value="'+ result[0].y +'" >';
			  	html += '<input type="hidden" name="room_lng" value="'+ result[0].x +'" >'
			  	$("#roadAdd").html(html);
			 }
		});
   	 
   	 
    }
    
   
// 파일 리스트 번호
   var fileIndex = 0;
   // 등록할 전체 파일 사이즈
   var totalFileSize = 0;
   // 파일 리스트
   var fileList = new Array();
   // 파일 사이즈 리스트
   var fileSizeList = new Array();
   // 등록 가능한 파일 사이즈 MB
   var uploadSize = 50;
   // 등록 가능한 총 파일 사이즈 MB
   var maxUploadSize = 500;

   $(function (){
       // 파일 드롭 다운
       fileDropDown();
   });

   // 파일 드롭 다운
   function fileDropDown(){
       var dropZone = $("#dropBox");
       //Drag기능 
       dropZone.on('dragenter',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px solid #5272A0');
       });
       dropZone.on('dragleave',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px dotted #8296C2');
       });
       dropZone.on('dragover',function(e){
           e.stopPropagation();
           e.preventDefault();
           // 드롭다운 영역 css
       });
       dropZone.on('drop',function(e){
           e.preventDefault();
           // 드롭다운 영역 css
           $(this).css('border', '2px dotted #8296C2');
           
           var files = e.originalEvent.dataTransfer.files;
           if(files != null){
               if(files.length >= 1){
	           		selectFile(files)
               }else{
            	   alert("폴더 업로드 불가");
                   return;
               }
           }else{
               alert("ERROR");
           }
       });
   }

   // 파일 선택시
   function selectFile(files){
       // 다중파일 등록
       if(files != null){
           for(var i = 0; i < files.length; i++){
               // 파일 이름
               var fileName = files[i].name;
               var fileNameArr = fileName.split("\.");
               // 확장자
               var ext = fileNameArr[fileNameArr.length - 1];
               // 파일 사이즈(단위 :MB)
               var fileSize = files[i].size / 1024 / 1024;
               
               if($.inArray(ext, ['exe', 'bat', 'sh', 'java', 'jsp', 'html', 'js', 'css', 'xml']) >= 0){
                   // 확장자 체크
                   alert("등록 불가 확장자");
                   break;
               }else if(fileSize > uploadSize){
                   // 파일 사이즈 체크
                   alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                   break;
               }else{
                   // 전체 파일 사이즈
                   totalFileSize += fileSize;
                   
                   // 파일 배열에 넣기
                   fileList[fileIndex] = files[i];
                   
                   // 파일 사이즈 배열에 넣기
                   fileSizeList[fileIndex] = fileSize;

                   // 업로드 파일 목록 생성
                   addFileList(fileIndex, fileName, fileSize, files);

                   // 파일 번호 증가
                   fileIndex++;
               }
           }
       }else{
           alert("ERROR");
       }
   }

   // 업로드 파일 목록 생성
   function addFileList(fIndex, fileName, fileSize, files){
	  
       var html = "";
       html += "<div id='fileTr_" + fIndex + "'>";
       html += " 	<div class='right' >";
       html += "	   <img src="+window.URL.createObjectURL(files[fIndex])+"></div>"
       html += "    <div class='left' >";
       html += "<h5>"+        fileName + "</5><button onclick='deleteFile(" + fIndex + "); return false;' class='btn'><img class='btnImg' src='${pageContext.servletContext.contextPath }/resources/images/x버튼.png'></a>"
       html += "    </div>";
       html += "</div>";

       $('#imgContainer').append(html);
   }

   // 업로드 파일 삭제
   function deleteFile(fIndex){
       // 전체 파일 사이즈 수정
       totalFileSize -= fileSizeList[fIndex];
       
       // 파일 배열에서 삭제
       delete fileList[fIndex];
       
       // 파일 사이즈 배열 삭제
       delete fileSizeList[fIndex];
       
       // 업로드 파일 테이블 목록에서 삭제
       $("#fileTr_" + fIndex).remove();
   }

   // 파일 등록
   function uploadFile(){
       // 등록할 파일 리스트
       var uploadFileList = Object.keys(fileList);
       console.log(formData);
       // 파일이 있는지 체크
       if(uploadFileList.length == 0){
           // 파일등록 경고창
           alert("파일이 없습니다.");
           return;
       }
       
       // 용량을 500MB를 넘을 경우 업로드 불가
       if(totalFileSize > maxUploadSize){
           // 파일 사이즈 초과 경고창
           alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
           return;
       }
   }
   $(document).on("dragover drop", function(e) {
	    e.preventDefault();
	}).on("drop", function(e) {
	    $("input[type='file']")
	        .prop("files", e.originalEvent.dataTransfer.files)
	        .closest("form")
	});
   

   
</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div class="thead"></div>
<div id="main">
<form action="roominsert.do" method="post" id="uploadForm" enctype="multipart/form-data">
<input type="hidden" name="user_id" value="${loginMember.user_id }" >

<div id="first" class="write">
<div id="roadAdd"></div>
<h2>숙소</h2>
	<span id="roomName" ><h5>숙소의 이름을 입력해 주세요</h5>  <input type="text" name="room_name" placeholder="숙소 이름" required>  </span><br>
	<span id="roomContent"><h5>숙소를 소개해 주세요</h5> <textarea rows="5" cols="50" name="room_content" required placeholder="숙소 소개"></textarea> </span><br>
	
	<input type="text"  id="PostNumber" placeholder="우편번호" required readonly><br>
	숙소 주소 : <button onclick="PostCall()" type="button">우편번호 검색</button><br>
	<input type="text" class="address" id="room_roadaddress" name="room_roadaddress" placeholder="도로명주소" readonly><br>
	<input type="text" class="address" id="DetailAddress" name="address" placeholder="상세주소" required><br>
	<hr>
	기준 인원 : <input type="number" name="st_num_people" placeholder="기준 인원" required>명 <br>
	최대 인원 : <input type="number" name="max_people" placeholder="최대 인원" required>명<br>
	평일 금액 : <input type="number" name="room_weekday" placeholder="평일 가격"><br>
	주말 금액 : <input type="number" name="room_weekend" placeholder="주말 가격"><br>
	인원 추가 금액 : <input type="number" name="plus_charge" required><br>
	

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

<hr>
<div id="second" class="write">
<h2>시설</h2>
침대 수 : <input type="number" name="bed" placeholder="1" required> 개 <br>
침실 수 : <input type="number" name="bedroom" placeholder="1" required> 개 <br>
욕실 수 : <input type="number" name="bathroom" placeholder="1" required> 칸 <br> <br>
<hr>

<h4 class="first">편의 시설 </h4>
<div id="container1">
<c:forEach var="count1" begin="0" end="${fn:length(Alist)}" step="4">
<c:forEach items="${Alist }" var="alist" begin="${count1 }" end="${count1 + 3}">
<div class="checkBox"><input type="checkbox" name="amenity" value="${alist }"> ${ alist }</div>
</c:forEach>
</c:forEach>
</div>
 
<hr>
<h4>시설 </h4>
<div id="container2">
<c:forEach var="count2" begin="0" end="${fn:length(Flist)}" step="4">
<c:forEach items="${Flist }" var="flist" begin="${count2 }" end="${count2 + 2}">
<div class="checkBox"><input type="checkbox" name="facility" value="${flist }"> ${ flist }</div>
</c:forEach> 
</c:forEach>
</div>
<hr>
<h4>건물 유형 </h4>
<div id="container3">
<c:forEach var="count3" begin="0" end="${fn:length(Blist)}" step="4">
<c:forEach items="${Blist }" var="blist" begin="${count3 }" end="${count3 + 3}">
<div class="checkBox"><input type="checkbox" name="build" value="${blist }"> ${ blist }</div>
</c:forEach> 
</c:forEach>
</div>
<hr>
<h4>이용 규칙 </h4>
<div id="container4">
<c:forEach var="count4" begin="0" end="${fn:length(Rlist)}" step="4">
<c:forEach items="${Rlist }" var="rlist" begin="${count4 }" end="${count4 + 3 }">
<div class="checkBox"><input type="checkbox" name="rule" value="${rlist }">${rlist }</div>
</c:forEach>
</c:forEach>
</div>
<br>
</div>
<div id="third" class="write">
<div class="filebox"><label for="files">숙소 사진 추가</label><input multiple="multiple" type="file" id="files" name="file" style="display:none;"/></div>
<div class="dropBox" id="dropBox">사진 업로드</div>
<div id="imgContainer">

</div>
<button type="submit" id="submit">글 등록하기</button>
</div>
</form>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>