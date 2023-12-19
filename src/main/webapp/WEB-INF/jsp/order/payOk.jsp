<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
<style type="text/css">
	body {
		background-color: whitesmoke;
		text-align: center;
		width: 95%;
	}
	h1 {
		font-size: 50px;
		text-align: center;
		font-weight: bold;
	}
	button {
		font-size:20px;
		padding: 15px 20px;
		background-color: yellow;
		border-radius: 40px;
		border: 0;
		margin: 20px auto;
		font-weight: bold;
		opacity:0.6;
		transition: 0.5s;
		cursor: pointer;
	}
	button:hover {
		opacity:1;
	}
	p {
		color: gray;
		font-size: 13px;
	}
</style>
</head>
<body>
	<h1>결제 성공</h1>
	<button onclick="sw = 1;window.opener.payCom = 1;window.opener.order();window.close();">결제 완료</button>
	<p>*정상적인 결제 진행을 위해 결제 완료 버튼을 눌러주세요</p>
<script type="text/javascript">
var sw = 0;
window.onbeforeunload = function(){
	if(sw == 0) {
		window.opener.payCom = 1;
		window.opener.order();
	}
};
</script>
</body>
</html>