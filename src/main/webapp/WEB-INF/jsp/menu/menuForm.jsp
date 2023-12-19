<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/menuSideBar.css"/>
<link rel="stylesheet" href="/miniProject/css/animation.css">
<style type="text/css">
main{
	margin: 0 auto;
	width:940px;
}
.price {
	clear: both;
}
.order {
	border:0;
	background-color: whitesmoke;
	border-radius: 5px;
	margin: 4% 5%;
	transition: 0.7s;
}
.order:hover {
	background-color: #265B3D;
	color: white;
}
.inb {
	vertical-align: top;
	margin:4% 2%;
	width:20%;
	display: inline-block;
}
.items {
	overflow:hidden;
	transition: 0.7s ease-in-out; 
	min-height: 240px;
	cursor: pointer;
} 
.itemName {
	font-size: 18px;
	margin:0 auto;
	width: 90%;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow:hidden;
}
.content {
	padding: 10% 5%;
	display: none;
	font-size: 14px
}
.content .itemName{
	font-size: 16px;
	font-weight: bold;
}
.content .itemText{
	font-size: 13px;
	margin-top: 10px;
	text-align: left;
}
.info{
	margin:4% 0;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
 	  rel="stylesheet" 
 	  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
 	  crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<aside class="side-bar">
	<section class="side-bar__icon-box">
		<section class="side-bar__icon-1">
			<div></div>
			<div></div>
			<div></div>
		</section>
	</section>
	<ul>
		<li>
			<a href="#Coffee" style="text-decoration-line: none;">Coffee☕</a>
		</li>
		<li>
			<a href="#beverage" style="text-decoration-line: none;">beverage 🍹</a>
		</li>
		<li>
			<a href="#dessert" style="text-decoration-line: none;">dessert 🥐</a>
		</li>
		<li>
			<a href="#MD" style="text-decoration-line: none;">MD 🍶</a>
		</li>
	</ul>
</aside>

<!-- -------------------------------------- 커피 -------------------------------------- -->
<main>
<div style="margin: 20px 10px 80px 10px">
	<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Menu
	<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">메뉴</h1>
</div>
<div class="container text-center" style="margin: 0 0 30px 0;">
	<div align="left" id="Coffee">
		<h4>Coffee ☕</h4>
	</div>
	 <c:forEach items="${menu }" var="item">
		<c:if test="${item.id == 100}">
		<div class="inb">
			<div class="card items">
				<input type="hidden" class="sw" value="0">
				<input type="hidden" value="${item.seq }" class="menuSeq">
				<div class="info">
				  	<img src=" ${item.image} " class="card-img-top" alt="...">
					<div class="itemName">${item.name}</div>	
					<span class="price">${item.price}원<input type="button" class="order" value="주문"></span>
				</div>
				<div class="content">
					<div class="itemName">${item.name}</div>
					<p class="card-text itemText">${item.content}</p>
					<span class="price">${item.price}원<input type="button" class="order" value="주문하기"></span>
				</div>
		  </div>
		  </div>
		</c:if>
	</c:forEach>		
</div>
<!-- --------------------------------------음료-------------------------------------- -->

<div class="container text-center" style="margin: 0 0 30px 0;">
<div align="left" id="beverage"><h4>beverage 🍹</h4></div>
	 <c:forEach items="${menu }" var="item">
		<c:if test="${item.id == 300}">
		<div class="inb">
			<div class="card items">
				<input type="hidden" class="sw" value="0">
				<input type="hidden" value="${item.seq }" class="menuSeq">
				<div class="info">
				  	<img src=" ${item.image} " class="card-img-top" alt="...">
					<div class="itemName">${item.name}</div>	
					<span class="price">${item.price}원<input type="button" class="order" value="주문"></span>
				</div>
				<div class="content">
					<div class="itemName">${item.name}</div>
					<p class="card-text itemText">${item.content}</p>
					<span class="price">${item.price}원<input type="button" class="order" value="주문하기"></span>
				</div>
		  </div>
		  </div>
		</c:if>
	</c:forEach>		
</div>

<!-- ------------------------------------- 디저트 -------------------------------------- -->

<div class="container text-center" style="margin: 0 0 30px 0;">
<div align="left" id="dessert"><h4>dessert 🥐</h4></div>
	 <c:forEach items="${menu }" var="item">
		<c:if test="${item.id == 200}">
		<div class="inb">
			<div class="card items">
				<input type="hidden" class="sw" value="0">
				<input type="hidden" value="${item.seq }" class="menuSeq">
				<div class="info">
				  	<img src=" ${item.image} " class="card-img-top" alt="...">
					<div class="itemName">${item.name}</div>	
					<span class="price">${item.price}원<input type="button" class="order" value="주문"></span>
				</div>
				<div class="content">
					<div class="itemName">${item.name}</div>
					<p class="card-text itemText">${item.content}</p>
					<span class="price">${item.price}원<input type="button" class="order" value="주문하기"></span>
				</div>
		  </div>
		  </div>
		</c:if>
	</c:forEach>	
</div>

<!-- ------------------------------------- MD -------------------------------------- -->

<div class="container text-center">
<div align="left" id="MD"><h4>MD 🍶</h4></div>
	 <c:forEach items="${menu }" var="item">
		<c:if test="${item.id == 400}">
		<div class="inb">
			<div class="card items">
				<input type="hidden" class="sw" value="0">
				<input type="hidden" value="${item.seq }" class="menuSeq">
				<div class="info">
				  	<img src=" ${item.image} " class="card-img-top" alt="...">
					<div class="itemName">${item.name}</div>	
					<span class="price">${item.price}원<input type="button" class="order" value="주문"></span>
				</div>
				<div class="content">
					<div class="itemName">${item.name}</div>
					<p class="card-text itemText">${item.content}</p>
					<span class="price">${item.price}원<input type="button" class="order" value="주문하기"></span>
				</div>
		  </div>
		  </div>
		</c:if>
	</c:forEach>			
</div>
</main>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
var sw = 0;
$('.order').click(function(){
	sw = 1;
	location.href="/miniProject/order/order?seq="+$(this).parents('.items').find('.menuSeq').val();
});
$('main').on('click','.items',function(){
if (sw == 0) {
	if ($(this).find('.sw').val() == 0) {
		$(this).find('.sw').val('2');
		$(this).css('animation','rollleft 1.5s')
		$(this).find('.info').css('animation','fadeout 0.4s forwards')
		setTimeout(() => {
			$(this).find('.info').css('display','none')
			$(this).find('.content').css('display','block')
			$(this).find('.content').css('animation','fadein 1s ease-in-out')
			$(this).find('.itemName').css('white-space','normal')
			setTimeout(() => {
				$(this).find('.sw').val('1');
	    	},790 );
    	},490 );
	} else if ($(this).find('.sw').val() == 1) {
		$(this).find('.sw').val('2');
		$(this).css('animation','rollright 1.5s')
		$(this).find('.content').css('animation','fadeout 0.4s forwards')
		setTimeout(() => {
			$(this).find('.content').css('display','none')
			$(this).find('.info').css('display','block')
			$(this).find('.info').css('animation','fadein 1s ease-in-out')
			$(this).find('.itemName').css('white-space','nowrap')
			setTimeout(() => {
				$(this).find('.sw').val('0');
	    	},790 );
    	},490 );
	}
} else sw = 0;
})
</script>
</body>
</html>