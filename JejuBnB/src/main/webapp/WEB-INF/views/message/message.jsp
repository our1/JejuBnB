<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JejuBnB</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/images/favicon.png">
<style type="text/css">
 .chat {
    list-style: none;
    margin: 0;
    padding: 0;
}
.chat li {
    margin-bottom: 10px;
    padding-bottom: 5px;
    border-bottom: 1px dotted #B3A9A9;
}
.chat li.left .chat-body {
    margin-left: 60px;
}
.chat li.right .chat-body {
    margin-right: 60px;
}
.chat li .chat-body p {
    margin: 0;
    color: #777777;
}
.panel .slidedown .glyphicon, .chat .glyphicon {
    margin-right: 5px;
}
.panel-body {
    overflow-y: scroll;
    height: 500px;
}
.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 84%;
    margin-bottom: 0;
}
.sma {
	background-color: #337ab7;
    color: #fff;
    border: none;
    height: 29px;
    font-size: 12px;
    width: 54px;
}
.sma:hover {
	background-color : #33619e;
}
.messagelistgo {
    width: 33px;
    height: 23px;
    border: none;
    float: right;
    background: none;
    color: #fff;
    padding-bottom: 4%;
    padding-left: 6%;
}
.icon-bar {
    background-color: #fff;
    border-radius: 1px;
    cursor: pointer;
    display: block;
    height: 2px;
    margin-top: 3px;
    width: 18px;
 }
</style>
<script type="text/javascript">
	function message() {
	 	window.open("message.do?user_one=${loginMember.user_id }&user_two=user02" , "메세지함",
		"width=800, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
		}
	 	function moveMessageListPage() {
	 	 	window.open("moveMessageList.do?user_one=${loginMember.user_id }", "메세지창",
	 		"width=1700, height=900, left=100, top=50, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); 
	 	}
</script>
</head>
<body>
    <div class="container">
	   <div class="row">
	       <div class="col-md-6 col-md-offset-3">
	           <div class="panel panel-primary">
	               <div class="panel-heading">
	                   <span class="glyphicon glyphicon-comment"></span> Message
		                   	<button class="messagelistgo" onclick="javascript:location.href='${ message }'">
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						       <span class="icon-bar"></span>
						     </button>
             	   </div>
            <div class="panel-body">
               <ul class="chat">
					<c:forEach items ="${ list2 }" var = "ms">
					<c:if test="${ ms.writer == loginMember.user_name }">
					<div align="right">
					${ ms.writer } :  ${ ms.content }<br>
					</div>
					</c:if>
					<c:if test="${ ms.writer != loginMember.user_name }">
					<div align="left">
					${ ms.writer } :  ${ ms.content }<br>
					</div>
					</c:if>
					</c:forEach>
 			   </ul>
            </div>
                 <div class="panel-footer">
                   <div class="input-group">
						<form action="insertMessageDetail.do" method="post" >
							<input id="Mensaje" type="text" name="content" class="form-control input-sm" placeholder="메세지를 입력하세요..." />
							<input type="hidden" name="writer" value="${ loginMember.user_name }">
							<input type="hidden" name="message_no" value="${ messagelist.message_no }">
							<input type="submit" value="보내기" class="sma">		
						</form>
					</div>
               </div>
           </div>
       </div>
   </div>
</div>

</body>
</html>