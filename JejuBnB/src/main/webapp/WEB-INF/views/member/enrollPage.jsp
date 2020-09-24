<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" >
<!--     <link rel="stylesheet" href="resources/css/email.css" > -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Alex+Brush&display=swap" rel="stylesheet">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');
	.login,
    .image {
    min-height: 100vh;
    }
    .bg-image {
    background-image: url('resources/images/05.jpg');
    background-size: cover;
    background-position: center center;
    }
    strong {
      color: #444141;
	  font-family: 'Alex Brush', cursive;
	  font-size: 50px;
	  margin-left: 26%;
    }
    .rounded-pill {
      border-radius: 8px;
    }
    form .signin__btn {
      background: #3c84d2;
      color: white;
      display: block;
      width: 30.5%;
      max-width: 680px;
      height: 50px;
      border-radius: 8px;
      margin: 0 auto;
      border: none;
      cursor: pointer;
      font-size: 14px;
      font-family: 'Roboto', sans-serif;
      box-shadow: 0 15px 30px rgb(78 75 216 / 36%);
      -webkit-transition: .2s linear;
      transition: .2s linear;
      font-size: 17px;
      margin-left : 4%;
    }
    form .signin__btn:hover {
      box-shadow: 0 0 0 rgba(233, 30, 99, 0);
    }
    form .signin2__btn {
      background: #e04646;
      color: white;
      display: block;
      width: 30.5%;
      max-width: 680px;
      height: 50px;
      border-radius: 8px;
      position: absolute;
	  left: 62%;
	  top: 76%;
      border: none;
      cursor: pointer;
      font-size: 14px;
      font-family: 'Roboto', sans-serif;
      box-shadow: 0 15px 30px rgba(233, 30, 99, 0.36);
      -webkit-transition: .2s linear;
      transition: .2s linear;
      font-size: 17px;
    }
    form .signin2__btn:hover {
      box-shadow: 0 0 0 rgba(233, 30, 99, 0);
    }
    .separator {
      display: block;
      margin: 30px auto 10px;
      text-align: center;
      height: 40px;
      position: relative;
      background: transparent;
      color: rgba(15, 19, 42, 0.4);
      font-size: 13px;
      width: 90%;
      max-width: 680px;
    }
    .separator::before {
      content: "";
      position: absolute;
      top: 8px;
      left: 0;
      background: rgba(15, 19, 42, 0.2);
      height: 1px;
      width: 45%;
    }
    .separator::after {
      content: "";
      position: absolute;
      top: 8px;
      right: 0;
      background: rgba(15, 19, 42, 0.2);
      height: 1px;
      width: 45%;
    }

    .google__btn {
      display: block;
      width: 90%;
      max-width: 680px;
      margin: 20px auto;
      height: 50px;
      cursor: pointer;
      font-size: 14px;
      font-family: 'Roboto', sans-serif;
      border-radius: 8px;
      border: none;
      line-height: 40px;
    }
    .google__btn.google__btn {
      background: #5b90f0;
      color: white;
      box-shadow: 0 15px 30px rgba(91, 144, 240, 0.36);
      -webkit-transition: .2s linear;
      transition: .2s linear;
    }
    .google__btn.google__btn .fa {
      font-size: 20px;
      padding: 0 5px 0 0;
    }
    .google__btn.google__btn:hover {
      box-shadow: 0 0 0 rgba(91, 144, 240, 0);
    }
    .google__btn.github__btn {
      background: #25282d;
      color: white;
      box-shadow: 0 15px 30px rgba(37, 40, 45, 0.36);
      -webkit-transition: .2s linear;
      transition: .2s linear;
    }
    .google__btn.github__btn .fa {
      font-size: 20px;
      padding: 0 5px 0 0;
    }
    .google__btn.github__btn:hover {
      box-shadow: 0 0 0 rgba(37, 40, 45, 0);
    }

    .enroll {
      color: black;
      margin-left: 37.5%;
      text-decoration: underline;
    }
    .fb_iframe_widget {
    display : inline-block;
    position : relative;
    left : 5.2%;
    }
    p {
     margin-left : 5%;
    }
</style>
</head>
<script type="text/javascript" src="resources/js/jquery-3.5.1.min.js"></script>
<script>
	function validate(){
	var pwdValue = document.getElementById("userpwd").value;
	var pwdValue2 = document.getElementById("userpwd2").value;
	if (pwdValue !== pwdValue2) {
		alert ("암호와 암호 확인의 값이 일치하지 않습니다.")
		document.getElementById("userpwd").select();
		return false; 
	}
	return true; 
}
</script>
<body>
 <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-md-6 d-none d-md-flex bg-image"></div>
            <div class="col-md-6 bg-light">
                <div class="login d-flex align-items-center py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-10 col-xl-7 mx-auto">
                               <strong>JejuBnB</strong>
                              	 <div style="padding: 30px 0px 0px 0px;"></div>
                              	  <p> 회원의 정보를 입력해 주세요.</p>
                              	  <div style="padding: 10px 0px 0px 0px;"></div>
                                <form method="post" action="enroll.do" onsubmit= "return validate();">	
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" type="text" placeholder="아이디 를 입력해 주세요" required="" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" name="user_id" value="${user_id }" readonly>
                                    </div>
                                    <div class="form-group mb-3">
                                        <input id="inputname" type="text" placeholder="이름 을 입력해 주세요" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="user_name" required>
                                    </div>
                                     <div class="form-group mb-3">
                                        <input id="inputPassword" type="password" placeholder="비밀 번호 를 입력해 주세요" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="user_pwd">
                                    </div>
                                     <div class="form-group mb-3">
                                        <input id="inputPassword" type="password" placeholder="비밀 번호 확인" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="user_pwd">
                                    </div>
                                     <div class="form-group mb-3">
                                        <input id="inputPassword" type="text" placeholder="생 년 월 일 을 입력해 주세요" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="birthday">
                                    </div>
                                     <div class="form-group mb-3">
                                        <input id="inputPassword" type="tel" placeholder="전화 번호 를 입력해 주세요" required="" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary" name="phone" required>
                                    </div>
                                    <input type="submit" value = "가입하기" class="signin__btn">
									<input type="reset" value = "작성취소" class="signin2__btn">
                                    <div class="separator">
                                      <p>OR</p>
                                    </div>
                                  		<a href="main.do" class="enroll">시작 페이지로</a> <br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
</body>
</html>