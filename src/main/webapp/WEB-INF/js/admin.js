$(function(){//onload function start
	memberList();
	menuList();
	storeList();
	payList();
//onload function end
});
//멤버 리스트 불러오기
function memberList() {
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/memberList',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var tr = $('<tr height="20" class="memberItem"/>')
				var check = $('<input type="checkbox" name="selectMember"/>');
				check.val(items.seq);
				var td1 = $('<td width="50"/>').append(check);
				var td2 = $('<td width="100" class="m100"/>').text(items.name);
				var td3 = $('<td width="130" class="m130" id="memberId"/>');
				var div = $('<div class="idDiv"/>').text(items.id)
				var td4 = $('<td width="120"/>').text(items.point-items.pointUsed);
				var point = $('<button class="point"/>').text('증감')
				var hidden = $('<input type="hidden" class="memberSeq">').val(items.seq);
				td3.append(div)
				td4.append(point)
				tr.append(td1).append(td2).append(td3).append(td4).append(hidden).appendTo($('#memberList'))
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}
//맴버 마일리지 변경
$('#memberList').on('click','.point',function(){
	var point = prompt("증감할 마일리지를 입력하세요(숫자,음수는 앞에 -기호)")
	var id = $(this).parents('.memberItem').find('#memberId').text()
	if(point != null) {
		$.ajax({
		type: 'post',
		url:'/miniProject/admin/memberPoint',
		data:'id='+id+'&point='+point,
		success: function(){
			alert('변경 완료')
			$('#memberList').empty();
			memberList();
		},
		error: function(e) {
			alert('변경 실패')
			console.log(e);
		}
		})
	}
	return false;
})
//맴버 상세정보
$('#memberList').on('mousemove','.idDiv',function(event){
	var seq = $(this).parents('.memberItem').find('.memberSeq').val();
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/memberSelect',
		data:'seq='+seq,
		dataType:'json',
		success: function(data){
			$('#info').remove();
			var scrollX = window.scrollX || window.pageXOffset;
		    var scrollY = window.scrollY || window.pageYOffset;
		    var cursorX = event.clientX + scrollX;
		    var cursorY = event.clientY + scrollY;
			var div = $('<div id="info"/>')
			div.html("아이디 "+data.id+" 이름 "+data.name+" 이메일 "+data.email+" 전화번호 "+
			data.phoneNumber+"<br>주소 "+data.address+" 누적 포인트 "+data.point+" 사용한 포인트 "+data.pointUsed);
			div.css('left',cursorX+'px')
			div.css('top',cursorY+'px')
			$(document).mousemove(function(){
				div.remove();
			})
			div.appendTo('body');
		},
		error: function(e) {
			alert('조회 실패')
			console.log(e);
		}
		})
})
//멤버 삭제
$('#memberDelete').click(function(){
	if($("input[name='selectMember']:checked").length > 0) { 
		if(confirm('정말 삭제 하시겠습니까?')) {
				var selectMember = [];
				$("input[name='selectMember']:checked").each(function() {
		        	selectMember.push($(this).val());
		        });
		        var deleteData = JSON.stringify(selectMember);
				$.ajax({
				type: 'post',
				url:'/miniProject/admin/memberDelete',
				data: deleteData,
				contentType: 'application/json',
				success: function(){
					alert('삭제 완료');
					$('#memberList').empty();
					memberList();
				},
				error: function(e) {
					console.log(e);
				}
				});
		}
	} else alert('선택된 항목이 없습니다.')
})
//메뉴 리스트 불러오기
function menuList() {
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/menuList',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var tr = $('<tr height="20" class="menuItem"/>')
				var check = $('<input type="checkbox" name="selectMenu" id="selectMenu"/>');
				check.val(items.seq);
				var td1 = $('<td width="50"/>').append(check);
				var td2 = $('<td width="80" />').text(items.id);
				var td3 = $('<td width="150" class="m150" id="menuName"/>')
				var div = $('<div class="nameDiv"/>').text(items.name);
				var td4 = $('<td width="120" />').text(items.price);
				var hidden = $('<input type="hidden" class="menuSeq"/>').val(items.seq);
				td3.append(div);
				tr.append(td1).append(td2).append(td3).append(td4).append(hidden).appendTo($('#menuList'))
			});
		},
		error: function(e) {
			console.log(e);
		}
	});
}
//메뉴 삭제
$('#menuDelete').click(function(){
	if($("input[name='selectMenu']:checked").length > 0) { 
		if(confirm('정말 삭제 하시겠습니까?')) {
				var selectMenu = [];
				$("input[name='selectMenu']:checked").each(function() {
		        	selectMenu.push($(this).val());
		        });
		        var deleteData = JSON.stringify(selectMenu);
				$.ajax({
				type: 'post',
				url:'/miniProject/admin/menuDelete',
				data: deleteData,
				contentType: 'application/json',
				success: function(){
					alert('삭제 완료');
					$('#menuList').empty();
					menuList();
				},
				error: function(e) {
					console.log(e);
				}
				});
		}
	}else alert('선택된 항목이 없습니다.');
})
//메뉴 등록
$('#menuSubmit').click(function(){
	$.ajax({
	type: 'post',
	url:'/miniProject/admin/menuAdd',
	data: $('#menuAdd').serialize(),
	success: function(){
		alert('등록 완료');
		$('#menuList').empty();
		menuList();
		$('#menuAdd')[0].reset();
	},
	error: function(e) {
		console.log(e);
	}
	});
})
//이미지링크 미리보기
$('#imageLink').focusout(function(){
	$('#imgThumb').attr('src',$('#imageLink').val());
	return false;
})
$('#imgThumb').on('error', function() {
	$('#imgThumb').attr('src','/miniProject/image/no-image.jpg');
});
//메뉴 상세정보
$('#menuList').on('mousemove','.nameDiv',function(event){
	var seq = $(this).parents('.menuItem').find('.menuSeq').val();
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/menuSelectOne',
		data:'seq='+seq,
		dataType:'json',
		success: function(data){
			$('#info').remove();
			var scrollX = window.scrollX || window.pageXOffset;
		    var scrollY = window.scrollY || window.pageYOffset;
		    var cursorX = event.clientX + scrollX;
		    var cursorY = event.clientY + scrollY;
		    var img = $('<img id="infoImg"/>');
		    img.attr('src',data.image);
			var div = $('<div id="info"/>')
			div.html("분류번호 "+data.id+" 이름 "+data.name+" 가격 "+data.price+"<br>내용 "+data.content+"<br>");
			div.append(img);
			div.css('left',cursorX+'px')
			div.css('top',cursorY+'px')
			$(document).mousemove(function(){
				div.remove();
			})
			div.appendTo('body');
		},
		error: function(e) {
			alert('조회 실패')
			console.log(e);
		}
		})
})
//멤버 검색
var memberSearch=document.getElementById('memberSearch');
memberSearch.addEventListener("input",function(){
var memberItem=document.querySelectorAll('.memberItem');
	for(let i = 0;i < memberItem.length;i++) {
		if(memberItem[i].querySelector('td[id="memberId"]').textContent.includes(memberSearch.value)) 
			memberItem[i].style.display = "table-row";
		else memberItem[i].style.display = "none";
	}
})
//메뉴 검색
var menuSearch=document.getElementById('menuSearch');
menuSearch.addEventListener("input",function(){
var menuItem=document.querySelectorAll('.menuItem');
	for(let i = 0;i < menuItem.length;i++) {
		if(menuItem[i].querySelector('td[id="menuName"]').textContent.includes(menuSearch.value)) 
			menuItem[i].style.display = "table-row";
		else menuItem[i].style.display = "none";
	}
})
//매장 검색
var storeSearch=document.getElementById('storeSearch');
storeSearch.addEventListener("input",function(){
var storeItem=document.querySelectorAll('.storeItem');
	for(let i = 0;i < storeItem.length;i++) {
		if(storeItem[i].querySelector('td[id="storeName"]').textContent.includes(storeSearch.value)) 
			storeItem[i].style.display = "table-row";
		else storeItem[i].style.display = "none";
	}
})
//주문
var paySearch=document.getElementById('paySearch');
paySearch.addEventListener("input",function(){
var payItem=document.querySelectorAll('.payItem');
	for(let i = 0;i < payItem.length;i++) {
		if(payItem[i].querySelector('td[id="payId"]').textContent.includes(paySearch.value)) 
			payItem[i].style.display = "table-row";
		else payItem[i].style.display = "none";
	}
})
//메뉴 체크시 정보 넣기
$(document).on('change','#selectMenu',function() {
    if ($(this).is(':checked')) {
    	$.ajax({
		type: 'post',
		url:'/miniProject/admin/menuSelectOne',
		data: "seq="+$(this).val(),
		dataType: 'json',
		success: function(data){
			$('#menuId').val(data.id);
			$('#menuNam').val(data.name);
			$('#menuPrice').val(data.price);
			$('#imageLink').val(data.image);
			$('#menuContent').val(data.content);
			$('#imgThumb').attr('src',data.image);
		},
		error: function(e) {
			console.log(e);
		}
	});
    }
})
//매장 체크시 정보 넣기
$(document).on('change','#selectStore',function() {
    if ($(this).is(':checked')) {
    	$.ajax({
		type: 'post',
		url:'/miniProject/admin/storeSelectOne',
		data: "seq="+$(this).val(),
		dataType: 'json',
		success: function(data){
			$('#storeRegion').val(data.region);
			$('#storeNam').val(data.name);
			$('#storeTel').val(data.tel);
			$('#storeAddress').val(data.address);
		},
		error: function(e) {
			console.log(e);
		}
	});
    }
})
//매장 리스트 불러오기
function storeList() {
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/storeList',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var tr = $('<tr height="20" class="storeItem"/>')
				var check = $('<input type="checkbox" name="selectStore" id="selectStore"/>');
				check.val(items.seq);
				var td1 = $('<td width="50"/>').append(check);
				var td2 = $('<td width="130" class="m130" id="storeName"/>').text(items.name);
				var td3 = $('<td width="80" />')
				var div = $('<div class="regionDiv"/>').text(items.region);
				var td4 = $('<td width="140"/>').text(items.tel);
				var hidden = $('<input type="hidden" class="storeSeq">').val(items.seq)
				td3.append(div);
				tr.append(td1).append(td2).append(td3).append(td4).append(hidden).appendTo($('#storeList'))
			});
		},
		error: function(e) {
			console.log(e);
		}
	});
}
//매장 등록
$('#storeSubmit').click(function(){
	$.ajax({
	type: 'post',
	url:'/miniProject/admin/storeAdd',
	data: $('#storeAdd').serialize(),
	success: function(){
		alert('등록 완료');
		$('#storeList').empty();
		storeList();
		$('#storeAdd')[0].reset();
	},
	error: function(e) {
		console.log(e);
	}
	});
})
//매장 삭제
$('#storeDelete').click(function(){
	if($("input[name='selectStore']:checked").length > 0) {
		if(confirm('정말 삭제 하시겠습니까?')) {
				var selectStore = [];
				$("input[name='selectStore']:checked").each(function() {
		        	selectStore.push($(this).val());
		        });
		        var deleteData = JSON.stringify(selectStore);
				$.ajax({
				type: 'post',
				url:'/miniProject/admin/storeDelete',
				data: deleteData,
				contentType: 'application/json',
				success: function(){
					alert('삭제 완료');
					$('#storeList').empty();
					storeList();
				},
				error: function(e) {
					console.log(e);
				}
				});
		}
	} else alert('선택된 항목이 없습니다.')
})
//매장 상세정보
$('#storeList').on('mousemove','.regionDiv',function(event){
	var seq = $(this).parents('.storeItem').find('.storeSeq').val();
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/storeSelectOne',
		data:'seq='+seq,
		dataType:'json',
		success: function(data){
			$('#info').remove();
			var scrollX = window.scrollX || window.pageXOffset;
		    var scrollY = window.scrollY || window.pageYOffset;
		    var cursorX = event.clientX + scrollX;
		    var cursorY = event.clientY + scrollY;
			var div = $('<div id="info"/>')
			div.html("상세 주소 "+data.address);
			div.css('left',cursorX+'px')
			div.css('top',cursorY+'px')
			$(document).mousemove(function(){
				div.remove();
			})
			div.appendTo('body');
		},
		error: function(e) {
			console.log(e);
		}
		})
})
//주문목록 리스트 불러오기
function payList() {
	$.ajax({
		type: 'post',
		url:'/miniProject/admin/payList',
		dataType: 'json',
		success: function(data){
			$.each(data, function(index, items){
				var tr = $('<tr height="20" class="payItem"/>')
				var td1 = $('<td width="70"/>').text(items.seq);
				var td2 = $('<td width="100" class="m100"/>').text(items.storeSeq);
				var td3 = $('<td width="130" class="m130" id="payId"/>');
				var div = $('<div class="payDiv"/>').text(items.id)
				var td4 = $('<td width="100"/>').text(items.total);
				var hidden = $('<input type="hidden" class="paySeq">').val(items.seq);
				td3.append(div)
				tr.append(td1).append(td2).append(td3).append(td4).append(hidden).prependTo('#payList')
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}
//주문목록 상세정보
$('#payList').on('mousemove','.payDiv',function(event){
	var seq = $(this).parents('.payItem').find('.paySeq').val();
	$.ajax({
		type: 'post',
		url:'/miniProject/order/selectPayment',
		data:'seq='+seq,
		dataType:'json',
		success: function(data){
			$('#info').remove();
			var scrollX = window.scrollX || window.pageXOffset;
		    var scrollY = window.scrollY || window.pageYOffset;
		    var cursorX = event.clientX + scrollX;
		    var cursorY = event.clientY + scrollY;
			var div = $('<div id="info"/>')
			//배열 대입
			var menuSeqAr = [];
			var cntAr = [];
			menuSeqAr = data.menuSeq.split(",");
			cntAr = data.cnt.split(",");
			for (var i = 0;i < menuSeqAr.length;i++) {
				$.ajax({
				type: 'post',
				url:'/miniProject/order/paymentList',
				data: 'seq='+menuSeqAr[i]+"&num="+cntAr[i],
				dataType: 'json',
				success: function(data){
						var span = $('<span class="payInfo"/>').text(data.list.name + " "+data.num+"개 "
						+data.list.price*data.num+"원")
						var br = $('<br/>')
						div.append(span).append(br)
				},
				error: function(e) {
					console.log(e);
				}
				})
			}//for
			//배열 대입 끝
			var div2 = $('<div class="payInfo"/>').html("사용포인트 " + data.pointUsed + 
			"<br>결제 총" + data.total + "원<br><br>")
			div.css('left',cursorX+'px')
			div.css('top',cursorY+'px')
			$(document).mousemove(function(){
				div.remove();
			})
			div.append(div2).appendTo('body');
		},
		error: function(e) {
			console.log(e);
		}
		})
})
//토큰 찾기
$('#token').click(function(){
	window.open('https://kauth.kakao.com/oauth/authorize?client_id=3f565d247c5c13e62128504de6d8297d&response_type=code&redirect_uri=http://localhost:8080/miniProject/admin/token', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
});