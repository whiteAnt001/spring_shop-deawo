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
<h2>��� ���� �ֹ� ���</h2>

<form action="../admin/orderStateSearch.html">
��ۻ���:<select name="state">
	<option value="0">�ֹ��Ϸ�</option><option value="1">�����</option>
	<option value="2">��ۿϷ�</option>
</select>
<input type="submit" value="�� ȸ"/>
</form><br/>

<table border="1">
<tr><th>�� ��</th><th>�ֹ���ȣ</th><th>�ֹ��󼼹�ȣ</th><th>��ǰ��ȣ</th><th>�ֹ� ����</th>
	<th>�ֹ��ð�</th><th>��ۻ���</th><th>���¼���</th></tr>
<c:forEach var="order" items="${allOrders}">
<form action="../admin/orderModifyFromList.html">
<input type="hidden" name="user_id" value="${order.user_id }">
<input type="hidden" name="sale_id" value="${order.sale_id }">
<input type="hidden" name="sale_detail_id" value="${order.sale_detail_id}">
<tr><td>${order.user_id }</td><td>${order.sale_id }</td><td>${order.sale_detail_id}</td>
	<td>${order.item_id }</td><td>${order.quantity }</td><td>${order.sale_time }</td>
	<td><select name="state">
			<c:choose>
				<c:when test="${order.delivery_state == 0}">
					<option value="0" selected="selected">�ֹ��Ϸ�</option>
				</c:when>
				<c:otherwise><option value="0">�ֹ��Ϸ�</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${order.delivery_state == 1}">
					<option value="1" selected="selected">�����</option>
				</c:when>
				<c:otherwise><option value="1">�����</option></c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${order.delivery_state == 2}">
					<option value="2" selected="selected">��ۿϷ�</option>
				</c:when>
				<c:otherwise><option value="2">��ۿϷ�</option></c:otherwise>
			</c:choose>
			</select>
	</td>
	<td><input type="submit" value="��������"/></td></tr></form>
</c:forEach>	
</table><br/>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../admin/orderStateSearch.html?PAGE=${page }&state=${state}">${page }</a>
</c:forEach>
<br/>
</div>
</body>
</html>















