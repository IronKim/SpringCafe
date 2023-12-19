$(function() {
	//유효성검사
	$('#updateBtn').click(function() {
		$('#nameDiv').empty();
		$('#pwdDiv').empty();
		$('#emailDiv').empty();
		$('#phoneNumberDiv').empty();
		$('#addressDiv').empty();
		
		if ($('#name').val() == '') {
			$('#nameDiv').text('이름을 입력하세요.');
			$('#name').focus();
			
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
			var email1 = $('#user_email').val();
			var email2 = $('#email_address').val();
			var tel1 = $('#phoneNumber1').val();
			var tel2 = $('#phoneNumber2').val();
			var tel3 = $('#phoneNumber3').val();
			$('#totalemail').val(email1 + '@' + email2);
			$('#phoneNumber').val(tel1 + '-' + tel2 + '-' + tel3);
			console.log($("#phoneNumber").val());
			
			
			/* 정보 수정 완료 */
			$.ajax({
				type: 'post',
				url: '/miniProject/member/update',
				data: $('#updateForm').serialize(), //변수=값&변수=값
				success: function(){
					alert('정보 수정 완료');
					location.href = '/miniProject/member/myPage'
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
		
		console.log(email1);
		console.log(email2);

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
$('#deleteBtn').click(function() {
	var ask1 = prompt('DELETE를 입력해주세요');
	if(ask1 == 'DELETE') {
		if(confirm('정말로 탈퇴하시겠습니까?')) {
			$.ajax({
				type : 'post',
				url : '/miniProject/member/delete',
				data : 'id=' +$("#userId").val(),
				success: function(){
					alert('탈퇴 완료');
					naverLogout();
					location.href = '/miniProject/'
				},
				error: function(e){
					console.log(e);
			}
			})
		}
	} else {
		alert('잘못 입력하였습니다');
	}
	
	
	
});

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