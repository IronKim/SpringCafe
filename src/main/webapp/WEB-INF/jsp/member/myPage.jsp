<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<style type="text/css">
table {
	border-collapse: collapse;
}
th{
  border-bottom: 1px solid #444444;
  background-color: #265B3D;
  color : white;
  padding: 10px;
  text-align: left;
  border-top-left-radius:10px;
  border-top-right-radius:10px;
  margin: auto;
}
td {
	border-bottom: 3px solid #265B3D;
}
#grade{
	width: 940px;
	margin: auto;
	frame: hsides; 
	rules: rows;
	min-height: 400px;
}
#update{
	float: right;
	text-decoration: none;
	color:black;
	border: 1.5px solid black;
	padding: 7px 30px;
	border-radius: 8px;
	background-color: white;
	transition: 0.5s;
}
#update:hover{
	background-color: black;
	color: white;
}
#payList{
	max-height: 400px;
	overflow: scroll;
	overflow-x: hidden;
	border-top: 3px solid #265B3D;
	border-bottom: 3px solid #265B3D;
}
#payList::-webkit-scrollbar {
   width:7px;
}
#payList::-webkit-scrollbar-track {
    background-color: white;
}
#payList::-webkit-scrollbar-thumb {
    background-color: #265B3D;
    border-radius: 7px;
}
.payItem{
	cursor: pointer;
	background-color: whitesmoke;
	border-bottom: 2px solid lightgray;
	padding: 15px 10px;
}
.payPoint{
	margin-top: 2px;
	font-size: 13px;
	color: gray;
}
.payName{
	margin-top: 2px;
	font-size: 18px;
	font-weight: bold;
}
.payNum{
	font-size: 13px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${sessionScope.memMemberDTO != null}">
<div id="grade">
<div style="margin: 20px 10px">
	<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > MyPage
	<h1 style="margin-top: 10px;">마이페이지</h1>
</div>
 	<table>
        <tr>
			<th width="940px" height="30px"><span style="font-size: 30px;">
			<b>${sessionScope.memMemberDTO.name }</b>님 반갑습니다:)</span><a id="update" href="pwdCheck">정보 수정</a>
				<input type="hidden" id="name" value="${sessionScope.memMemberDTO.name }" />
				<input type="hidden" id="id" value="${sessionScope.memMemberDTO.id }" />
			</th>
        </tr>
      
        <tr>
			<td height="60px"> 
				누적 포인트는 ${sessionScope.memMemberDTO.point}P 이고 현재 등급은 <b><span id="gradeT"></span></b>입니다<br>
				<font size="2" color="gray">잔여 포인트 : ${sessionScope.memMemberDTO.point - sessionScope.memMemberDTO.pointUsed}P</font>
				<input type="hidden" id="userPoint" value="${sessionScope.memMemberDTO.point}" />
			</td>
       </tr>
	</table>
	<h2 style="margin:15px;text-align: center;">주문내역</h2>
	<div id="payList">
	</div>
</div>
</c:if>
 <c:if test="${sessionScope.memMemberDTO == null}">
   	<script type="text/javascript">
   		window.onload=location.href='/miniProject/member/loginForm'
   	</script>
</c:if>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/miniProject/js/myPage.js"></script>
</body>
</html>