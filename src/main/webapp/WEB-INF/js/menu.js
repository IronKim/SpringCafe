$(function(){
	$.ajax({
		type: 'get',
		url: '/miniProject/menu/getMenu',
		dataType: 'json',
		success: function(data){
		console.log(JSON.stringify(data));
		
		$.each(data, function(index, item){
		
		var container;
		
        if (item.id == 100) {
          container = 'coffee';
        } else if (item.id == 200) {
          container = 'dessert';
        } else if (item.id == 300 || item.id == 500) {
          container = 'beverage';
        } else {
          container = 'MD';
        }
        
		var result =`<div class="container text-center" id="` + container + `">` +
						`<div align="left"><h4>` + item.id + `</h4></div>` +
							`<div class="row">` +
							    `<div class="col-lg-4" style="width: 18rem;">` +
							      `<div class="card" style="width: 18rem;">` +
									  `<img src="` + image + `" class="card-img-top">` +
									    `<h5 class="card-title">` + item.name + `</h5>` +
										`<div class="card-body">` +
										`<p class="card-text">` + item.content + `</p>` + 
									    `<input type="button" class="order" value="주문하기">` +
									  `</div>`+
									`</div>`+
							    `</div>`+
					    	`</div>`+
						`</div>`
						
						
			$('#' + container).append(result);
			});
		},
		error: function(e){
			console.log(e);
		},
	});
});