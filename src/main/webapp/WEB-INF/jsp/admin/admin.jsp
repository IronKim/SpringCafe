<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" href="/miniProject/css/admin.css"/>
</head>
<body>
<!-- 세션 id가 관리자여야 화면이 보이게 설정 -->
<c:if test="${sessionScope.memMemberDTO.id == 'a'}"> <!-- admin으로 변경 -->
<div>
	<button onclick="location.href='/miniProject'">main</button>
	<button style="float:right" id="token">카카오 Token</button>
	<h1>관리자</h1>
</div>

<hr/>

<main>
	<!-- 맴버 관리자 -->
	<section id="memberSection">
		<form action="" id="memberForm">
			<table class="allTable" border="1">
				<tr height="20" align="center">
					<td width="50">선택</td>
					<td width="100">이름</td>
					<td width="130">아이디(자세히)</td>
					<td width="120">가용 포인트</td>
				</tr>
			</table>
			<div id="memberListScroll">
				<table class="allTable" border="1" id="memberList">
				</table>
			</div>
			<input style="float: right" type="button" value="삭제" id="memberDelete">
			<input style="float: left" type="search" id="memberSearch" placeholder="아이디 검색">
			<div style="clear: both;"></div>
		</form>
	</section>
	
	<!-- 메뉴 관리자 -->
	
	<section id="menuSection">
		<form action="" id="menuForm">
			<table class="allTable" border="1">
				<tr height="20" align="center">
					<td width="50">선택</td>
					<td width="80">분류코드</td>
					<td width="150">메뉴이름(자세히)</td>
					<td width="120">가격</td>
				</tr>
			</table>
			<div id="menuListScroll">
				<table class="allTable" border="1" id="menuList">
				</table>
			</div>
			<input style="float: right" type="button" value="삭제" id="menuDelete">
			<input style="float: left" type="search" id="menuSearch" placeholder="이름 검색">
			<div style="clear: both;"></div>
		</form>
		<form id="menuAdd">
			<div>
				제품 분류(코드) : 
				<select name="id" id="menuId">
					<option value="100" selected>Coffee</option>
					<option value="200">dessert</option>
					<option value="300">smoody/juice</option>
					<option value="400">MD</option>
					<option value="500">chocolate and tea</option>
				</select>
			</div>
			<div>
				제품 이름 : <input type="text" name="name" id="menuNam"> 
			</div>
			<div>
				제품 가격 : <input type="text" name="price" id="menuPrice"> 
			</div>
			<div>
				이미지 링크 : <input type="text" name="image" id="imageLink"> 
			</div>
			<div>
				제품 설명 : <br>
				<textarea style="resize: none;" rows="5" cols="45" name="content" id="menuContent"></textarea>
				<img alt="제품 이미지" id="imgThumb" src="/miniProject/image/no-image.jpg" onerror="/miniProject/image/no-image.jpg">
			</div>
			<input type="button" value="등록" id="menuSubmit">
			<input type="reset" value="초기화">
		</form>
	</section>
	
<!-- 매장 관리자 -->
	
	<section id="storeSection">
		<form action="" id="storeForm">
			<table class="allTable" border="1">
				<tr height="20" align="center">
					<td width="50">선택</td>
					<td width="130">이름</td>
					<td width="80" style="font-size: 12px">장소(자세히)</td>
					<td width="140">전화번호</td>
				</tr>
			</table>
			<div id="storeListScroll">
				<table class="allTable" border="1" id="storeList">
				</table>
			</div>
			<input style="float: right" type="button" value="삭제" id="storeDelete">
			<input style="float: left" type="search" id="storeSearch" placeholder="이름 검색">
			<div style="clear: both;"></div>
		</form>
		<form id="storeAdd">
			<div>
				매장 위치(시/도) : 
				<select name="region" id="storeRegion">
					<option value="서울" selected>서울</option>
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
			</div>
			<div>
				매장 이름 : <input type="text" name="name" id="storeNam"> 
			</div>
			<div>
				전화 번호 : <input type="tel" name="tel" id="storeTel"> 
			</div>
			<div>
				매장 주소 : <input type="text" name="address" id="storeAddress" readonly="readonly">
				<button id="postSearch">찾기</button>
			</div>
			<input type="button" value="등록" id="storeSubmit">
			<input type="reset" value="초기화">
		</form>
	</section>
	
	<!-- 주문 목록 관리자 -->
	<section id="paySection">
		<form action="" id="payForm">
			<table class="allTable" border="1">
				<tr height="20" align="center">
					<td width="70">주문번호</td>
					<td width="100">매장</td>
					<td width="130">아이디(자세히)</td>
					<td width="100">금액</td>
				</tr>
			</table>
			<div id="payListScroll">
				<table class="allTable" border="1" id="payList">
				</table>
			</div>
			<input style="float: left" type="search" id="paySearch" placeholder="아이디 검색">
			<div style="clear: both;"></div>
		</form>
	</section>
</main>
<div style="height: 100px;"></div>
</c:if>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/miniProject/js/admin.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/miniProject/js/post.js"></script>
</body>
</html>