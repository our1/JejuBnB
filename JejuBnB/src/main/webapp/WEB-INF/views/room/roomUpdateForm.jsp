<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
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
    
    function back(){
    	var html = "";    	
    	html += '<input type="hidden" name="room_roadaddress" value="${room.room_roadaddress }">';
		html += '<input type="text" value="${room.room_address }" name="room_address" style="width:300px;margin-left:0;"readonly>';
		html += '<button onclick="show()" type="button">주소 수정</button>';
    	
    	$("#ShowAddress").html(html);
    }
    
    function show(){    	
    	var html = "";
    	html += '<input type="text" id="PostNumber" placeholder="우편번호"  readonly required><br>';
    	html += '숙소 주소 : <button onclick="PostCall()" type="button">우편번호 검색</button><br>';
    	html += '<input type="text" id="room_roadaddress" name="room_roadaddress" placeholder="도로명주소" readonly required><br>';
    	html += '<input type="text" id="DetailAddress" name="address" placeholder="상세주소" required><br>';
    	html += '<button onclick="back()" type="button">수정 취소</button>';
    	$("#ShowAddress").html(html);
    
    }
    
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
    
    
    function deleteRoomFile(fileNo){
    	var roomNo = ${room.room_no};
    	
    	if(confirm("삭제하시겠습니까?")){
    		$.ajax({
        		url : "deleteFile.do",
        		data : {room_no : roomNo, room_file_no:fileNo},
        		type : "post",
        		success : function(result){
        			if(result == "ok"){
        				alert("삭제 완료!");
        				location.reload();        				
        			}else {
        				alert("삭제 할 수 없습니다.")
        			}
        		},
        		error : function(request, status, errorData){
					console.log("error code : " + request.satus + "\nMessage : " + request.responseText + "\nError" + errorData);
				}	        			
        	});
    	}

    	
    	
    }
    
</script>
<style type="text/css">
body {
		margin : 0;
		padding : 0;
		text-align : center;
		font-family: 'Nanum Gothic Coding', monospace;
	}
	
	textarea {
		border : 1px solid gray;
		border-radius : 5px;
	}
	
	#main {
		width : 50%;
		position : relative;
		left : 35%;
		top : 20%;
		padding : 5px;
		margin-top : 30px;
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
	
	#container5{
		display : grid;
		width : 90%;
		grid-template-columns : 1fr 1fr 1fr;
		gap : 10px 10px;
		padding : 0;
		margin : 10px;
		margin-left : 0;
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
	 
	 #deleteBto {
	 	border : none;
	 	background : none;
	 	padding : 0;
	 	margin : 0;
	 }
	 
	 #deleteBto img{
	 	width : 20px;
	 	height : 20px;
	 	margin : 0;
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
	 
	 h4{
	 	font : bold;
	 }
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
	<div class="thead"></div>
	<div id="main">
		<form action="roomUpdate.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="room_no" value="${room.room_no }" >
			<div id="first">
				숙소 이름 : <input type="text" name="room_name" placeholder="숙소 이름" value="${room.room_name }"> <br>
				숙소 소개 : <textarea rows="5" cols="50" name="room_content" >${room.room_content } </textarea> <br>
					<div id="ShowAddress" >
					<input type="hidden" name="room_roadaddress" value="${room.room_roadaddress }">
					<input type="text" value="${room.room_address }" name="room_address" style="width:300px;margin-left:0;"readonly>
					<button onclick="show()" type="button">주소 수정</button>
					</div>
					
					기준 인원 : <input type="number" name="st_num_people" value="${room.st_num_people }" >명 <br>
					최대 인원 : <input type="number" name="max_people" value="${room.max_people }"> 명<br>
					평일 금액 : <input type="number" name="room_weekday" value="${room.room_weekday}"> 원<br>
					주말 금액 : <input type="number" name="room_weekdend" value="${room.room_weekend }"> 원<br>
					
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
								</select>
					<br>
				</div>
			<div id="second">
				침대 수 : <input type="number" name="bed" placeholder="1" value="${room.bed }"> 개 <br>
				침실 수 : <input type="number" name="bedroom" placeholder="1" value="${room.bedroom }"> 개 <br>
				욕실 수 : <input type="number" name="bathroom" placeholder="1" value="${room.bathroom }"> 칸 <br>
				
				<h4>편의 시설 </h4>
					<div id="container1">
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
								<div class="checkBox"><input type="checkbox" name="amenity" value="${alist }" ${checked } >${ alist }</div>
							</c:forEach>
						</c:forEach>
					</div>
<h4>시설 </h4>
<div id="container2">
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

<div class="checkBox"><input type="checkbox" name="facility" value="${flist }" ${checked }>${ flist } </div>
</c:forEach>
</c:forEach>
</div>

<h4>건물 유형 </h4>
<div id="container3">
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

<div class="checkBox"><input type="checkbox" name="build_type" value="${blist }" ${checked }>${ blist } </div>
</c:forEach> 
</c:forEach>
</div>

<h4>이용 규칙 </h4>
<div id="container4">
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

<div class="checkBox"><input type="checkbox" name="rule" value="${rlist }" ${checked }>${rlist } </div>
</c:forEach>
</c:forEach>
</div>
인원 추가 금액 : <input type="number" name="plus_charge" value="${room.plus_charge }"><br>
</div>

<div id="third">
<h4>숙소 사진</h4>
<div id="container5">
	<c:forEach items="${rflist }" var="rf">
		<div id="roomContent">
			<div class="right" >
				<img src="${pageContext.servletContext.contextPath }/resources/roomFiles/${rf.rename_file}" >
			</div>
			
			<div class="left" >
				${ rf.original_file} <button id="deleteBto" type="button" onclick="deleteRoomFile(${rf.room_file_no });"><img src="${pageContext.servletContext.contextPath }/resources/images/x버튼.png"></button>
			</div>
		</div>
	</c:forEach>
</div>


<div class="filebox"><label for="files">숙소 사진 추가</label><input multiple="multiple" type="file" id="files" name="files" style="display:none;"/></div>
<div class="dropBox" id="dropBox">사진 업로드</div>
<div id="imgContainer">

</div><input type="submit" value="전송">
</div>
</form>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>