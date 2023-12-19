<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link  rel="stylesheet" href="../css/map.css" type="text/css">
<link  rel="stylesheet" href="../css/animation.css" type="text/css">
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
	
		<div class="storeContainer">
		<div style="margin: 20px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Map > StoreSearch
			<h1 style="margin-top: 10px;">매장 검색</h1>
		</div>
		<div class="mapContainer">
			<img src="../image/img_map.png"  alt="전국지도" usemap="#MapStore" id="map" />
			<map name="MapStore" id="MapStore">
				<area shape="poly" coords="169,127,180,125,187,136,177,142,167,142,166,130" href="#" class="city01" alt="서울" onmouseover="mapHover('서울')" onmouseout="mouseOut('서울')" onclick="mapClick('서울', event)" />
				<area shape="poly" coords="263,306,276,303,295,290,304,298,289,318" href="#" class="city02" alt="부산" onmouseover="mapHover('부산')" onmouseout="mouseOut('부산')" onclick="mapClick('부산', event)" />
				<area shape="poly" coords="251,252,268,244,278,254,268,271,256,270" href="#" class="city03" alt="대구" onmouseover="mapHover('대구')" onmouseout="mouseOut('대구')" onclick="mapClick('대구', event)" />
				<area shape="poly" coords="150,130,159,126,166,147,157,152" href="#" class="city04" alt="인천" onmouseover="mapHover('인천')" onmouseout="mouseOut('인천')" onclick="mapClick('인천', event)" />
				<area shape="poly" coords="150,304,162,303,175,310,169,320,158,326,147,313" href="#" class="city05" alt="광주" onmouseover="mapHover('광주')" onmouseout="mouseOut('광주')" onclick="mapClick('광주', event)" />
				<area shape="poly" coords="191,212,202,228,192,234,185,222" href="#" class="city06" alt="대전" onmouseover="mapHover('대전')" onmouseout="mouseOut('대전')" onclick="mapClick('대전', event)"/>
				<area shape="poly" coords="301,291,286,280,291,271,318,273,314,289,307,297" href="#" class="city07" alt="울산" onmouseover="mapHover('울산')" onmouseout="mouseOut('울산')" onclick="mapClick('울산', event)" />
				<area shape="poly" coords="249,61,306,159,266,167,248,165,239,160,216,158,214,134,208,127,207,110,179,86" href="#" class="city08" alt="강원" onmouseover="mapHover('강원')" onmouseout="mouseOut('강원')" onclick="mapClick('강원', event)" />
				<area shape="poly" coords="175,88,201,121,214,159,195,178,169,181,159,160,170,156,171,148,191,141,182,120,167,126,130,128" href="#" class="city09" alt="경기" onmouseover="mapHover('경기')" onmouseout="mouseOut('경기')" onclick="mapClick('경기', event)" />
				<area shape="poly" coords="225,255,240,276,279,278,292,288,267,301,261,313,272,323,265,335,250,328,241,328,232,321,221,322,206,296,211,269" href="#" class="city10" alt="경남" onmouseover="mapHover('경남')" onmouseout="mouseOut('경남')" onclick="mapClick('경남', event)" />
				<area shape="poly" coords="261,172,294,171,306,163,310,241,323,242,316,269,293,268,286,268,285,277,270,274,283,254,268,239,248,249,250,268,241,271,228,249,224,222,222,202,229,195,255,189" href="#" class="city11" alt="경북" onmouseover="mapHover('경북')" onmouseout="mouseOut('경북')" onclick="mapClick('경북', event)" />
				<area shape="poly" coords="199,297,218,325,208,339,201,331,194,335,194,351,179,342,142,363,141,351,128,340,177,318" href="#" class="city12" alt="전남" onmouseover="mapHover('전남')" onmouseout="mouseOut('전남')" onclick="mapClick('전남', event)" />
				<area shape="poly" coords="139,332,126,312,135,305,136,297,149,297,160,288,171,292,192,301,179,311,171,303,153,300,145,306,149,320,149,326" href="#" class="city13" alt="전남" onmouseover="mapHover('전남')" onmouseout="mouseOut('전남')" onclick="mapClick('전남', event)" />
				<area shape="poly" coords="156,244,168,240,188,244,203,254,211,243,223,249,210,262,203,287,197,296,177,291,158,286,138,293,147,279,145,266,160,263" href="#" class="city14" alt="전북" onmouseover="mapHover('전북')" onmouseout="mouseOut('전북')" onclick="mapClick('전북', event)" />
				<area shape="poly" coords="126,184,142,184,137,176,155,178,162,187,171,184,190,187,193,205,191,213,179,219,185,229,192,235,205,230,209,232,214,240,204,249,189,242,166,237,154,242,144,231,146,210,126,195" href="#" class="city15" alt="충남" onmouseover="mapHover('충남')" onmouseout="mouseOut('충남')" onclick="mapClick('충남', event)" />
				<area shape="poly" coords="219,162,237,163,257,171,249,188,233,188,217,203,224,249,197,213,192,185" href="#" class="city16" alt="충북" onmouseover="mapHover('충북')" onmouseout="mouseOut('충북')"  onclick="mapClick('충북', event)"/>
				<area shape="poly" coords="141,375,166,372,181,377,176,395,149,402,134,391" href="#" class="city17" alt="제주" onmouseover="mapHover('제주')" onmouseout="mouseOut('제주')" onclick="mapClick('제주', event)" />
			</map>
		<!-- naming layer -->
			<div>
				<img style="display:none; pointer-events:none;" src="../image/store/img_city01.png" class="city_layer01 ping" alt="서울" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city02.png" class="city_layer02 ping" alt="부산" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city03.png" class="city_layer03 ping" alt="대구" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city04.png" class="city_layer04 ping" alt="인천" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city05.png" class="city_layer05 ping" alt="광주" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city06.png" class="city_layer06 ping" alt="대전" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city07.png" class="city_layer07 ping" alt="울산" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city08.png" class="city_layer08 ping" alt="강원" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city09.png" class="city_layer09 ping" alt="경기" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city10.png" class="city_layer10 ping" alt="경남" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city11.png" class="city_layer11 ping" alt="경북" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city12.png" class="city_layer12 ping" alt="전남" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city12.png" class="city_layer12 ping" alt="전남" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city13.png" class="city_layer13 ping" alt="전북" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city14.png" class="city_layer14 ping" alt="충남" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city15.png" class="city_layer15 ping" alt="충북" />
				<img style="display:none; pointer-events:none;" src="../image/store/img_city16.png" class="city_layer16 ping" alt="제주" />
			</div>
		</div>
		<div>
		<select id="mapSelect">
			<option selected="selected">시/도</option>
			<option value="서울">서울</option>
			<option value="대전">대전</option>
			<option value="세종">세종</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
			<option value="인천">인천</option>
			<option value="강원">강원</option>
			<option value="경기">경기</option>
			<option value="광주">광주</option>
			<option value="전남">전남</option>
			<option value="전북">전북</option>
			<option value="부산">부산</option>
			<option value="경남">경남</option>
			<option value="울산">울산</option>
			<option value="제주">제주</option>
			<option value="대구">대구</option>
			<option value="경북">경북</option>
		</select>
		</div>
		<br><br>
		<table id="regionTable">
			<tr>
				<th width="100">지역</th>
				<th width="350">매장명</th>
				<th width="500">주소</th>
				<th width="200">전화번호</th>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
	
	<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="../js/map.js"></script>
	
	<input type="hidden" id="name" value="${param.name}" />
	
	<c:if test="${param.name != null}">
		<script type="text/javascript">
		$.ajax({
			type: 'post',
			url: '/miniProject/store/getStoreListByName',
			data: 'name=' + $('#name').val(),
			dataType: 'json',
			success: function(data){		
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
		</script>
	</c:if>
	
</body>
</html>