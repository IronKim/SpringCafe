<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/writeForm.css"/>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${param.auth == 1}">
<form id="memberWriteForm">
	<div>
	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > Register
			<h1 style="margin-top: 10px;">회원가입</h1>
		</div>
	</div>
	<table border="1" style="width:750px" frame="hsides" rules="rows">
		<tr>
			<th width="100">이름</th>
			<td width="650">
				<input type="text" name="name" id="name" placeholder="이름 입력">
				<div id="nameDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" id="id" size="30" placeholder="아이디 입력"
					oninput="checkId()">
				<span class="id_ok" style="color: green; display: none;">사용 가능한 아이디입니다.</span>
				<span class="id_no" style="color: red; display: none;">중복된 아이디입니다.</span>
				<!-- <input type="button" value="중복체크" onclick="checkId()">
				<input type="text" id="sw"> -->
				<!-- <button id="checkId" type="button">중복확인</button><br> -->
				<div id="idDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pwd" id="pwd" size="40">
				<div id="pwdDiv" style="color:red;"></div>
			</td>
		</tr>
		
		<tr>
			<th>재확인</th>
			<td>
				<input type="password" id="repwd" size="40">
			</td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="user_email" value="${email1}" required> @ <input type="text" id="email_address" value="${email2}">
					<select id="user_email_address">
						<option id="option" value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>
				<input type="hidden" id="totalemail" name="email" value="">
				<div id="emailDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>휴대폰</th>
			<td>
				<input type="tel" name="phoneNumber1" id="phoneNumber1" value="${tel1 }" maxlength="3" style="width: 85px;">-
				<input type="tel" name="phoneNumber2" id="phoneNumber2" value="${tel2 }" maxlength="4" style="width: 85px;">-
				<input type="tel" name="phoneNumber3" id="phoneNumber3" value="${tel3 }" maxlength="4" style="width: 85px;">
				<input type="hidden" id="phoneNumber" name="phoneNumber" value="">
				<div id="phoneNumberDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="address" id="address" style="width: 295px" readonly>
				<input type="button" value="우편번호검색" id="checkPostBtn" class="btn"><br>
				<div id="addressDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th colspan="2">
				<button type="button" id="writeBtn" class="btn">회원가입</button>
				<button type="reset" id="resetBtn" class="btn">다시작성</button>
			</th>
		</tr>
	</table>
	</div>


		<script type="text/javascript"
			src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="../js/checkId_AJax.js"></script>
		<script type="text/javascript">
			$(function() {
				//유효성검사
				$('#writeBtn').click(function() {
					$('#nameDiv').empty();
					$('#idDiv').empty();
					$('#pwdDiv').empty();
					$('#emailDiv').empty();
					$('#phoneNumberDiv').empty();
					$('#addressDiv').empty();

					if ($('#name').val() == '') {
						$('#nameDiv').text('이름을 입력하세요.');
						$('#name').focus();

					} else if ($('#id').val() == '') {
						$('#idDiv').text('아이디를 입력하세요.');
						$('#id').focus();

					} else if ($('#pwd').val() == '') {
						$('#pwdDiv').text('비밀번호를 입력하세요.');
						$('#pwd').focus();

					} else if ($('#pwd').val() != $('#repwd').val()) {
						$('#pwdDiv').text('비밀번호가 맞지 않습니다.');
						$('#repwd').focus();
					} else if ($('#user_email').val() == '') {
						$('#emailDiv').text('이메일을 입력하세요.');
						$('#user_email').focus();

					} else if ($('#email_address').val() == '') {
						$('#emailDiv').text('이메일을 입력하세요.');
						$('#email_address').focus();

					} else if ($('#phoneNumber1').val() == '') {
						$('#phoneNumberDiv').text('전화번호를 입력하세요.');
						$('#phoneNumber1').focus();

					} else if ($('#phoneNumber2').val() == '') {
						$('#phoneNumberDiv').text('전화번호를 입력하세요.');
						$('#phoneNumber2').focus();

					} else if ($('#phoneNumber3').val() == '') {
						$('#phoneNumberDiv').text('전화번호를 입력하세요.');
						$('#phoneNumber3').focus();

					} else if ($('#address').val() == '') {
						$('#addressDiv').text('주소를 입력하세요.');
						$('#address').focus();

					} else {
						$('#totalemail').val($('#user_email').val() + '@' + $('#email_address').val());
						$('#phoneNumber').val(tel1 + '-' + tel2 + '-' + tel3);
						console.log($("#totalemail").val());
						console.log($("#phoneNumber").val());
						
						
						/* 회원가입 완료 */
						$.ajax({
							type: 'post',
							url: '/miniProject/member/write',
							data: $('#memberWriteForm').serialize(), //변수=값&변수=값
							success: function(){
								alert('회원가입 완료');
								location.href = '/miniProject/member/loginForm'
							}, 
							error: function(e){
								console.log(e);
							}
						});
					}
				});
				
				//주소
				$('#checkPostBtn').click(function() {
					new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('address').value = addr;
						}
					}).open();
					return false;
				});
				//이메일 합치기
				var email1;
				var email2;
				$('#user_email_address').change(function() {
					var user_email_address = $('#user_email_address').val();
					$('#email_address').val(user_email_address);
					email2 = $('#user_email_address').val();
					
					if (user_email_address == '직접입력') {
						$('#email_address').val('');
					}//if
				});
				$("#user_email").blur(function() {
					email1 = $("#user_email").val();
				});
				//번호 합치기
				var tel1;
				var tel2;
				var tel3
				$("#phoneNumber1").blur(function() {
					tel1 = $("#phoneNumber1").val();
				});
				$("#phoneNumber2").blur(function() {
					tel2 = $("#phoneNumber2").val();
				});
				$("#phoneNumber3").blur(function() {
					tel3 = $("#phoneNumber3").val();
				});
			});
		</script>
	</form>
	</c:if>
	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
</body>
</html>















