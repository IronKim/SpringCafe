$(function(){
	var point = $('#userPoint').val();
	var gold = (300000*10) - (parseInt(point)*10);
	var red = (700000*10) - (parseInt(point)*10);
	if(point < 300000){
		document.getElementById('gradeT').innerText = "SILVER";
		document.getElementById('gradeT').style.color = "silver";
	}else if(point < 700000){
		document.getElementById('gradeT').innerText = "GOLD";
		document.getElementById('gradeT').style.color = "#C5A56C";
	}else if(point < 1000000){
		document.getElementById('gradeT').innerText = "RED";
		document.getElementById('gradeT').style.color = "red";
	}else{
		document.getElementById('gradeT').innerText = "DIAMOND";
		document.getElementById('gradeT').style.color = "lightgray";
	}
	payList();
})
function payList() {
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/myPayList',
		data:'id='+$('#id').val(),
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div = $('<div class="payItem"/>')
				div.attr('onclick','location.href="/miniProject/order/complete?seq='+items.seq+'"')
				var div1 = $('<div class="payNum"/>').html("주문 번호 " + items.seq + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" 
				+ items.storeSeq);
				var div2 = $('<div class="payName"/>')
				var span = $('<span style="float:right">').html('&#9654;&nbsp;&nbsp;')
				var menuSeq = [];
				menuSeq = items.menuSeq.split(",");
				$.ajax({
				type: 'post',
				url:'/miniProject/order/paymentList',
				data: 'seq='+menuSeq[0]+"&num="+0,
				dataType: 'json',
				success: function(data){
					if(menuSeq.length > 1) div2.text(data.list.name + " 외 " 
					+ (menuSeq.length-1) + "건");
					else div2.text(data.list.name);
					div2.append(span);
				},
				error: function(e) {
					console.log(e);
				}
				})
				//
				var div3 = $('<div class="payPoint"/>').html('사용 포인트 ' +items.pointUsed+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결제 금액 ' 
				+ items.total +"원")
				div.append(div1).append(div2).append(div3).prependTo('#payList')
				
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}