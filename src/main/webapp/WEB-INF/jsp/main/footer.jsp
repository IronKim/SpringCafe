<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/miniProject/css/animation.css">
<link rel="stylesheet" href="/miniProject/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
 	  rel="stylesheet" 
 	  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
 	  crossorigin="anonymous"> -->
</head>
<body>
<div class="footer">
	<div class="inner_footer">
	
		<a href="/miniProject/board/boardView?seq=51&pg=1&id=200"><b>개인정보처리방침</b></a>
		|
		<a href="/miniProject/board/boardView?seq=52&pg=1&id=200">서비스이용약관</a>
		|
		<a href="/miniProject/board/boardView?seq=53&pg=1&id=200">멤버십이용약관</a>
		|
		<a href="/miniProject/board/boardView?seq=54&pg=1&id=200">스프링카드이용약관</a>
		|
		<a href="/miniProject/board/boardView?seq=55&pg=1&id=200">BI 소개</a>
		
		<p>
		법인명: (주) 스프링에프앤비 대표자: 김재철 사업자등록번호 123-12-34567 통신판매업: 제2019-서울종로-0193호 
		<br>
		주소 : 서울특별시 중구 통일로 92, 9층(순화동, 케이지타워) 대표전화 : 02-1234-1234 (가맹문의 : 02-4321-4321)
		</p>
		
		<p >COPYRIGHT (C) KG SPRING F&amp;B. All Rights Reserved.</p>
		
		<div OnClick="location.href ='';" style="margin-left:790px; 
		background-image: url('/miniProject/image/instagram.png');"></div>
		
		<div OnClick="location.href ='';" style="margin-left:840px; 
		background-image: url('/miniProject/image/twitter.png');"></div>
		
		<div OnClick="location.href ='';" style="margin-left:890px; 
		background-image: url('/miniProject/image/facebook.png');"></div>
	</div>
	<div id="chatWindow">
		<section id="topSectionM">
			<button id="outChatM">
				<img src="/miniProject/image/outChat.png">
			</button>
			<button id="closeChatM">
				<img src="/miniProject/image/closeChat.png">
			</button>
    	</section>
    	<div style="clear:both"></div>
		<section id="writeSectionM">
    		<div id="refreshSectionM">
	    		<button id="resetM">
	    			<img src="/miniProject/image/refresh.png" id="refresh">
	    		</button>
	    		<div id="reDivM">실시간 채팅 활성화</div>
    		</div>
    		<form id="chatFormM">
    			<input type="button" id="submitM" value="전송">
    			<textarea name="content" id="contentM"></textarea>
    			<input type="hidden" name="name" id="nameM" value="${sessionScope.memMemberDTO.name}">
    			<input type="hidden" name="userSeq" id="seqM" value="${sessionScope.memMemberDTO.seq}">
    			<div id="chatDivM"></div>
    		</form>
    	</section>
    	<div style="clear:both"></div>
    	<section id="messageSectionM">
    	</section>
	</div>
	<!-- 상단 이동 화살표 -->
	<button id="scrollToTopBtn" onclick="scrollToTop()">
		<i class="fas fa-arrow-up"><br>Top</i>
	</button>
	<c:if test="${sessionScope.memMemberDTO != null}">
		<button id="chatBtn">
			<img src="/miniProject/image/chat.png"><div>Chat</div>
		</button>
	</c:if>
	<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="/miniProject/js/footer.js"></script>
</div>

</html>