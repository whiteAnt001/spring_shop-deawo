<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="dto" value="${ DETAIL }"/>
<div align="center">
<h3>이미지 게시글 상세보기</h3>
<table>
	<tr><th>제 목</th><td>${ dto.title }</td></tr>
	<tr><th>작성자</th><td>${ dto.writer }</td></tr>
	<tr><th>작성일</th><td>${ dto.w_date }</td></tr>
	<tr><td colspan="2" align="center"><img alt="" src="${ pageContext.request.contextPath }/upload/${ dto.imagename }"
			width="250" height="200"/></td></tr>
	<tr><th>내 용</th><td><textarea rows="5" cols="60" 
			readonly="readonly">${ dto.content }</textarea></td></tr>
	<tr><td colspan="2" align="center">
		<a href="javascript:goReply()">[답글]</a>
		<a href="../image/imageList.html">[목록]</a></td></tr>
</table>
</div>
<form name="move" method="post">
	<input type="hidden" name="id" value="${ dto.w_id }"/>
	<input type="hidden" name="parentid" value="${ dto.parent_id }"/>
	<input type="hidden" name="groupid" value="${ dto.group_id }"/>
</form>
<script type="text/javascript">
function goReply(){
	document.move.action="../image/imageReplyForm.html";
	document.move.submit();
}
</script>
</body>
</html>

















