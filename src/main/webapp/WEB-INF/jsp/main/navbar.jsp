<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
.navnavbar{
	width:940px;
	margin:0 auto;
	margin-top: 20px;
	position:relative;
	top: 0;
	z-index: 100;
}
#navbar{
	font:bold 16px;
	background-color:white;
	width:940px;
	height:60px;
	margin:0 auto;
	line-height: 60px; 
}
#navbar div{
	position: absolute;
	font-weight: bold;
	text-align: center;
	width:180px;
	height:60px;
	float:left;
}
#navbar ul{
	list-style: none;
	padding: 0;
	float:left;
	width:180px;
	position:relative;
	margin: 0;
}
#navbar li{
	list-style: none;
	padding: 0;
	width:180px;
	position:relative;
	}
#navbar a {
	text-decoration: none;
	color:black;
	}
#navbar div li ul a{
	color:white;
}
#navbar div li ul{
	margin-top: 1px;
	font-weight: bold;
	background-color: #265B3D;
	height:0;
	opacity:0.8;
	position: absolute;
	transition: 0.7s;
	overflow: hidden;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}
#navbar div li:hover ul{
	height: 400%;
	opacity : 1;
	
}
#navbar div li {
	transition: 0.5s;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	color:black;
}
#navbar div li:hover{
	background-color: #265B3D;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	opacity : 0.85;
}
#navbar div li ul li{
	transition: 0.3s;
}

#navbar div li ul li:hover{
	transform: scale(1.05);
}
#navline {
	border-bottom: solid 3px #265B3D;
}
/* 메뉴 항목 아래에 그림자 효과 추가 */
#navbar div :hover ul{
	box-shadow: 0 5px 5px 3px rgba(50, 50, 50, 0.5); 
}
</style>
</head>
<body>
<div class="navnavbar">
	<div id="navbar">
		<div class="menu1">
	 		<li><a href="/miniProject/menu/menuForm">Menu</a>
	          <ul>
	            <li><a href="/miniProject/menu/menuForm#coffee">COFFEE</a></li>
	            <li><a href="/miniProject/menu/menuForm#beverage"">BEVERAGE</a></li>
	            <li><a href="/miniProject/menu/menuForm#dessert"">DESSERT</a></li>
	            <li><a href="/miniProject/menu/menuForm#MD"">MD</a></li>
	          </ul>
	        </li>
		</div>	
	
		<div class="menu2" style="margin-left:190px; ">
			<li><a href="/miniProject/membership/membership">Membership</a>
	          <ul>
	            <li><a href="/miniProject/membership/membership">MEMBERSHIP LEVEL</a></li>
	            <li><a href="/miniProject/order/order">SMART ORDER</a></li>
	          </ul>
	        </li>
	    </div>
    
	    <div class="menu3" style="margin-left:380px; ">   
	        <li><a href="/miniProject/store/storeSearch">MAP</a>
	          <ul>
	            <li><a href="/miniProject/store/storeSearch">SEARCH STORE</a></li>
	          </ul>
	        </li>
		</div>
	
		<div class="menu4" style="margin-left:570px; ">   
	        <li><a href="/miniProject/board/boardList">Community</a>
	          <ul>
	            <li><a href="/miniProject/board/boardList">BOARD</a></li>
	            <li><a href="/miniProject/chat/chat">CHAT</a></li>
	          </ul>
	        </li>
		</div>
		

		<div class="menu5" style="margin-left:760px; ">   
	        <li><a href="/miniProject/about/spring">About Us</a>
	          <ul>
	            <li><a href="/miniProject/about/spring">GREETING</a></li>
	            <li><a href="/miniProject/board/boardList?id=200">NOTICE</a></li>
	          </ul>
	        </li>
		</div>
	</div>
</div>
<div id="navline"></div>
</body>
</html>