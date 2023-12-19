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
/* 머지 오류 범위 */
table {
	border: solid lightgray;
	margin: 0 auto;
   	border-collapse: collapse;
   	margin-top: 5%;
}

#memberLoginForm div {
   font-weight: bold;
   border-collapse: collapse;
   margin: 20px auto;
}

th, td {
    padding: 20px;
}
/* ========= */
/* -----------------캡챠----------------- */
.center {
	margin: 0 auto;

#table {
    background-color: #fff;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

#captcha {
    font-size: 18px;
    color: black;
    font-weight: bold;
    text-transform: uppercase;
    margin-bottom: 5px;
}

#textBox{
    height: 25px;
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 200px;
    font-size: 14px;
    text-transform: uppercase;
    cursor: text; /* 입력란 클릭 가능하도록 설정 */
}
#id, #pwd{
   height: 25px;
   padding: 6px;
   border: 1px solid #ccc;
   border-radius: 4px;
   width: 200px;
   font-size: 14px;
   cursor: text; /* 입력란 클릭 가능하도록 설정 */
}

#refreshButton {
    height: 15px;
    width: 15px;
    cursor: pointer;
    color: #fff;
    border: 1px;
    border-radius: 25px; /* 버튼을 볼록하게 만듦 */
    margin-right: 10px;
    z-index: 2; /* 버튼들은 캡차 위에 표시되도록 설정 */
}

#output {
    font-size: 14px;
    color: red;
    margin-top: 10px;
}

#captchaBackground {
    /* height: 78px;
    width: 304px; */
    background-color: transparent; /* 배경색 투명으로 변경 */
    border: 1px solid #d3d3d3;
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1); /* 그림자 표시 */
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1; /* 다른 요소 위에 표시되도록 설정 */
}
#confirmDiv, #idDiv, #pwdDiv, #captchaDiv {
    font-size: 14px;
    color: red;
}
#idDiv,#pwdDiv {
	display: none;
	color:red;
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
<c:if test="${sessionScope.memMemberDTO == null}">
<div style="width:940px;margin: 0 auto;">
    <div style="margin: 20px 10px">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Member > Login
		<h1 style="margin-top: 10px;">로그인</h1>
	</div>
</div>
<form id="memberLoginForm" onsubmit="return false">
    <div class="center">
        <div id="loginContainer">
            <table frame="hsides" rules="rows">
                <tr>
                    <th width="100">아이디</th>
                    <td>
                        <input type="text" name="id" id="id" size="30" placeholder="아이디 입력"  autocomplete="off">
                        <div id="idDiv"></div>
                    </td>
                </tr>

                <tr>
                    <th width="100">비밀번호</th>
                    <td>
                        <input type="password" name="pwd" id="pwd" size="40" autocomplete="off">
                        <div id="pwdDiv"></div>
                    </td>
                </tr>

                <!-- 테이블 내에서 캡차 행 추가 -->
                <tr id="captchaRow" style="display: none;">
                    <th width="100">보안 문자</th>
                    <td>
                        <div class="center">
                            <div id="captchaContainer">
                                <span id="captcha"></span> &nbsp; <img id="refreshButton" alt="새로고침" src="https://cdn-icons-png.flaticon.com/512/93/93641.png">
                                <div></div>
                                <input id="textBox" type="text" name="text" placeholder="보안 문자 입력" autocomplete="off">
                                <div id="captchaDiv" style="margin-top: 10px;"></div>
                                <span id="output"></span>
                            </div>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th colspan="2">
                        <button type="button" id="loginBtn" class="btn">로그인</button>
                        <button type="reset" id="signInBtn" onclick="location.href='/miniProject/member/authForm'" class="btn">회원가입</button>
                    </th>
                </tr>
                
                <tr>
                	<th colspan="2">
               			<img src="../image/kakao_login_large_narrow.png" width="183" height="45" style="cursor:pointer;border-radius: 6px;"
               			onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=c4a0be65c83d074e043a3662d1fe649f&redirect_uri=http://localhost:8080/miniProject/member/auth/kakao/callback&response_type=code&prompt=login'"/>
			          	<img alt="네이버로그인" src="../image/btnG_완성형.png" width="183" height="45" style="cursor:pointer;border-radius: 6px;"
			         	 onclick="javascript:void(0)" id="naverIdLogin_loginButton"/>
                	</th>
                </tr>    
            </table>

            <div style="text-align: center; font: bold;margin-bottom: 10%;" id="confirmDiv"></div>

        </div>
    </div>


            <div id="confirmDiv"></div>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
