<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<style>
.hidden{
	font-color : white;
	text-align : top-left;
	position:relative;
}
.content {
	color: #6F6F6F;
	font-family : 12px helvetica, "Nanum Gothic", 나눔고딕;
	
	width: 940px;
	margin: auto;

}
p.copy_1{
	color : #505050;
	font : 16.5px helvetica, "Nanum Gothic", 나눔고딕;
	margin : 100px 0px 30px;
}

h3 {
	color : #265B3D;
	font-family : 19px helvetica, "Nanum Gothic", 나눔고딕;
	margin-top: 50px;
		
}
.floatleft {
	color : #6F6F6F;
	font-size : 14px;
	font-family : helvetica, "Nanum Gothic", 나눔고딕;
	width: 49%; 
	height : 260px;
	float : left;
	margin : 0px 0px 100px 0px;

}
.floatright {
	color : #6F6F6F;
	font-size : 14px;
	font-family : helvetica, "Nanum Gothic", 나눔고딕;
	width: 49%;
	height : 200px;
	float: right;
	margin : 0 auto;

}
.about_hollys div{
    float: left;
    width:100%; 
    height:500px;
    background-size: cover;
    background-repeat: no-repeat;
    margin: auto;
    color: #ffffff;

}

.img_1 div{
   	width:100%; 
  	height:678px;
    background-size: contain;
    background-repeat: no-repeat;
    margin : -80px 0 0; 
    
}
.img_2{
	width: 100%;
	height : 500px;
	background-image: url('/miniProject/image/img_about_hollys_2.png');
	background-size: contain;
    background-repeat: no-repeat;
    margin : 270px 500px 0 0;
}

