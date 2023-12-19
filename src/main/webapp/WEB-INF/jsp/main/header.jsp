<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="/miniProject/css/animation.css">
<link rel="stylesheet" href="/miniProject/css/default.css">
<style type="text/css">


.header{
	margin-top:10px;
	width: 100%;
	height: 150px;
	position:relative;
}
.inner_header{
	width: 940px;
	height: 180px;
	margin: auto;
	position:relative;
}

#logo{
	margin: 0 auto;
}
#user {
	position: absolute;
	right: 50px;
	z-index: 100;
}
#order{
	position:fixed;
	top:10%;
	margin-left:940px;
    z-index:120;
}
#order img{
	width:110px;
	opacity: 0.85;
	transition: 0.7s;
}
#order:hover img{
	width:115px;
	opacity: 1;
	animation: orderIn 1.5s infinite;
}
#user{
	font-size: 13px;
	color: gray;
}
#user a{
	cursor: pointer;
	color: gray;
	text-decoration: none;
}
#logoImg {
	width:172px;
	height:150px;
	display: block;
	margin: 0 auto; 
}
#logoImg:hover {
	cursor: pointer;
}


</style>
</head>
<body>
<div class="header">
<div class="inner_header">
	<!-------------------------------------->
	<div id="user">
	<input type="hidden" value="${n_Token }" id="naverToken">
	<c:if test="${sessionScope.memMemberDTO == null}">
		<a href="/miniProject/member/loginForm">
		로그인
		</a>
		|
		<a href="/miniProject/member/authForm">
		회원가입
		</a>
	</c:if>
	<c:if test="${sessionScope.memMemberDTO != null}">
		<b>${sessionScope.memMemberDTO.name}</b>님 &#8471; ${sessionScope.memMemberDTO.point - sessionScope.memMemberDTO.pointUsed}P | 
		<a id="logoutbtn">
		로그아웃
		</a>
		|
		<c:if test="${sessionScope.memMemberDTO.id != 'a'}"><!-- a를 admin으로 -->
			<a href="/miniProject/member/myPage">
			마이페이지
			</a>
		</c:if>
		<c:if test="${sessionScope.memMemberDTO.id == 'a'}"><!-- a를 admin으로 -->
			<a href="/miniProject/admin/admin">
			<b>관리자</b>
			</a>
		</c:if>
		<!-------------------------------------->
	</c:if>
	</div>
	<!-------------------------------------->
	<div id="logo">
		<img src="/miniProject/image/1.png" id="logoImg" onclick="location.href='/miniProject/'">
	</div>
	<div id="order">
	<a href="/miniProject/order/order">
		<img src="/miniProject/image/order.png">
	</a>
	</div>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
var windowAr = window.location.href.split("/");
if(windowAr[windowAr.length-1].includes("order")||windowAr[windowAr.length-2].includes("order")){
	$('#order').css('display','none');
}
$(function() {
	 $("#logoutbtn").click(function(){
		 	
		 if($('#naverToken').val() != null){
			 naverLogout();
		 }
		 
		 
		 
	        $.ajax({
	            type:"POST",
	            url:"/miniProject/member/logout",
	            success:function(data){
	                location.href="/miniProject/"
	            },
	            error:function(e){
	    		}
	        });
	});
})

 var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	closePopUp();	
}
</script>
</html>