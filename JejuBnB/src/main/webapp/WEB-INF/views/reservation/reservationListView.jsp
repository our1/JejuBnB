<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
<link rel="stylesheet" href="resources/css/header.css" >
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
        <style>
            /*datepicker에서 사용한 이미지 버튼 style적용*/
            img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
}
        </style>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- datepicker 한국어로 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <script>
            $(function() {


                //오늘 날짜를 출력
                $("#today").text(new Date().toLocaleDateString());

                //datepicker 한국어로 사용하기 위한 언어설정
                $.datepicker.setDefaults($.datepicker.regional['ko']);

                // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                //시작일.
                $('#fromDate').datepicker({
                    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                    buttonImage: "images/calendar.gif", // 버튼 이미지
                    buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                    //buttonText: "날짜선택",             // 버튼의 대체 텍스트
                    dateFormat: "yy-mm-dd",             // 날짜의 형식
                    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                    onClose: function( selectedDate ) {
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#toDate").datepicker( "option", "minDate", selectedDate );
                    }
                });

                //종료일
                $('#toDate').datepicker({
                    showOn: "both",
                    //buttonImage: "images/calendar.gif",
                    buttonImageOnly : true,
                    //buttonText: "날짜선택",
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    //minDate: 0, // 오늘 이전 날짜 선택 불가
                    onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
                        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                    }
                });
            });
        </script>
<style type="text/css">
._1044tk8 {
    display: flex !important;
    margin-bottom: 24px !important;
}
._fz3zdn {
    flex-shrink: 0 !important;
}
._1mqc21n {
    margin-left: 16px !important;
}
._1qsawv5 {
    color: rgb(34, 34, 34) !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-weight: 600 !important;
    font-size: 16px !important;
    line-height: 20px !important;
    margin-bottom: 4px !important;
}
._1jlr81g {
    color: rgb(113, 113, 113) !important;
    font-family: Circular, -apple-system, BlinkMacSystemFont, Roboto, "Helvetica Neue", sans-serif !important;
    font-weight: 400 !important;
    font-size: 14px !important;
    line-height: 20px !important;
}

</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<div>
<h1>${ room.room_name }</h1> <br><hr>
<style>
	*{margin:0;padding:0;}
	ul,li{list-style:none;}
	#slide{height:300px;position:relative;overflow:hidden;}
	#slide ul{width:400%;height:100%;transition:1s;}
	#slide ul:after{content:"";display:block;clear:both;}
	#slide li{float:left;width:25%;height:100%;}
	#slide li:nth-child(1){background-image:url(resources/image.jpg); }
	#slide li:nth-child(2){background-image:url(resources/image.jpg); }
	#slide li:nth-child(3){background-image:url(resources/image.jpg); }
	#slide li:nth-child(4){background-image:url(resources/image.jpg); }
	#slide li:nth-child(5){background-image:url(resources/image.jpg); }
	#slide li:nth-child(6){background-image:url(resources/image.jpg); }
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
</div> <br>
    
<h3>${ room.user_id } 님의 JejuBnB</h3> <br>
<h4>최대 인원  ${ room.max_people } 명, 침대수 ${ room.num_bed } 개, 
	침실수 ${ room.num_bedroom } 개, 욕실수  ${ num_bathroom } 개
</h4> <br><hr>

<div data-plugin-in-point-id="HIGHLIGHTS_DEFAULT" data-section-id="HIGHLIGHTS_DEFAULT" style="padding-top: 32px; padding-bottom: 32px;"><div class="_1044tk8"><div class="_fz3zdn"><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M17.954 2.781l.175.164 13.072 12.842-1.402 1.426-1.8-1.768L28 29a2 2 0 0 1-1.85 1.994L26 31H6a2 2 0 0 1-1.995-1.85L4 29V15.446l-1.8 1.767-1.4-1.426L13.856 2.958a3 3 0 0 1 4.097-.177zm-2.586 1.503l-.096.088L6 13.48 6 29l5-.001V19a2 2 0 0 1 1.85-1.995L13 17h6a2 2 0 0 1 1.995 1.85L21 19v9.999h5V13.48l-9.3-9.135a1.001 1.001 0 0 0-1.332-.06zM19 19h-6v9.999h6z"></path></svg></div><div class="_1mqc21n">
	<div class="_1qsawv5">집 전체</div><div class="_1jlr81g">초소형 주택 전체를 단독으로 사용하시게 됩니다.</div></div></div><div class="_1044tk8"><div class="_fz3zdn"><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M25 1a2 2 0 0 1 1.995 1.85L27 3l-.001 26H29v2H3v-2h1.999L5 3a2 2 0 0 1 1.85-1.995L7 1zm-4 2H7l-.001 26H21zm4 0h-2v26h1.999zm-7 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg></div><div class="_1mqc21n"><div class="_1qsawv5">셀프 체크인</div><div class="_1jlr81g">키패드를 이용해 체크인하세요.</div></div></div><div class="_1044tk8"><div class="_fz3zdn"><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M16 0c6.627 0 12 5.373 12 12 0 6.337-3.814 12.751-11.346 19.257L16 31.82l-1.076-.932C7.671 24.509 4 18.218 4 12 4 5.423 9.397 0 16 0zm0 2C10.504 2 6 6.525 6 12c0 5.44 3.249 11.118 9.831 17.02l.169.149.576-.518c6.178-5.65 9.293-11.092 9.42-16.318L26 12c0-5.523-4.477-10-10-10zm0 5a5 5 0 1 1 0 10 5 5 0 0 1 0-10zm0 2a3 3 0 1 0 0 6 3 3 0 0 0 0-6z"></path></svg></div>
<div class="_1mqc21n"><div class="_1qsawv5">훌륭한 숙소 위치</div>
<div class="_1jlr81g">최근 숙박한 게스트 중 90%가 위치에 별점 5점을 준 숙소입니다.</div></div></div><div class="_1044tk8"><div class="_fz3zdn"><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M12 0v2h8V0h2v2h6a2 2 0 0 1 1.995 1.85L30 4v15.586a2 2 0 0 1-.467 1.284l-.119.13L21 29.414a2 2 0 0 1-1.238.578l-.176.008H7a5 5 0 0 1-4.995-4.783L2 25V4a2 2 0 0 1 1.85-1.995L4 2h6V0zM4 12v13a3 3 0 0 0 2.824 2.995L7 28h11v-5a5 5 0 0 1 4.783-4.995L23 18h5v-6zm23.585 8H23a3 3 0 0 0-2.995 2.824L20 23v4.585zM4 10h24V4h-6v2h-2V4h-8v2h-2V4H4z"></path></svg></div><div class="_1mqc21n">
<div class="_1qsawv5">체크인 24시간 전까지 수수료 없이 예약 취소 가능</div><div class="_1jlr81g"></div></div></div></div> <br><hr>

<div>
<h2>요금을 확인하려면 날짜를 입력하세요.</h2>
<form>
	 <label for="fromDate"></label>
			<input type="text" name="fromDate" id="fromDate" readonly value="체크인">
		<label for="toDate"></label>
		<input type="text" name="toDate" id="toDate" readonly value="체크아웃">
</form>
<button onclick="javascript:location.href='redetail.do';">예약 진행하기</button>
</div>




<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>