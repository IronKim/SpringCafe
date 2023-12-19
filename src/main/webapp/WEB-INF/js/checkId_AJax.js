function checkId(){
	var id = $('#id').val();
	$.ajax({
		type: 'post',
		url: '/miniProject/member/idCheck',
		data:{id:id},
		success:function(cnt){
		if(cnt != 1 && id.length > 0){
				$('.id_ok').css("display", "inline-block");
				$('.id_no').css("display", "none");
			}else if(cnt == 1 && id.length > 0){
				$('.id_no').css("display", "inline-block");
				$('.id_ok').css("display", "none");
			}else{
				$('.id_no').css("display", "none");
				$('.id_ok').css("display", "none");
			}
		},
		error:function(e){
			console.log(e);
		}
	});
};