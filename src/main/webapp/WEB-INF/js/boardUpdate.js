var subject;
var content;
$(function(){
    var seq = $('#seq').val();
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardView',
		data: 'seq=' + $('#seq').val(),
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			
			$('#subject').val(data.subject);
            $('#content').val(data.content);
            if(data.writer != $('#sessionId').val()) {
            	alert('잘못된 접근입니다');
            	if($("#boardId").val() == 200) location.href = '/miniProject/board/boardList?pg=&id=200';
            	else location.href = '/miniProject/board/boardList?pg=&id=';
            }
            subject = data.subject;
            content = data.content;
			
		},
		error: function(e){
			console.log(e);
		}
	});
});

//취소 버튼

$('#resetBtn').click(function(){
	$('#subject').val(subject);
    $('#content').val(content);
});

//수정버튼
$('#boardUpdateBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val()==''){
			$('#subjectDiv').text('제목을 입력하세요.')
			$('#subject').focus();
		}
		else if($('#content').val()==''){
				$('#contentDiv').text('내용을 입력하세요.');
				$('content').focus();
		}
		else{
			$.ajax({
				type: 'post',
				url: '/miniProject/board/boardUpdate',
				data: $('#boardUpdateForm').serialize(),
				success: function(){
					alert('수정 완료');
					location.href = '/miniProject/board/boardList?pg=' + $("#pg").val() + '&id='+$("#boardId").val();
				},
				error: function(e){
					console.log(e);
					}
		});
	}//else
});


