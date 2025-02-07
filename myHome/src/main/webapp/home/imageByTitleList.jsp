<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, model.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>이미지 게시글 목록</h3>
<table>
	<tr><td align="center">
		<form action="../image/search.html" method="post">
			게시글 검색 : <input type="text" placeholder="제목을 입력하세요." name="title"/> <input type="submit" value="검색"/>
		</form>
	</td></tr>
</table>
<table>
	<tr><td align="right">${ START + 1}~${ END - 1}/${ TOTAL }</td></tr>
</table>
<table>
	<tr><th>이미지</th><th>글번호</th><th>제 목</th><th>작성자</th><th>작성일</th></tr>
	<c:forEach var="dto" items="${LIST }">
		<tr align="center"><td><img alt="" src="${pageContext.request.contextPath}/upload/${dto.imagename }" width="50" 
					height="50"/></td>
			<td>${dto.w_id }</td>
			<td><a href="../image/readImage.html?ID=${dto.w_id }">${dto.title }</a></td>
			<td>${dto.writer }</td><td>${dto.w_date }</td></tr>
	</c:forEach>
</table>
<c:set var="currentPage" value="${currentPage }"/>
<c:set var="pageCount" value="${pageCount }"/>
<c:set var="startPage" 
	value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1 }"/>
<c:set var="endPage" value="${ startPage + 9 }"/>	
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>
<c:if test="${startPage > 10 }">
	<a href="#" onclick="movePage(${startPage - 1 })">[이전]</a>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="i">
	<c:if test="${currentPage == i }">
		<font size="6">
	</c:if>
	<a href="#" onclick="movePage(${ i })">${ i }</a>
	<c:if test="${currentPage == i }">
		</font>
	</c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="#" onclick="movePage(${endPage + 1 })">[다음]</a>
</c:if>
</div>
<form method="post" name="imagefm">
	<input type="hidden" name="title" value="${ title }"/>
	<input type="hidden" name="PAGE_NUM"/>
</form>
<script type="text/javascript">
function movePage(page){
	document.imagefm.PAGE_NUM.value = page;
	document.imagefm.action= "../image/search.html";
	document.imagefm.submit();
}
</script>
</body>
</html>