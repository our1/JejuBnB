<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
</head>
<body>
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="join_injeung.do" method="post">                  
                    <center>
                        <br>
                        <div>
                            인증번호 입력 : <input type="number" name="email_injeung"
                                placeholder="  인증번호를 입력하세요. ">
                        </div>                                        
 								<input type="hidden" name="dice" value="${dice }">
 								<input type="hidden" name="user_id" value="${user_id }">
                        <br> <br>
                        <button type="submit" name="submit">인증번호 확인</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
 
</body>
</html>
