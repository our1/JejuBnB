<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Spring second file down up page</h1>
<h2> 파일 업로드 테스트</h2>
<form action="tinsert.do" method = "post" enctype="multipart/form-data">
이 름   : <input type ="text" name ="name" required><br>
나 이  : <input type = "number" name= "age" required> <br>
첨부파일 : <input type = "file" name="upfile"><br>
<input type="submit" value = "전송하기">


</form><br>
<hr>



<h2> 파일 업로드 테스트</h2>


</body>
</html>