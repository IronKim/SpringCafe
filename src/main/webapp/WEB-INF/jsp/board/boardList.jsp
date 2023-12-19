<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe Spring</title>
<link rel="icon" href="/miniProject/image/icon.ico">
<style type="text/css">
/* #writeBtn{
    height: 30px;
    width: 100px;
    cursor: pointer;
    background-color: #265B3D;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    margin-right: 10px;
    z-index: 2; /* 버튼들은 캡차 위에 표시되도록 설정 */
    margin-left: 10px;
} */
#boardPagingDiv{
color: #fff;
}
#writeBtn{
	float:right;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
	color:#265B3D;
	border: 1.5px solid #265B3D;
	padding: 7px 30px;
	border-radius: 5px;
	background-color: white;
	transition: 0.5s;
	z-index: 100;
	margin: 20px;
}
#writeBtn:hover{
	background-color: #265B3D;
	color: white;
}
</style>

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
 	  rel="stylesheet" 
 	  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
 	  crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<body>
	<jsp:include page="/WEB-INF/jsp/main/header.jsp"/>
	<jsp:include page="/WEB-INF/jsp/main/navbar.jsp"/>
<input type="hidden" id="pg" value="${param.pg }">
<input type="hidden" id="boardId" value="${param.id }">
<c:if test="${param.id != 200}">
 	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > Community > Board
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">자유게시판</h1>
		</div>
	</div>
</c:if>
<c:if test="${param.id == 200}">
 	<div style="width:940px;margin: 0 auto;">
	    <div style="margin: 20px 10px 0px 10px">
			<a href="/miniProject/" style="text-decoration: none; color: black;">Home</a> > About Us > Notice
			<h1 style="margin-top: 10px; font-weight: bold;font-size: 32px;">공지사항</h1>
		</div>
	</div>
</c:if>
<div style="text-align: center;max-width: 940px; margin: 0 auto;">
<c:if test="${sessionScope.memMemberDTO != null}">
		<c:if test="${param.id != 200}">
	            <input id="writeBtn" type="button" onclick="writeBtnClick('${sessionScope.memMemberDTO.id}')" value="글쓰기"/>
        </c:if>
        <c:if test="${param.id == 200}">
        	<c:if test="${sessionScope.memMemberDTO.id == 'a'}"><!-- a는 관리자 아이디 -->
	            <input id="writeBtn" type="button" onclick="writeBtnClick('${sessionScope.memMemberDTO.id}')" value="글쓰기"/>
        	</c:if>
        </c:if>
    </c:if>
<c:if test="${sessionScope.memMemberDTO == null}"><div style="margin:80px;"></div></c:if>
	<table border="1" frame="hsides" rules="rows" id="boardListTable" class="table table-hover" style="width: 100%;">
		<tr>
			<th width="50" style="text-align: center;">글번호</th>
			<th width="200" style="text-align: center;">제목</th>
			<th width="100" style="text-align: center;">작성자</th>
			<th width="100" style="text-align: center;">작성일</th>
			<th width="50" style="text-align: center;">조회수</th>
		</tr>
	
	</table>
	<div id="boardPagingDiv" style="text-align: center; max-width: 600px; margin: 30px auto;"></div>
      
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="../js/boardlist.js"></script>

<jsp:include page="/WEB-INF/jsp/main/footer.jsp"/>
</body>
</html>