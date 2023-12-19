$(function(){
	$('#boardWriteBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val()==''){
			$('#subjectDiv').text('제목 입력');
			$('#subject').focus();
		}else if($('#content').val()==''){
			$('#contentDiv').text('내용 입력');
			$('#content').focus();
		}else{
			//$('#boardWriteForm').submit();
			$.ajax({
				type: 'post',
				url: '/miniProject/board/boardWrite',
				data: $('#boardWriteForm').serialize(),
					success: function(){
						alert("작성하신 글을 저장하였습니다.");
						location.href='/miniProject/board/boardList?pg=1&id='+$('#boardId').val();
					},
					error: function(e){
						console.log(e);
					}
			});
		}
	});
	
});