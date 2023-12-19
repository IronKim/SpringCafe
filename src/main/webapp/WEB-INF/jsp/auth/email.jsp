<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<style type="text/css">
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
.email_form{
	margin-top: 5%;
}
.mail_btn{
	margin-top: 20px;
	float:right;
}	
.form-control{
	width: 170px;
	height: 20px;
}
.form-select{
	width: 100px;
	height: 26px;
}
#authInput{
	width: 150px;
	height: 29px;
	margin-left: 10px;
}
#authContainer div{
	float: left;
}
#authContainer{
	width: 350px;
	height:35px;
	margin: auto;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
}
.input-group-addon{
	width:100px;
	height:40px;
}
.btn-primary{
	margin-left: 10px;
}
#mail-check-warn {
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="email_form">
		<form action="/miniProject/member/writeForm" id="emailForm" method="post">
		<input type="hidden" name="auth" value="1">
		<div class="input-group">
			<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일 입력" > @
			<input type="text" class="form-control" name="userEmail2" id="userEmail2" >
			<select id="user_email_address" class="form-select">
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="yahoo.co.kr">yahoo.co.kr</option>
			</select>
		</div>   
		</form>
			<button type="button" class="mail_btn btn" id="mail-Send-Btn">이메일 전송</button>
		
		<div id="authContainer" style="display: none;">
			
			<div class="mail-check-box">
				인증번호<input class="form-control mail-check-input" id="authInput" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
			</div>
			<div class="input-group-addon">
				<button type="button" class="btn-primary btn" id="auth-Check-Btn">확인</button>
			</div>
			<div id="mail-check-warn"></div>
		</div>
	</div>
	

	<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="/miniProject/js/email.js"></script>
</body>
</html>