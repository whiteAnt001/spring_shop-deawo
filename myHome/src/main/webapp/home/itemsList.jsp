<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>��ǰ ���</h3>
<table>
	<tr><td align="right">${startRow + 1}~${endRow -1}/${total }</td></tr>
</table>
<table>
	<tr><th>��ǰ�ڵ�</th><th>��ǰ�̸�</th><th>��ǰ����</th><th>������</th><th>�����</th>
		<th>�� ��</th></tr>
	<c:forEach var="item" items="${ITEMS}">
		<tr><td>${item.item_code }</td>
			<td><a href="../item/detail.html?CODE=${item.item_code }">${item.item_title }</a></td>
			<td><fmt:formatNumber value="${item.price }" groupingUsed="true" currencySymbol="��"/></td>
			<td>${item.madein }</td>
			<td>${item.reg_date }</td>
		<c:if test="${essionScope.loginUser.id != 'admin'}">
			<td><a href="#" onclick="window.open('../cart/addCart.html?CODE=${item.item_code }','_blank_','width=450,height=200,top=200,left=200')">��ٱ��� ���</a></td>
		</c:if>
		</tr>
	</c:forEach>	
</table>
<c:set var="pageCount" value="${pageCount }"/>
<c:set var="currentPage" value="${ currentPage}"/>
<c:set var="startPage" 
	value="${currentPage - (currentPage % 10 == 0 ? 10 : (currentPage % 10)) + 1}"/>
<c:set var="endPage" value="${startPage + 9}"/>
<c:if test="${endPage > pageCount}">
	<c:set var="endPage" value="${pageCount}"/>
</c:if>
<c:if test="${startPage > 10}">
	<a href="../item/itemList.html?PAGE_NUM=${startPage - 1}">[����]</a>
</c:if>
<c:forEach begin="${startPage}" end="${endPage}" var="i">
	<c:if test="${currentPage == i}"><font size="6"></c:if>
	<a href="../item/itemList.html?PAGE_NUM=${ i }">${ i }</a>
	<c:if test="${currentPage == i}"></font></c:if>
</c:forEach>
<c:if test="${endPage < pageCount}">
	<a href="../item/itemList.html?PAGE_NUM=${endPage + 1 }">[����]</a>
</c:if>
</div>
</body>
</html>