//전역 범위에서 로그인 시도 횟수와 캡차 활성화 여부를 선언
let loginAttempts = 0;
let captchaActive = false;

// 캡차 행을 숨김
const captchaRow = document.getElementById("captchaRow");
captchaRow.style.display = "none";


// 로그인 시도 횟수 초기화 함수
function resetLoginAttempts() {
    loginAttempts = 0;
}

//엔터 키 눌렀을 때 로그인 버튼 클릭 이벤트 핸들러 추가
$('#id, #pwd, #textBox, #memberLoginForm').keypress(function (e) {
    if (e.keyCode == 13) { // 엔터 키의 keyCode는 13입니다.
        $('#loginBtn').click(); // 로그인 버튼 클릭
    }
});

$(function() {
    // 초기에는 캡차를 숨김
    $('#captchaRow').hide();

    // 캡차를 초기화하는 함수
    function resetCaptcha() {
        userText.value = "";
        resetCaptchaMessage();
        let refreshArr = [];
        for (let j = 1; j <= 7; j++) {
            refreshArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
        }
        captchaText.innerHTML = refreshArr.join('');
        userText.style.borderColor = ""; // 테두리 스타일 초기화
        userText.setAttribute("placeholder", ""); // 워터마크 제거
    }

 // 로그인 버튼 클릭 시
    $('#loginBtn').click(function () {
    	$('#idDiv').css('display','none');
        $('#idDiv').empty();
        $('#pwdDiv').css('display','none');
        $('#pwdDiv').empty();
        if ($('#id').val() == '') {
        	$('#idDiv').css('display','block');
            $('#idDiv').text('아이디를 입력하세요');
            $('#id').focus();
        } else if ($('#pwd').val() == '') {
        	$('#pwdDiv').css('display','block');
            $('#pwdDiv').text('비밀번호를 입력하세요');
            $('#pwd').focus();
        } else {
            if (captchaActive) {
                if ($('#textBox').val() == '') {
                    $('#captchaDiv').text('보안 문자를 입력하세요'); // 보안 문자를 입력하지 않았을 때 메시지를 표시
                    $('#textBox').focus();
                    userText.style.borderColor = "red"; // 빨간 테두리
                    userText.setAttribute("placeholder", "보안 문자를 입력하세요"); // 워터마크 추가
                    return;
                }
                // 보안 문자 검증
                verifyCaptcha();
            } else {
                // AJAX 요청으로 로그인 시도
                $.ajax({
                    type: 'post',
                    url: '/miniProject/member/login',
                    data: $('#memberLoginForm').serialize(),
                    success: function (data) {
                        if (data == true) {
                            resetLoginAttempts(); // 로그인 성공 시 초기화
                            location.href = '/miniProject/'
                        } else {
                            loginAttempts++;
                            if (loginAttempts >= 3) {
                                captchaActive = true;
                                captchaRow.style.display = "table-row"; // 캡차 행을 보이게 함
                                refreshCaptcha();
                                $('#confirmDiv').text('보안 문자를 입력하세요'); // 이후 로그인 클릭 시 메시지 변경
                            } else {
                                $('#confirmDiv').text('로그인 실패. 남은 시도 횟수: ' + (3 - loginAttempts));
                            }

                            // 각 오류 메시지를 표시
                            if (data == 'invalid_id') {
                                $('#idDiv').text('아이디가 올바르지 않습니다.');
                            } else if (data == 'invalid_pwd') {
                                $('#pwdDiv').text('비밀번호가 올바르지 않습니다.');
                            } else if (data === 'invalid_captcha') {
                                $('#captchaDiv').text('보안 문자가 일치하지 않습니다.'); // 보안 문자가 일치하지 않을 때 메시지를 표시
                                return;
                            }
                            
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }
        }
    });

    // 로그인 함수
    function doLogin() {
        $.ajax({
            type: 'post',
            url: '/miniProject/member/login',
            data: $('#memberLoginForm').serialize(),
            success: function (data) {
                if (data == true) {
                    resetLoginAttempts(); // 로그인 성공 시 초기화
                    location.href = '/miniProject/';
                } else {
                	$('#confirmDiv').text('아이디나 비밀번호가 일치하지 않습니다.');
                    refreshCaptcha(); // 보안 문자 새로고침
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    // 캡차 새로고침 버튼 클릭 시
    $('#refreshButton').click(function () {
        if (captchaActive) {
            resetCaptcha(); // 캡차 초기화
            refreshCaptcha(); // 캡차 새로고침
        }
    });

    // 캡차 초기화
    function refreshCaptcha() {
        userText.value = "";
        resetCaptchaMessage();
        let refreshArr = [];
        for (let j = 1; j <= 7; j++) {
            refreshArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
        }
        captchaText.innerHTML = refreshArr.join('');
    }

    // 보안 문자 검증 관련 이벤트 핸들러

    function verifyCaptcha() {
        // 대소문자 구분 없이 비교하기 위해 대문자로 변환 후 비교
        if (userText.value.toUpperCase() == captchaText.innerHTML.toUpperCase()) {
            resetCaptchaMessage(); // 보안 문자가 일치할 경우 메시지를 초기화합니다.
            output.classList.add("correctCaptcha");
            doLogin();
        } else {
            handleCaptchaFailure(); // 보안 문자가 일치하지 않을 경우 메시지를 표시합니다.
        }
    }
    
    // 보안 문자 검증 메시지 초기화 함수

    function resetCaptchaMessage() {
        output.innerHTML = "";
        output.classList.remove("correctCaptcha", "incorrectCaptcha");

        // 입력란 스타일 초기화
        userText.style.borderColor = ""; 
        userText.setAttribute("placeholder", "");

        // 보안 문자 입력란 메시지 초기화
        $('#captchaDiv').text(''); // "captchaDiv"의 내용을 비웁니다.

        // 입력란 스타일 변경 (빨간 테두리 포커스)
        userText.style.borderColor = "red"; // 빨간 테두리
        userText.focus(); // 입력란에 포커스
    }

 // 보안 문자 검증 실패 시 처리
    function handleCaptchaFailure() {
        resetCaptchaMessage(); // 메시지를 초기화합니다.
        $('#captchaDiv').text('보안 문자가 일치하지 않습니다.'); // "captchaDiv"에만 표시
        userText.style.borderColor = "red"; // 빨간 테두리
        userText.setAttribute("placeholder", "보안 문자를 입력하세요"); // 워터마크 추가
        userText.focus(); // 입력란에 포커스
    }


    // 창을 새로고침할 때 캡차 초기화
    window.onbeforeunload = function() {
        refreshCaptcha();
    };

    // 캡차 초기화
    refreshCaptcha();
});
    
/* ----------------------------캡차---------------------------- */

// document.querySelector() is used to select an element from the document using its ID
let captchaText = document.querySelector('#captcha');
let userText = document.querySelector('#textBox');
let output = document.querySelector('#output');
let refreshButton = document.querySelector('#refreshButton');

// alphaNums contains the characters with which you want to create the CAPTCHA
let alphaNums = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
let emptyArr = [];
// This loop generates a random string of 7 characters using alphaNums
// Further this string is displayed as a CAPTCHA
for (let i = 1; i <= 7; i++) {
emptyArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
}
captchaText.innerHTML = emptyArr.join('');

// This event listener is stimulated whenever the user press the "Enter" button
// "Correct!" or "Incorrect, please try again" message is
// displayed after validating the input text with CAPTCHA
userText.addEventListener('keyup', function(e) {
// Key Code Value of "Enter" Button is 13
if (e.keyCode === 13) {
if (userText.value === captchaText.innerHTML) {
output.classList.add("correctCaptcha");
} else {
output.classList.add("incorrectCaptcha");
}
}
});

// This event listener is stimulated whenever the user press the "Refresh" button
// A new random CAPTCHA is generated and displayed after the user clicks the "Refresh" button
refreshButton.addEventListener('click', function() {
userText.value = "";
let refreshArr = [];
for (let j = 1; j <= 7; j++) {
refreshArr.push(alphaNums[Math.floor(Math.random() * alphaNums.length)]);
}
captchaText.innerHTML = refreshArr.join('');
output.innerHTML = "";
});

</script>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "rkkypWiwBEBwntMSFU8E",
			callbackUrl: "http://localhost:8080/miniProject/member/auth/naver/callback",
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();



</script>
</c:if>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
</body>
</html>