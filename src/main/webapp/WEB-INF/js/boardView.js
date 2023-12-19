$(function(){
	
	 // 클릭한 게시물의 data-seq 값을 가져옴
    var seq = $('#seq').val();
	//조회수 상승	
	$.ajax({
		type: 'post',
		url: '/miniProject/board/boardHit',
		data: 'seq=' + $('#seq').val(),
		success: function(){
			console.log('aaa');
		},
			error: function(e){
			console.log(e);
		}
			
	});

	//글보기
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getBoardView',
		data: 'seq=' + $('#seq').val(),
		//'pg=' + $('#pg').val(),
		//data: { 'seq': seq },
		dataType: 'json',	//'text' or 'xml' or 'json'
		success: function(data){
				
				var date = new Date(data.logtime);
				var year = date.getFullYear();
				var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
				var day = date.getDate();
				var hours = date.getHours();
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
				var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;		
				var formattedTime = (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
				var formattedDateTime = formattedDate + ' ' + formattedTime;
				var hit = Number(data.hit)+1;
			console.log(data);
		 // 데이터가 비어 있지 않고 최소한 하나 이상의 항목이 있는 경우
            // 가져온 데이터를 각각의 th 셀에 추가
            $('#writer').text(data.writer);
            $('#subject').text(data.subject);
            $('#content').text(data.content);
            $('#logtime').text(formattedDateTime);
            $('#hit').text(hit);    
         	if(data.id == 200) $('#nv').css('display','block');
         	else $('#bv').css('display','block');
		},
		error: function(e){
			console.log('실패')
			console.log(e);
		}
	});
	getCommentList(0)
});//onload끝

//무한스크롤 기준 변수
var sc = 0;

function getCommentList(scroll) {
	var sessionId = $('#sessionId').val();
	$.ajax({
		type: 'post',
		url: '/miniProject/board/getCommentList',
		data: 'seq=' + $('#seq').val()+ '&sc=' + scroll,
		dataType: 'json',	//'text' or 'xml' or 'json'
		success: function(data){
			sc+=1;
			$.each(data, function(index, items){
				var date = new Date(items.logtime);
				console.log(date);
				var year = date.getFullYear();
				var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
				var day = date.getDate();
				var hours = date.getHours();
				var minutes = date.getMinutes();
				var seconds = date.getSeconds();
				var formattedDate = year + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;		
				var formattedTime = (hours < 10 ? '0' : '') + hours + ':' + (minutes < 10 ? '0' : '') + minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
				var formattedDateTime = formattedDate + ' ' + formattedTime;
				var div = $('<div class="commentItem" />')
				var hidden = $('<input type="hidden" class="commentSeq">').val(items.commentseq);
				
				div.append(hidden)
				if (items.writer == sessionId) {	
				   div.append($('<button/>', {
				        text: '삭제',
				        class: 'commentDeleteBtn',
				        'data-commentseq': items.commentseq,
				        id: 'commentDeleteBtn'
				    }))
			 	}
			 	
				div.append(
			    $('<span class="commentWriter"/>').text(items.writer),
			    $('<span class="commentDate"/>').html("&nbsp;|&nbsp;"+formattedDate),
			    $('<div class="commentText"/>').text(items.text))
				
			    div.appendTo('#boardCommentDiv');
			}); //$.each
			
			//페이징 처리
			//$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		},
		error: function(e){
			console.log(e);
		}
	});
}
//function 끝

	$('#deleteBtn').click(function(){
		if(confirm('삭제하시겠습니까?')){
	
		$.ajax({
			type: 'post',
			url: '/miniProject/board/boardDelete',
			data: {'seq' : $('#seq').val()},
			success: function(){
				alert('삭제 완료');
				location.href='/miniProject/board/boardList?pg='+$('#pg').val()+'&id='+$('#boardId').val();
			},
			error: function(e){
				console.log(e);
				}
		});
	}//if
});
	
	
	$('#commentWriteBtn').click(function(){
    	var text = $('#text').val();
		if($('#text').val()==''){
			$('#text').focus();
		}else{
			$.ajax({
				type: 'post',
				url: '/miniProject/board/commentWrite',
				data: {'seq' : $('#seq').val(),
						'text' : text,
				
				},
					success: function(){
						$('#text').val('');
						sc = 0;
						$('#boardCommentDiv').empty();
						getCommentList(0);
					},
					error: function(e){
						console.log(e);
					}
			});
		}
	});
	$(document).on('click', '.commentDeleteBtn', function() {
		if(confirm('삭제하시겠습니까?')){
		 var commentseq = $(this).data('commentseq');
		$.ajax({
			type: 'post',
			url: '/miniProject/board/commentDelete',
			data: { commentseq: commentseq },
			success: function(){
				sc = 0
				$('#boardCommentDiv').empty();
				getCommentList(0);
			},
			error: function(e){
				console.log(e);
				}
		});
	}//if
});


// 무한스크롤
var noScroll = 0;
var bcd = document.getElementById('boardCommentDiv');
var lastSeq = 0;
bcd.addEventListener('scroll', function() {
  var scrollPosition = bcd.scrollTop;
  var bcdHeight = bcd.scrollHeight - bcd.clientHeight;
  		if (scrollPosition+1 > bcdHeight) {
  		  $.ajax({
				type: 'post',
				url: '/miniProject/board/commentLastSeq',
				data: 'seq=' + $('#seq').val(),
				dataType: 'text',
				success: function(data){
					lastSeq = data;
				},
				error: function(e){
					console.log(e);
				}
			});
			var commentSeq = document.querySelectorAll('.commentItem');
			if(commentSeq[commentSeq.length-1].querySelector('.commentSeq').value != lastSeq) {
	  			if(noScroll == 0) {
			    	noScroll = 1;
			    	var loading = document.getElementById('loading');
			    	loading.style.display="block";
		  			setTimeout(() => {
				    	getCommentList(sc);
				    }, 500);	
			    	setTimeout(() => {
				       	noScroll = 0;
				    }, 1000);
			    	setTimeout(() => {
				       	noScroll = 0;
				       	loading.style.display="none";
				       	var commentItem = document.querySelectorAll('.commentItem');
				       	if(commentItem[commentItem.length-1].querySelector('.commentSeq').value != lastSeq) {
				       		commentItem[commentItem.length-3].scrollIntoView({behavior:'smooth',block: 'nearest'})
				       	} else commentItem[commentItem.length-1].scrollIntoView({behavior:'smooth',block: 'nearest'});
				    }, 1600);
		    	}
	    	}
	  }
});
