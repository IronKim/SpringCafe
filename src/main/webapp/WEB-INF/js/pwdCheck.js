//수정버튼 

$('#updateBtn').click(function(){
	$('#pwdDiv').empty();  //초기화

		if($('#pwd').val()==''){
         $('#pwdDiv').text('비밀번호를 입력하세요.');
         $('#pwd').focus();	
       	
	}
	else{
			$.ajax({
				type: 'post',
				url: '/miniProject/member/pwdCheck',
				data: $('#pwdCheck').serialize(), //변수=값&변수=값
				dataType: 'text',
				success: function(data){

					if (data > 0) {
					location.href = '/miniProject/member/updateForm'
					}else{
					alert('비밀번호를 확인해주세요.');
					}
				}, 
				error: function(e){
					console.log(e);
			}
		});
	}
});
