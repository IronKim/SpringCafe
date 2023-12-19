<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자 인증</title>
<style type="text/css">

#container{
	margin: auto;
	margin-top: 8%;
}
#container div{
	float: left;
}
.btn{
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
	color:#265B3D;
	border: 1.5px solid #265B3D;
	padding: 7px 30px;
	border-radius: 5px;
	background-color: white;
	transition: 0.5s;
}
.btn:hover{
	background-color: #265B3D;
	color: white;
}
#tel{
	width: 270px;
	height: 28px;
}
#smsForm{
	font-size: 15px;
	font-weight: bold;
}

#userNum{
	width: 150px;
	height: 28px;
}
#authContainer{
	width: 100%;
	height: 200px;
	margin: auto;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
}
#sms-check-warn {
	font-size: 13px;
}
</style>
</head>
<body>
	<div id="container"> 
		<div>
			<form action="/miniProject/member/writeForm" id="smsForm" method="post">
			<input type="hidden" name="auth" value="1">
				핸드폰 번호&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="tel" name="tel" placeholder="-없이 숫자만 입력" maxlength="11" />	
			&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary"  id="send">전송</button><br>
				<div id="authContainer" style="display: none;">
					<div style="margin-left: ">
					인증번호 <input type="text"id="userNum" placeholder="6자리 입력" style="margin-left: 20px;">
					</div>
					<div class="input-group">&nbsp;&nbsp;
						<button type="button" class="btn" id="cancelBtn">취소</button>&nbsp;&nbsp;
						<button type="button" class="btn" id="enterBtn">확인</button>
					</div>
					<div id="sms-check-warn"></div>
				</div>	
			</form>
	    </div>
    </div>

	<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="/miniProject/js/sms.js"></script>
</body>
</html>