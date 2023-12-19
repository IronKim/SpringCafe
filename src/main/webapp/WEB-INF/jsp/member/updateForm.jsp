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
	border: solid lightgray;
	margin: auto; 
	margin-top: 50px;
	margin-bottom: 10%;
	width:940;
	height: 250px;
}
th, td {
    padding: 15px; 10px;
}
#updateForm div {
	font-size: 10pt;
	font-weight: bold;
	color: red;
}
#userId, #pwd, #name, #repwd, #user_email, #email_address,
#phoneNumber1, #phoneNumber2, #phoneNumber3,
#address{
	height: 25px;
	padding: 6px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 200px;
	font-size: 14px;
	cursor: text; /* 입력란 클릭 가능하도록 설정 */
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
#deleteBtn{
	font-weight: bold;
	margin: 0 4px;
	cursor: pointer;
	text-decoration: none;
	color:red;
	border: 1.5px solid red;
	padding: 7px 30px;
	border-radius: 5px;
	background-color: white;
	transition: 0.5s;
}
#deleteBtn:hover{
	background-color: red;
	color: white;
}
#user_email_address{
	height: 25px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 140px;
	font-size: 14px;
	cursor: text; /* 입력란 클릭 가능하도록 설정 */
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${sessionScope.memMemberDTO != null}">
<div style="width:940px;margin: 0 auto;">
	<div style="margin: 20px 10px">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > Update
		<h1 style="margin-top: 10px;">정보수정</h1>
	</div>
</div>
<form id="updateForm">
	<table border="1" style="width:750px" frame="hsides" rules="rows">
		<tr>
			<th width="87">이름</th>
			<td>
				<input type="text" name="name" id="name" placeholder="이름 입력" value="${sessionScope.memMemberDTO.name}"/>
				<div id="nameDiv"></div>
			</td>
		</tr>

		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" readonly="readonly" id="userId" value="${sessionScope.memMemberDTO.id}"/>

			</td>
		</tr>
		<c:if test="${kakaoToken == null && n_Token == null}">
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" size="40"/>
					<div id="pwdDiv" style="color:red;"></div>
				</td>
			</tr>
			
			<tr>
				<th>재확인</th>
				<td>
					<input type="password" id="repwd" size="40"/>
				</td>
			</tr>
		</c:if>
		<c:if test="${kakaoToken != null || n_Token != null}">
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" size="40" readonly="readonly" value="${memMemberDTO.pwd }"/>
					<div id="pwdDiv"></div>
				</td>
			</tr>
			
			<tr>
				<th>재확인</th>
				<td>
					<input type="password" id="repwd" size="40" readonly="readonly" value="${memMemberDTO.pwd }"/>
				</td>
			</tr>
		</c:if>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="user_email" value="${sessionScope.memMemberDTO.email.split('@')[0]}" required>
				@&nbsp;<input type="text" id="email_address" value="${sessionScope.memMemberDTO.email.split('@')[1]}"/>
					<select id="user_email_address">
						<option id="option" value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>
				<input type="hidden" id="totalemail" name="email" value="">
				<input type="hidden" name="seq" value="${sessionScope.memMemberDTO.seq}">
			</td>
		</tr>
		
		<tr>
			<th>휴대폰</th>
			<td>
				<input type="tel" name="phoneNumber1" id="phoneNumber1" maxlength="3" style="width: 85px;" value="${sessionScope.memMemberDTO.phoneNumber.split('-')[0]}">-
				<input type="tel" name="phoneNumber2" id="phoneNumber2" maxlength="4" style="width: 85px;" value="${sessionScope.memMemberDTO.phoneNumber.split('-')[1]}">-
				<input type="tel" name="phoneNumber3" id="phoneNumber3" maxlength="4" style="width: 85px;" value="${sessionScope.memMemberDTO.phoneNumber.split('-')[2]}">
				<input type="hidden" id="phoneNumber" name="phoneNumber" value="">
				<div id="phoneNumberDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="address" id="address" style="width: 295px" value="${sessionScope.memMemberDTO.address}" readonly>
				<input type="button" value="우편번호검색" id="checkPostBtn" class="btn"><br>
				<div id="addressDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<input type="hidden" name="point" value="${sessionScope.memMemberDTO.point}">
				<button type="button" id="updateBtn" class="btn">정보 수정</button>
				<button type="reset" id="resetBtn" class="btn">다시 작성</button>
				<button type="button" id="deleteBtn">탈퇴</button>
			</th>
		</tr>
	</table>
</form>
</c:if>
<c:if test="${sessionScope.memMemberDTO == null}">
   	<script type="text/javascript">
   		window.onload=location.href='/miniProject/member/loginForm'
   	</script>
</c:if>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/update.js"></script>
</body>
</html>