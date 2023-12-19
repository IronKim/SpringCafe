$(function(){
	var code = '@!#@!#@!#@!#!@#';
	var count = 0;
	let userEmail;

	$('#mail-Send-Btn').click(function() {
		userEmail = $('#userEmail1').val() + '@' + $('#userEmail2').val();
		//console.log('완성된 이메일 : ' + email); // 최종 이메일 확인
		$('#mail-Send-Btn').hide();
		$('#userEmail1').prop('readonly', true);
		$('#userEmail2').prop('readonly', true);
		$('#user_email_address').prop('disabled', true);
		$('#authContainer').show();
		
		$.ajax({
			type : 'get',
			url : '/miniProject/emailSend?email=' + userEmail, 
			success : function (data) {
				code = data; //인증번호 code변수에 넣기
				alert('인증번호가 전송되었습니다.');
			}			
		}); 
		
	}); 

	$('#auth-Check-Btn').click(function () {
		const inputCode = $('#authInput').val();
		const resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			alert('인증번호가 일치합니다.');
			emailForm.target='authForm';
			$('#emailForm').submit();
			window.close();
		}else{
			count++;
			if(count >= 3){
					alert('3번 실패하였습니다.');
					window.close();
				}
			resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요. 인증 시도: ' + count);
			resultMsg.css('color','red');
		}
	});
	
	$('#user_email_address').change(function() {
		var user_email_address = $('#user_email_address').val();
		$('#userEmail2').val(user_email_address);
		
		if (user_email_address == '직접입력') {
			$('#userEmail2').val('');
		}//if
	});


}); //$(function)
		
