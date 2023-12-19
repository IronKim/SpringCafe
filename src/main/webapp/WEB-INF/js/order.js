$(function(){//onload function start
	itemList(100);
	sum();
	if($('#comeSeq').val() != "") {
		$.ajax({
			type: 'post',
			url:'/miniProject/order/item',
			data: 'seq='+ $('#comeSeq').val(),
			dataType: 'json',
			success: function(data){
				var div = $('<div class="cartItem"/>');
				var name = $('<span class="cartName"/>').text(data.name);
				var seq = $('<input type="hidden" class="cartSeq" name="seq">').val(data.seq);
				var price = $('<input type="hidden" class="cartPrice">').val(data.price);
				var img = $('<img class="cartImage"/>');
				img.attr('src',data.image);
				var span = $('<span class="countBox"/>');
				var countHide = $('<input type="hidden" name="count" class="count"/>').val(1);
				var count = $('<span class="cartCount"/>').text(countHide.val());
				var plus = $('<button class="countP"/>');
				var minus = $('<button class="countM"/>');
				var removeCart = $('<button class="removeCart"/>');
				
				minus.click(function(){
					var parentC = $(this).parents('.cartItem')
					if(parentC.find('.count').val() == 1) {
						parentC.remove();
					} else {
						parentC.find('.count').val((parentC.find('.count').val()-1))
						parentC.find('.cartCount').text(parentC.find('.count').val())
					}
					sum();
				})
				
				plus.click(function(){
					var parentC = $(this).parents('.cartItem')
					if(parentC.find('.count').val() == 99) {
						alert('최대 수량입니다')
					} else {
						parentC.find('.count').val((parseInt(parentC.find('.count').val())+1))
						parentC.find('.cartCount').text(parentC.find('.count').val())
					}
					sum();
				})
				
				removeCart.click(function(){
					$(this).parents('.cartItem').remove();
					sum();
				})
				
				span.append(minus.text('-')).append(count).append(plus.text('+')).append(countHide)
				
				div.append(removeCart.html('&#10799;')).append(img).append(name).append(seq).append(price).append(span).prependTo('#cartSection');
				sum();
			},
			error: function(e) {
				console.log(e);
			}
		})
	}
//onload function end
});
//커피 리스트 불러오기
function itemList(id) {
	var buttonAll = document.querySelectorAll('.tab')
	for (var i = 0;i < buttonAll.length;i++) {//버튼 초기화 반복문
		buttonAll[i].disabled = false;
		buttonAll[i].style.backgroundColor="";
		buttonAll[i].style.color="";
		buttonAll[i].style.opacity = "";
		buttonAll[i].style.cursor = "";
	}//버튼 초기화 반복문
	var button = document.getElementById('t'+id);
	button.disabled = true;
	button.style.backgroundColor = "#265B3D";
	button.style.color = "white";
	button.style.opacity = "0.8";
	button.style.cursor = "default";
	$.ajax({
		type: 'post',
		url:'/miniProject/order/itemList',
		data: 'id='+id,
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div = $('<div class="item"/>');
				var inner = $('<div class="inner"/>');
				var img = $('<img class="itemImage"/>');
				img.attr('src',items.image);
				var seq = $('<input type="hidden" class="itemSeq">').val(items.seq)
				var name = $('<div class="itemName">').text(items.name)
				var price = $('<div class="itemPrice">').text(items.price)
				inner.append(img).append(name).append(price).append(seq);
				div.append(inner).appendTo($('#itemSection'))
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}
//탭클릭시 화면 변경
$('#t100').click(function(){
	$('#itemSection').empty();
	itemList(100);
	return false;
})
$('#t200').click(function(){
	$('#itemSection').empty();
	itemList(200);
	return false;
})
$('#t300').click(function(){
	$('#itemSection').empty();
	itemList(300);
	return false;
})
$('#t400').click(function(){
	$('#itemSection').empty();
	itemList(400);
	return false;
})
//메뉴 클릭시 추가
$('#itemSection').on('click','.item', function() {
	var sw = 0;
	var cartItem = document.querySelectorAll('.cartItem')
	for (var i = 0;i < cartItem.length;i++) {
		if(cartItem[i].querySelector('input[name="seq"]').value == $(this).find('.itemSeq').val()) {
			cartItem[i].classList.remove("cartAnimation");
			void cartItem[i].offsetWidth;
			cartItem[i].classList.add("cartAnimation");
			cartItem[i].style.animatioin = "item 0.6s";
			cartItem[i].scrollIntoView({behavior:'smooth',block: 'nearest'});
			cartItem[i].querySelector('input[name="count"]').value = parseInt(cartItem[i].querySelector('input[name="count"]').value) + 1;
			cartItem[i].querySelector('.cartCount').textContent = cartItem[i].querySelector('input[name="count"]').value;
			sw = 1;
			sum();
		}
	}
	
	if(sw == 0) {
		moveCart($(this).find('.itemImage').attr('src'));
		var div = $('<div class="cartItem"/>');
		var name = $('<span class="cartName"/>').text($(this).find('.itemName').text());
		var seq = $('<input type="hidden" class="cartSeq" name="seq">').val($(this).find('.itemSeq').val());
		var price = $('<input type="hidden" class="cartPrice">').val($(this).find('.itemPrice').text());
		var img = $('<img class="cartImage"/>');
		img.attr('src',$(this).find('.itemImage').attr('src'));
		var span = $('<span class="countBox"/>');
		var countHide = $('<input type="hidden" name="count" class="count"/>').val(1);
		var count = $('<span class="cartCount"/>').text(countHide.val());
		var plus = $('<button class="countP"/>');
		var minus = $('<button class="countM"/>');
		var removeCart = $('<button class="removeCart"/>');
		minus.click(function(){
			var parentC = $(this).parents('.cartItem')
			if(parentC.find('.count').val() == 1) {
				parentC.remove();
			} else {
				parentC.find('.count').val((parentC.find('.count').val()-1))
				parentC.find('.cartCount').text(parentC.find('.count').val())
			}
			sum();
		})
		plus.click(function(){
			var parentC = $(this).parents('.cartItem')
			if(parentC.find('.count').val() == 99) {
				alert('최대 수량입니다')
			} else {
				parentC.find('.count').val((parseInt(parentC.find('.count').val())+1))
				parentC.find('.cartCount').text(parentC.find('.count').val())
			}
			sum();
		})
		removeCart.click(function(){
			$(this).parents('.cartItem').remove();
			sum();
		})
		span.append(minus.text('-')).append(count).append(plus.text('+')).append(countHide)
		
		div.append(removeCart.html('&#10799;')).append(img).append(name).append(seq).append(price).append(span).prependTo('#cartSection');
		sum();
	}
});
//합계 추적
function sum() {
	var result = 0;
	var cartItem = document.querySelectorAll('.cartItem')
	for (var i = 0;i < cartItem.length;i++) { 
			result += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value
	}
	$('#sum').text(result);
	$('#sumPay').text(result);
	$('#resultPay').text(result-$('#pointUsed').val());
	if(cartItem.length > 0){
		if(cartItem.length > 1) $('#itemPay').text(cartItem[0].querySelector('.cartName').textContent + " 외 "+(cartItem.length-1)+"건");
		else $('#itemPay').text(cartItem[0].querySelector('.cartName').textContent);
	}
}
//전체 비우기
function removeAll() {
	var cartItem = document.querySelectorAll('.cartItem')
	for (var i = 0;i < cartItem.length;i++) { 
			cartItem[i].remove();
	}
	sum()
}
//주문하기
function order() {
	var cartItem = document.querySelectorAll('.cartItem')
	var storeName = $('#storeValueName').val();
	var storeSeq = $('#storeValueSeq').val();
	var id = $('#userId').val()
	var menuSeqAr = [];
	var cntAr = [];
	var result = 0;
	var pointUsed = parseInt($('#pointUsed').val());
	var resultString = storeName+"\n\n"+id+"님이\n\n";
	for (var i = 0;i < cartItem.length;i++) { 
		menuSeqAr.push(cartItem[i].querySelector('.cartSeq').value);
		cntAr.push(cartItem[i].querySelector('input[name="count"]').value);
		resultString += cartItem[i].querySelector('.cartName').textContent + " " + cartItem[i].querySelector('.cartPrice').value + "원 " + cartItem[i].querySelector('input[name="count"]').value + "개\n";
		result += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
	}
	result -= pointUsed;
	resultString += "\n포인트 사용 " + pointUsed  + "P";
	resultString += "\n결제 금액 " + (result+pointUsed)  + "원";
	resultString += "\n총 합 " + result + "원 주문하셨습니다."
	//주문표 DB에 작성
	$.ajax({
		type: 'post',
		url:'/miniProject/order/payment',
		data: 'id='+id+'&menuSeq='+menuSeqAr+'&cnt='+cntAr+'&total='+result+'&storeSeq='+storeSeq+'&pointUsed='+pointUsed,
		dataType: 'text',
		success: function(data){
			var orderNum = parseInt(data)%100
			var seq = data
			resultString += "\n\n주문번호 " + orderNum + "번"
			//카카오 전송
			$.ajax({
				type: 'post',
				url:'/miniProject/order/send',
				data: 'order='+resultString,
				success: function(){
				//적립
				$.ajax({
					type: 'post',
					url:'/miniProject/order/point',
					data: 'point='+result*0.1+'&pointUsed='+pointUsed+'&id='+id,
					success: function(){
						alert('주문 성공');
						location.href="complete?seq="+seq;
					},
					error: function(e) {
						alert('주문 실패 \n적립 실패');
					}
				})
				//
				},
				error: function(e) {
					alert('주문 실패 \n토큰 갱신 필요');
				}
			})
			//
		},
		error: function(e) {
			alert('주문 실패')
		}
	})
}
//장바구니 이동 css 구현
function moveCart(src) {
	var scrollX = window.scrollX || window.pageXOffset;
    var scrollY = window.scrollY || window.pageYOffset;

    var cursorX = event.clientX + scrollX -60;
    var cursorY = event.clientY + scrollY -60;
    
   	var cartSection = document.getElementById('cartSection');
   	
   	var cartX = cartSection.offsetLeft + 13;
   	var cartY = cartSection.offsetTop - 18;
   
    var img = $('<img class="itemMove">');
    img.css('position',"absolute")
    img.css('left',cursorX + "px")
    img.css('top',cursorY + "px")
    img.attr('src',src);

  	img.appendTo($('body'))
  	setTimeout(() => {
        img.css('left',cartX + "px")
    	img.css('top',cartY + "px")
    	img.css('opacity',"0.5")
    	img.css('transform',"scale(0.5)")
    	var cartItem = document.querySelectorAll('.cartItem')
    	cartItem[0].scrollIntoView({behavior:'smooth',block: 'nearest'});
    	setTimeout(() => {
    		img.css('display','none')
    	},1000 );
    }, 1);
}
//select바뀌면 뜨기
$(document).ready(function() {
	$('#storeSelect').change(function(){
		$('#storeList').html('')
		var region = $('#storeSelect option:selected').val();
		$.ajax({
		type: 'post',
		url:'/miniProject/order/storeList',
		data: "region="+region,
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div = $('<div class="storeItem"/>')
				var address = $('<input type="hidden" class="storeAddress"/>').val(items.address)
				var seq = $('<input type="hidden" class="storeSeq"/>').val(items.seq)
				var name = $('<input type="hidden" class="storeName"/>').val(items.name)
				var span = $('<span style="font-size:17px;font-weight:bold;float:left;"/>').text(items.name)
				var clear = $('<div style="clear:both"/>')
				var button = $('<button class="storeButton"/>').text('선택')
				var addDiv = $('<div style="font-size:13px;color:gray;"/>').text(items.address)
				div.append(address).append(seq).append(name).append(span).append(button).append(clear).append(addDiv).appendTo('#storeList')
			})
		},
		error: function(e) {
			console.log(e);
		}
		});
	})
});
//map api
window.onload=function() {
	var position = new daum.maps.LatLng(37.499440,127.028946);
	var container = document.getElementById("map");//지도를 표시할 div
	var options = {
			center:position,
			level:3,//지도의 확대 레벨
	};
	var map = new daum.maps.Map(container,options);
	var marker = new daum.maps.Marker({
		position: position//지도중심 좌표에 마커를 생성
	});//마커 생성
	marker.setMap(map);
}
//map api 도로명 으로 가져오기

