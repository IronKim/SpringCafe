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
#check {
	border-bottom: 1px solid #444444;
	background-color: #265B3D;
	color : white;
	padding: 10px;
	text-align: left;
	margin: auto;

}
#pwdCheck div {
	font-size: 8pt;
	font-weight: bold;
	color: red;

}
main {
	width: 940px;
	margin: 0 auto;
	min-height: 400px;
}
.btn{
	font-weight: bold;
	margin: 0 4px;
	cursor: pointer;
	text-decoration: none;
	color:#265B3D;
	border: 1.5px solid #265B3D;
	padding: 7px 30px;
	border-radius: 5px;
	background-color: white;
	transition: 0.5s;
}
.btn:hover{
	background-color: #265B3D;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${sessionScope.memMemberDTO != null}">
<main>
<div style="width:940px;margin: 0 auto;">
	<div style="margin: 20px 10px">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > MyPage
		<h1 style="margin-top: 10px;">마이페이지</h1>
	</div>
</div>
<form id="pwdCheck">
		<table>
      
        <tr id="check">
     	     <th width="940px" height="40px">본인 확인을 위해 비밀번호를 입력해주세요.</th>
        </tr>
		<tr>
			<td height="60px">비밀번호&nbsp;&nbsp;&nbsp;<input type="password" name="pwd" id="pwd">
				&nbsp;<input type="button" value="정보 수정" id="updateBtn" class="btn">
			</td>
		</tr>
	</table>
</form>
</main>
</c:if>
<c:if test="${sessionScope.memMemberDTO == null}">
   	<script type="text/javascript">
   		window.onload=location.href='/miniProject/member/loginForm'
   	</script>
</c:if>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/pwdCheck.js"></script>

<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>


</body>
</html>