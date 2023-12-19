<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/boardWriteForm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<c:if test="${param.id != 200}">
 	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Community > Board > Write
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글작성</h1>
		</div>
	</div>
</c:if>
<c:if test="${param.id == 200}">
 	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > About Us > Notice > Write
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글작성</h1>
		</div>
	</div>
</c:if>
<form id="boardWriteForm">
<input type="hidden" name="id" value="${param.id}" id="boardId">
<input type="button" class="btn" value ="글쓰기" id="boardWriteBtn">
<input type="reset" class="btn" value = "다시작성">
<input type="button" class="btn" onclick="location.href='/miniProject/board/boardList?pg=${pg}&id=${param.id}'" value="목록"/>
	<table border = "1" frame="hsides" rules="rows">
		<tr>
			<th width="60" id="a">제목</th>
			<td>
				<input name="subject" type = "text" id="subject" size ="115" style=" width: 835px;"  >
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
<script src="../js/boardWrite.js"></script>
</body>
</html>