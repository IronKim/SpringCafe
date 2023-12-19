$(function(){//onload function start
	var menuSeqAr = [];
	var cntAr = [];
	$.ajax({
		type: 'post',
		url:'/miniProject/order/selectPayment',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success: function(data){
			if(data.id == $('#userId').val()) {
				menuSeqAr = data.menuSeq.split(",");
				cntAr = data.cnt.split(",");
				var storeSeq = data.storeSeq;
				$('#total').text(data.total)
				$('#point').text(parseInt(data.total * 0.1))
				if (data.pointUsed != null) $('#pointUsed').text(parseInt(data.pointUsed));
				else $('#pointUsed').text(0);
				$('#name').text(data.id)
				$.ajax({
					type: 'post',
					url:'/miniProject/order/storeName',
					data: 'seq='+storeSeq, 
					dataType: 'text',
					success: function(data){
						$('#storeName').text(data)
					},
					error: function(e) {
						console.log(e);
					}
				})
				for (var i = 0;i < menuSeqAr.length;i++) {
					$.ajax({
					type: 'post',
					url:'/miniProject/order/paymentList',
					data: 'seq='+menuSeqAr[i]+"&num="+cntAr[i],
					dataType: 'json',
					success: function(data){
							var div = $('<div class="item"/>');
							var div1 = $('<div class="itemName"/>').text(data.list.name);
							var div2 = $('<div class="itemPrice"/>').text(data.list.price+"원");
							var div3 = $('<div class="itemCnt"/>').text(data.num+"개");
							div.append(div1).append(div2).append(div3).appendTo($('#itemSection'));
					},
					error: function(e) {
						console.log(e);
					}
					})
				}//for
			} else {
				$('main').css('display','none')
				$('#wrong').css('display','block')
			}
		},
		error: function(e) {
			console.log(e);
		}
	})
//onload function end
});