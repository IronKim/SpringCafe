$(function(){
	autoReload();
	document.getElementById('reset').disabled = true;
	document.getElementById('submit').disabled = true;
})
var seq = 0;
var count = 0;
var off = 0;
var dup = 0;
function autoReload() {
	if (dup == 0) {
		reload();
	}
	count++;
	if(count < 30) {//갱신 카운트
		setTimeout(() => {
			autoReload();
			var divs = document.querySelectorAll('.area')
			for(let i = 20;i < divs.length;i++) {
				divs[i-20].remove();
			}
	    },2000 );
    } else {
    	document.getElementById('reset').disabled = false;
    	$('#reset > img').css('animation-play-state','paused')
    	$('#reDiv').css('color','gray')
    	$('#reDiv').text('실시간 채팅 비활성화')
    	off = 1;
    }
}
function reload() {
	$.ajax({
		type: 'post',
		url:'/miniProject/chat/reload',
		data: 'seq='+seq,
		dataType: 'json',
		success: function(data){
			var userSeq = $('#seq').val();
			if(data.length>0)seq = data[0].seq;
			$.each(data.reverse(), function(index, items){
				var div1 = $('<div class="area"/>')
				var div2 = $('<div class="name"/>').text(items.name)
				var clear = $('<div style="clear:both"/>');
				var div3 = $('<div class="time"/>').text(items.logtime)
				var div4 = $('<div class="content"/>').text(items.content);
				if(userSeq == items.userSeq) {
					div1.css('float','right');
					div2.css('text-align','right')
					div3.css('text-align','right')
					div4.css('background','#FAF9CB');
					div4.css('color','black');
					div1.append(div2).append(clear).append(div4).append(div3).appendTo('#messageSection')
				}
				else {
					div1.css('float','left');
					div4.css('background','white');
					div1.append(div2).append(clear).append(div4).append(div3).appendTo('#messageSection')
				}
				clear.appendTo('#messageSection')
				$('#messageSection').scrollTop($(document).height());
				dup = 0;
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}
var content = document.getElementById('content');
content.addEventListener("input",function(){
	if(content.value.trim() != '') document.getElementById('submit').disabled = false;
	else document.getElementById('submit').disabled = true;
})
content.addEventListener('keydown', function(event) {
    if (event.key === 'Enter') {
    	event.preventDefault();
        chatSubmit();
    }
});
function chatSubmit() {
	if(content.value.trim() != '') {
		count = 0;
		$.ajax({
			type: 'post',
			url:'/miniProject/chat/send',
			data: $('#chatForm').serialize(),
			success: function(){
				dup = 1;
				reload();
			},
			error: function(e) {
				console.log(e);
			}
		})
		$('#content').val('');
		document.getElementById('submit').disabled = true;
		if(off == 1) {
			off = 0;
			count = 0;
			autoReload();
			document.getElementById('reset').disabled = true;
			$('#reset > img').css('animation-play-state','running')
			$('#reDiv').css('color','green')
	    	$('#reDiv').text('실시간 채팅 활성화')
		}
		return false;
	}
}
$('#submit').click(function(){
	chatSubmit();
})
$('#reset').click(function(){
	off = 0;
	count = 0;
	autoReload();
	document.getElementById('reset').disabled = true;
	$('#reset > img').css('animation-play-state','running')
	$('#reDiv').css('color','green')
    $('#reDiv').text('실시간 채팅 활성화')
})