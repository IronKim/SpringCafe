
$(function(){
	var id = 100;
	if($('#boardId').val() == 200) {
		id = 200;
	}
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardList',
		data: 'pg=' +$('#pg').val()+'&id='+ id,
		dataType: 'json',	//'text' or 'xml' or 'json'
		success: function(data){
			console.log(data.list[0].name);

			$.each(data.list, function(index, items){
				var date = new Date(items.logtime)
				var year = date.getFullYear();
				var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
				var day = date.getDate();
				var hours = date.getHours();
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
				var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;				
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text : items.seq				
				})).append($('<td/>',{}).append($('<a/>',{
					href :'/miniProject/board/boardView?seq=' + items.seq + '&pg=' + $('#pg').val()+"&id="+$('#boardId').val(),
					align: 'center',
					class: 'subjectA',
					text : items.subject,
					style: 'text-decoration: none; color: black;'
				}))).append($('<td/>',{
					align: 'center',
					text : items.writer
					
				})).append($('<td/>',{
					align: 'center',
					text : formattedDate
				})).append($('<td/>',{
					align: 'center',
					text : items.hit
				})).appendTo('#boardListTable');
			}); //$.each
			
			//페이징 처리
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		},
		error: function(e){
			console.log(e);
		}
	});
	

});

function writeBtnClick(id){
	
	if(id == ''){
		alert('로그인 먼저해주세요');
	}else{
		location.href='/miniProject/board/boardWriteForm?pg='+$('#pg').val()+'&id='+$('#boardId').val();
	}			
}

function userPaging(pg){
		location.href = "/miniProject/board/boardList?pg="+pg+"&id="+$('#boardId').val();
	};