dt {
	font-size : 21px; 
	padding : 30px 0 0 40px;
}
strong {
	font-size : 29px;
	padding : 50px 0 150px 0px;
}
dd	{
	font-size : 16px;
	margin-top : 80px; 
	margin-left: 40px;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<div class="content">
	<div style="margin: 20px 10px 80px 10px;color: black;">
		<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > About Us
		<h1 style="margin-top: 10px;">About Us</h1>
	</div>
		<div class="about_hollys" >
			<div style="background-image: url('/miniProject/image/img_about_hollys.jpg');">
			<!-- <img src="/miniProject/image/img_about_hollys.jpg"  float="none;"> -->
				<dl>
					<dt>커피의 즐거움을 만드는 <br> <strong>'작은 차이의 미학'</strong></dt>
					<dd>스프링은 ‘의미 있는 작은 차이가 <br>평범함과 특별함을 가르는 기준이 된다’고 생각합니다.</dd>
				</dl>

			</div>
		</div>
		
		<br>
		<div>
			<p class="copy_1">
				&nbsp;<br>
				다양한 토양과 기후에서 자란 커피 원두는 그 속에 각기 다른 맛과 향의 비밀을 숨기고 있습니다.<br> 
				생두를 로스팅하여 에스프레소를 만드는 과정은 단순하고 평범해 보이지만, 사실은 로스팅과 추출법 등의 미묘하고 작은 차이가 
				커피 맛을 변화시킵니다. <br><br>
				원두에 숨겨진 이러한 커피의 비밀을 하나 하나 밝혀가면서 많은 사람들이 커피와 함께 소중한 순간을 즐기도록 해주는 것이
				바로 스프링이 추구하는 ‘커피의 즐거움’입니다.<br><br>
				오늘도 스프링은 전세계의 커피 산지를 연구하고, 원두 본연의 맛을 살리기 위한 수많은 블랜딩을 개발하는 등 다양한
				노력을 지속하고 있습니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를
				만들어가는 스프링이 되겠습니다.
			</p>
			
			<div class="copy_2">
				<h3>하나, 커피를 알아가는 즐거움</h3>
				<p class="floatleft">
					세상에 같은 사람이 존재할 수 없듯이 똑같은 원두도 존재하지 않습니다.<br> 숙련된 바리스타는 산지에 따라 각기 다른 원두의 비밀을 밝혀내고 고객의 입맛과 성향을 이해한 후 
					자신만의 커피 미학으로 섬세하게 커피를 내립니다. 그 결과 커피가 줄 수 있는 최상의 즐거움을 제공합니다. <br><br>
		
					이 즐거움을 위해 스프링은 1998년 국내 최초 에스프레소 커피 전문점의 문을 연 이래 지속적으로 커피 시장을 이끄는 새로운 시도를 해왔습니다.<br> 
					스프링연구소에서는 국제공인인증 커피 감별사인 큐그레이더가 커핑 테스트를 통해 생두를 엄선하고, 자체 로스팅 공장에서는 각 원산지의 특성을 고려한 프로파일로 로스팅하여 맛의 차이를 만듭니다. <br><br>
					더불어 원두를 태워 강한 맛을 내는 강배전 로스팅으로 그저 진하기만 한 커피를 만드는 대신, 스프링 고유의 로스팅 기법과 더블샷을 적용하여 원두
				</p>
				
				<p class="floatright">
					고유의 풍부한 향미를 살리고 있습니다. 이로써 스프링은 모두의 일상 깊숙이 들어온 커피 한 잔의 가치를 높입니다. <br><br>
					또한 2011년 업계 최초로 학원 인가를 취득, 운영 중인 스프링 아카데미는 많은 커피 애호가 및 창업 희망자를 위한 프로그램으로 수준 높은 커피 문화를 만드는 데 기여하고 있습니다. <br><br>
					지식은 쉽게 얻지만, 지혜를 얻는 데는 시간이 필요한 법입니다. <br>
					1998년 이후 이렇듯 성실하게 한 길만 걸으며 체득한 커피에 대한 지혜는 무엇과도 바꿀 수 없는 스프링의 소중한 자산임을 자부합니다.
				</p>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div class="img_1">
			<div style="background-image: url('https://www.hollys.co.kr/websrc/images/hollysIs/img_about_hollys_2.jpg');" alt="로스팅하는 이미지">
				<!-- <img src="https://www.hollys.co.kr/websrc/images/hollysIs/img_about_hollys_2.jpg"alt="로스팅하는 이미지" > -->
			</div>
		</div>
		
		<div class="copy_3">
			<h3>둘, 커피를 함께하는 즐거움</h3>
				<p class="floatleft">
					커피는 혼자 즐길 때, 또는 사람들과 함께 할 때 각기 다른 즐거움을 줍니다. 스프링에서는 친구, 연인, 가족과 함께 일상 속 즐거운 순간들을 만끽하셔도 좋고, 가끔은 혼자만의 시간을 누리셔도 좋습니다. 
					이를 위해 스프링은 편안하고 여유로운 공간에 그 이상의 가치를 담으려 다양한 노력을 하고 있습니다.<br><br>
					스프링은 다양한 라이프스타일을 반영한 공간으로 변화하고 있습니다. 부산송정점, 속초영랑해변점, 영종덕교점 등 탁 트인 오션뷰가 매력적인 매장, 경주 보불로점, 
					인천한옥마을점 등 한국 정취가 느껴지는 한옥 매장, 반려동물과 함께 이용할 수 있는 제주연북로점, 공덕경의선숲길점 등은 새로운 공간을 제안하는 스프링의 고민과 열정을 보여줍니다. 
				</p>
				
				<p class="floatright">
					공간뿐만 아니라 커피와 어우러져 즐거움을 주는 요소로서 엄선된 재료로 만든 다양한 디저트 메뉴 또한 스프링의 자랑입니다. 
					100% 국내산 고구마와 고흥 유자 등의 과일, 마다가스카르산 바닐라, 스리랑카산 딤블라 홍차 등 커피와 어우러지는 디저트의 재료 역시 커피 원두만큼 깐깐하게 관리되기에 믿을 수 있습니다. <br>
					이 디저트들은 개발단계에서부터 스프링의 음료와의 조화로움을 염두에 둔 덕분에 함께할 때 더욱 풍부한 맛을 즐기실 수 있습니다. <br><br>
					이처럼 스프링은 고객님께 최고의 즐거움과 특별함을 선사하기 위한 노력을 멈추지 않을 것입니다. 특별함을 위한 작은 차이는 이러한 노력에서 비롯됩니다. 
				</p>
				<div class="img_2">	</div>
					
		</div>
	<div style="clear: both;"></div>
</div>
	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>		
</body>
</html>