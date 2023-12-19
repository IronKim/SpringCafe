$(function(){
	
	var point = $('#userPoint').val();
	var gold = (300000*10) - (parseInt(point)*10);
	var red = (700000*10) - (parseInt(point)*10);
		
		if(point < 300000){
			$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_silver1.png");
			document.getElementById('gradeT').innerText = "SILVER";
			document.getElementById('gradeT').style.color = "silver";
			
			document.getElementById('add_grade').innerText = "GOLD";
			document.getElementById('add_grade').style.color = "#C5A56C";
			document.getElementById('add').innerText = gold;
		}else if(point < 700000){
			$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_gold1.png");
			document.getElementById('gradeT').innerText = "GOLD";
			document.getElementById('gradeT').style.color = "#C5A56C";
			
			document.getElementById('add_grade').innerText = "RED";
			document.getElementById('add_grade').style.color = "red";
			document.getElementById('add').innerText = red;
		}else if(point < 1000000){
			$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_red1.png");
			document.getElementById('gradeT').innerText = "RED";
			document.getElementById('gradeT').style.color = "red";
			
			document.getElementById('gradebar_p').innerText = "구매금액 상위1% 달성시 DIAMOND등급업!";
			
		}else{
			$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_dia1.png");
			document.getElementById('grade').style.backgroundColor = "#265B3D";
			document.getElementById('gradeT').innerText = "DIAMOND";
			document.getElementById('gradeT').style.color = "lightgray";
			
			document.getElementById('gradebar_p').innerText = "구매금액 상위1%로 최고등급 입니다.";
		}

/*
$(function(){
		var point = $('#userPoint').val();
		
		if(point == null){
			document.getElementById('idid').css("display" ,"none");
		}
}
*/
/*
$(function(){

	$.ajax({
	type: 'post',
	url:'/miniProject/membership/grade',
	dataType: 'json',
	success: function(data){
		
			var tr = $('<tr height="20"/>')
			var td1 = $('<td/>').text(data.id);
			var td2 = $('<td/>').text(data.point);
			
			tr.append(td1).append(td2).appendTo($('#grade'))
		
	},
	error: function(e) {
		console.log(e);
	}
	})

});
*/
/*
$(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject/membership/loginId',
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			$('#grade').val(data.id);
			
		},
		error: function(e){
			console.log(e);
		}
	});
});
*/
////////////
/*
$(function(){
	$.ajax({
		type: 'post',
		url:'/miniProject/membership/loginId',
		dataType: 'json',
		success: function(data){
			
				var tr = $('<tr height="20"/>')
				var td1 = $('<td width="150"/>').text(data);
				tr.append(td1).appendTo($('#idid'))
			
		},
		error: function(e) {
			console.log(e);
		}
	})

});*/
	
	/*$.ajax({
		type: 'post',
		url:'/miniProject/membership/grade',
		dataType: 'json',
		success: function(data){
			
			var point = data.point;
			console.log(JSON.stringify(point));
				if(point < 10000){
					console.log(JSON.stringify(point));
					$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_silver1.png");
				}else if(point < 50000){
					console.log(JSON.stringify(point));
					$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_gold1.png");
				}else{
					console.log(JSON.stringify(point));
					$("#gradeimg").attr("src", "https://www.hollys.co.kr/websrc/images/membership/img_membership_red1.png");
				}
				
		},
		error: function(e) {
			console.log(e);
		}
	})
	*/
});






























