<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, model.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring"  uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>�̹��� �Խñ� ���</h3>
<table>
	<tr><td align="right">${ requestScope.START + 1 }~${ requestScope.END - 1 }/${ requestScope.TOTAL }</td></tr>
</table>
<table>
	<tr><th>�̹���</th><th>�۹�ȣ</th><th>�� ��</th><th>�ۼ���</th><th>�ۼ���</th></tr>
	
	<c:forEach var="dto" items="${ LIST }">
		<tr><td><img alt="" src="${ pageContext.request.contextPath }/upload/${ dto.imagename }" width="50" 
				height="50"/></td>
		<td>${ dto.w_id }</td>
		<td><a href="../image/detail.html?ID=${ dto.w_id }">${ dto.title }</a></td>
		<td>${ dto.writer }</td><td>${ dto.w_date }</td></tr>
	</c:forEach>
</table>
<c:set var="pageCount" value="${ pageCount }"/>
<c:set var="currentPage" value="${ currentPage}"/>
<c:set var="startPage" 
	value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1}"/>
<c:set var="endPage" value="${startPage + 9}"/>
<c:if test="${endPage > pageCount}">
	<c:set var="endPage" value="${pageCount}"/>
</c:if>
<c:if test="${startPage > 10}">
	<a href="../image/imageList.html?PAGE_NUM=${startPage - 1}">[����]</a>
</c:if>
<c:forEach begin="${startPage}" end="${endPage}" var="i">
	<c:if test="${currentPage == i}"><font size="6"></c:if>
	<a href="../image/imageList.html?PAGE_NUM=${ i }">${ i }</a>
	<c:if test="${currentPage == i}"></font></c:if>
</c:forEach>
<c:if test="${endPage < pageCount}">
	<a href="../image/imageList.html?PAGE_NUM=${endPage + 1 }">[����]</a>
</c:if>
</div>
</body>
</html>
















