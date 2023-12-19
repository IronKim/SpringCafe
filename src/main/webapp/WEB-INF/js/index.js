$(function(){
	$.ajax({
		type: 'post',
		url:'/miniProject/index/menu',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div1 = $('<div class="item"/>')
				var img = $('<img/>').attr('src',items.image)
				var div2 = $('<div class="itemName"/>').text(items.name)
				var hdn = $('<input type="hidden" class="itemId">').val(items.id)
				div1.append(img).append(div2).append(hdn).appendTo('#itemRandom')
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
	$.ajax({
		type: 'post',
		url:'/miniProject/index/board',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div1 = $('<div class="boardItem"/>')
				div1.attr('onclick','location.href="/miniProject/board/boardView?pg=1&id=&seq='+items.seq+'"')
				var span1 = $('<span class="boardItemSubject"/>').text(items.subject)
				var span2 = $('<span class="boardItemWriter"/>').html("|&nbsp;&nbsp;"+items.writer)
				div1.append(span1).append(span2).appendTo('#boardList')
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
	$.ajax({
		type: 'post',
		url:'/miniProject/index/notice',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div1 = $('<div class="boardItem"/>')
				div1.attr('onclick','location.href="/miniProject/board/boardView?pg=1&id=200&seq='+items.seq+'"')
				var span1 = $('<span class="boardItemSubject"/>').text(items.subject)
				var span2 = $('<span class="boardItemWriter"/>').html("|&nbsp;&nbsp;"+items.writer)
				div1.append(span1).append(span2).appendTo('#noticeList')
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
});
$('#itemRandom').on('click','.item',function(){
	if($(this).find('.itemId').val()==100){
		location.href='./menu/menuForm#coffee';
	} else if($(this).find('.itemId').val()==300){
		location.href='./menu/menuForm#beverage';
	} else if($(this).find('.itemId').val()==200){
		location.href='./menu/menuForm#dessert';
	} else if($(this).find('.itemId').val()==400){
		location.href='./menu/menuForm#MD';
	}
})