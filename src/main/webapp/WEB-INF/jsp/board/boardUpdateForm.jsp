<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/boardUpdateForm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" id="boardId" value="${param.id }">
<input type="hidden" id="sessionId" value="${sessionScope.memMemberDTO.id }">
<div style="width:940px;margin: 0 auto;">
    <c:if test="${param.id != 200}">
 	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Community > Board > Update
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글수정</h1>
		</div>
	</div>
	</c:if>
	<c:if test="${param.id == 200}">
	 	<div style="width:940px;margin: 0 auto;">
		    <div style="margin: 20px 10px 0px 10px">
				<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > About Us > Notice > Update
				<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글수정</h1>
			</div>
		</div>
	</c:if>
</div>
<form id="boardUpdateForm">
<input type="hidden" name="seq" id="seq" value="${seq }">
<input type = "button" class="btn" value ="수정" id="boardUpdateBtn">
<input type="button" class="btn" id="resetBtn" value = "다시작성">
<input type="button" class="btn" onclick="location.href='/miniProject/board/boardList?pg=${param.pg}&id=${param.id}'" value="목록"/>
	<table border = "1" frame="hsides" rules="rows">
		<tr>
			<th width="70" id="a">제목</th>
			<td>
				<input name="subject" type = "text" id="subject" size ="115" style=" width: 835px; "  >
				<div id = "subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<th id="a">내용</th>
			<td>
				<textarea name = "content" id = "content" rows="35" cols = "120" style=" width: 835px; height: 300px;"></textarea>
				<div id = "contentDiv"></div>
			</td>
		</tr>
	</table>
</form>
<c:if test="${param.id == 200}">
	<c:if test="${sessionScope.memMemberDTO.id != 'a'}"><!-- a는 관리자 아이디 -->
    	 <script type="text/javascript">
    	 	alert('잘못된 접근입니다');
    	 	location.href= '/miniProject/board/boardList?pg=&id=200'
    	 </script>
    </c:if>
</c:if>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="../js/boardUpdate.js"></script>

</body>
</html>