function storeMap(roadAddress) {
	$('#map').html('')
	$.ajax({
       url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(roadAddress),
       type:'GET',
       headers: {'Authorization' : 'KakaoAK f44fef7bc69c69caec860d37b5f9c940'},
   success:function(data){
       	var position = new daum.maps.LatLng(data.documents[0].y,data.documents[0].x);
		var container = document.getElementById("map");//지도를 표시할 div
		var options = {
				center:position,
				level:3,//지도의 확대 레벨
		};
		var map = new daum.maps.Map(container,options);
		var marker = new daum.maps.Marker({
			position: position//지도중심 좌표에 마커를 생성
		});//마커 생성
		marker.setMap(map);
   },
   error : function(e){
       console.log(e);
   }
   });
}
//매장 검색

storeSearch = document.getElementById('storeSearch')
storeSearch.addEventListener("input",function(){
	$('#storeList').html('');
	var region = $('#storeSelect option:selected').val();
	var search = $('#storeSearch').val();
	$.ajax({
		type: 'post',
		url:'/miniProject/order/storeSearch',
		data: "region="+region+"&search="+search,
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var div = $('<div class="storeItem"/>')
				var address = $('<input type="hidden" class="storeAddress"/>').val(items.address)
				var seq = $('<input type="hidden" class="storeSeq"/>').val(items.seq)
				var name = $('<input type="hidden" class="storeName"/>').val(items.name)
				var span = $('<span style="font-size:17px;font-weight:bold;float:left;"/>').text(items.name)
				var clear = $('<div style="clear:both"/>')
				var button = $('<button class="storeButton"/>').text('선택')
				var addDiv = $('<div style="font-size:13px;color:gray;"/>').text(items.address)
				div.append(address).append(seq).append(name).append(span).append(button).append(clear).append(addDiv).appendTo('#storeList')
			})
		},
		error: function(e) {
			console.log(e);
		}
		});
})
//매장 클릭
$('#rightSectionTop').on('click','.storeItem', function() {
	storeMap($(this).find('.storeAddress').val());
	var storeItem = document.querySelectorAll('.storeItem');
	for (let i = 0; i < storeItem.length; i++) {
		storeItem[i].style.backgroundColor = 'white';
		storeItem[i].querySelector('.storeButton').style.display = 'none';
	}
	$(this).css('background-color','whitesmoke')
	$(this).find('.storeButton').css('display','block')
})
//메뉴 선택 활성화 여부
var mode = 0;
//매장 선택 완료
$('#rightSectionTop').on('click','.storeButton', function() {
	$('#storeValueSeq').val($(this).parents('.storeItem').find('.storeSeq').val())
	$('#storeValueName').val($(this).parents('.storeItem').find('.storeName').val())
	$('#mainTop').css('height','37px')
	var storeButton = document.querySelectorAll('.storeButton');
	for (let i = 0; i < storeButton.length; i++) {
		storeButton.disabled = true;
	}
	setTimeout(() => {
        $('#mainCenter').css('height','775px')
        mode = 1;
    }, 990);
})
//다시 매장 선택
$('#storeOpen').click(function(){
	if(mode == 1) {
		mode = 0;
		$('#mainCenter').css('height','37px')
		setTimeout(() => {
	        $('#mainTop').css('height','510px')
	        var storeButton = document.querySelectorAll('.storeButton');
			for (let i = 0; i < storeButton.length; i++) {
				storeButton.disabled = false;
			}
	    }, 990);
    } else if(mode == 2) {
    	if (payStatus == 0) {
			mode = 0;
			$('#mainBottom').css('height','35px')
			setTimeout(() => {
		        $('#mainTop').css('height','510px')
		        var storeButton = document.querySelectorAll('.storeButton');
				for (let i = 0; i < storeButton.length; i++) {
					storeButton.disabled = false;
				}
		    }, 990);
	    } else alert('결제를 완료해주세요');
    }
})
$('#menuOpen').click(function(){
	if (payStatus == 0) {
		if(mode == 2) {
			mode = 1;
			$('#mainBottom').css('height','35px')
			setTimeout(() => {
		        $('#mainCenter').css('height','775px')
		    }, 990);
	    }
	} else alert('결제를 완료해주세요');
})
$('#orderSubmit').click(function(){
	var cartItem = document.querySelectorAll('.cartItem')
	if(cartItem.length > 0) {
		$('#mainCenter').css('height','37px')
		setTimeout(() => {
	        $('#mainBottom').css('height','300px')
	        mode = 2;
	    }, 990);
	} else alert('상품을 담아주세요');
	
})

