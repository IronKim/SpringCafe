<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/authForm.css">
</head>

<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${sessionScope.memMemberDTO == null}">
<div style="width:940px;margin: 0 auto;">
    <div style="margin: 20px 10px">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > Register
		<h1 style="margin-top: 10px;">회원가입</h1>
	</div>
</div>
	<div id="row">
	<div id="row_inner">
		<div class="card">
			<div class="card_inner">
				<img src="../image/email.png" class="card-img-top" alt="..." style="width: 200px;">
			</div>
			<div style="width: 100%;">
				<button onclick="openPopup('/miniProject/email')">이메일 인증</button>
			</div>
		</div>
		
		<div class="card" style="margin-left: 5px;">
			<div class="card_inner">
				<img src="../image/phone.png" class="card-img-top" alt="..." style="width: 200px;">
			</div>
			<div style="width: 100%;">
				<button onclick="openPopup('/miniProject/sms')">문자 인증</button>
			</div>
		</div>
	</div>
	</div>
</c:if>
	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
	<script type="text/javascript">
	    window.name = "authForm";
		
		function openPopup(url){
		    var popup = window.open(url, 
		    		'auth', 'top=10,left=10,width=500px,height=300px,scrollbars=no, resizable=no,' + 
		    		'toolbars=no, menubar=no');
		    return popup
		}
	</script>
</body>
</html>















