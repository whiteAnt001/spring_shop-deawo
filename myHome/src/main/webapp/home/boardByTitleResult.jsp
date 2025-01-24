<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, model.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3 align="center">게시글 목록</h3>
<table>
	<tr><td align="center">
		<form action="../write/search.html" method="post">
			게시글 검색 : <input type="text" placeholder="제목을 입력하세요." name="title"/> <input type="submit" value="검색"/>
		</form>
	</td></tr>
</table>
<table border="1">
	<tr><th width="100">글번호</th><th>작성자</th><th width="300">제 목</th><th>작성일</th></tr>
	<c:forEach var="dto" items="${BOARD }">
	<tr align="center"><td>${dto.seq }</td>
		<td>${dto.id }</td>
		<td><a href="../write/detail.html?SEQ=${dto.seq }">${dto.title }</a></td>
		<td>${dto.write_date }</td></tr>
	</c:forEach>
</table>
<c:set var="currentPage" value="${ currentPage}" />
<c:set var="startPage"
	value="${currentPage - (currentPage % 10 == 0 ? 10 :(currentPage % 10)) + 1 }" />
<c:set var="endPage" value="${startPage + 9}"/>	
<c:set var="pageCount" value="${PAGES }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }" />
</c:if>
<c:if test="${startPage > 10 }">
	<a href="#" onclick="">[이전]</a>
</c:if>
<c:forEach begin="${startPage }" end="${endPage }" var="i">
	<c:if test="${currentPage == i }"><font size="6"></c:if>
		<a href="#" onclick="movePage(${ i })">${ i }</a>
	<c:if test="${currentPage == i }"></font></c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="#" onclick="movePage(${endPage + 1 })">[다음]</a>
</c:if>
</div>	
<form method="post" name="baordfm">
	<input type="hidden" name="title" value="${ title }"/>
	<input type="hidden" name="pageNo"/>
</form>
<script type="text/javascript">
function movePage(page){
	document.baordfm.pageNo.value = page;
	document.baordfm.action= "../write/search.html";
	document.baordfm.submit();
}
</script>
</body>
</html>