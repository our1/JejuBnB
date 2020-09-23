<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
</head>
<style type="text/css">
	body {
	  margin : 0;
	  padding : 0;
	}
	form {
	  position: relative;
   	  left: 20%;
   	  width : 1000px;
	}
	select {
	  width: 121px;
      height: 42px;
	}
    .tn {
      width: 479px;
      height: 42px;
      margin-bottom : 2%;
	}
	.tds {
	  width : 300px;
	  height : 42px;
	  margin-bottom : 2%;
	}
	.tdd {
	  width : 300px;
	  height : 42px;
	}
	.trhead {
	  position : relative;
	  width : 100%;
	  height : 600px;
	  background-image : url('resources/images/40.jpg');
	  background-size: cover;
}
.postsea {
    position: relative;
    left: 1%;
    height : 42px;
}
#PostNumber {
	height : 42px;
    margin-bottom : 1%;
}
#tour_roadaddress {
	height : 42px;
	margin-bottom : 1%;
}
#DetailAddress {
 	height : 42px;
 	margin-bottom : 2%;
}

.moin {
	height: 200px;
    width: 1000px;
}
.co {
	float : right;
}
</style>
<%-- <c:import url="/WEB-INF/views/common/header.jsp"/> --%>
<body>
   <div class="trhead"></div>
   		<div style="padding: 100px 0px 0px 0px;"></div>
  <form action="tupdate.do" method="post">
    <input type="hidden" name="tour_no" value="${ tour.tour_no }">
    <input type="hidden" name="tour_category_no" value="${ tour.tour_category_no }">
    <input type="text" class="tn" name="tour_name" value="${ tour.tour_name }" placeholder="관광지 이름 을 입력 하세요"><br>
	<input type="date" class="tds" name="tour_act_start_date" value="${ tour.tour_act_start_date }"placeholder="체험 시작 날짜">
	<input type="date" class="tdd" name="tour_act_end_date" value="${ tour.tour_act_end_date } "placeholder="체험 끝나는 날짜">
	<textarea name="tour_content" id="summernote" class="summernote" >${ tour.tour_content } </textarea>
<script>
	$(document).ready(function() { $('#summernote').summernote(); 
	});
	$('.summernote').summernote({ 
		height : 300, 
		width : 1000,
		lang : 'ko-KR',
		placeholder : '관광지 내용 을 입력 하세요',
		onImageUpload: function(files, editor, welEditable) { sendFile(files[0], editor, welEditable);
		} 
	});
</script>
	<input type="text" id="PostNumber" placeholder="우편번호" required readonly>
	<button onclick="PostCall()" type="button" class="postsea">우편번호 검색</button><br>
	<input type="text" id="tour_roadaddress" name="tour_roadaddress" value="${ tour.tour_roadaddress }"placeholder="도로명주소" readonly><br>
	<input type="text" id="DetailAddress" name="address" placeholder="상세주소"><br>
	<textarea name="tour_moreinfo" class="moin" value="${ tour.tour_moreinfo }"placeholder="알아야 할 사항 을 입력 하세요"></textarea>	
	<input type="hidden" name="user_id" value="${loginMember.user_id }" >
	<input type="submit" value="수정 완료" class="co">
	</form>
	<div style="padding: 100px 0px 0px 0px;"></div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</html>