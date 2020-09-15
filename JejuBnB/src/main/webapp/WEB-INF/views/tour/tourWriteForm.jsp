<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="resources/summernote/summernote-bs4.css" rel="stylesheet">
<script src="resources/summernote/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>

<title>JejuBnB</title> 
<style type="text/css">
	
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
               url('resources/images/29.jpg');
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
                document.getElementById("tour_roadaddress").value = roadAddr;
               
            }
        }).open();
    })
    }
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div class="thead"></div>
	<form action="tinsert.do"  method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
	<fieldset>
	 <select name="카테고리">
	 	<option value="live">자연</option>
	 	<option value="food">음식</option>
	 	<option value="act">액티비티</option>
	 </select>
	 <input type="text" placeholder="관광지 이름 을 입력하세요" required>
	 </fieldset>
	 <fieldset>
	 	<input type="date" placeholder="시작 날짜">
	 	<input type="date" placeholder="끝나는 날짜">
	 </fieldset>
	 <fieldset>
	 <textarea id="summernote" name="editordata"></textarea> <br>
	 </fieldset>
	 <fieldset>
	 <input type="text" id="PostNumber" placeholder="우편번호" required readonly><br>
		<button onclick="PostCall()" type="button">우편번호 검색</button><br>
		<input type="text" id="tour_roadaddress" name="tour_roadaddress" placeholder="도로명주소" readonly><br>
		<input type="text" id="DetailAddress" name="address" placeholder="상세주소" required><br>
	  </fieldset>
	  <fieldset>
	 <input type="text" placeholder=" 알아두어야 할 사항 을 입력하세요"> <br>
	 </fieldset>
<input type="submit" value="작성 완료">
</form>
    <script type="text/javascript">
      $(document).ready(function() {
  $('#summernote').summernote({
    lang: 'ko-KR' // default: 'en-US'
  });
});
$('#summernote').summernote({
  height: 300,                 // set editor height
  minHeight: null,             // set minimum height of editor
  maxHeight: null,             // set maximum height of editor
  focus: true                  // set focus to editable area after initializing summernote
});
    </script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>