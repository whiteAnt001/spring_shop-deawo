<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>���� �ֹ� ���</h2>
<table border="1">
	<tr><th>����</th><th>�ֹ���ȣ</th><th>�󼼹�ȣ</th><th>��ǰ��ȣ</th><th>�ֹ�����</th>
		<th>��ۻ���</th><th>���º���</th></tr>
	<c:forEach var="sales" items="${salesList}">
<form action="../admin/orderModify.html" >	
<input type="hidden" name="user_id" value="${sales.user_id }">
<input type="hidden" name="sale_id" value="${sales.sale_id }">
<input type="hidden" name="sale_detail_id" value="${sales.sale_detail_id }">
	<tr><td>${sales.user_id }</td><td>${sales.sale_id }</td>
		<td>${sales.sale_detail_id }</td><td>${sales.item_id }</td>
		<td>${sales.quantity }</td><td><select name="state">
			<c:choose>
				<c:when test="${sales.delivery_state == 0}">
					<option value="0" selected="selected">�ֹ��Ϸ�</option>
				</c:when>
				<c:otherwise><option value="0">�ֹ��Ϸ�</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sales.delivery_state == 1}">
					<option value="1" selected="selected">�����</option>
				</c:when>
				<c:otherwise><option value="1">�����</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sales.delivery_state == 2}">
					<option value="2" selected="selected">��ۿϷ�</option>
				</c:when>
				<c:otherwise><option value="2">��ۿϷ�</option></c:otherwise>
			</c:choose>
			</select></td>
			<td><input type="submit" value="���º���"/></td>
			</tr></form>
	</c:forEach>
</table>
</div>
</body>
</html>










