$(function(){
	var userNum = '!@##@!!@##@!$#';
	var userTel;
	var count = 0;

	$('#send').click(function(){
		
		userTel = $('#tel').val();
		
		if(telValidator(userTel)){
			$('#tel').prop('readonly', true);
			$('#send').hide();
			$('#authContainer').show();
		
			$.ajax({
				type: 'post',
				url: '/miniProject/smsSend',
				data: 'tel=' + userTel,
				dataType: 'text',
				success: function(data){
					alert('인증번호가 전송되었습니다.');
					userNum = data;
				},
				error: function(e){
					console.log(e)
				}
			});
		}
	});
			
		$('#enterBtn').click(function(){
			if(userNum === $('#userNum').val()){
				alert('인증번호가 일치합니다.');
				smsForm.target='authForm';
				$('#smsForm').submit();
				window.close();
			}else{
				count++;
				if(count >= 3){
					alert('3번 실패하였습니다.');
					window.close();
				}
				$('#sms-check-warn').html('인증번호가 불일치 합니다. 다시 확인해주세요! 인증 시도: ' + count);
				$('#sms-check-warn').css('color','red');
			}
		});

		$('#cancelBtn').click(function(){
			window.close();
		});

		function telValidator(args) {
			if (/^(01[016789]{1})-?[0-9]{4}-?[0-9]{4}$/.test(args)) {
				return true;
			}
			alert('유효하지 않는 전화번호입니다.');
			return false;
		}

}); //$(function)
		
