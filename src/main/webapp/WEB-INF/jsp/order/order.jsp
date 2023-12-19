<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/order.css">
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
    <div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Membership > SmartOrder
			<h1 style="margin-top: 10px;">스마트 오더</h1>
		</div>
	</div>
    <!-- 매장 선택 -->
    <div id="mainTop">
    	<div id="storeOpen">
    		매장
    	</div>
    	<section id="leftSectionTop">
    		<div id="map"></div>
    	</section>
    	<section id="rightSectionTop">
    		<div id=searchSection>
	    		<select id="storeSelect">
					<option selected="selected" value="">시/도</option>
					<option value="서울">서울</option>
					<option value="대전">대전</option>
					<option value="세종">세종</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
					<option value="인천">인천</option>
					<option value="강원">강원</option>
					<option value="경기">경기</option>
					<option value="광주">광주</option>
					<option value="전남">전남</option>
					<option value="전북">전북</option>
					<option value="부산">부산</option>
					<option value="경남">경남</option>
					<option value="울산">울산</option>
					<option value="제주">제주</option>
					<option value="대구">대구</option>
					<option value="경북">경북</option>
				</select>
				<input type="search" id="storeSearch">
			</div>
			<div id="storeList"></div>
    	</section>
    </div>
    <!-- 전체 메뉴 -->
    <div id="mainCenter">
    <!-- 메뉴탭 펼치기 버튼 -->
    <div id="menuOpen">
    	메뉴
    </div>
    <!-- 메뉴탭에서 물건 선택해서 날라올시 -->
    <input type="hidden" value="${param.seq}" id="comeSeq">
    <!-- 제품 추가 되는 좌측 면 -->
        <section id="leftSection">
           <div id="cartTopSection">
              장바구니
           </div>
           <div id="cartSection"></div>    
        </section>
    <!-- 제품 표시 되는 우측 면 -->
        <section id="rightSection">
             <div id="tabSection">
            <button class="tab" id="t100">coffee</button> <!-- 구매할 제품 종류를 선택하는 tab -->           
            <button class="tab" id="t200">dessert</button> <!-- 구매할 제품 종류를 선택하는 tab -->           
            <button class="tab" id="t300">smoody/juice</button> <!-- 구매할 제품 종류를 선택하는 tab -->           
            <button class="tab" id="t400">MD</button> <!-- 구매할 제품 종류를 선택하는 tab -->     
         </div>  
         <div id="itemSection"></div>    
        </section>
        <div style="clear: both;"></div>
        <section id="resultSection">
        	<input type="hidden" id="userId" value="${sessionScope.memMemberDTO.id}">
        	<input type="hidden" id="storeValueSeq">
        	<input type="hidden" id="storeValueName">
           	<span style="float:left;font-size:27px;font-weight: bold;">합계 <span id="sum"></span>원</span>
           	<button id="orderSubmit" class="orderBtn">결제하기</button>
           	<button onclick="removeAll()" class="orderBtn">비우기</button>
        </section>
    </div>
    <!-- 결제 방법 -->
    <div id="mainBottom">
    	<div id="payOpen">
    		결제
    	</div>
    <section id="leftSectionBottom">
   		<input type="hidden" value="${sessionScope.memMemberDTO.point - sessionScope.memMemberDTO.pointUsed}" id="userPoint">
   		<div class="payDiv">주문 건&nbsp;&nbsp;&nbsp;&nbsp;
    		<span id="itemPay"></span>
    	</div>
    	<div class="payDiv">총 가격&nbsp;&nbsp;&nbsp;&nbsp;
    		<span id="sumPay"></span>
    	</div>
    	<div class="payDiv"> 포인트&nbsp;&nbsp;&nbsp;&nbsp;
    		<input type="text" size="10" id="pointUsed" value="0">&nbsp;&nbsp;<button id="allUse">전액사용</button>
    		<font size="1" color="red" id="pointFont"></font>	    	
    	</div>
    	<div id="pointHaving">
    		잔여&nbsp;&nbsp;&nbsp;&nbsp;
    		${sessionScope.memMemberDTO.point - sessionScope.memMemberDTO.pointUsed}
    	</div> 
		<div class="payDiv">
			최종가격&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="resultPay"></span>
		</div>
    </section>
    <section id="rightSectionBottom">
    	<div id="paySection">
    		<input type="hidden" id="userEmail" value="${sessionScope.memMemberDTO.email}">
    		<input type="hidden" id="userTel" value="${sessionScope.memMemberDTO.phoneNumber}">
    		<input type="hidden" id="userName" value="${sessionScope.memMemberDTO.name}">
    		<input type="hidden" id="userAdd" value="${sessionScope.memMemberDTO.address}">
    		<div class="pay" id="kaPay">
    			<img alt="kakaoPay" src="/miniProject/image/kakaoPay.png">
    		</div>
    		<div class="pay" id="caPay">
    			<img alt="card" src="/miniProject/image/card.png">
    		</div>
    	</div>
   	 <button id="payBtn" style="margin-top:20px;" class="orderBtn">주문하기</button>
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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appKey=f660b2878058084f6f78ada90c08a455&libraries=services"></script>
<script type="text/javascript" src="/miniProject/js/order.js"></script>
</body>
</html>