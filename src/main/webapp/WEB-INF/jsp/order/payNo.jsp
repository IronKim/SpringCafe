<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 실패</title>
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
		padding: 15px 30px;
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
	<h1>결제 실패</h1>
	<button onclick="window.opener.payStatus = 0;window.close();">닫&nbsp;&nbsp;기</button>
	<p>*정상적인 취소를 위해 닫기 버튼을 눌러주세요</p>
<script type="text/javascript">
window.onbeforeunload = function(){
	window.opener.payStatus = 0;
};
</script>
</body>
</html>