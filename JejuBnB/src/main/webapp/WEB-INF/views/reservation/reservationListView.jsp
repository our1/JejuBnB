<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
    body {
    background-color: #eee

}

.card {
    background-color: #fff;
    padding: 14px;
    border: none
}

.demo {
    width: 100%
}

ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom: 0
}

li {
    display: block;
    float: left;
    margin-right: 6px;
    cursor: pointer
}

img {
    display: block;
    height: auto;
    width: 100%
}

.stars i {
    color: #f6d151
}

.stars span {
    font-size: 13px
}

hr {
    color: #d4d4d4
}

.badge {
    padding: 5px !important;
    padding-bottom: 6px !important
}

.badge i {
    font-size: 10px
}

.profile-image {
    width: 35px
}

.comment-ratings i {
    font-size: 13px
}

.username {
    font-size: 12px
}

.comment-profile {
    line-height: 17px
}

.date span {
    font-size: 12px
}

.p-ratings i {
    color: #f6d151;
    font-size: 12px
}

.btn-long {
    padding-left: 35px;
    padding-right: 35px
}

.buttons {
    margin-top: 15px
}

.buttons .btn {
    height: 46px
}

.buttons .cart {
    border-color: #ff7676;
    color: #ff7676
}

.buttons .cart:hover {
    background-color: #e86464 !important;
    color: #fff
}

.buttons .buy {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676
}

.buttons .buy:focus,
.buy:active {
    color: #fff;
    background-color: #ff7676;
    border-color: #ff7676;
    box-shadow: none
}

.buttons .buy:hover {
    color: #fff;
    background-color: #e86464;
    border-color: #e86464
}

.buttons .wishlist {
    background-color: #fff;
    border-color: #ff7676
}

.buttons .wishlist:hover {
    background-color: #e86464;
    border-color: #e86464;
    color: #fff
}

.buttons .wishlist:hover i {
    color: #fff
}
.buttons .wishlist i {
    color: #ff7676
}

.comment-ratings i {
    color: #f6d151
}

.followers {
    font-size: 9px;
    color: #d6d4d4
}

.store-image {
    width: 42px
}
.bullet-text {
    font-size: 16px;
    font-family: 'Roboto', sans-serif;
}
.card-body {
    padding: 0.3rem 0.3rem 0.2rem
}
.sub {
  font-size: 14px;
  color : gray;
  font-family: 'Roboto', sans-serif;
}
p {
  font-family: 'Roboto', sans-serif;
}

.map {
  width: 1065px;
  height: 300px;
  border : 1px solid gray;
}
</style>
  <body>
    <link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
