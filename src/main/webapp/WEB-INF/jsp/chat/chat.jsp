<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/chat.css">
<link rel="stylesheet" href="/miniProject/css/animation.css">
</head>
<body>
     <header>
        <jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
    </header> 
    <nav>
       <jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
    </nav>

    <c:if test="${sessionScope.memMemberDTO != null}">
    <main>

    <div style="margin: 20px 10px">
	<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Community > Chat
		<h1 style="margin-top: 10px;">채팅</h1>
	</div>
    <div id="chat">
    	<div style="clear:both"></div>
    	<div id="messageSection_h">
    	<h1>실시간 채팅</h1>
    	</div>
    	<section id="messageSection">
    	</section>
    	<section id="writeSection">
    		<div id="refreshSection">
    			<div>
	    		<button id="reset">
	    			<img src="/miniProject/image/refresh.png" id="refresh">
	    		</button>
	    		</div>
	    		<div id="reDiv">실시간 채팅 활성화</div>
    		</div>
    		<form id="chatForm">
    			<input type="button" id="submit" value="전송">
    			<textarea rows="2" name="content" id="content" placeholder="메시지를 입력하세요"></textarea>
    			<input type="hidden" name="name" id="name" value="${sessionScope.memMemberDTO.name}">
    			<input type="hidden" name="userSeq" id="seq" value="${sessionScope.memMemberDTO.seq}">
    			<div id="chatDiv"></div>
    		</form>
    	</section>
    </div>
  	</main>
    </c:if>
    <c:if test="${sessionScope.memMemberDTO == null}">
    	<script type="text/javascript">
    		window.onload=location.href='/miniProject/member/loginForm'
    	</script>
    </c:if>
    <footer>
    	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
    </footer>

<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/miniProject/js/chat.js"></script>
<script type="text/javascript">

</script>
</body>
</html>