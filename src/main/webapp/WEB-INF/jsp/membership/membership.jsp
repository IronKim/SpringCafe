<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/membership.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<div id="membership_h">
	<div style="margin: 20px 10px">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Membership > 멤버십 혜택
		<h1 style="margin-top: 10px;">멤버십 혜택</h1>
	</div>
</div>
<div id="memgrade">
	<div id="gauge">
			<div id="grade">
				<img id="gradeimg" src=""/>
			</div>
			<div id="idid">
		<c:if test= "${sessionScope.memMemberDTO.name !=null}">
				<h1 style="margin-top: 25%;">${sessionScope.memMemberDTO.name }</h1>님의 등급
				<p id="gradeT"></p>
		</c:if>	
		<c:if test= "${sessionScope.memMemberDTO.name ==null}">
				<h1 style="font-size: 14px; margin-top: 45%;">
				<a href="/miniProject/member/loginForm" style="color:lightgray;text-decoration: none;">
				로그인</a>후</h1><h1 style="font-size: 14px;">이용 가능합니다.</h1>
		</c:if>
			</div>
			<input type="hidden" id="userPoint" value="${sessionScope.memMemberDTO.point }" />
		<div id="gradebarcase">
			<div id="gradebar_p"style="color: white;">
		<c:if test= "${sessionScope.memMemberDTO.name !=null}">
				<span id="add"></span>원 추가 구매시 <span id="add_grade"></span>로 등급 업!
		</c:if>
			</div>
			<progress id="gradebar" value="${sessionScope.memMemberDTO.point/10000 }"max="100">
			</progress>
			
			<div style="color: white; font-weight: bold; font-size: 20px; ">
			&nbsp;SILVER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			GOLD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			RED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			DIAMOND
			</div>
		</div>
	</div>
</div>


<div id="membership">
	<div class="grade">
		<div>
			<img src="https://www.hollys.co.kr/websrc/images/membership/img_membership_silver1.png">
			<p style="font-weight: bold; color: silver; margin-top: 0;margin-bottom: 0;">SILVER</p>
			<li>멤버십 회원 가입 시</li><br>
			<li>적립금 5000원 적립시<br>아메리카노 (R) 무료 쿠폰</li><br>
			<li>3만원 이상 자동충전<br>설정 후 발생 시 마다<br>아메리카노 1+1 쿠폰<br>즉시 발행 (1일 1회 한정)</li><br>
			<li>멤버십에 현금영수증<br>등록 후 할리스카드<br>이용시 자동 소득공제</li>
		</div>
		
		<div>
			<img src="https://www.hollys.co.kr/websrc/images/membership/img_membership_gold1.png">
			<p style="font-weight: bold; color: #C5A56C; margin-top: 0;margin-bottom: 0;">GOLD</p>
			<li>적립금 30만원 적립시</li><br>
			<div id="benefit" style="width: 180px; height: 45px; margin-left:10px;background-color: silver;">
			SILVER 혜택 모두 포함</div>
			<li><br></li>
			<li>적립금 5000원 적립시<br>아메리카노 (R) 무료 쿠폰</li><br>
			<li>커피음료 무료 사이즈업<br>또는 샷 / 시럽 무료 추가 중 택 1 (1일 1회 1잔 한정)</li>
		</div>
		
		<div>
			<img src="https://www.hollys.co.kr/websrc/images/membership/img_membership_red1.png">
			<p style="font-weight: bold; color: red; margin-top: 0;margin-bottom: 0;">RED</p>
			<li>적립금 70만원 적립시</li><br>
			<div id="benefit" style="width: 180px; height: 45px; margin-left:10px; background-color: #C5A56C;">
			GOLD 혜택 모두 포함</div>
			<li><br></li>
			<li>적립금 5000원 적립시 제조<br>음료 (R) 무료 쿠폰</li><br>
			<li>생일 축하 미니 케이크<br>무료 쿠폰 증정</li>
		</div>
	</div>
	
	<div id="crown">
		<img src="https://www.hollys.co.kr/websrc/images/membership/img_membership_dia1.png">
	</div>
	<div id="diamond">
			<p style="font-weight: bold; color: black; margin-top: 145px;margin-bottom: 0;">DIAMOND</p>
			<li>연간 구매금액 상위 1%</li><br>
			<div style="font-weight: bold; width: 160px; height: 45px; margin-left:10px; line-height :45px;
						border-top: 1px solid #c5a56c; border-bottom: 1px solid #c5a56c;">
			<span style="color: red;">RED</span> 혜택 모두 포함</div>
			<li><br></li>
			<li>홀케이크 무료 쿠폰 증정<br>(겨울 시즌 출시 기간 개별 알림)</li><br>
			<li>시즌 스페셜 혜택 제공<br>(이벤트 일정에 따라 개별 알림)</li>
	</div>
</div>


<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/miniProject/js/membership.js"></script>

</body>
</html>