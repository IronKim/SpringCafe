<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/orderComplete.css">
</head>
<body>
  	<header>
       <jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
    </header>
    <nav>
       <jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
    </nav>
    <div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Membership > SmartOrder
			<h1 style="margin-top: 10px;">스마트 오더</h1>
		</div>
	</div>
    <main>
    	<div id="storeName"></div>
    	<div id="paymentSection">
    		<div id="paymentNumber">
    			<div id="daegi">대기번호</div>
    			${param.seq%100}
    			<input type="hidden" value="${param.seq}" id="seq">
    		</div>
	   		<span id="name" style="font-weight: bold;"></span>님 주문
	   		<div id="itemSection">
	   		</div>
	   		<div id="resultSection">
	   			<div id="totalSection">합계 <span id="total"></span>원</div>
	   			<div id="pointSection">
	   				<div>-&nbsp;<span id="pointUsed"></span>포인트 사용</div>
	   				<div>+&nbsp;<span id="point"></span>포인트 적립</div>
	   			</div>
	   			<div style="clear:both;"></div>
	   		</div>
   		</div>
   		<div style="text-align: center;">
   			<button class="maingo" onclick="location.href='/miniProject'">나가기</button>
   		</div>
    </main>
    <input type="hidden" id="userId" value="${sessionScope.memMemberDTO.id}">
    <h2 id="wrong" style="font-weight: bold;text-align: center;display: none;">잘못된 접근입니다</h2>
    <footer>
       <jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
    </footer>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/miniProject/js/orderComplete.js"></script>
</body>
</html>