<div class="container-fluid mt-2 mb-3">
    <div class="row no-gutters">
        <div class="col-md-5 pr-2">
            <div class="card">
                <div class="demo">
                    <ul id="lightSlider">
                        <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/KZpuufK.jpg"> <img src="https://i.imgur.com/KZpuufK.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/GwiUmQA.jpg"> <img src="https://i.imgur.com/GwiUmQA.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/DhKkTrG.jpg"> <img src="https://i.imgur.com/DhKkTrG.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/kYWqL7k.jpg"> <img src="https://i.imgur.com/kYWqL7k.jpg" /> </li>
                        <li data-thumb="https://i.imgur.com/c9uUysL.jpg"> <img src="https://i.imgur.com/c9uUysL.jpg" /> </li>
                    </ul>
                </div>
            </div>
            <div class="card mt-2">
                <h6>리뷰</h6>
                <div class="d-flex flex-row">
                    <div class="stars"><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></div> <span class="ml-1 font-weight-bold">4.6</span>
                </div>
                <hr>
                <div class="badges"> <span class="badge bg-dark ">(230)</span> <span class="badge bg-dark "> <i class="fa fa-image"></i> 23 </span> <span class="badge bg-dark "> <i class="fa fa-comments-o"></i> 23 </span> <span class="badge bg-warning"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <span class="ml-1">2,123</span> </span> </div>
                <hr>
                <div class="comment-section">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/o5uMfKo.jpg" class="rounded-circle profile-image">
                            <div class="d-flex flex-column ml-1 comment-profile">
                                <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Lori Benneth</span>
                            </div>
                        </div>
                        <div class="date"> <span class="text-muted">2 May</span> </div>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex flex-row align-items-center"> <img src="https://i.imgur.com/tmdHXOY.jpg" class="rounded-circle profile-image">
                            <div class="d-flex flex-column ml-1 comment-profile">
                                <div class="comment-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="username">Timona Simaung</span>
                            </div>
                        </div>
                        <div class="date"> <span class="text-muted">12 May</span> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="card">
                <div class="d-flex flex-row align-items-center">
                    <div class="p-ratings"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> </div> <span class="ml-1">5.0</span>
                </div>
                <div class="about"> <span class="font-weight-bold">도심속의 힐링:) 피아노와 빔이 있는, 역에서 차로 3분거리 단독주택의 1층 스테이여수에서</span>
                    <h4 class="font-weight-bold"><span>&#8361;</span>130,000</h4>
                </div>
                <div class="buttons"><button class="btn btn-warning btn-long buy" onclick="location.href='#'">Buy it Now</button> <button class="btn btn-light wishlist"> <i class="fa fa-heart"></i> </button> </div>
                <hr>
                <div class="product-description">
                    <div class="d-flex flex-row align-items-center"> <i class="fa fa-calendar-check-o"></i> <span class="ml-1">최대 인원 4명 · 침실 1개 · 침대 1개 · 욕실 1개</span> </div>
                    <div class="mt-2">
                        <p class="content">- 매 청소시마다 연무기와 소독제를 이용해 꼼꼼히 소독하고있습니다.
                          - 기존 2층 숙소는 운영종료이며, 1층 숙소를 리뉴얼해 한개만 운영 중입니다.

                          엑스포역에서 차로 3분거리에 위치해있는 단독주택으로, 포토그래퍼와 바리스타 부부가 고양이와 생활하는 공간입니다. 큰 야자수가 있고 멀리 바다가 보여요.
                          1층에 있는 두개의 숙소 중 하나가 게스트숙소이며 코지한 컨셉의 분리형 원룸입니다.
                          TV가 없고 빔프로젝트로 usb나 노트북으로 영화를 보실 수 있습니다.
                          취사는 불가하며 간단한 조리를 위한 전자제품이 구비되어있어요.

                          번화가가 아닌 조용한 동네지만 외지지않았고, 숙소 앞 대로변에 버스정류장이 있어 오동도, 낭만포차, 교동 등 10분정도 소요됩니다.
                          숙소 오른편으로 바다가 보이는 예쁜 산책길이 있고, 일출을 감상하실 수 있어 조용히 동네 산책하기 좋아요.
                          고양이를 사랑하시는 분이라면 더욱 좋을 것 같아요.

                          '스테이여수에서'와 함께 편안하고 행복한 여행이 되시길.. 환영합니다! :)

                          숙소
                          -단독주택의 1층이며, 마당에서 오른쪽에 보이는 파란색 문이 숙소입니다.
                          -카페 여수에서는 벽화마을 안에 위치해있습니다.

                          게스트 이용 가능 공간/시설
                          - 취사는 불가하며, 간단한 조리를 할 수 있는 전자렌지, 토스트기, 전기포트가 준비되어있습니다.
                          - TV가 없고, 빔프로젝트와 블루투스 스피커로 벽면 가득히 영화감상하실 수 있습니다.
                          - 오래된 피아노가 있습니다. 늦은 밤 외에는 연주 가능하십니다.

                          기타 주의사항
                          마당에 고양이를 키우고있습니다. 고양이 알레르기나 싫어하시는 분들은 다른 곳을 추천해드릴게요ㅠ
                          고양이가 사람을 좋아해서 가끔 방으로 따라들어가는 경우가 있습니다.
                          털때문에 방에 두시면 안되고, 괜찮으시다면 들어서 밖으로 내보내주시면 감사하겠습니다.</p>
                          <script text="javascript/text">
                            $(document).ready(function(){

                                $('.mt-2').each(function(){
                                    var content = $(this).children('.content');
                                    var content_txt = content.text();
                                    var content_txt_short = content_txt.substring(0,300)+"...";
                                    var btn_more = $('<a href="javascript:void(0)" class="more">더보기..</a>');


                                    $(this).append(btn_more);

                                    if(content_txt.length >= 300){
                                        content.html(content_txt_short)

                                    }else{
                                        btn_more.hide()
                                    }

                                    btn_more.click(toggle_content);
                                    // 아래 bind가 안 되는 이유는??
                                    // btn_more.bind('click',toggle_content);

                                    function toggle_content(){
                                        if($(this).hasClass('short')){
                                            // 접기 상태
                                            $(this).html('더보기');
                                            content.html(content_txt_short)
                                            $(this).removeClass('short');
                                        }else{
                                            // 더보기 상태
                                            $(this).html('접기');
                                            content.html(content_txt);
                                            $(this).addClass('short');

                                        }
                                    }
                                });
                            });
                          </script>
                        </div> <br>
                          <div class="bullet-text"><i class="fa fa-home"></i>집 전체</div><div class="sub">주택 전체를 단독으로 사용하시게 됩니다.</div> <br>
                          <div class="bullet-text">청결 강화</div><div class="sub">공중보건 및 숙박업계 최고의 전문가들과 협력하여 개발한 엄격한 청결 강화 기준을 준수합니다.</div> <br>
                          <div class="bullet-text">셀프 체크인</div><div class="sub">키패드를 이용해 체크인하세요.</div> <br>
                          <div class="bullet-text">환불 정책</div><div class="sub">체크인 30일 전까지 취소하시면 전액이 환불됩니다.</div> <br>
                </div>
                <hr>
                <p>편의 시설</p>
                <div class="it">
                  <i class="fa fa-wifi"></i> 무선 인터넷 <i class="fa fa-snowflake"></i> 에어컨 <br>
                  <i class="fa fa-swimmer"></i> 수영장 <i class="fas fa-smoking-ban"></i> 금연 <br>
                  <i class="fa fa-glass-martini-alt"></i> 칵테일바 <i class="fa fa-dumbbell"></i> 헬스장 <br>
                 </div>
                <hr>
                <p>위치</p><div class="map"></div>
            </div>
            <div class="card mt-2"> <span>Similar items:</span>
                <div class="similar-products mt-2 d-flex flex-row">
                    <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/KZpuufK.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">$1,999</h6>
                        </div>
                    </div>
                    <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/GwiUmQA.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">$1,699</h6>
                        </div>
                    </div>
                    <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/c9uUysL.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">$2,999</h6>
                        </div>
                    </div>
                    <div class="card border p-1" style="width: 9rem;margin-right: 3px;"> <img src="https://i.imgur.com/kYWqL7k.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">$3,999</h6>
                        </div>
                    </div>
                    <div class="card border p-1" style="width: 9rem;"> <img src="https://i.imgur.com/DhKkTrG.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">$999</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>
<script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
<script>
    $('#lightSlider').lightSlider({
        gallery: true,
        item: 1,
        loop: true,
        slideMargin: 0,
        thumbItem: 9
    });
</script>
  </body>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</html>