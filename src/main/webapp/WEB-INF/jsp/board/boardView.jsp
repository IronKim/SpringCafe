<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<link rel="stylesheet" href="/miniProject/css/boardView.css">
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" id="boardId" value="${param.id }">
<input type="hidden" id="sessionId" value="${sessionScope.memMemberDTO.id }">
<input type="hidden" id="seq" value="${seq }">
<div style="width:940px;margin: 0 auto;">
 	<div style="width:940px;margin: 0 auto;display: none;" id="bv">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Community > Board > View
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글보기</h1>
		</div>
	</div>
 	<div style="width:940px;margin: 0 auto;display: none;" id="nv">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > About Us > Notice > View
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">글보기</h1>
		</div>
	</div>
</div>
<div style="width:940px;margin: 0 auto;">
<c:if test="${sessionScope.memMemberDTO.id == writer }"> 
	<input type="button" id="deleteBtn" class="btnV" value = "글삭제">
	<input type="button" id="ABtn" class="btnV" onclick="location.href='/miniProject/board/boardUpdateForm?pg=${pg}&seq=${seq}&id=${param.id}'" value="수정"/>
</c:if>
<input type="button" id="BBtn" class="btnV" onclick="location.href='/miniProject/board/boardList?pg=${pg}&id=${param.id}'" value="목록"/>
</div>
<div style="clear: both;"></div>
<main>
<table border="1"  frame="hsides" rules="rows" id="boardViewTable">
	<tr>
		<th align="center" colspan="6" id="subject"></th>
	</tr>
	<tr height="40">
		<td width="40" align="center" id="a">작성자</td>
		<td align="center" id="writer" width="150"></td>	
		
		<td width="40" align="center" id="a">작성일</td>
		<td align="center" id="logtime" width="150"></td>
		
		<td width="40" align="center" id="a">조회수</td>
		<td align="center" id="hit"></td>
	</tr>
	<tr height="300">
		<td align="center" id="a">내용</td>
		<td colspan="6" valign="top">
			<div id="content"></div>
		</td>
	</tr>

</table>


<div id="commentSection">
<div id=comment>댓글</div>
<form id="commentForm" >
<input type="hidden" id="seq" value="${seq }">
	<c:if test="${sessionScope.memMemberDTO != null}">
		 <div id="commentInputContainer">
			 <textarea name="text" id="text" rows="3" cols = "80"></textarea>
			 <input type="button" id="commentWriteBtn" value="등록">
		 </div>
	</c:if>
	<c:if test="${sessionScope.memMemberDTO == null}">
		 <div id="commentLogin" onclick="location.href='/miniProject/member/loginForm'">댓글을 작성하려면 로그인해주세요</div>
	</c:if>
</form>
<div style="position: relative;">
	<div id="loading">
		<img alt="loading" src="/miniProject/image/loading.png" width="30px;">
	</div>
</div>
<div id="boardCommentDiv"  > <!-- frame="hsides" rules="rows" --> 
</div>	
</div>
</main>
<div style="clear: both;"></div>
<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>

</body>
</html>