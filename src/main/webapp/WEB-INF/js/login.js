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
        captchaActive = false; // 캡차 비활성화
    }

 // 로그인 버튼 클릭 시
    $('#loginBtn').click(function () {
        $('#idDiv').empty();
        if ($('#id').val() == '') {
            $('#idDiv').text('아이디를 입력하세요');
            $('#id').focus();
        } else if ($('#pwd').val() == '') {
            $('#pwdDiv').text('비밀번호를 입력하세요');
            $('#pwd').focus();
        } else {
            if (captchaActive) {
                if ($('#textBox').val() == '') {
                    alert('보안 문자를 입력하세요');
                    $('#textBox').focus();
                    userText.style.borderColor = "red"; // 빨간 테두리
                    userText.setAttribute("placeholder", "보안 문자를 입력하세요"); // 워터마크 추가
                    userText.focus(); // 입력란에 포커스
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
                            alert('로그인 완료');
                            resetLoginAttempts(); // 로그인 성공 시 초기화
                            location.href = '/miniProject/'
                        } else {
                            loginAttempts++;
                            if (loginAttempts >= 3) {
                                captchaActive = true;
                                captchaRow.style.display = "table-row"; // 캡차 행을 보이게 함
                                refreshCaptcha();
                            } else {
                                alert('로그인 실패. 남은 시도 횟수: ' + (3 - loginAttempts));
                            }

                            // 각 오류 메시지를 표시
                            if (data == 'invalid_id') {
                                $('#idDiv').text('아이디가 올바르지 않습니다.');
                            } else if (data == 'invalid_pwd') {
                                $('#pwdDiv').text('비밀번호가 올바르지 않습니다.');
                            } else if (data === 'invalid_captcha') {
                                $('#captchaDiv').text('보안 문자가 일치하지 않습니다.');
                            }

                            // 로그인 실패 시 캡차 검증을 하지 않도록 처리
                            return;
                        }
                        resetLoginInputs(); // 로그인 입력 필드 초기화
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
                    alert('로그인 성공!');
                    resetLoginAttempts(); // 로그인 성공 시 초기화
                    location.href = '/miniProject/';
                } else {
                    alert('아이디나 비밀번호가 일치하지 않습니다.');
                    resetLoginInputs(); // 아이디와 비밀번호 초기화
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
            resetCaptchaMessage();
            output.classList.add("correctCaptcha");
            output.innerHTML = "보안 문자가 일치합니다!";
            
            doLogin();
        } else {
            handleCaptchaFailure();
        }
    }
 	
 	// 보안 문자 검증 메시지 초기화 함수
    function resetCaptchaMessage() {
        output.innerHTML = "";
        output.classList.remove("correctCaptcha", "incorrectCaptcha");

        // 입력란 스타일 초기화
        userText.style.borderColor = ""; 
        userText.setAttribute("placeholder", "");

        // 입력란 스타일 변경 (빨간 테두리 포커스 및 워터마크 추가)
        userText.style.borderColor = "red"; // 빨간 테두리
        userText.setAttribute("placeholder", "보안 문자를 입력하세요."); // 워터마크 추가
        userText.focus(); // 입력란에 포커스
    }

    // 보안 문자 검증 실패 시 처리
    function handleCaptchaFailure() {
        resetCaptchaMessage();
        output.classList.add("incorrectCaptcha");
        output.innerHTML = "보안 문자가 일치하지 않습니다.";
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
output.innerHTML = "보안 문자가 일치합니다!";
} else {
output.classList.add("incorrectCaptcha");
output.innerHTML = "보안 문자가 일치하지 않습니다.";
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