var payStatus = 0;
//카카오페이 결제 API
function kakaoPay(){
if (isNaN(document.getElementById('pointUsed').value) || document.getElementById('pointUsed').value == '') {
	$('#pointFont').text('포인트값이 올바르지 않습니다');	
	$('#pointUsed').focus();
} else {
	if(payStatus == 0) {
		var cartItem = document.querySelectorAll('.cartItem')
		var itemName;
		if(cartItem.length > 1) itemName = cartItem[0].querySelector('.cartName').textContent + " 외 "+(cartItem.length-1)+"건";
		else itemName = cartItem[0].querySelector('.cartName').textContent;
		var tot = 0;
		var cnt = 0;
		var payNum = 0;
		for (var i = 0;i < cartItem.length;i++) { 
			cnt += parseInt(cartItem[i].querySelector('input[name="count"]').value);
			tot += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
		}
		tot -= $('#pointUsed').val();
		if (tot == 0) {
			order();
		} else {
		//주문번호 가져오기
			$.ajax({
				url:'/miniProject/order/payNum',
				type:'POST',
				dataType: 'text',
				success:function(data){
			   		payNum = data;
			   		//결제
			   		$.ajax({
					url:'/miniProject/order/pay',
					type:'POST',
					data:'id='+payNum+'&itemName='+itemName+'&cnt='+cnt+'&tot='+tot,
					dataType: 'json',
					success:function(data){
						payStatus = 1;
				   		window.open(data.next_redirect_pc_url, 'pay', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
				    },
				    error : function(e){
				       	alert("결제 실패");
				    }
				    })
			    },
			    error : function(e){
			       	alert("결제 실패");
			    }
			    });
		    }
		} else alert('이미 진행중인 결제건입니다');
	}
}
//포인트 적용
$('#pointUsed').focusout(function(){
	$('#pointFont').text('')
	if (isNaN(document.getElementById('pointUsed').value) || document.getElementById('pointUsed').value == '') {
		$('#pointFont').text('포인트값이 올바르지 않습니다');	
		$('#pointUsed').val(0);
		$('#resultPay').text(tot);
		$('#kaPay').css('opacity','1')
		$('#caPay').css('opacity','1')
	} else {
		var cartItem = document.querySelectorAll('.cartItem')
		var tot = 0;
		var userPoint = parseInt($('#userPoint').val());
		var pointUsed = parseInt($('#pointUsed').val());
		for (var i = 0;i < cartItem.length;i++) { 
			tot += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
		}
		if (userPoint < pointUsed ) {
			$('#pointFont').text('포인트값이 올바르지 않습니다');	
			$('#pointUsed').val(0);
			$('#resultPay').text(tot);
			$('#kaPay').css('opacity','1')
			$('#caPay').css('opacity','1')
		} else {
			if (pointUsed < tot) {
				$('#resultPay').text(tot-pointUsed);
				$('#kaPay').css('opacity','1')
				$('#caPay').css('opacity','1')
			} else {
				$('#pointUsed').val(tot);
				$('#resultPay').text(0);
				$('#kaPay').css('opacity','0')
				$('#caPay').css('opacity','0')
			}
		}
	}
})
//전액 사용
$('#allUse').click(function(){
	$('#pointFont').text('')
	if (isNaN(document.getElementById('pointUsed').value) || document.getElementById('pointUsed').value == '') {
		$('#pointFont').text('포인트값이 올바르지 않습니다');	
		$('#pointUsed').val(0);
		$('#resultPay').text(tot);
	} else {
		var cartItem = document.querySelectorAll('.cartItem')
		var tot = 0;
		var userPoint = parseInt($('#userPoint').val());
		var pointUsed = parseInt($('#pointUsed').val());
		for (var i = 0;i < cartItem.length;i++) { 
			tot += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
		}
		if (userPoint < tot) {
			$('#pointUsed').val(userPoint);
			$('#resultPay').text(tot-userPoint);
			$('#kaPay').css('opacity','1')
			$('#caPay').css('opacity','1')
		} else {
			$('#pointUsed').val(tot);
			$('#resultPay').text(0);
			$('#kaPay').css('opacity','0')
			$('#caPay').css('opacity','0')
		}
	}
})
//카드 결제 API
function cardPay (){
	if (isNaN(document.getElementById('pointUsed').value) || document.getElementById('pointUsed').value == '') {
	$('#pointFont').text('포인트값이 올바르지 않습니다');	
	$('#pointUsed').focus();
	} else {
	if(payStatus == 0) {
		var cartItem = document.querySelectorAll('.cartItem')
		var itemName;
		if(cartItem.length > 1) itemName = cartItem[0].querySelector('.cartName').textContent + " 외 "+(cartItem.length-1)+"건";
		else itemName = cartItem[0].querySelector('.cartName').textContent;
		var tot = 0;
		var payNum = 0;
		for (var i = 0;i < cartItem.length;i++) { 
			tot += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
		}
		tot -= $('#pointUsed').val();
		if (tot == 0) {
			order();
		} else {
			$.ajax({
				url:'/miniProject/order/payNum',
				type:'POST',
				dataType: 'text',
				success:function(data){
					payStatus = 1;
					IMP.init('imp10723600')
				    IMP.request_pay({
				    pg: "kcp.A52CY",
				    pay_method: "card",
				    merchant_uid: "ORD20231013-"+(parseInt(data)+1),   // 주문번호
				    name: itemName,
				    amount: tot,//가격 - tot
				    buyer_email: $('#userEmail').val(),
				    buyer_name: $('#userName').val(),
				    buyer_tel: $('#userTel').val(),
				    buyer_addr: $('#userAdd').val()
				    }, function (rsp) { // callback
				    	if(rsp.success == true) order();
				    	else payStatus = 0;
				    });
				},
				 error : function(e){
				   	alert("결제 실패");
				}
			});	
		}
		} else alert('이미 진행중인 결제건입니다');
	} 
}
//결제방식 선택
var payChoice = 0;
$('#payBtn').click(function(){
	if (payChoice == 0) {
		var cartItem = document.querySelectorAll('.cartItem')
		var tot = 0;
		for (var i = 0;i < cartItem.length;i++) { 
			tot += cartItem[i].querySelector('input[name="count"]').value * cartItem[i].querySelector('.cartPrice').value;
		}
		tot -= $('#pointUsed').val();
		if (tot == 0) {
			order();
		} else {
			alert('결제 방식을 선택해주세요');
		}
	}
	else if(payChoice == 1) kakaoPay();
	else if(payChoice == 2) cardPay();
})
$('#kaPay').click(function(){
	$('#caPay').css('background-color','whitesmoke')
	$('#kaPay').css('background-color','darkgray')
	payChoice = 1;
})
$('#caPay').click(function(){
	$('#kaPay').css('background-color','whitesmoke')
	$('#caPay').css('background-color','darkgray')
	payChoice = 2;
})