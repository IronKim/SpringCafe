<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cafe Spring</title>
<link rel="icon" href="./image/icon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
		crossorigin="anonymous">
<style>

.main{
	width:940px;
	margin: 0 auto;
}
.slideItem{
	width:100%;
}
/**************************추천푸드 시작  ********************/
.first {
	margin-top: 40px;
	margin-bottom: 20px;
	height: 240px;
	position:relative;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}
#itemRandom {
	width: 100%;
}
.item {
	text-align: center;
	border: 1px solid lightgray;
	border-radius: 5px;
	float: left;
	width: 16%;
	margin: 2%;
	transition: 0.7s;	
	cursor: pointer;
}
.item:hover{
	background-color: whitesmoke;
}
.item img {
	height:100px;
	width:100px;
	object-fit:contain;
}
.itemName {
	font-size: 13px;
	font-weight: bold;
	margin: 10px auto;
	width: 90%;
	white-space: nowrap;
	overflow: hidden;   
	text-overflow: ellipsis;
}
/************************멤버십시작********************/
.second{
	position:relative;
	height: 152px;
	background-color: lightgray;
}
.second div{
	position: absolute;
	background-color: #141414;
	float: left;
	width: 466px;
	height: 152px;
}

/***********************이벤트칸 시작'********************/
.third{
	height: 200px;
	position:relative;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	margin-top: 20px;
}
a{
	text-decoration: none;
	color: black;
} 
.searchSubmit {
	margin-bottom: 5px;
	padding:2px 5px;
}
.carousel-item{
	cursor: pointer;
}
/* 게시판 */
#boardSection {
	float:left;
	padding:5px;
	margin:10px;
	height:180px;
	width:350px;
}
#noticeSection {
	float:left;
	padding:5px;
	margin:10px;
	height:180px;
	width:350px;
	border-left: 1px solid gray;
}
#boardTop {
	margin:0;
	font-size:16px;
	font-weight: bold;
	height: 30px;
	border-bottom: 1px solid lightgray;
}
#boardTop img{
	margin-bottom: 3px;
}
#boardTop a{
	color: lightgray;
	float: right;
	font-size:12px;
}
#noticeTop {
	margin:0;
	font-size:16px;
	font-weight: bold;
	height: 30px;
	border-bottom: 1px solid lightgray;
}
#noticeTop a{
	color: lightgray;
	float: right;
	font-size:12px;
}
#noticeTop img{
	margin-bottom: 3px;
}
#boardList {
	padding: 10px;
	padding-top: 0px;
	width:100%;
}
#noticeList {
	padding: 10px;
	padding-top: 0px;
	width:100%;
}
.boardItem {
	font-size:13px;
	padding:3px;
	height:27px; 
	width: 100%;
	border-bottom: 1px solid lightgray;
	cursor: pointer;
}
.boardItem:hover .boardItemSubject{
	text-decoration: underline;
}
.boardItemWriter {
	float:right;
	color: gray;
	font-weight: bold;
	width:30%;
	white-space: nowrap;
	overflow: hidden;   
	text-overflow: ellipsis;
}
.boardItemSubject {
	width:70%;
	white-space: nowrap;
	overflow: hidden;   
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
	<!--  -->
	<div class="slideItem">
<!-- ------------------------------------------슬라이드 시작---------------------------------------------------------------------- -->
	<div id="carouselExampleIndicators" class="carousel slide">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active" onclick="location.href='/miniProject/menu/menuForm#beverage'">
	      <img src="https://admin.hollys.co.kr/upload/main/banner/mainBanner_202309181002459770.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" onclick="location.href='/miniProject/menu/menuForm#dessert'">
	      <img src="https://admin.hollys.co.kr/upload/main/banner/mainBanner_202308300525586070.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" onclick="location.href='/miniProject/menu/menuForm#beverage'">
	      <img src="https://admin.hollys.co.kr/upload/main/banner/mainBanner_202308300526459490.jpg" class="d-block w-100" alt="...">
	    </div>
	    <div class="carousel-item" onclick="location.href='/miniProject/menu/menuForm#Coffee'">
	      <img src="https://admin.hollys.co.kr/upload/main/banner/mainBanner_202306200519374970.jpg" class="d-block w-100" alt="...">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>
<!-- -------------------------------------------슬라이드 끝-------------------------------------------------------- -->
<!-- ----------------------------------------------모음집 시작 -------------------------------------------------------------->
<div class="main">
		<!-- -------------몸통 안에 첫번째 그룹------------------- -->
<div class="first">
	<h3 style="font-size: 25px; color:#265B3D;font-weight:bold;">SPRING Mall</h3>
	<div style="font-size: 13px; color:grey">스프링 카페의 다양한 상품들을 만나보세요</div>
	<div id="itemRandom"></div>
</div>
<br>
		<!-- -------------몸통 안에 두번째 그룹------------------- -->
<div class="second">
		<div id="membership" style="background-position: center;background-size: cover; background-image: url('./image/membershipBanner.png');
		cursor:pointer;" onclick="location.href='/miniProject/membership/membership'">
		<span style="margin-left:5px; margin-top:5px;font-weight:bold;color:white;font-size: 20px;">멤버십</span>
		<br>
		<span style="margin-left:15px; margin-top:20px;font-weight:bold;color:white;font-size: 12px;">스프링 카페의 멤버십으로</span><br>
		<span style="margin-left:15px; margin-top:20px;font-weight:bold;color:white;font-size: 12px;">다양한 혜택을 누려보세요</span>
		</div>
		<div id="map" style="margin-left:470px;background-image: url('./image/cafeSearch.png');width:50%;background-size: cover;">
			<li style="margin-left:5px; font-weight:bold;color:white;list-style: none;font-size: 20px;">매장 찾기</li>
		<form id="searchForm" method="post" action="/miniProject/store/storeSearch" style="margin:5px 20px;">
	        <input class="search" name="name" type="search" placeholder="매장 이름 검색"
	        	 style="width:150px;">
	        <button class="btn btn-success searchSubmit" type="submit">Search</button>
	        <button style="width:100%; height: 80px;opacity: 0;" onclick="location.href='/miniProject/store/storeSearch'"></button>
      	</form>
		</div>
</div>
<br>
		<!-- --------------몸통 안에 세번째 그룹------------------ -->
<div class="third">
		<div id="boardSection">
			<div id="boardTop"><img src="./image/board.png" width="17">&nbsp;&nbsp;BOARD
			<a href="/miniProject/board/boardList">more</a></div>
			<div id="boardList"></div>
		</div>
		
		<div id="noticeSection">
			<div id="noticeTop"><img src="./image/notice.png" width="17">&nbsp;&nbsp;NOTICE
			<a href="/miniProject/board/boardList?id=200">more</a></div>
			<div id="noticeList"></div>
		</div>
		
		<img src="./image/mainChat.png" id="mainChat" width="120px" 
		style="margin:40px;cursor: pointer;float:left;" onclick="location.href='/miniProject/chat/chat'">
</div>
<!-- ----------------------------------------------모음집 끝 -------------------------------------------------------------->
</div>
	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="./js/index.js"></script>
</html>