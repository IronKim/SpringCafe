
$('#chatBtn').click(function(){
	$('#chatWindow').css('display','block')
	$('#chatBtn').css('display','none')
	$('#chatWindow').css('animation','chatUp 1s')
	document.getElementById('chatBtn').disabled = true;
	setTimeout(() => {
		off = 0;
		count = 0;
		autoReload();
		document.getElementById('resetM').disabled = true;
		$('#resetM > img').css('animation-play-state','running')
		$('#reDivM').css('color','green')
		$('#reDivM').text('실시간 채팅 활성화')
		setTimeout(() => {
			windowOX = 1;
		}, 500);
	}, 490);
})
$('#closeChatM').click(function(){
	$('#chatWindow').css('animation','chatDown 1s')
	setTimeout(() => {
		$('#chatWindow').css('display','none')
		$('#chatBtn').css('display','block')
		document.getElementById('chatBtn').disabled = false;
		document.getElementById('resetM').disabled = false;
		$('#resetM > img').css('animation-play-state','paused')
		$('#reDivM').css('color','gray')
		$('#reDivM').text('실시간 채팅 비활성화')
		count = 15;
		off = 1;
		windowOX = 0;
	},650);
})
$('#outChatM').click(function(){
	location.href="/miniProject/chat/chat";
})
var windowAr = window.location.href.split("/");
if(windowAr[windowAr.length-1].includes("chat")){
	$('#chatBtn').css('display','none');
}


//===================채팅 메커니즘======================================
$(function(){
	document.getElementById('resetM').disabled = true;
	document.getElementById('submitM').disabled = true;
})
var windowOX = 0;
var seq = 0;
var count = 0;
var off = 1;
var dup = 0;
function autoReload() {
if(dup == 0) {
	reload();
}
	count++;
	if(count < 15) {//갱신 카운트
		setTimeout(() => {
			autoReload();
			var divs = document.querySelectorAll('.areaM')
			for(let i = 20;i < divs.length;i++) {
				divs[i].remove();
			}
	    },2000 );
    } else {
    	document.getElementById('resetM').disabled = false;
    	$('#resetM > img').css('animation-play-state','paused')
    	$('#reDivM').css('color','gray')
    	$('#reDivM').text('실시간 채팅 비활성화')
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
			var userSeq = $('#seqM').val();
			if(data.length>0)seq = data[0].seq;
			$.each(data.reverse(), function(index, items){
				var div1 = $('<div class="areaM"/>')
				var div2 = $('<div class="nameM"/>').text(items.name)
				var clear = $('<div style="clear:both"/>');
				var div3 = $('<div class="timeM"/>').text(items.logtime)
				var div4 = $('<div class="contentM"/>').text(items.content);
				if(userSeq == items.userSeq) {
					div1.css('float','right');
					div2.css('text-align','right')
					div3.css('text-align','right')
					div4.css('background','#5d8469');
					div4.css('color','white');
					div1.append(div2).append(clear).append(div3).append(div4).prependTo('#messageSectionM')
				}
				else {
					div1.css('float','left');
					div1.append(div2).append(clear).append(div3).append(div4).prependTo('#messageSectionM')
				}
				clear.prependTo('#messageSectionM')
				dup = 0;
			});
		},
		error: function(e) {
			console.log(e);
		}
	})
}
var content = document.getElementById('contentM');
content.addEventListener("input",function(){
	if(content.value.trim() != '') document.getElementById('submitM').disabled = false;
	else document.getElementById('submitM').disabled = true;
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
			data: $('#chatFormM').serialize(),
			success: function(){
				dup = 1;
				reload();
			},
			error: function(e) {
				console.log(e);
			}
		})
		$('#contentM').val('');
		document.getElementById('submitM').disabled = true;
		if(off == 1) {
			off = 0;
			count = 0;
			autoReload();
			document.getElementById('resetM').disabled = true;
			$('#resetM > img').css('animation-play-state','running')
			$('#reDivM').css('color','green')
	    	$('#reDivM').text('실시간 채팅 활성화')
		}
		return false;
	}
}
$('#submitM').click(function(){
	chatSubmit();
})
$('#resetM').click(function(){
	off = 0;
	count = 0;
	autoReload();
	document.getElementById('resetM').disabled = true;
	$('#resetM > img').css('animation-play-state','running')
	$('#reDivM').css('color','green')
    $('#reDivM').text('실시간 채팅 활성화')
})

const chatWindow = document.getElementById('chatWindow');
document.addEventListener('click', function(event) {
	if(windowOX == 1) {
	    if (event.target !== chatWindow  && !chatWindow.contains(event.target)) {
	        $('#chatWindow').css('animation','chatDown 1s')
			setTimeout(() => {
				$('#chatWindow').css('display','none')
				$('#chatBtn').css('display','block')
				document.getElementById('chatBtn').disabled = false;
				document.getElementById('resetM').disabled = false;
				$('#resetM > img').css('animation-play-state','paused')
				$('#reDivM').css('color','gray')
				$('#reDivM').text('실시간 채팅 비활성화')
				count = 15;
				off = 1;
				windowOX = 0;
			},650);
	    }
	}
});
// ================================================================


// 상단 이동 화살표
function scrollToTop() {
  // Scroll to the top with smooth animation
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Initially show the button
var scrollToTopBtn = document.getElementById('scrollToTopBtn');
scrollToTopBtn.style.display = 'block';

// Add a click event listener to scroll to the top when the button is clicked
scrollToTopBtn.addEventListener('click', function() {
  scrollToTop();
});

var isScrolling = false;

// Function to scroll to the top of the page
function scrollToTop() {
  if (isScrolling) {
    return;
  }

  isScrolling = true;

  // Scroll to the top with smooth animation
  window.scrollTo({ top: 0, behavior: 'smooth' });

  // After scrolling is complete, re-enable scrolling
  setTimeout(function() {
    isScrolling = false;
  }, 1000); // 1 second timeout
}

// Add an event listener to show/hide the button based on scroll position
window.addEventListener('scroll', function() {
  // Check if scrolling is currently disabled
  if (isScrolling) {
    return;
  }

  var scrollToTopBtn = document.getElementById('scrollToTopBtn');
  if (window.pageYOffset > 300) {
    scrollToTopBtn.style.display = 'block';
  } else {
    scrollToTopBtn.style.display = 'none';
  }
});
