$(function(){   //onload function start
	
	$('#mapSelect').change(function(){
		reset();
		
		var region = $('#mapSelect option:selected').val()
		
		if($('#mapSelect option').index($('#mapSelect option:selected')) === 0){
			return;
		}
		
		mapSelect(region);
	});
	
	function mapSelect(region){
		reset();
		
		$.ajax({
			type: 'post',
			url: '/miniProject/store/getStoreList',
			data: 'region=' + region,
			dataType: 'json',
			success: function(data){
				//console.log(JSON.stringify(data));
				
				$.each(data, function(index, items){
				$('<tr/>',{
					class : 'region'
				}).append($('<td/>',{
					text : items.region,
					align : 'center'
				})).append($('<td/>',{
					text : items.name,
					align : 'center'
				})).append($('<td/>',{
					text : items.address,
					align : 'center'
				})).append($('<td/>',{
					text : items.tel,
					align : 'center'
				})).appendTo($('#regionTable'));
			});//$.each
				
			},
			error: function(e){
				console.log(e)
			}
		});
	}
	function reset(){
	
		let td = $('.region');
		
		$.each(td, function(index, items){
			items.remove();
		});
	}
});






function mapClick(region, event){
	    event.preventDefault();
	    $('#mapSelect').val(region);
	    $('#mapSelect').trigger('change');
		}
		function mapHover(region){
			switch(region) {
		        case '서울':
		            $('.city_layer01').show();
		            break;
		        case '부산':
		        	$('.city_layer02').show();
		            break;
		        case '대구':
		        	$('.city_layer03').show();
		            break;
		        case '인천':
		        	$('.city_layer04').show();
		            break;
		        case '광주':
		        	$('.city_layer05').show();
		            break;
		        case '대전':
		        	$('.city_layer06').show();
		            break;
		        case '울산':
		        	$('.city_layer07').show();
		            break;
		        case '강원':
		        	$('.city_layer08').show();
		            break;
		        case '경기':
		        	$('.city_layer09').show();
		            break;
		        case '경남':
		        	$('.city_layer10').show();
		            break;
		        case '경북':
		        	$('.city_layer11').show();
		            break;
		        case '전남':
		        	$('.city_layer12').show();
		            break;
		        case '전북':
		        	$('.city_layer13').show();
		            break;
		        case '충남':
		        	$('.city_layer14').show();
		            break;
		        case '충북':
		        	$('.city_layer15').show();
		            break;
		        case '제주':
		        	$('.city_layer16').show();
		            break;
	    	}
		}
		
		function mouseOut(region){
			switch(region) {
	        case '서울':
	            $('.city_layer01').hide();
	            break;
	        case '부산':
	        	$('.city_layer02').hide();
	            break;
	        case '대구':
	        	$('.city_layer03').hide();
	            break;
	        case '인천':
	        	$('.city_layer04').hide();
	            break;
	        case '광주':
	        	$('.city_layer05').hide();
	            break;
	        case '대전':
	        	$('.city_layer06').hide();
	            break;
	        case '울산':
	        	$('.city_layer07').hide();
	            break;
	        case '강원':
	        	$('.city_layer08').hide();
	            break;
	        case '경기':
	        	$('.city_layer09').hide();
	            break;
	        case '경남':
	        	$('.city_layer10').hide();
	            break;
	        case '경북':
	        	$('.city_layer11').hide();
	            break;
	        case '전남':
	        	$('.city_layer12').hide();
	            break;
	        case '전북':
	        	$('.city_layer13').hide();
	            break;
	        case '충남':
	        	$('.city_layer14').hide();
	            break;
	        case '충북':
	        	$('.city_layer15').hide();
	            break;
	        case '제주':
	        	$('.city_layer16').hide();
	            break;
    		}
		}
		
		